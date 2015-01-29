<?php

namespace Addons\MessageBoard;
use Common\Controller\Addon;

/**
 * 留言版插件
 * @author 无名
 */
    class MessageBoardAddon extends Addon{
        public $info = array(
            'name'=>'MessageBoard',
            'title'=>'留言版',
            'description'=>'留言板',
            'status'=>1,
            'author'=>'tp',
            'version'=>'0.1'
        );

        public $custom_adminlist = 'adminlist.html';

        public $admin_list = array(
            'model'=>'MessageBoard',
			'fields'=>'*',			//要查的字段
			'map'=>'',				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
			'order'=>'id desc',		//排序,
            'search_key'=>'nickname',//搜索字段
			'list_grid'=>array( 		//这里定义的是除了id序号外的表格里字段显示的表头名和模型一样支持函数和链接
                'nickname:昵称',
                'link:联系方式',
                'content:留言内容',
                'reply:回复内容',
                'create_time|time_format:留言时间',
                'update_time|time_format:更新时间',
                'id:操作:[EDIT]|编辑,[DELETE]|删除'
            ),
        );

        public function install(){
            //读取SQL文件
            $sql = file_get_contents(__DIR__.'/data.sql');
            $sql = str_replace("\r", "\n", $sql);
            $sql = explode(";\n", $sql);
            $md =M();
            foreach ($sql as $value) {
                $value = trim($value);
                if(empty($value)) continue;
                $md->execute($value);
            }
            return true;
        }

        public function uninstall(){
            $md =new Model();
            $sql = "DROP TABLE IF EXISTS `tp_messages`";
            $md->execute($sql);
            return true;
        }

        /**
         * 直接调用插件件执行入口
         */
        public function  MessageBoard($param){
            $list = M('message','tp_')->order('create_time DESC')->select();
            $this->assign('list',$list);
            $this->display('message');
        }
    }