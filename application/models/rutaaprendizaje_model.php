<?php
class RutaAprendizaje_model extends CI_Model {
        
	function __construct() {
            parent::__construct();
        }

	function create($data)
	{
            $this->db->insert('rutaaprendizaje', $data);
            return $this->db->affected_rows();
	}
        function update($data) {
            $this->db->update('rutaaprendizaje', $data, array("id"=>$data["id"]));
            return $this->db->affected_rows();
        }
        function selectAll() {
            $query = $this->db->get('rutaaprendizaje');
            return $query;
        }
        
        function selectOne($id) {
            $query = $this->db->get_where('rutaaprendizaje', array("id" => $id));
            return $query;
        }

}
