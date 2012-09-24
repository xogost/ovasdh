<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Site extends CI_Controller {
    function index() {

    }
    function loadView($config) {
        $this->load->view('header_view.php');
        $this->load->view($config["view"], $config["parameters"]);
        $this->load->view('footer_view.php');
    }
}

