<?php

namespace Addons\MessageBoard\Controller;
use Common\Controller\AddonsController;

class MessageBoardController extends AddonsController{
    function add() {
        //数据库操作
        $model = D('Addons://MessageBoard/MessageBoard');
        if($model->update() !== false){
            $this->success('留言成功!');
        }else{
            $this->error($model->getError());
        }
    }

    function  index(){
        $this->display();
    }
}
