<?php

namespace App\Exceptions;

use App\Traits\ErrorChannelTrait;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;

class Handler extends ExceptionHandler
{
    use ErrorChannelTrait;
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    public function report(Throwable $e)
    {
        if ($this->shouldReport($e)  && $e instanceof \Exception) {
            $this->sendToErrorChannel($e);
        }

    }

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    private function sendToErrorChannel(Throwable $e) {
        $this->pushError($e);
    }
}
