<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class app extends CI_Controller {
    public function __construct() {
        parent::__construct();
        // $this->load->model("model_myclass", "mmc", TRUE);
        // $this->load->model('model_table', "mt", TRUE);
    }
    public function student_list(){
        $data = $this->db->query("SELECT * FROM tbl_students ORDER BY stu_id DESC")->result();
        echo json_encode($data);
    }

}
