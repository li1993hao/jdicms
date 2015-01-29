<?php
namespace Admin\Controller;
use Common\Controller\AdminController;
use Think\Controller;
class IndexController extends AdminController {
    public function index(){
       // $hj = QueryList::Query('http://mobile.csdn.net/',array("title"=>array('.unit h1','text')));
       // print_r($hj->jsonArr);
        $this->assign('__INDEXCLASS__','active');
        $this->display();
    }
}