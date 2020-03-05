<?php
namespace App\Models;

use Slim\Container;

use App\Lib\PDOFilter;
use App\Lib\Connection;

class Model
{
    /**
     * @var Container
     */
    protected $app;

    /**
     * @var \PDO
     */
    protected $pdo;

    /**
     * @var \PDOFilter
     */
    protected $filter;

    /**
     * Model constructor.
     * @param Container $app
     * @param array|Array $configParams
     */
    public function __construct(Container $app)
    {
        $this->app = $app;

        $this->pdo = new Connection();
        $this->filter = new PDOFilter;
    }

    protected function execute($query)
    {
        try {
            $stmt = $this->pdo->prepare($query);
            $stmt->execute($this->filter->getParam());
        } catch (\PDOException $e) {
            $message = $e->getMessage();

            throw new \PDOException($message);
        }

        return $stmt->fetchAll();
    }
}
