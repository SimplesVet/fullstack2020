<?php

namespace App\Models;

use App\Lib\PDOHelpers;

class Cliente extends Model {
	public function listar() {
		$query = 'SELECT id, nome, telefone, inclusao_formatada 
                  FROM vw_clientes';

		$query .= $this->filter->getWhere();
        return $this->execute($query);
	}

	public function filtrar($filtros)
    {
        if (!empty($filtros['id'])) {
            $this->filter->addFilter(
            	'AND id = :id', array(':id' => $filtros['id'])
            );
        }

        if (!empty($filtros['nome'])) {
            $this->filter->addFilter(
            	'AND nome like :nome', [':nome' => '%' . $filtros['nome'] . '%']
            );
        }

        return $this;
    }

    public function inserir($params)
    {
        $query = "CALL sp_clientes_ins(:nome, :telefone, @p_status, @p_msg);";
        return PDOHelpers::procedure($this->pdo, $query, $params);
    }

    public function alterar($params)
    {
        $query = "CALL sp_clientes_upd(:id, :nome, :telefone, @p_status, @p_msg);";
        return  PDOHelpers::procedure($this->pdo, $query, $params);
    }

    public function excluir($params)
    {
        $query = "CALL sp_clientes_del(:id, @p_status, @p_msg);";
        return PDOHelpers::procedure($this->pdo, $query, $params);
    }
}