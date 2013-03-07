<?php

class Respuestas_model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function create($data) {
        $this->db->insert('respuestas', $data);
        return $this->db->affected_rows();
    }

    function read($id) {
        $query = $this->db->get_where('respuestas', array('pregunta_id'=> $id));
        //$query = $this->db->query("select * from respuestas");
        return $query;
    }

    function readAll() {
        $query = $this->db->get('respuestas');
        return $query;
    }

    function update($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('respuestas', $data);
        return $this->db->affected_rows();
    }

    function delete($id) {
        $this->db->where('id', $id);
        $this->db->delete('respuestas');

        return $this->db->affected_rows();
    }
    
    function insertResultadosRespuestas($username, $subcategoria, $resultado, $fechacreacion){
        $this->db->query("INSERT INTO resultados_examen_final (username,subcategoria,resultado,fechacreacion) VALUES ('$username', '$subcategoria', '$resultado', '$fechacreacion');");
        return true;
    }

}