<?php

namespace Addons\MessageBoard\Model;
use Think\Model;

/**
 * MessageBoard模型
 */
class MessageBoardModel extends Model{
    protected $tablePrefix      =   'tp_';
    protected $tableName = 'message';
    protected  $_auto = array(
        array('create_time',NOW_TIME,self::MODEL_INSERT),
        array('update_time',NOW_TIME,self::MODEL_BOTH),
        array('uid', 'session', self::MODEL_INSERT, 'function', 'user_auth.uid')
    );

    public function update(){
        $data = $this->create();
        if(!$data){
            return false;
        }
        /* 添加或更新数据 */
        if(empty($data['id'])){
            $res = $this->add();
        }else{
            $res = $this->save();
        }
        return $res;
    }

}
