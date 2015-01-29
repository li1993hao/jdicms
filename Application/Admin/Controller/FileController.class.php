<?php
namespace Admin\Controller;
use Common\Controller\BaseFileController;
class FileController extends BaseFileController{
    protected function _initialize(){
        // 获取当前用户ID
        define('UID',is_login());
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }
    }
}