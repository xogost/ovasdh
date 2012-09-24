<?php
class Preguntas_model extends CI_Model
{
        var $pregunta = '';
        var $valor = '';
        var $respuestacorrecta = '';
        var $fechacreacion = '';
        var $fechaactualizacion = '';
        var $usuario_id = '';        

        public function __construct() {
            parent::__construct();
        }

	function create($data)
	{
		$this->db->pregunta= $data['pregunta'];
		$this->db->valor= $data['valor'];
		$this->db->respuestacorrecta= $data['respuestacorrecta'];
		$this->db->fechacreacion= $data['fechacreacion'];
		$this->db->fechaactualizacion= $data['fechaactualizacion'];
		$this->db->usuario_id= $data['usuario_id'];
                
		$this->db->insert('preguntas', $data);

		return $this->db->affected_rows();
	}

	function read($id)
	{
		$this->db->where("id = $id");
		$query = $this->db->get('preguntas');

		return $query;
	}

	function readAll()
	{
		$query = $this->db->get('preguntas');

		return $query;
	}

	function update($id, $values)
	{
		$this->db->pregunta= $values['pregunta'];
		$this->db->valor= $values['valor'];
		$this->db->respuestacorrecta= $values['respuestacorrecta'];
		$this->db->fechacreacion= $values['fechacreacion'];
		$this->db->fechaactualizacion= $values['fechaactualizacion'];
		$this->db->usuario_id= $values['usuario_id'];
                
		$this->db->update('preguntas', $values, array("id" => (int)$id ));

		return $this->db->affected_rows();
	}

	function delete($id)
	{
		$this->db->where('id= $id');
		$this->db->delete('preguntas');

		return $this->db->affected_rows();
	}

}