<?php
namespace App\Controllers;

use Slim\Container;

class Controller
{
    /**
     * @var Container
     */
    protected $app;

    public function __construct(Container $container)
    {
        $this->app = $container;
    }
}
