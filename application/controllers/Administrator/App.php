<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class App extends CI_Controller {
    public function __construct() {
         header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        parent::__construct();
    }
    public function student_list(){
        $data = $this->db->query("SELECT * FROM tbl_students ORDER BY stu_id DESC")->result();
        echo json_encode($data);
    }
    public function student_acc_create(){
        $res = ['success'=>false, 'message'=>''];
        $data = json_decode($this->input->raw_input_stream);
        $stu_email = $data->stu_email;
        $stu_pass = md5($data->stu_pass);
        $stu_first_name = $data->stu_first_name;
        $stu_last_name = $data->stu_last_name;
        $stu_age = $data->stu_age;
        $data = array(
                'stu_email'=>$stu_email,
                'stu_pass'=>$stu_pass,
                'stu_first_name'=>$stu_first_name,
                'stu_last_name'=>$stu_last_name,
                'stu_age'=>$stu_age
        );
        $insert_result = $this->db->insert('tbl_students',$data);
        if($insert_result){
            echo json_encode(['success'=>true,'message'=>'Student create success']);
        }else{
            echo json_encode(['success'=>false,'message'=>'Student create success']);

        }
    }
     public function auth(){
        $res = ['success'=>false, 'message'=>''];
        $data = json_decode($this->input->raw_input_stream);
        $stu_email = $data->stu_email;
        $stu_pass = md5($data->stu_pass);
        $result = $this->db->query("SELECT * FROM tbl_students WHERE stu_email=? AND stu_pass=?",[$stu_email,$stu_pass])->result();
        
        if(!empty($result)){
            echo json_encode(['success'=>true, 'message'=>$result]);
        }else{
            echo json_encode(['success'=>false,'message'=>'Sorry !! Your Email or Password not match']);
        }
        
    }

}
