<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 朱亚杰 <zhuyajie@topthink.net>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Common\Controller\AdminController;
use Admin\Model\AuthRuleModel;
use Admin\Model\AuthGroupModel;

/**
 * 权限管理控制器
 * Class AuthManagerController
 * @author 朱亚杰 <zhuyajie@topthink.net>
 */
class AuthManagerController extends AdminController{

    /**
     * 后台节点配置的url作为规则存入auth_rule
     * 执行新节点的插入,已有节点的更新,无效规则的删除三项任务
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function updateRules(){
        //需要新增的节点必然位于$nodes
        $nodes    = $this->returnNodes(false);
        $AuthRule = M('AuthRule');
        $map      = array('module'=>'admin','type'=>array('in','1,2'));//status全部取出,以进行更新
        //需要更新和删除的节点必然位于$rules
        $rules    = $AuthRule->where($map)->order('name')->select();

        //构建insert数据
        $data     = array();//保存需要插入和更新的新节点
        foreach ($nodes as $value){
            $temp['name']   = $value['url'];
            $temp['title']  = $value['title'];
            $temp['module'] = 'admin';
            if($value['pid'] >0){
                $temp['type'] = AuthRuleModel::RULE_URL;
            }else{
                $temp['type'] = AuthRuleModel::RULE_MAIN;
            }
            $temp['status']   = 1;
            $data[strtolower($temp['name'].$temp['module'].$temp['type'])] = $temp;//去除重复项
        }


        $update = array();//保存需要更新的节点
        $ids    = array();//保存需要删除的节点的id
        foreach ($rules as $index=>$rule){
            $key = strtolower($rule['name'].$rule['module'].$rule['type']);
            if ( isset($data[$key]) ) {//如果数据库中的规则与配置的节点匹配,说明是需要更新的节点
                $data[$key]['id'] = $rule['id'];//为需要更新的节点补充id值
                $update[] = $data[$key];
                unset($data[$key]);
                unset($rules[$index]);
                unset($rule['condition']);
                $diff[$rule['id']]=$rule;
            }elseif($rule['status']==1){
                $ids[] = $rule['id'];
            }
        }
        if ( count($update) ) {
            foreach ($update as $k=>$row){
                if ( $row!=$diff[$row['id']] ) {
                    $AuthRule->where(array('id'=>$row['id']))->save($row);
                }
            }
        }
        if ( count($ids) ) {
            $AuthRule->where( array( 'id'=>array('IN',implode(',',$ids)) ) )->save(array('status'=>-1));
            //删除规则是否需要从每个用户组的访问授权表中移除该规则?
        }
        if( count($data) ){
            $AuthRule->addAll(array_values($data));
        }
        if ( $AuthRule->getDbError() ) {
            trace('['.__METHOD__.']:'.$AuthRule->getDbError());
            return false;
        }else{
            return true;
        }
    }


    /**
     * 权限管理首页
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function index(){
        $list = $this->lists('AuthGroup',array('module'=>'admin'),'id asc');
        $list = int_to_string($list);
        $this->assign( '_list', $list );
        $this->assign( '_use_tip', true );
        $this->meta_title = '权限管理';
        Cookie('__forward__', $_SERVER['REQUEST_URI']);
        $this->display();
    }

    /**
     * 创建管理员用户组
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function createGroup(){
        if ( empty($this->auth_group) ) {
            $this->assign('auth_group',array('title'=>null,'id'=>null,'description'=>null,'rules'=>null,));//排除notice信息
        }
        $this->meta_title = '新增用户组';
        $this->display('editgroup');
    }

    /**
     * 编辑管理员用户组
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function editGroup(){
        $auth_group = M('AuthGroup')->where( array('module'=>'admin','type'=>AuthGroupModel::TYPE_ADMIN) )
                                    ->find( (int)$_GET['id'] );
        $this->assign('auth_group',$auth_group);
        $this->meta_title = '编辑用户组';
        $this->display();
    }


    /**
     * 访问授权页面
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function access(){
        $this->updateRules();
        $auth_group = M('AuthGroup')->where( array('status'=>array('egt','0'),'module'=>'admin','type'=>AuthGroupModel::TYPE_ADMIN) )
                                    ->getfield('id,id,title,rules');
        $node_list   = $this->returnNodes();
        $map         = array('module'=>'admin','type'=>AuthRuleModel::RULE_MAIN,'status'=>1);
        $main_rules  = M('AuthRule')->where($map)->getField('name,id');
        $map         = array('module'=>'admin','type'=>AuthRuleModel::RULE_URL,'status'=>1);
        $child_rules = M('AuthRule')->where($map)->getField('name,id');

        $this->assign('main_rules', $main_rules);
        $this->assign('auth_rules', $child_rules);
        $this->assign('node_list',  $node_list);
        $this->assign('auth_group', $auth_group);
        $this->assign('this_group', $auth_group[(int)$_GET['group_id']]);
        $this->meta_title = '访问授权';
        $this->display('managergroup');
    }

    /**
     * 管理员用户组数据写入/更新
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function writeGroup(){
        if(isset($_POST['rules'])){
            sort($_POST['rules']);
            $_POST['rules']  = implode( ',' , array_unique($_POST['rules']));
        }
        $_POST['module'] =  'admin';
        $_POST['type']   =  AuthGroupModel::TYPE_ADMIN;
        $AuthGroup       =  D('AuthGroup');
        $data = $AuthGroup->create();
        if ( $data ) {
            if ( empty($data['id']) ) {
                $r = $AuthGroup->add();
            }else{
                $r = $AuthGroup->save();
            }
            if($r===false){
                $this->error('操作失败'.$AuthGroup->getError());
            } else{
                $this->success('操作成功!',U('index'));
            }
        }else{
            $this->error('操作失败'.$AuthGroup->getError());
        }
    }

    /**
     * 状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method=null){
        if ( empty($_REQUEST['id']) ) {
            $this->error('请选择要操作的数据!');
        }
        switch ( strtolower($method) ){
            case 'forbidgroup':
                $this->forbid('AuthGroup');
                break;
            case 'resumegroup':
                $this->resume('AuthGroup');
                break;
            case 'deletegroup':
                $this->delete('AuthGroup');
                break;
            default:
                $this->error($method.'参数非法');
        }
    }

    /**
     * 将分类添加到用户组  入参:cid,group_id
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function addToCategory(){
        $cid = I('cid');
        $gid = I('group_id');

        if( empty($gid) ){
            $this->error('参数有误');
        }
        $AuthGroup = D('AuthGroup');
        if( !$AuthGroup->find($gid)){
            $this->error('用户组不存在');
        }
        if( $cid && !$AuthGroup->checkCategoryId($cid)){
            $this->error($AuthGroup->error);
        }
        if ( $AuthGroup->addToCategory($gid,$cid) ){
            $this->success('操作成功',LK());
        }else{
            $this->error('操作失败');
        }
    }


    /**
     * 栏目授权
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function category(){
        $map = array('status'=>array('gt',-1),'type'=>array('in','1,2'));

        $list = D('Category')->where($map)->select();
        //得到栏目树形结构
        $tree =list_to_tree($list,'id','pid','children');

        //得到树形结构的先序遍历集合
        $sortList= array();
        tree_to_list_first($tree,'children',$sortList);

        //判断节点是不是父亲节点的最后一个孩子
        //用于前台显示判断
        foreach($sortList as $key => $value){
            $children = &$sortList[$key]['children'];
            if(isset($children)){
                $count = count($children);
                foreach($sortList as $m_key => $m_value){
                    //当前孩子节点的ID等于父亲节点ID，则是最后一个节点
                    if($m_value['id'] == $children[$count-1]['id']){
                        $sortList[$m_key]['last'] = true;
                    }
                }
            }
        }

        $authed_group   =   AuthGroupModel::getCategoryOfGroup(I('group_id'));
        $this->assign('authed_group', (array)$authed_group);
        $this->assign('nodeList',     $sortList);
        $this->assign('this_group',$_GET['group_id']);
        $this->display();
    }

    /**
     * 模块授权
     */
    public function  module(){
        $list       =   M('Module')->select();
        int_to_string($list);
        $authed_group   =   AuthGroupModel::getModuleOfGroup(I('group_id'));
        $this->assign('authed_group', (array)$authed_group);
        $this->assign('nodeList',     $list);
        $this->assign('this_group',$_GET['group_id']);
        $this->display();
    }

    public function addToModule(){
        $mid = I('mid');
        $gid = I('group_id');
        if( empty($gid) ){
            $this->error('参数有误');
        }
        $AuthGroup = D('AuthGroup');
        if( !$AuthGroup->find($gid)){
            $this->error('用户组不存在');
        }
        if( $mid && !$AuthGroup->checkModuleId($mid)){
            $this->error($AuthGroup->error);
        }
        if ( $AuthGroup->addToModule($gid,$mid) ){
            $this->success('操作成功',LK());
        }else{
            $this->error('操作失败');
        }
    }
}
