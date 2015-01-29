<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

namespace Common\Api;
class CommentApi {
    /**获取评论
     * @param $table
     * @param $topic_id
     * @param $page
     * @param array $map
     * @param string $order
     * @return bool
     */
    public function comments($table,$topic_id,$page,$map=array(),$order='create_time DESC'){
        $map['topic_table'] = $table;
        $map['topic_id']  =$topic_id;

        $model  = D('Comment')->where($map)->order($order);
        if(is_numeric($page)){
            $model->page($page,C('COMMENT_LIST'));
        }else{
            $model->limit($page);
        }
        $result = $model->select();
        if(!$result){
            return false;
        }else{
            foreach($result as $k => $v){
                $result[$k]['create_time_text'] = formatTime($v['create_time']);
                $result[$k]['uid_text'] = api('User/get_nickname',array('uid'=> $v['uid']));
            }
        }

        return $result;
    }

    /**获取评论数量
     * @param $table
     * @param $topic_id
     * @return mixed
     */
    public function comment_num($table,$topic_id){
        $map['topic_table'] = $table;
        $map['topic_id'] = $topic_id;
        $map['pid'] = 0;
        return D('Comment')->where($map)->count(); //评论数量,不包括回复数量
    }

}