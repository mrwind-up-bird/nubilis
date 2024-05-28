<?php

namespace App\Traits;

use Illuminate\Support\Collection;
use Illuminate\Support\Str;
use Redis;

trait ErrorChannelTrait {

    protected Redis $redis;
    private string $channel = 'error';
    private string $prefix = 'lax_obfuscator';

    public function __construct()
    {
        $this->getInstance();
    }

    /**
     * @return Redis
     * @throws \RedisException
     */
    public function getInstance() : Redis
    {
        $redis = new Redis();
        $redis->connect(config('redis.host'), config('redis.port'));

        return $redis;
    }

    /**
     * @param \Throwable $e
     * @param string $channel
     * @return void
     * @throws \RedisException
     */
    public function pushError(\Throwable $e, string $channel = 'error') : void
    {
        $this->channel = $channel;

        $errorCode = ($e->getCode() !== 0) ? $e->getCode() : $this->generateUniqueId($e->getMessage());

        $this->getInstance()->incr(sprintf('%s:%s:%s', $this->prefix, $this->channel, $errorCode));
        $this->getInstance()->set(sprintf('%s:%s:message:%s', $this->prefix, $this->channel, $errorCode), $e->getMessage());
    }

    /**
     * @param string $channel
     * @return array
     * @throws \RedisException
     */
    public function getErrorCount(string $channel = 'error') : Collection
    {
        $this->channel = $channel;

        $errorDetails = collect();

        foreach ($this->getInstance()->keys(sprintf('%s:%s:*', $this->prefix, $this->channel)) as $key) {

            $errorCode = preg_replace('/message:\b/', '', substr($key, strlen(sprintf('%s:%s:', $this->prefix, $this->channel))));

            $messagePath = sprintf('%s:%s:message:%s', $this->prefix, $this->channel, $errorCode);
            $counterPath = sprintf('%s:%s:%s', $this->prefix, $this->channel, $errorCode);

            $errorMessages = $this->getInstance()->get($messagePath);
            $errorCount = $this->getInstance()->get($counterPath);

            $errorDetails->put($errorCode, [
                'errorCount' => $errorCount,
                'errorCode' => $errorCode,
                'errorMessage' => $errorMessages
            ]);
        }

        return $errorDetails;
    }

    /**
     * @return string
     */
    public function getChannel() : string
    {
        return $this->channel;
    }

    /**
     * @param string $channel
     * @return \App\Http\Controllers\ObfuscateController|\App\Services\DatabaseService|ErrorChannelTrait
     */
    public function setChannel(string $channel) : self
    {
        $this->channel = $channel;

        return $this;
    }

    /**
     * @param $inputString
     * @return string
     */
    function generateUniqueId($inputString) : string
    {
        return Str::upper(Str::substr(md5($inputString),0,6));
    }
}
