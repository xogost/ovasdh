<?php
class Respuestas_model extends Model
{

	function Respuestas_model()
	{
		parent::Model();
		$this->load->database();
	}

	function create($data)
	{
		$this->db->set('pregunta_id', $data['pregunta_id']);
		$this->db->set('texto', $data['texto']);
		$this->db->set('fechacreacion', $data['fechacreacion']);
		$this->db->set('fechaactualizacion', $data['fechaactualizacion']);
		$this->db->set('usuario_id', $data['usuario_id']);
		$this->db->insert('respuestas');

		return $this->db->affected_rows();
	}

	function read($id)
	{
		$this->db->where('id', $id);
		$query = $this->db->get('respuestas');

		return $query;
	}

	function readAll()
	{
		$query = $this->db->get('respuestas');

		return $query;
	}

	function update($id, $data)
	{
		$this->db->where('id', $data['id']);
		$this->db->set('pregunta_id', $data['pregunta_id']);
		$this->db->set('texto', $data['texto']);
		$this->db->set('fechacreacion', $data['fechacreacion']);
		$this->db->set('fechaactualizacion', $data['fechaactualizacion']);
		$this->db->set('usuario_id', $data['usuario_id']);
		$this->db->update('respuestas');

		return $this->db->affected_rows();
	}

	function delete($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('respuestas');

		return $this->db->affected_rows();
	}

}