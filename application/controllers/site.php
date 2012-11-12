<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Site extends CI_Controller {
    function index() {
        $this->load->view('header_view');
        $this->load->view('site/index');
    }
    function loadView($config) {
        $this->load->view('header_view.php');
        foreach($config as $configItem){
            $this->load->view($configItem["view"], $configItem["parameters"]);
        }
        $this->load->view('footer_view.php');
    }
}

