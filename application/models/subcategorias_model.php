<?php

class Subcategorias_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function getsubcategorias($sistemaDigestivo) {
        $this->db->where("sistema_digestivo = '$sistemaDigestivo'");
        return $this->db->get('subcategorias');
    }

}