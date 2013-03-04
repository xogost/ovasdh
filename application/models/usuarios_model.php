<?php
class Usuarios_model extends CI_Model {
    function login($username, $password){
        $authentication = $this->db->query("SELECT * FROM moodle.mdl_user u WHERE u.username = '$username' AND u.password = MD5('$password')");
        return $authentication;
    }
}