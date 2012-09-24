<?php
class Imagenes_model extends Model
{

	function Imagenes_model()
	{
		parent::Model();
		$this->load->database();
	}

	function create($data)
	{
		$this->db->set('ruta', $data['ruta']);
		$this->db->set('pregunta_id', $data['pregunta_id']);
		$this->db->set('orden', $data['orden']);
		$this->db->insert('imagenes');

		return $this->db->affected_rows();
	}

	function read($id)
	{
		$this->db->where('id', $id);
		$query = $this->db->get('imagenes');

		return $query;
	}

	function readAll()
	{
		$query = $this->db->get('imagenes');

		return $query;
	}

	function update($id, $data)
	{
		$this->db->where('id', $data['id']);
		$this->db->set('ruta', $data['ruta']);
		$this->db->set('pregunta_id', $data['pregunta_id']);
		$this->db->set('orden', $data['orden']);
		$this->db->update('imagenes');

		return $this->db->affected_rows();
	}

	function delete($id)
	{
		$this->db->where('id', $id);
		$this->db->delete('imagenes');

		return $this->db->affected_rows();
	}

}