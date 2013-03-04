<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Site extends CI_Controller {

    function index() {
        if (isset($_SESSION["userid"])) {
            $this->load->view('header_view');
            $this->load->view('site/index');
        } else {
            $this->load->view('header_view');
            $this->load->view('login/login');
        }
    }

    function loadView($config) {
        $this->load->view('header_view.php');
        foreach ($config as $configItem) {
            $this->load->view($configItem["view"], $configItem["parameters"]);
        }
        $this->load->view('footer_view.php');
    }

    function login() {
        $username = $_POST["username"];
        $password = $_POST["password"];

        $this->load->model("usuarios_model", "Usuarios", true);
        $user = $this->Usuarios->login($username, $password);
        $userData = $user->result();
        
        if(isset($userData[0]->id)){
            $this->load->view('header_view');
            $this->load->view('site/index');
            $_SESSION["userid"] = $userData[0]->id;
            $_SESSION["username"] = $userData[0]->username;
        }else{
            $this->load->view('header_view');
            $this->load->view('login/login');
        }
        
        
        
    }

}

