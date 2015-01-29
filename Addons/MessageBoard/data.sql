CREATE TABLE IF NOT EXISTS `tp_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT  '留言id',
  `nickname` varchar(224) NOT NULL COMMENT '留言昵称',
  `link` varchar(225) NOT NULL COMMENT '留言者联系方式',
  `content` varchar(225) NOT NULL COMMENT '留言内容',
  `create_time` int(10) NOT NULL COMMENT '留言时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `reply_time` int(10) NOT NULL COMMENT '回复时间',
  `reply` varchar(225) NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;