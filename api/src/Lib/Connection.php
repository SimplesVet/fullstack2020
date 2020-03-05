<?php

namespace App\Lib;

use \PDO as PDO;

class Connection extends PDO
{
    public function __construct()
    {
        try {
            $timezone   = 'America/Bahia';
            $banco      = 'simplesvetdb';
            $host       = 'mysql:3306';
            $usuario    = 'simplesvetuser';
            $senha      = 's1mpl3sv3t';
            $charset    = 'utf8';

            parent::__construct("mysql:host=" . $host . ";dbname=" . $banco . ';charset=' . $charset, $usuario, $senha, [PDO::MYSQL_ATTR_INIT_COMMAND => "SET time_zone = '" . $timezone . "'"]);

            $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

            return $this;
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }
}
