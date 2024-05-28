<?php

namespace App\Traits;

use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

trait ClosureSerializerTrait {

    use SerializesModels;

    /**
     * @return array
     */
    public function serializeClosures() : array
    {
        $closures = [];

        foreach (get_object_vars($this) as $propertyName => $propertyValue) {

            try {
                if ($propertyValue instanceof \Closure) {
                    $closures[$propertyName] = serialize($propertyValue);
                }
            } catch (\Exception $e) {
                Log::error(sprintf('Error serializing closure in property: %s, Message: %s', $propertyName, $e->getMessage()));
            }
        }

        return $closures;
    }

    /**
     * @return int[]|string[]
     */
    public function __sleep()
    {
        return array_keys($this->serializeClosures());
    }

    /**
     * @return void
     */
    public function __wakeup()
    {
        foreach ($this->serializeClosures() as $propertyName => $serializedClosure) {
            $this->$propertyName = unserialize($serializedClosure);
        }
    }
}
