-- phpMyAdmin SQL Dump
-- version 4.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 29, 2015 at 01:34 PM
-- Server version: 5.5.38
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jdicms`
--

-- --------------------------------------------------------

--
-- Table structure for table `jdi_action`
--

CREATE TABLE `jdi_action` (
`id` int(11) unsigned NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jdi_action`
--

INSERT INTO `jdi_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 1, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 0, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 1, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, -1, 1418542406),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, -1, 1418542415),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, -1, 1418890941),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, -1, 1418540966),
(12, 'update_sports', '更新项目库', '更新项目库', '', '', 1, 1, 1419212751);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_action_log`
--

CREATE TABLE `jdi_action_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=736 ;

--
-- Dumping data for table `jdi_action_log`
--

INSERT INTO `jdi_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(701, 10, 1, 0, 'Menu', 269, '操作url：/jdicms/admin.php/Menu-add.html', 1, 1421198978),
(702, 10, 1, 0, 'Menu', 270, '操作url：/jdicms/admin.php/Menu-add.html', 1, 1421199033),
(703, 10, 1, 0, 'Menu', 271, '操作url：/jdicms/admin.php/Menu-add.html', 1, 1421199059),
(704, 1, 1, 0, 'member', 1, '李浩在2015-01-17 16:38登录了后台', 1, 1421483934),
(705, 1, 1, 0, 'member', 1, '李浩在2015-01-17 16:39登录了后台', 1, 1421483963),
(706, 1, 1, 0, 'member', 1, '李浩在2015-01-22 09:58登录了后台', 1, 1421891910),
(707, 1, 1, 0, 'member', 1, '李浩在2015-01-22 09:58登录了后台', 1, 1421891922),
(708, 10, 1, 0, 'Menu', 272, '操作url：/jdicms/admin.php/Menu-edit.html', 1, 1422062065),
(709, 10, 1, 0, 'Menu', 273, '操作url：/jdicms/admin.php/Menu-edit.html', 1, 1422062073),
(710, 10, 1, 0, 'Menu', 274, '操作url：/jdicms/admin.php/Menu-edit.html', 1, 1422062093),
(711, 10, 1, 0, 'Menu', 275, '操作url：/jdicms/admin.php/Menu-edit.html', 1, 1422062222),
(712, 10, 1, 0, 'Menu', 276, '操作url：/jdicms/admin.php/Menu-edit.html', 1, 1422062233),
(713, 1, 1, 0, 'member', 1, '李浩在2015-01-26 10:03登录了后台', 1, 1422237828),
(714, 1, 1, 0, 'member', 1, '李浩在2015-01-26 10:03登录了后台', 1, 1422237834),
(715, 8, 1, 0, 'attribute', 256, '操作url：/jdicms/admin.php/Attribute-update.html', 1, 1422241670),
(716, 1, 1, 0, 'member', 1, '李浩在2015-01-26 22:40登录了后台', 1, 1422283228),
(717, 10, 1, 0, 'Menu', 277, '操作url：/jdicms/admin.php/Menu-add.html', 1, 1422338074),
(718, 1, 1, 0, 'member', 1, '李浩在2015-01-28 01:41登录了后台', 1, 1422380492),
(719, 1, 1, 0, 'member', 1, '李浩在2015-01-28 01:41登录了后台', 1, 1422380501),
(720, 10, 1, 0, 'Menu', 278, '操作url：/jdicms/admin.php/Menu-add.html', 1, 1422386053),
(721, 10, 1, 0, 'Menu', 278, '操作url：/jdicms/admin.php/Menu-edit.html', 1, 1422413687),
(722, 10, 1, 0, 'Menu', 279, '操作url：/jdicms/admin.php/Menu-add.html', 1, 1422413727),
(723, 1, 1, 0, 'member', 1, '李浩在2015-01-28 12:18登录了后台', 1, 1422418681),
(724, 1, 1, 0, 'member', 1, '李浩在2015-01-28 15:13登录了后台', 1, 1422429234),
(725, 10, 1, 0, 'Menu', 280, '操作url：/jdicms/admin.php/Menu-add.html', 1, 1422431010),
(726, 1, 1, 0, 'member', 1, '李浩在2015-01-28 20:07登录了后台', 1, 1422446832),
(727, 1, 1, 0, 'member', 1, '李浩在2015-01-28 20:22登录了后台', 1, 1422447737),
(728, 1, 36, 0, 'member', 36, 'test在2015-01-29 15:22登录了后台', 1, 1422516174),
(729, 1, 36, 0, 'member', 36, 'test在2015-01-29 15:27登录了后台', 1, 1422516440),
(730, 1, 36, 0, 'member', 36, 'test在2015-01-29 15:30登录了后台', 1, 1422516631),
(731, 1, 1, 0, 'member', 1, '李浩在2015-01-29 15:57登录了后台', 1, 1422518269),
(732, 1, 1, 0, 'member', 1, '李浩在2015-01-29 15:58登录了后台', 1, 1422518299),
(733, 1, 36, 0, 'member', 36, 'test在2015-01-29 15:58登录了后台', 1, 1422518322),
(734, 1, 1, 0, 'member', 1, '李浩在2015-01-29 18:03登录了后台', 1, 1422525797),
(735, 1, 36, 3232235633, 'member', 36, 'test在2015-01-29 19:44登录了后台', 1, 1422531841);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_addons`
--

CREATE TABLE `jdi_addons` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `jdi_addons`
--

INSERT INTO `jdi_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(16, 'MessageBoard', '留言版', '留言板', 1, '{"random":"1"}', 'tp', '0.1', 1422329206, 1),
(17, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1422380556, 0),
(19, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"2006241","comment_short_name_duoshuo":"","comment_form_pos_duoshuo":"buttom","comment_data_list_duoshuo":"10","comment_data_order_duoshuo":"asc"}', 'thinkphp', '0.1', 1422533740, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_article`
--

CREATE TABLE `jdi_article` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '外链',
  `deadline` int(10) NOT NULL COMMENT '截止时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '内容页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `title_color` char(10) NOT NULL DEFAULT '#555' COMMENT '内容页标题颜色',
  `list_color` char(10) NOT NULL DEFAULT '#555' COMMENT '列表页标题颜色',
  `content` text NOT NULL COMMENT '文章内容',
  `is_up` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `position` varchar(100) NOT NULL DEFAULT '0' COMMENT '推荐位',
  `cover` varchar(150) NOT NULL COMMENT '封面',
  `extend` text NOT NULL COMMENT '扩展统计字段',
  `weight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `auto_image` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '提取封面图片'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jdi_article`
--

INSERT INTO `jdi_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`, `weight`, `keyword`, `auto_image`) VALUES
(1, '我', 1, 3, '&lt;img src=&quot;/jdicms/Uploads/editor/image/20150123/54c2184529ef0.jpg&quot; title=&quot;54c2184529ef0.jpg&quot; alt=&quot;u=772942726,2163368331&amp;amp;', '', 0, 21, 1422006401, 1422527840, '', 1, '#555', '#555', '&lt;p&gt;&lt;img src=&quot;/jdicms/Uploads/editor/image/20150123/54c2184529ef0.jpg&quot; title=&quot;54c2184529ef0.jpg&quot; alt=&quot;u=772942726,2163368331&amp;amp;fm=21&amp;amp;gp=0.jpg&quot;/&gt;&lt;/p&gt;&lt;p&gt;啊实打实大打算阿萨德d&lt;/p&gt;&lt;pre class=&quot;brush:php;toolbar:false&quot;&gt;&lt;br/&gt;&lt;/pre&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '3,', '', '', 0, '', 1),
(2, 'dasdasd', 1, 4, '看完这一期的《我是歌手》，有个问题一直在思考，是谁在左右大众评审的耳朵？媒体舆论一直在争执“飙高音的歌手是否更适合这个舞台”，让大众评审现在在投票时对高音歌手出奇的挑剔，而对抒情歌手更多的青睐。一种“补偿”的心态似乎正在蔓延，可能会左右这一季很长时间。今天的官方微博以“绝世武功”做主题设计了海报，一场群雄纷争，混战厮杀就此开始。', '', 0, 18, 1422105661, 1422105737, '', 1, '#555', '#555', '&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;/jdicms/Uploads/editor/image/20150124/54c39bd2da13d.jpg&quot; title=&quot;54c39bd2da13d.jpg&quot; alt=&quot;14ce36d3d539b600c79c6193ea50352ac65cb740.jpg&quot; width=&quot;247&quot; height=&quot;355&quot; style=&quot;width: 247px; height: 355px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;看完这一期的《我是歌手》，有个问题一直在思考，是谁在左右大众评审的耳朵？媒体舆论一直在争执“飙高音的歌手是否更适合这个舞台”，让大众评审现在在投票时对高音歌手出奇的挑剔，而对抒情歌手更多的青睐。一种“补偿”的心态似乎正在蔓延，可能会左右这一季很长时间。今天的官方微博以“绝世武功”做主题设计了海报，一场群雄纷争，混战厮杀就此开始。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;最终排名还是有点出乎意料：韩红1，黄丽玲2，李健3，胡彦斌4，孙楠5，古巨基6，张靓颖7。本人本场的个人排名完全不同：胡彦斌1，孙楠2，古巨基3，张靓颖4，韩红5，黄丽玲6，李健7。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;胡彦斌，赤裸裸地再次炫耀自己改编的才华，本季第一次摇滚演绎，非常出色，大胆突破自己，嗨动气氛。终于给小胡的嗓音找到了一个贴切的名词——金属拉丝般的嗓音，如滚石在金属上反复拉扯出的一道道痕迹，鸡皮疙瘩，却又上瘾般的美妙！摇滚新境界，当属今晚的胡彦斌。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;孙楠，流浪流浪，空灵高亢，这首歌的改编好听过小哥的版本。稳定的发挥反而给孙楠的排名带了弊病，在我歌的舞台，有一种“一如既往”叫排名不前！为胖楠有点叫屈，露背装还是蛮拼的，希望下一首孙楠大胆突破，焕然一新！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;古巨基，从《好想好想》到《突然好想你》，一种蜕变的成熟，基仔很会唱歌，这首歌的演绎完全摆脱了五月天的影子，一如一首崭新的情歌，真的好听好听。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;张靓颖，飙高音有什么错，今晚排名第七有点吃亏，如今大家都在刻意躲避高音歌手，今晚的《离歌》其实表现得不错，结尾处那句直窜云霄的高音堪称完美，唢呐的搭配，增强了离悲的情绪。为什么会输，还是因为选歌不慎，这首烂透了的K歌之王，每个人都有自己不同的嘶吼，所以很少能赢得大家一致的惊叹和认同，选择《离歌》，女神，你是要离开我歌的节奏吗？&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;韩红，自费的马头琴乐队，有钱任性。韩红一直给我的感觉就是唱得不错，但是始终不走心。今晚的蒙语，有想法，但是还是显得做作，形式感的东西太多，什么时候让我们见识一下不同的韩红。40岁和50岁的选票帮了韩红一把，继续稳坐第一，难以撼动。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;黄丽玲，听重播第二遍才觉得有味道，与那英的嗓音类而不同，更有力量但是辨识度不足，今天的演绎犹如郁闷般的发泄却打在棉花上，爱上你等于爱上寂寞，无可又奈何，至于我把她排名第六，主要是因为我更喜欢那英那版的演绎。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;李健，本来非常期待的《贝加尔湖畔》原唱，却略显失望，不是他发挥不好，而是一百个人心中有一百个自己的贝加尔湖，李健的这曲不够纯净，暗含很多故事。在我心里，我的贝加尔湖是最纯净的，正如李维和周深版那样。不过健哥的确帅，诗人般的俊朗，他妈的还是清华的，让人心生嫉妒。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;返场的李荣浩，平淡无奇的《笑忘书》，毫无亮点，难以逾越的王菲，唱完不罗嗦直接走掉，杰伦般的屌。如此的谢幕，只希望他“笑着忘掉在我歌的输”！&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;如今的我歌，胜负毫厘，不分伯仲，混战混战，下周再战，靓颖反弹，谁走好难！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', '', '', 0, '', 1),
(3, '我的', 1, 4, '布里斯班的第三场比赛，体育场周边早早就涌动着红色的海洋，我努力要将眼睛看到的一切都刻在脑海里，多年后再追忆，会存留些什么呢？记忆一定会有磨损，比如如今再想起2004年8月7日中国亚洲杯决赛，我耳边似乎还能清晰地想起比赛行将结束时，耳机里急促的叮嘱，接收失败很难吗？未必，就看输给谁，在哪儿输，以怎样的方式输。', '', 0, 6, 1422105700, 1422105719, '', 1, '#555', '#555', '&lt;p&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-family: 华文仿宋; font-size: 18px;&quot;&gt;&lt;img src=&quot;http://ww2.sinaimg.cn/large/005AYphGjw1eoj050i7jgj30qe0hm79l.jpg&quot; real_src=&quot;http://ww2.sinaimg.cn/large/005AYphGjw1eoj050i7jgj30qe0hm79l.jpg&quot; alt=&quot;亚洲杯有感：请继续哀兵之态&quot; title=&quot;亚洲杯有感：请继续哀兵之态&quot; action-data=&quot;http%3A%2F%2Fww2.sinaimg.cn%2Flarge%2F005AYphGjw1eoj050i7jgj30qe0hm79l.jpg&quot; action-type=&quot;show-slide&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; list-style: none; max-width: 100%;&quot;/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-family: 华文仿宋; font-size: 18px;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;布里斯班的第三场比赛，体育场周边早早就涌动着红色的海洋，我努力要将眼睛看到的一切都刻在脑海里，多年后再追忆，会存留些什么呢？记忆一定会有磨损，比如如今再想起&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;2004&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;7&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;日中国亚洲杯决赛，我耳边似乎还能清晰地想起比赛行将结束时，耳机里急促的叮嘱，接收失败很难吗？未必，就看输给谁，在哪儿输，以怎样的方式输。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;2015&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;22&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;日，输给东道主，在阔别&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;125&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;个月的亚洲国家队顶级赛事的淘汰赛中输掉比赛，以拼尽全力的方式没能挽回败局，我们应该坦然接受这一结局，没有一句抱怨，暂且将疑问和不解包裹起来，此时不是战术复盘的最佳时刻。我们可以安慰自己，这不是个最好的结束方式，但可以是中国队再度出发的最佳起点，这份收获在出征澳大利亚前，在战胜乌兹别克斯坦前，都是断然不敢奢望的。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-family: 华文仿宋; font-size: 18px;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;当我走进布里斯班大球场时，大门还未向球迷打开，场地内空空荡荡，前一天铺撒的绿色小颗粒将原本斑驳的球场装点得生机勃发。场地内正在彩排球队入场，《义勇军进行曲》昂然奏响，我在看台上用手机记录着这一瞬间，算计着中国队缺席这一时刻到底已经多久，真会出现大家普遍期待的转折时刻或是蚕变时刻吗？还会继续高歌猛进吗？我是悲观者，但并无妨碍我对比赛戏剧性的无限向往。赛前，一位前国脚非常肯定地对我说，中澳之间是有三球差距的，中国队如果输两个很正常的。当时，我无感，因为中国队此前连一个丈量差距的机会都没有。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-family: 华文仿宋; font-size: 18px;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;就让这机会在我们眼前爆发吧。首发阵容前所未有的莫测，拿到手中习惯性地揣度佩兰的苦心，希望随着他的调整，中国队能踢得有模有样。开场的攻击性出乎意料，压迫性逼得自己比对手更早地发动马力，澳大利亚略显匆忙地进入比赛，躯体的僵硬和配合的局促让我们畅想很多，但比赛进行到这样的阶段，对抗的是球队的深度、厚度、气度，中国队能力的边界显露得太早，不足以支撑教练隐藏在背后的雄心。中国队可以多种姿态出战东道主，稳健中寻求控制，以控制自己和球进而达成对于比赛的局部控制，但初始的姿态是压迫性地试图在全场与对手争夺控制权，这需要充沛的体能，需要一以贯之的控制能力。很遗憾，中国队支撑了&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;15&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;分钟后，便将主动权交给了对手。不需要太细致的技术统计，仅从观感上便可以感知，两队差距之大。此时，你更会清晰地记得巴西世界杯上，澳大利亚输掉的三场比赛，&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;0&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;（西班牙）、&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;1&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;（智利）和&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;2&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;（荷兰），这是一支可以与世界强队拉开架势，站得稳，有攻防对抗能力甚至可以有世界波的球队，以上三个比分是他们与世界最高水准丈量的结果。&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;11&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;年来，第一场高强度、高压力事关生死的比赛，结果一切正常。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-family: 华文仿宋; font-size: 18px;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;欠缺比赛，欠缺如此有价值的比赛，何谈质的转变，三场小组赛的价值在于目前算是可以平顺地赢下同等级对手了，虽小有波折，但球员们对于胜利的坚信程度在增强。经过这一场对抗，中国队内部的心态很会各不相同，吉翔赛后第一反应是，不该过度高看对手，这份源自场上的感受是不能被替代的。也有球员也会体会到对手的强大所在，对手施加的压力让中国队球员之间丧失了有效的关联，根本不可能从容地进行区域配合。澳大利亚比我们更习惯于此类比赛，比我们调整更快，更有效，这就是亚洲一流的水准，我们在短期内越过他们不现实。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-family: 华文仿宋; font-size: 18px;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;其实，没打澳大利亚之前，中国队的亚洲杯赛已经赢了，而且取得了巨大的能效，同时证明中国队在赛场丧失的一切，必须在赛场上靠自己去夺回，没有捷径可言。三场九分，小组第一，过程清晰，至少逆转了国字号的美誉度，此前负面居多，而今可以平常心待之，再以批评中国足球错误而证明自己正确的习惯思维方式也可以慢慢寿终正寝了。但是，中国足球仍不具备高位运行的能力，澳大利亚人帮我们确认了这一点，理论上与日本、韩国和伊朗之战的机会还要再等等。如此，也就踏实了，稳住亚洲第二阵营的地位，常来八强行列就算正常表现，心怀憧憬，但不做虚妄。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(188, 211, 229);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-family: 华文仿宋; font-size: 18px;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 华文仿宋;&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; line-height: 27px; font-size: 18px;&quot;&gt;能有澳大利亚亚洲杯不错结果，哀兵姿态该是主因之一，哀兵虽不保必胜，但哀兵同时具有的特质一点也不能少吧——专注、坚韧、老实、搏命。这样的心态不仅仅该长久属于中国国家足球队，更该属于即将迎来变革微妙期的中国足球改革吧。昂头活着，低头奋进，与中国足球共勉。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', '', '', 0, '', 1);
INSERT INTO `jdi_article` (`id`, `title`, `uid`, `category_id`, `description`, `link`, `deadline`, `view`, `create_time`, `update_time`, `url`, `status`, `title_color`, `list_color`, `content`, `is_up`, `position`, `cover`, `extend`, `weight`, `keyword`, `auto_image`) VALUES
(4, '大大说dasd 啊', 1, 4, '采访中，陈赫一直强调自己很希望家庭和事业能够两头兼顾，多一点时间陪爱人。殊不知那只是理想状态，因为忙于事业，他的童话婚姻在半年前已经破灭。13年的爱情长跑不易，经营一辈子的婚姻更难，想必在回忆以往甜蜜的同时，他一定也明白了这个道理。\r\n&lt;img src', '', 0, 24, 1422105770, 1422105770, '', 1, '#555', '#555', '&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;font-family:宋体;word-wrap: normal; word-break: normal;&quot;&gt;采访中，陈赫一直强调自己很希望家庭和事业能够两头兼顾，多一点时间陪爱人。殊不知那只是理想状态，因为忙于事业，他的童话婚姻在半年前已经破灭。13年的爱情长跑不易，经营一辈子的婚姻更难，想必在回忆以往甜蜜的同时，他一定也明白了这个道理。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(232, 220, 200);&quot;&gt;&lt;img src=&quot;http://s16.sinaimg.cn/bmiddle/001IgbT4gy6PoQkTD0b2f&amp;690&quot; real_src=&quot;http://s16.sinaimg.cn/bmiddle/001IgbT4gy6PoQkTD0b2f&amp;amp;690&quot; name=&quot;image_operate_72671421981490136&quot; alt=&quot;陈赫“贱”入佳境&quot; title=&quot;陈赫“贱”入佳境&quot; action-data=&quot;http%3A%2F%2Fs16.sinaimg.cn%2Fbmiddle%2F001IgbT4gy6PoQkTD0b2f%26690&quot; action-type=&quot;show-slide&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; list-style: none; line-height: 1.5; text-indent: 28px;&quot;/&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; color: rgb(35, 59, 46); font-weight: bold; font-size: 10.5pt;&quot;&gt;“跑男”遇上《微爱》&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; color: rgb(231, 0, 18); font-size: 10.5pt;&quot;&gt;“我在跑男里就是真实的自己。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;光看《奔跑吧，兄弟》在重庆拍摄现场围观的里三层外三层“跑粉”，就知道这档节目有多火。粉丝们不遗余力地想穿过人山人海只为在人群中多看偶像一眼，一位《爱情公寓》的“忠粉”面露担心：“不知道贤哥的腰好了没？还好他陪伴节目走到了最后。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;在杭州拍摄的第一期节目，一上阵就要背起将近200斤的大妈、踩着&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt; text-indent: 21pt;&quot;&gt;硌死人的指压板飞奔，因为在学校时打排球腰上有伤，陈赫一背起大妈就觉得自己完了，但仍坚持录了几个环节。最后实在支撑不住，节目组只能叫急救车把他送进了医院。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;对这次掉链子，陈赫直呼遗憾，但接下来的几期他却越来越进入状态——不是表现得最好的那个，却是表现得最“贱”的那个。吃记忆飞饼的环节，队友紧张地盯着他吃东西的顺序，生怕因他的错误而被弹入水中，他却置队友的“生死”于不顾，表情妩媚，吃得自得其乐，搞得Angelababy和郑恺心都碎了。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;看了节目人们才发现，其实陈赫的那些微表情——挑眉、斜眼、扁嘴巴、贱笑——都是自然流露，没有一丝表演成分。而也因为他的天然“贱”，为他赢得了第一次触电的机会。&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;刚签约华谊不久，经纪人喊陈赫去试镜顾长卫导演的新电影《微爱之渐入佳境》，他觉得自己肯定不行，见了好几次导演，都很冷场。两人就那么干坐着，也不说话，大眼瞪小眼地互相看着。没想到最后得到通知：他虽不动声色却力压所有演员，拿到了男主角资格！毫无疑问，正是他在《爱情公寓》中“好男人”般的幽默和风趣与电影中的都市喜剧爱情相吻合。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;表演系出身，成功进军影坛，陈赫也算圆梦了。但他儿时的梦想本与演员无关。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-align: center; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; color: rgb(35, 59, 46); font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;img src=&quot;http://s7.sinaimg.cn/mw690/001IgbT4gy6PoQ8A4yab6&amp;690&quot; real_src=&quot;http://s7.sinaimg.cn/mw690/001IgbT4gy6PoQ8A4yab6&amp;amp;690&quot; name=&quot;image_operate_47941421981491200&quot; alt=&quot;陈赫“贱”入佳境&quot; title=&quot;陈赫“贱”入佳境&quot; action-data=&quot;http%3A%2F%2Fs7.sinaimg.cn%2Fmw690%2F001IgbT4gy6PoQ8A4yab6%26690&quot; action-type=&quot;show-slide&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; list-style: none; line-height: 1.5; text-indent: 28px;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-weight: bold; font-size: 10.5pt;&quot;&gt;舞台上当厨师&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; color: rgb(231, 0, 18); font-size: 10.5pt;&quot;&gt;“你猜我小时候的梦想是什么？是厨师。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;每个好男人都有一个能为爱人掌勺的厨师梦，陈赫也想当厨师，不过初衷是喂饱自己。&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;小时候，陈赫是出了名的捣蛋鬼，大院里谁的车坏了、谁家的玻璃碎了，肯定都是他带着那些孩子干的。淘气的孩子体力消耗大，饿得也快，小小年纪的他一人就能吃好几个人的饭。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;一年级时，爸妈上班不在家，他打电话给妈妈喊饿，问今天吃什么。妈妈说冰箱里有菜，把菜的做法给他讲了一遍，让他试着自己做。没想陈赫还真有做饭的天赋，做的菜不仅美味而且卖相也大赞。从那时起他便养成了一个习惯：不管什么菜谱，只要听一遍，就能自己做出来。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;到了高三，父母开始关心起陈赫的将来。妈妈拉着他问：“儿子，你将来想干啥？”陈赫心想，如果我说想当厨师，他们肯定不同意，就敷衍道：“我要当演员，咱们一家都是演员，我肯定也要当啊。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;他的戏言却被妈妈当了真，请假陪着儿子去北京和上海考试，从中央戏剧学院、北京电影学院，一路来到上海戏剧学院。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;这三所学校在从未学过表演的陈赫心里，简直是高不可攀的神坛。幸好他从小就跟随妈妈在话剧团的舞台边长大，耳濡目染，不算两眼一抹黑。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;当年考试的情景陈赫依然记忆犹新。“有天在中戏考完二试，看到我妈在巷口等我。冬天，风吹得很烈，我妈一个人在那儿站着，当时我心里就很感动，心想不管怎么样我都要拼一次。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;考“上戏”初试那天，题目是表演“看榜”。所有人都拥上去看黑板，只有陈赫往后退，蹲在后面。等一起考试的学生表演完，陈赫才站起来，看一眼就走，什么夸张的表演都没有，却让老师记住了这个聪明的小孩。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;等到最后口试时，老师拿着一张写着电话号码的纸找到他：“这是我们教务处的号码，你是我们第一个破格录取的学生。只要你考过了文化课，打这个电话就可以来上学了。”陈赫把纸条揣在兜里，心跳得很厉害。走到校门口，看到妈妈，拿出这张纸，什么话都没说，眼泪却飞出来了。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-weight: bold; font-size: 10.5pt;&quot;&gt;幸遇《爱情公寓》&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; color: rgb(231, 0, 18); font-size: 10.5pt;&quot;&gt;“我不可能一辈子演曾小贤，我什么角色都会尝试，但是我希望以后如果提到中国喜剧的话，观众能想起有一部《爱情公寓》这样的戏。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;“我是个幸运的人。”陈赫一直强调。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;毕业之后他进入上海话剧中心，第一部戏就是在知名青年导演何念的话剧《疯狂的疯狂》中扮演男一号，这个角色本属于黄渤。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;演完《疯狂的疯狂》，《爱情公寓》就来了。试的第一个角色是陆展博，试着试着，他觉得这个角色和自己不对口，台词怎么念都念不出感觉，只能放弃：“导演，对不起，我达不到你的要求，我走了。”谁知道导演追出来问：“我这里有一个主持人的角色，你帮我读一句话。”那句话就是曾小贤在《爱情公寓》里说得最多的标志性语言：“欢迎收听《你的月亮我的心》，好男人就是我，我就是曾小贤。”陈赫刚念完，导演就说：“你可以来我们剧组了。”&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;《爱情公寓》的走红，和剧中个性相异的几位主演有着莫大关联。曾小贤这个角色最为出彩。剧中的曾小贤很敏感，是一个老好人，特别爱管闲事，但每次出的都是馊主意。“他总认为自己是最棒的，其实他是一个失败者，他主持的节目永远是在午夜十二时开始，他做的事是帮助人家解决爱情问题，但是自己的爱情问题一塌糊涂。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;陈赫把这个角色演得活脱，他觉得自己入戏“太深”，甚至生活都在向曾小贤靠拢，“以前不是那么像，但演了5年后大家都说越来越像了，以前大学的时候比较宅，演了曾小贤之后我自己的性格也变得越来越开朗和幽默了。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-weight: bold; font-size: 10.5pt;&quot;&gt;初恋一辈子&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; color: rgb(231, 0, 18); font-size: 10.5pt;&quot;&gt;“每次谈起这件事，我都骄傲得恨不得用下巴俯视世界——哥把初恋谈了13年，最后修成正果了，哥实在觉得自己帅爆了！”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;和把自己的爱情搞得一塌糊涂的曾小贤不同，陈赫的爱情拥有让人羡慕的所有关键词——一见钟情、初恋、13年爱情长跑、一辈子。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;14年前，陈赫对许婧一见钟情。几个同学在一起打水枪，陈赫一眼就看到了许婧，从此便在同学的关注和老师的暴怒中开始了坏男孩和乖&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;女孩的早恋。“其实这种感情是非常单纯和透明的，无非是看到她就开心，想呆在她身边跟她说说话。那么多人断言我们无法长远，我就算赌气，也要把自己变好，让自己变得配得上这份感情，证明给全世界看她跟我在一起一定会幸福。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;陈赫在上海戏剧学院上学期间，许婧考入浙江传媒学院。几乎每个周末他都会坐火车去杭州看女友，“周日晚上再坐火车回学校，除了生病、有事的几次缺席，那3年里我为铁道部贡献了144张车票。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;毕业后经过5年打拼，2013年9月陈赫终于和许婧在泰国普吉岛完婚。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;婚后，他毫不讳言自己是“妻管严”，甚至因为经常跪键盘而自嘲是“常跪”，还认为怕老婆是好男人基本标志。陈赫最想提醒广大男同胞：“千万不要和女人讲道理。也许你的道理是对的，但讲道理这件事本身就错大了。对女人而言，她肯定不是不明白道理，她只是需要证明：在你心里她比道理重要。说到底，让着一个你爱的人，有多难呢？”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;曾干过和老婆论战这种蠢事的他，如今总结的经验就是学会看老婆脸色。“要是不认同老婆的做法，就找她心情好的时候半开玩笑地教育她。她多半会委屈地撒娇说：‘好嘛好嘛，以后不犯了。’”如果发生争执，多数情况下陈赫会拿出“常跪”的气概来低头认错，“哄老婆开心有很多方式：给她做一顿爱心晚餐，或者替她把淘宝账户购物车里的账结了……”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;不过在和老婆的“战争”中他也有罕见的胜利，“我老婆身高1.69米，体重不到100斤，她还要减肥。后来我就跟她说：‘从现在开始你吃什么我吃什么，你不吃我也不吃，如果在片场饿到晕倒，我就说是老婆逼我减肥’。两天下来，老婆被我吓到了，废除了减肥计划。”&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; text-indent: 21pt; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;生活中的陈赫其实很简单，他喜欢打游戏、看漫画书、玩微博、煮饭，还爱养宠物。在他福州的家里，有五六条金毛猎犬，而在上海的家里，也有猫有狗，其乐无穷。在他的微博空间里，有不少猫猫狗狗的照片，还有不少自己和宠物的合影。他在图片下面配文字，有空了会替它们写剧本，故事生动又好玩，被不少网友评论为“很有爱”。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;刚结束跑男的拍摄又要到处宣传新电影《微爱之渐入佳境》，陈赫直言自己很忙，但他还是希望能够有多点的时间陪家人，“我想事业和家庭两头兼顾，我给自己立下一个目标，不要那么忙。每年拍8个月的戏，其余时间就带着爱人和父母去旅游。”虽然身在演艺圈，却没有大红大紫的野心，这是陈赫最享受的生活状态。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;&amp;nbsp;&lt;wbr/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; color: rgb(255, 0, 0); font-size: 10.5pt;&quot;&gt;明星面对面&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q=家人杂志&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;&amp;nbsp;&lt;wbr/&gt;A&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;=陈赫&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;第一部电影就出演男主角，你紧张过吗？在和Angelababy的合作过程中有什&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;么有趣的事情发生？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;非常紧张，开机第一个镜头我整个人一直在发抖。和baby合作很愉快，片场太多搞笑&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;的事了，比如我们一起打游戏。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;现在最后一期的《奔跑吧，兄弟》拍摄已经结束，你最大的收获是什么？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;是友情，我们几个人从最开始有些互相都不认识，现在成为了家人一样的存在。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;除了自己，你最爱的演员是谁？为什么？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;周星驰，觉得他很厉害，能够坚持做喜剧做了那么多年，而且一直有新的东西出来。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;每个人都可能经历波峰和波谷，你觉得你的波谷在什么时候？现在是你的波峰吗？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;其实一路走来都还算顺利，我觉得没有真正波谷的时候吧，虽然有起有落，但都是正常&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;的。至于波峰，我也觉得自己没有到最好的时候，还是一步一个脚印，希望未来越来越好。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;通常你会因为什么事情生气或高兴？怎么处理那些负面情绪呢？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;很多事情啊，吃到美食会开心，终于能睡个好觉也会很开心。有负面情绪的时候我会跟&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;身边人说出来，不会憋在心里。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;最害怕什么？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;我爱的人生病，身体不健康。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;用一句话总结工作中的自己，你会怎么说？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;棒棒哒！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;Q：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;如果没有选择做演员，你想你现在最有可能在做什么？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;A：&lt;/span&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;我现在可能真成厨师了吧，哈哈哈。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; padding: 0px; border: 0px; list-style: none; word-wrap: normal; word-break: normal; line-height: 21px; color: rgb(70, 70, 70); font-family: &amp;#39;Microsoft YaHei&amp;#39;, &amp;#39;Helvetica Neue&amp;#39;, SimSun; font-size: 14px; white-space: normal; background-color: rgb(232, 220, 200);&quot;&gt;&lt;span style=&quot;word-wrap: normal; word-break: normal; font-family: 宋体; font-size: 10.5pt;&quot;&gt;（版权所有，严禁一切商业用途的转载&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, '0', '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_article_picture`
--

CREATE TABLE `jdi_article_picture` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '外链',
  `deadline` int(10) NOT NULL COMMENT '截止时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '内容页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `picture` text COMMENT '图片',
  `weight` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `is_up` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `list_color` char(10) NOT NULL COMMENT '列表页颜色',
  `title_color` char(10) NOT NULL COMMENT '内容页颜色'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jdi_attribute`
--

CREATE TABLE `jdi_attribute` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  `validate_condition` tinyint(1) NOT NULL DEFAULT '0' COMMENT '验证条件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=257 ;

--
-- Dumping data for table `jdi_attribute`
--

INSERT INTO `jdi_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`, `validate_condition`) VALUES
(82, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 18, 1, 1, 1418891555, 1418802074, '', 3, '', 'regex', '', 3, 'function', 0),
(83, 'uid', '发布用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 18, 1, 1, 1418803756, 1418802189, '', 3, '', 'regex', '', 3, 'function', 0),
(84, 'category_id', '所属分类', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 18, 1, 1, 1418802338, 1418802338, '', 3, '', 'regex', '', 3, 'function', 0),
(85, 'description', '描述', 'varchar(255) NOT NULL', 'string', '', '内容描述', 1, '', 18, 0, 1, 1418966250, 1418802392, '0,255', 3, '', 'length', '', 3, 'function', 2),
(86, 'link', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 18, 0, 1, 1418865687, 1418802915, 'url', 3, 'url格式错误', 'regex', '', 3, 'function', 2),
(87, 'deadline', '截止时间', 'int(10) NOT NULL', 'date', '', '文章的显示截至日期,不写则代表永久有效', 1, '', 18, 0, 1, 1418890382, 1418803034, '', 3, '', 'regex', '', 3, 'function', 0),
(88, 'view', '浏览数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 18, 0, 1, 1418866062, 1418803184, '/^([1-9]\\d*)|0$/', 3, '浏览次数必须是正整数', 'regex', '', 3, 'function', 0),
(89, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'date', '', '如果不写则默认为当前时间', 2, '', 18, 0, 1, 1418865962, 1418803555, '', 3, '', 'regex', 'time', 1, 'function', 0),
(90, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 18, 0, 1, 1418803597, 1418803597, '', 3, '', 'regex', 'time', 3, 'function', 0),
(91, 'url', '内容页面url', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 18, 0, 1, 1418866509, 1418866472, '', 3, '', 'regex', '', 3, 'function', 0),
(92, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '1', '状态', 0, '', 18, 0, 1, 1418887579, 1418882734, '', 3, '', 'regex', '', 3, 'function', 0),
(93, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 20, 1, 1, 1418891555, 1418802074, '', 3, '', 'regex', '', 3, 'function', 0),
(94, 'uid', '发布用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 20, 1, 1, 1418803756, 1418802189, '', 3, '', 'regex', '', 3, 'function', 0),
(95, 'category_id', '所属分类', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 20, 1, 1, 1418802338, 1418802338, '', 3, '', 'regex', '', 3, 'function', 0),
(96, 'description', '描述', 'varchar(255)  NOT NULL', 'autoText', '', '内容描述,255个字符以内', 1, '', 20, 0, 1, 1421130059, 1418802392, '0,255', 3, '长度不能超过255个字符', 'length', '', 3, 'function', 0),
(97, 'link', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 20, 0, 1, 1420596778, 1418802915, '', 3, '', 'regex', '', 3, 'function', 0),
(98, 'deadline', '截止时间', 'int(10) NOT NULL', 'date', '', '文章的显示截至日期,不写或者显示1970-01-01则代表永久有效', 1, '', 20, 0, 1, 1418979835, 1418803034, '', 3, '', 'regex', '', 3, 'function', 0),
(99, 'view', '浏览数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 20, 0, 1, 1418866062, 1418803184, '/^([1-9]\\d*)|0$/', 3, '浏览次数必须是正整数', 'regex', '', 3, 'function', 0),
(100, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'date', '', '如果不写则默认为当前时间', 2, '', 20, 0, 1, 1418865962, 1418803555, '', 3, '', 'regex', 'time', 1, 'function', 0),
(101, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 20, 0, 1, 1418803597, 1418803597, '', 3, '', 'regex', 'time', 3, 'function', 0),
(102, 'url', '内容页面url', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 20, 0, 1, 1418866509, 1418866472, '', 3, '', 'regex', '', 3, 'function', 0),
(103, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '1', '状态', 0, '', 20, 0, 1, 1418887579, 1418882734, '', 3, '', 'regex', '', 3, 'function', 0),
(104, 'title_color', '内容页标题颜色', 'char(10)  NOT NULL', 'color', '''#555''', '默认值代表不设置', 1, '', 20, 0, 1, 1419255883, 1418954725, '', 3, '', 'regex', '', 3, 'function', 0),
(105, 'list_color', '列表页标题颜色', 'char(10)  NOT NULL', 'color', '''#555''', '默认值代表不设置', 1, '', 20, 0, 1, 1419255901, 1418954751, '', 3, '', 'regex', '', 3, 'function', 0),
(106, 'content', '文章内容', 'text NOT NULL', 'editor', '', '', 1, '', 20, 1, 1, 1418954824, 1418954824, '', 3, '', 'regex', '', 3, 'function', 0),
(107, 'is_up', '是否置顶', 'tinyint(2) NOT NULL', 'bool', '0', '', 1, '0:否\r\n1:是', 20, 0, 1, 1418956979, 1418955083, '', 3, '', 'regex', '', 3, 'function', 0),
(108, 'position', '推荐位', 'varchar(100) NOT NULL', 'checkbox', '0', '', 1, '[DOCUMENT_POSITION]', 20, 0, 1, 1419138707, 1418955236, '', 3, '', 'regex', 'position_parse', 3, 'function', 0),
(131, 'url', '内容页面url', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 22, 0, 1, 1418866509, 1418866472, '', 3, '', 'regex', '', 3, 'function', 0),
(130, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 22, 0, 1, 1418803597, 1418803597, '', 3, '', 'regex', 'time', 3, 'function', 0),
(128, 'view', '浏览数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 22, 0, 1, 1418866062, 1418803184, '/^([1-9]\\d*)|0$/', 3, '浏览次数必须是正整数', 'regex', '', 3, 'function', 0),
(127, 'deadline', '截止时间', 'int(10) NOT NULL', 'date', '', '文章的显示截至日期,不写则代表永久有效', 1, '', 22, 0, 1, 1418890382, 1418803034, '', 3, '', 'regex', '', 3, 'function', 0),
(126, 'link', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 22, 0, 1, 1418865687, 1418802915, 'url', 3, 'url格式错误', 'regex', '', 3, 'function', 2),
(125, 'description', '描述', 'varchar(255) NOT NULL', 'string', '', '内容描述', 1, '', 22, 0, 1, 1418966250, 1418802392, '0,255', 3, '', 'length', '', 3, 'function', 2),
(124, 'category_id', '所属分类', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 22, 1, 1, 1418802338, 1418802338, '', 3, '', 'regex', '', 3, 'function', 0),
(123, 'uid', '发布用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 22, 1, 1, 1418803756, 1418802189, '', 3, '', 'regex', '', 3, 'function', 0),
(122, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 22, 1, 1, 1418891555, 1418802074, '', 3, '', 'regex', '', 3, 'function', 0),
(129, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'date', '', '如果不写则默认为当前时间', 2, '', 22, 0, 1, 1418865962, 1418803555, '', 3, '', 'regex', 'time', 1, 'function', 0),
(132, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '1', '状态', 0, '', 22, 0, 1, 1418887579, 1418882734, '', 3, '', 'regex', '', 3, 'function', 0),
(133, 'file', '文件', 'int(10) UNSIGNED NOT NULL', 'file', '', '', 1, '', 22, 1, 1, 1418979125, 1418978785, '', 3, '', 'regex', '', 3, 'function', 0),
(134, 'cover', '封面', 'varchar(150) NOT NULL', 'picture', '', '', 1, '', 20, 0, 1, 1421118390, 1418979727, '', 3, '', 'regex', '', 3, 'function', 0),
(135, 'extend', '扩展统计字段', 'text NOT NULL', 'textarea', '', '', 0, '', 20, 0, 1, 1418986871, 1418986871, '', 3, '', 'regex', '', 3, 'function', 0),
(239, 'auto_image', '提取封面图片', 'mediumint(8) UNSIGNED NOT NULL', 'autoImage', '0', '0表示不提取,如果设置了封面图片则提取无效', 1, '', 20, 0, 1, 1421128801, 1421122745, '/^([1-9]\\d*)|0$/', 3, '图片提取必须是正整数或者0', 'regex', '', 3, 'function', 0),
(238, 'keyword', '关键词', 'varchar(255) NOT NULL', 'keyword', '', '', 1, 'title\r\ncontent', 20, 0, 1, 1421119003, 1421119003, '', 3, '', 'regex', '', 3, 'function', 0),
(237, 'weight', '权重', 'int(10) UNSIGNED NOT NULL', 'num', '0', '权重越大,排位越靠前', 1, '', 22, 0, 1, 1421066522, 1421066265, '', 3, '', 'regex', 'serWeight', 1, 'function', 0),
(236, 'weight', '权重', 'int(10) UNSIGNED NOT NULL', 'num', '0', '权重越大,排位越靠前', 1, '', 18, 0, 1, 1421066543, 1421066228, '', 3, '', 'regex', 'setWeight', 1, 'function', 0),
(235, 'weight', '权重', 'int(10) UNSIGNED NOT NULL', 'num', '0', '权重越大,文章排位越靠前', 1, '', 20, 0, 1, 1421128753, 1421066182, '/^(-?[1-9]\\d*)|0$/', 3, '权重必须是数字', 'regex', 'setWeight', 1, 'function', 0),
(240, 'url', '内容页面url', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 32, 0, 1, 1418866509, 1418866472, '', 3, '', 'regex', '', 3, 'function', 0),
(241, 'update_time', '更新时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 32, 0, 1, 1418803597, 1418803597, '', 3, '', 'regex', 'time', 3, 'function', 0),
(242, 'view', '浏览数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 32, 0, 1, 1418866062, 1418803184, '/^([1-9]\\d*)|0$/', 3, '浏览次数必须是正整数', 'regex', '', 3, 'function', 0),
(243, 'deadline', '截止时间', 'int(10) NOT NULL', 'date', '', '文章的显示截至日期,不写则代表永久有效', 1, '', 32, 0, 1, 1418890382, 1418803034, '', 3, '', 'regex', '', 3, 'function', 0),
(244, 'link', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 32, 0, 1, 1418865687, 1418802915, 'url', 3, 'url格式错误', 'regex', '', 3, 'function', 2),
(245, 'description', '描述', 'varchar(255) NOT NULL', 'string', '', '内容描述', 1, '', 32, 0, 1, 1418966250, 1418802392, '0,255', 3, '', 'length', '', 3, 'function', 2),
(246, 'category_id', '所属分类', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 32, 1, 1, 1418802338, 1418802338, '', 3, '', 'regex', '', 3, 'function', 0),
(247, 'uid', '发布用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 32, 1, 1, 1418803756, 1418802189, '', 3, '', 'regex', '', 3, 'function', 0),
(248, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 32, 1, 1, 1418891555, 1418802074, '', 3, '', 'regex', '', 3, 'function', 0),
(249, 'create_time', '创建时间', 'int(10) UNSIGNED NOT NULL', 'date', '', '如果不写则默认为当前时间', 2, '', 32, 0, 1, 1418865962, 1418803555, '', 3, '', 'regex', 'time', 1, 'function', 0),
(250, 'status', '状态', 'tinyint(1) UNSIGNED NOT NULL', 'num', '1', '状态', 0, '', 32, 0, 1, 1418887579, 1418882734, '', 3, '', 'regex', '', 3, 'function', 0),
(251, 'picture', '图片', 'text', 'multiPicture', '', '', 1, '', 32, 1, 1, 1421650895, 1418978785, '', 3, '您至少上传一张图片', 'regex', '', 3, 'function', 0),
(252, 'weight', '权重', 'int(10) NOT NULL', 'num', '0', '权重越大,排位越靠前', 1, '', 32, 0, 1, 1421661867, 1421066265, '/^(-?[1-9]\\d*)|0$/', 3, '权重必须是数字', 'regex', '', 1, 'function', 0),
(253, 'is_up', '是否置顶', 'tinyint(2) NOT NULL', 'bool', '0', '', 1, '0:否\r\n1:是', 32, 0, 1, 1421666583, 1421661622, '', 3, '', 'regex', '', 3, 'function', 0),
(254, 'list_color', '列表页颜色', 'char(10)  NOT NULL', 'color', '', '', 1, '', 32, 0, 1, 1421661707, 1421661646, '', 3, '', 'regex', '', 3, 'function', 0),
(255, 'title_color', '内容页颜色', 'char(10)  NOT NULL', 'color', '', '', 1, '', 32, 0, 1, 1421661687, 1421661687, '', 3, '', 'regex', '', 3, 'function', 0),
(256, 'is_top', '是否置顶', 'tinyint(2) NOT NULL', 'bool', '0', '', 1, '0:否\r\n1:是', 22, 0, 1, 1422241670, 1422241670, '', 3, '', 'regex', '', 3, 'function', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_auth_extend`
--

CREATE TABLE `jdi_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- Dumping data for table `jdi_auth_extend`
--

INSERT INTO `jdi_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(11, 29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_auth_group`
--

CREATE TABLE `jdi_auth_group` (
`id` mediumint(8) unsigned NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jdi_auth_group`
--

INSERT INTO `jdi_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(10, 'admin', 1, '超级管理员', '', 1, '358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,417,419,421,423,424,425,426'),
(11, 'admin', 1, '测试', '测试', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `jdi_auth_group_access`
--

CREATE TABLE `jdi_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jdi_auth_group_access`
--

INSERT INTO `jdi_auth_group_access` (`uid`, `group_id`) VALUES
(36, 11);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_auth_rule`
--

CREATE TABLE `jdi_auth_rule` (
`id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `jdi_auth_rule`
--

INSERT INTO `jdi_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 1, 'Admin/menu/add', '新增', 1, ''),
(2, 'admin', 1, 'Admin/menu/del', '删除', 1, ''),
(3, 'admin', 1, 'Admin/menu/import', '导入', 1, ''),
(4, 'admin', 1, 'Admin/menu/edit', '编辑', 1, ''),
(5, 'admin', 1, 'Admin/user/index', '用户信息', 1, ''),
(6, 'admin', 1, 'Admin/user/action', '用户行为', 1, ''),
(7, 'admin', 1, 'Admin/authManager/index', '权限管理', 1, ''),
(8, 'admin', 1, 'Admin/action/actionlog', '行为日志', 1, ''),
(9, 'admin', 1, 'Admin/user/updatePassword', '修改密码', 1, ''),
(10, 'admin', 1, 'Admin/user/updateNickname', '修改昵称', 1, ''),
(11, 'admin', 1, 'Admin/config/group', '分组管理', 1, ''),
(12, 'admin', 1, 'Admin/config/index', '配置管理', 1, ''),
(13, 'admin', 1, 'Admin/model/index', '模型管理', 1, ''),
(14, 'admin', 1, 'Admin/menu/sort', '排序', 1, ''),
(15, 'admin', 1, 'Admin/link/add', '添加', 1, ''),
(16, 'admin', 1, 'Admin/link/edit', '编辑', 1, ''),
(17, 'admin', 1, 'Admin/link/changeStatus\r', '禁用', 1, ''),
(18, 'admin', 1, 'Admin/link/del\r', '删除', 1, ''),
(19, 'admin', 1, 'Admin/link/sort', '排序', 1, ''),
(20, 'admin', 1, 'Admin/content/news', '查看', 1, ''),
(21, 'admin', 1, 'Admin/content/add', '添加', 1, ''),
(22, 'admin', 1, 'Admin/content/edit', '编辑', 1, ''),
(23, 'admin', 1, 'Admin/content/changeStatus', '改变状态', 1, ''),
(24, 'admin', 1, 'Admin/content/up', '置顶', 1, ''),
(25, 'admin', 1, 'Admin/content/del', '删除', 1, ''),
(26, 'admin', 1, 'Admin/category/add\r', '添加', 1, ''),
(27, 'admin', 1, 'Admin/category/edit\r', '编辑', 1, ''),
(28, 'admin', 1, 'Admin/category/changeStatus\r', '禁用', 1, ''),
(29, 'admin', 1, 'Admin/category/delete\r', '删除', 1, ''),
(30, 'admin', 1, 'Admin/category/sort\r', '排序', 1, ''),
(31, 'admin', 1, 'Admin/category/clearCache\r', '清除缓存', 1, ''),
(32, 'admin', 1, 'Admin/category/import', '导入', 1, ''),
(33, 'admin', 1, 'Admin/model/add', '添加模型', 1, ''),
(34, 'admin', 1, 'Admin/model/edit', '编辑模型', 1, ''),
(35, 'admin', 1, 'Admin/model/generate', '生成模型', 1, ''),
(36, 'admin', 1, 'Admin/attribute/add', '添加属性', 1, ''),
(37, 'admin', 1, 'Admin/attribute/edit', '编辑属性', 1, ''),
(38, 'admin', 1, 'Admin/attribute/index', '属性管理', 1, ''),
(39, 'admin', 1, 'Admin/config/add', '新增配置', 1, ''),
(40, 'admin', 1, 'Admin/config/edit', '编辑配置', 1, ''),
(41, 'admin', 1, 'Admin/config/save', '批量保存', 1, ''),
(42, 'admin', 1, 'Admin/config/del', '删除配置', 1, ''),
(43, 'admin', 1, 'Admin/config/sort', '排序', 1, ''),
(44, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(45, 'admin', 1, 'Admin/content/index', '内容管理', 1, ''),
(46, 'admin', 2, 'Admin/public/index', '扩展', 1, ''),
(47, 'admin', 1, 'Admin/link/index', '链接管理', 1, ''),
(48, 'admin', 1, 'Admin/category/index', '分类管理', 1, ''),
(49, 'admin', 1, 'Admin/menu/index', '菜单管理', 1, ''),
(50, 'admin', 1, 'Admin/database/exportIndex', '备份数据库', 1, ''),
(51, 'admin', 1, 'Admin/database/importIndex', '还原数据库', 1, ''),
(52, 'admin', 1, 'Admin/authManager/createGroup', '创建用户组', 1, ''),
(53, 'admin', 1, 'Admin/authManager/access', '访问授权', 1, ''),
(54, 'admin', 1, 'Admin/authManager/category', '分类授权', 1, ''),
(55, 'admin', 1, 'Admin/addons/index', '插件管理', 1, ''),
(56, 'admin', 1, 'Admin/addons/hooks', '钩子管理', 1, ''),
(57, 'admin', 1, 'Admin/addons/create', '创建', 1, ''),
(58, 'admin', 1, 'Admin/addons/preview', '预览', 1, ''),
(59, 'admin', 1, 'Admin/addons/config', '设置', 1, ''),
(60, 'admin', 1, 'Admin/addons/edithook', '编辑钩子', 1, ''),
(61, 'admin', 1, 'Admin/addons/addhook', '添加钩子', 1, ''),
(62, 'admin', 1, 'Admin/temp/editTemp', '编辑模版', 1, ''),
(63, 'admin', 1, 'Admin/temp/index', '模版设置', 1, ''),
(64, 'admin', 1, 'Admin/module/index', '模块管理', 1, ''),
(65, 'admin', 2, 'Admin/dispatch/execute_module?_module=Goods&_controller=index&_action=index', '商品管理', 1, ''),
(66, 'admin', 2, 'Admin/addonsBack/adminList', '插件', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `jdi_base_article`
--

CREATE TABLE `jdi_base_article` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '外链',
  `deadline` int(10) NOT NULL COMMENT '截止时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '内容页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `weight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权重'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `jdi_config`
--

CREATE TABLE `jdi_config` (
`id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `jdi_config`
--

INSERT INTO `jdi_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, 'jdicms内容管理系统', 1),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '', 2),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '', 9),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 6),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 14),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 15),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位', 1379053380, 1419111436, 1, '1:列表页推荐\r\n2:频道页推荐\r\n3:网站首页推荐', 5),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 7),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n', 16),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 10),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 11),
(40, 'TEMP_PATH', 2, '前台模版路径', 2, '', '内容显示的模版路径', 1418650622, 1422414641, 1, './Template', 0),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 20),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 21),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1421158169, 1, '1', 4),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 17),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 8),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 18),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 22),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 24),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1420635986, 1, '1:index/index\r\n2:Index/verify\r\n3:file/upload\r\n4:file/download\r\n5:user/updatePassword\r\n6:user/updateNickname\r\n7:user/submitPassword\r\n8:user/submitNickname\r\n9:file/uploadpicture\r\n10:myspace/selectsports', 3),
(41, 'SYSTEM_COLOR', 3, '颜色配置', 0, '', '通用颜色', 1418973661, 1418976664, 1, '#555\r\n#ac725e\r\n#d06b64\r\n#f83a22\r\n#fa573c\r\n#ff7537\r\n#ffad46\r\n#42d692\r\n#16a765\r\n#7bd148\r\n#b3dc6c\r\n#fbe983\r\n#fad165\r\n#92e1c0\r\n#9fe1e7\r\n#9fc6e7\r\n#4986e7\r\n#9a9cff\r\n#b99aff\r\n#c2c2c2\r\n#cabdbf\r\n#cca6ac\r\n#f691b2\r\n#cd74e6\r\n#a47ae2\r\n\r\n', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 12),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 23),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 25),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 13),
(42, 'SPORT_GROUP', 3, '项目层级的组别名称', 0, '', '', 1419003723, 1419003723, 1, '0:项目\r\n1:分项\r\n2:组别\r\n3:小项', 0),
(43, 'LINK_GROUP', 3, '链接分组', 2, '', '链接分组,t开头的分组代表只能是纯文本链接,\r\np开头的分组代表必须有图片,a开头的分组代表都行', 1419298534, 1421140065, 1, 't-1:外部链接\r\np-2:快速通道\r\na-3:服务台\r\np-3:合作单位', 0),
(60, 'JDI_THEME', 1, '前台主题', 0, '', '', 1421898458, 1422414658, 1, 'default', 0),
(61, 'WEB_URL', 1, '网站前台url', 1, '', '', 1422007394, 1422007407, 1, 'http://localhost/jdicms', 0),
(62, 'MOBILE_THEME', 1, '手机模版', 0, '', '', 1422414699, 1422414699, 1, 'default', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_download`
--

CREATE TABLE `jdi_download` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) unsigned NOT NULL COMMENT '发布用户id',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '外链',
  `deadline` int(10) NOT NULL COMMENT '截止时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数量',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '内容页面url',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `file` int(10) unsigned NOT NULL COMMENT '文件',
  `weight` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `is_top` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否置顶'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jdi_file`
--

CREATE TABLE `jdi_file` (
`id` int(10) unsigned NOT NULL COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `jdi_file`
--

INSERT INTO `jdi_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `create_time`) VALUES
(12, '屏幕快照 2014-12-17 下午8.03.50.png', '5493b68e35017.png', '2014-12-19/', 'png', 'image/png', 237017, '4cacbb3d8c186b4092c625b6337b83b1', '0c4383749ef8ae4fa4c68374939c14efb707e525', 0, 1418966670),
(11, 'article.model', '548ee0cd838ad.model', '2014-12-15/', 'model', 'text/plain', 208, '08a4b8435d1412147c870104a8e34bf8', '118b6e9b4572c145e7bc51866a307669539eafde', 0, 1418649805),
(10, '546972193c65c.model', '548eddb58b4ee.model', '2014-12-15/', 'model', 'text/plain', 221, '38b086ec6301e686b9124c736c60df7b', 'f0c04950ab0bf45998051f97b3974a0892ab051e', 0, 1418649013),
(13, '性能测试.doxc.doc', '5493b69fd56e8.doc', '2014-12-19/', 'doc', 'application/msword', 134144, '9e73d31b4fad35ecada6bda4ca87ef41', 'ba68d260f496c95fdbe402e73ee9457c6210ee01', 0, 1418966687);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_hooks`
--

CREATE TABLE `jdi_hooks` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jdi_hooks`
--

INSERT INTO `jdi_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, '', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, '', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'SocialComment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, '', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, '', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, '', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1422381240, 'SiteStat,SystemInfo', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, '', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_link`
--

CREATE TABLE `jdi_link` (
`id` int(11) NOT NULL,
  `picture_id` int(10) NOT NULL COMMENT '图片外键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(200) NOT NULL COMMENT 'url链接',
  `sort` int(11) NOT NULL COMMENT '排序',
  `group` varchar(20) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jdi_member`
--

CREATE TABLE `jdi_member` (
`id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(40) NOT NULL COMMENT '密码',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态,-1代表删除,0代表禁用,1代表正常,2代表未审核,3代表审核未通过',
  `login_times` int(11) DEFAULT '0',
  `nickname` char(40) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0代表管理员,1代表运动员,2代表教练,3代表裁判',
  `score` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=37 ;

--
-- Dumping data for table `jdi_member`
--

INSERT INTO `jdi_member` (`id`, `username`, `password`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`, `login_times`, `nickname`, `type`, `score`) VALUES
(1, 'admin', '0fdcd401563560514b51347603c8929761a87973', '', 1419563970, 0, 1422525797, 0, 1419563970, 1, 345, '李浩', 0, 0),
(36, 'test', '0fdcd401563560514b51347603c8929761a87973', '', 1422515785, 0, 1422531841, 3232235633, 1422515785, 1, 9, 'test', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_menu`
--

CREATE TABLE `jdi_menu` (
`id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `module` char(20) NOT NULL DEFAULT 'Admin'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=287 ;

--
-- Dumping data for table `jdi_menu`
--

INSERT INTO `jdi_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `module`) VALUES
(134, '新增', 128, 0, 'menu/add', 0, '新增菜单dasdasd', '', 0, 'Admin'),
(135, '删除', 128, 0, 'menu/del', 0, '', '', 0, 'Admin'),
(136, '导入', 128, 0, 'menu/import', 0, '', '', 0, 'Admin'),
(137, '编辑', 128, 0, 'menu/edit', 0, '', '', 0, 'Admin'),
(141, '用户信息', 140, 0, 'user/index', 0, '', '用户管理', 0, 'Admin'),
(140, '用户', 0, 3, 'Public/index', 0, '', '', 0, 'Admin'),
(142, '用户行为', 140, 0, 'user/action', 0, '', '行为管理', 0, 'Admin'),
(143, '权限管理', 140, 0, 'authManager/index', 0, '', '用户管理', 0, 'Admin'),
(144, '行为日志', 140, 0, 'action/actionlog', 0, '', '行为管理', 0, 'Admin'),
(145, '修改密码', 140, 0, 'user/updatePassword', 1, '', '', 0, 'Admin'),
(146, '修改昵称', 140, 0, 'user/updateNickname', 1, '', '', 0, 'Admin'),
(128, '菜单管理', 6, 6, 'menu/index', 0, '', '系统设置', 0, 'Admin'),
(129, '备份数据库', 6, 6, 'database/exportIndex', 0, '', '数据备份', 0, 'Admin'),
(130, '还原数据库', 6, 6, 'database/importIndex', 0, '', '数据备份', 0, 'Admin'),
(6, '系统', 0, 4, 'Public/index', 0, '', '', 0, 'Admin'),
(148, '网站设置', 6, 0, 'config/group', 0, '', '系统设置', 0, 'Admin'),
(149, '配置管理', 6, 0, 'config/index', 0, '', '系统设置', 0, 'Admin'),
(150, '内容', 0, 2, 'Public/index', 0, '', '', 0, 'Admin'),
(151, '分类管理', 150, 3, 'category/index', 0, '', '', 0, 'Admin'),
(152, '模型管理', 6, 0, 'model/index', 0, '', '系统设置', 0, 'Admin'),
(153, '内容管理', 150, 1, 'content/index', 0, '', '', 0, 'Admin'),
(166, '链接管理', 150, 2, 'link/index', 0, '', '', 0, 'Admin'),
(265, '排序', 128, 0, 'menu/sort', 0, '', '', 0, 'Admin'),
(266, '创建用户组', 143, 0, 'authManager/createGroup', 0, '', '', 0, 'Admin'),
(267, '访问授权', 143, 0, 'authManager/access', 0, '', '', 0, 'Admin'),
(268, '分类授权', 143, 0, 'authManager/category', 0, '', '', 0, 'Admin'),
(188, '添加', 166, 0, 'link/add', 0, '', '', 0, 'Admin'),
(189, '编辑', 166, 0, 'link/edit', 0, '', '', 0, 'Admin'),
(190, '禁用', 166, 0, 'link/changeStatus\r', 0, '', '', 0, 'Admin'),
(191, '删除', 166, 0, 'link/del\r', 0, '', '', 0, 'Admin'),
(192, '排序', 166, 0, 'link/sort', 0, '', '', 0, 'Admin'),
(193, '查看', 153, 0, 'content/news', 0, '', '', 0, 'Admin'),
(194, '添加', 153, 0, 'content/add', 0, '', '', 0, 'Admin'),
(195, '编辑', 153, 0, 'content/edit', 0, '', '', 0, 'Admin'),
(196, '改变状态', 153, 0, 'content/changeStatus', 0, '', '', 0, 'Admin'),
(197, '置顶', 153, 0, 'content/up', 0, '', '', 0, 'Admin'),
(198, '删除', 153, 0, 'content/del', 0, '', '', 0, 'Admin'),
(199, '添加', 151, 0, 'category/add\r', 0, '', '', 0, 'Admin'),
(200, '编辑', 151, 0, 'category/edit\r', 0, '', '', 0, 'Admin'),
(201, '禁用', 151, 0, 'category/changeStatus\r', 0, '', '', 0, 'Admin'),
(202, '删除', 151, 0, 'category/delete\r', 0, '', '', 0, 'Admin'),
(203, '排序', 151, 0, 'category/sort\r', 0, '', '', 0, 'Admin'),
(204, '清除缓存', 151, 0, 'category/clearCache\r', 0, '', '', 0, 'Admin'),
(205, '导入', 151, 0, 'category/import', 0, '', '', 0, 'Admin'),
(252, '添加模型', 152, 0, 'model/add', 0, '', '', 0, 'Admin'),
(253, '编辑模型', 152, 0, 'model/edit', 0, '', '', 0, 'Admin'),
(254, '生成模型', 152, 0, 'model/generate', 0, '', '', 0, 'Admin'),
(255, '添加属性', 152, 0, 'attribute/add', 0, '', '', 0, 'Admin'),
(256, '编辑属性', 152, 0, 'attribute/edit', 0, '', '', 0, 'Admin'),
(257, '属性管理', 152, 0, 'attribute/index', 0, '', '', 0, 'Admin'),
(258, '配置管理', 149, 0, 'config/index', 0, '', '', 0, 'Admin'),
(259, '新增配置', 149, 0, 'config/add', 0, '', '', 0, 'Admin'),
(260, '编辑配置', 149, 0, 'config/edit', 0, '', '', 0, 'Admin'),
(261, '批量保存', 149, 0, 'config/save', 0, '', '', 0, 'Admin'),
(262, '删除配置', 149, 0, 'config/del', 0, '', '', 0, 'Admin'),
(263, '分组管理', 149, 0, 'config/group', 0, '', '', 0, 'Admin'),
(264, '排序', 149, 0, 'config/sort', 0, '', '', 0, 'Admin'),
(269, '扩展', 0, 5, 'public/index', 0, '', '', 0, 'Admin'),
(270, '插件管理', 269, 0, 'addons/index', 0, '', '扩展', 0, 'Admin'),
(271, '钩子管理', 269, 0, 'addons/hooks', 0, '', '扩展', 0, 'Admin'),
(272, '创建', 270, 0, 'addons/create', 0, '', '', 0, 'Admin'),
(273, '预览', 270, 0, 'addons/preview', 0, '', '', 0, 'Admin'),
(274, '设置', 270, 0, 'addons/config', 0, '', '', 0, 'Admin'),
(275, '编辑钩子', 271, 0, 'addons/edithook', 0, '', '', 0, 'Admin'),
(276, '添加钩子', 271, 0, 'addons/addhook', 0, '', '', 0, 'Admin'),
(277, '插件', 0, 6, 'addonsBack/adminList', 0, '', '', 0, 'Admin'),
(278, '编辑模版', 6, 0, 'temp/editTemp', 0, '', '模版管理', 0, 'Admin'),
(279, '模版设置', 6, 0, 'temp/index', 0, '', '模版管理', 0, 'Admin'),
(280, '模块管理', 269, 0, 'module/index', 0, '', '扩展', 0, 'Admin'),
(286, '商品管理', 0, 0, 'dispatch/execute_module?_module=Goods&_controller=index&_action=index', 0, '', '', 0, 'Goods');

-- --------------------------------------------------------

--
-- Table structure for table `jdi_model`
--

CREATE TABLE `jdi_model` (
`id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `type` tinyint(3) unsigned NOT NULL,
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  `pid` int(10) NOT NULL COMMENT '父id'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=33 ;

--
-- Dumping data for table `jdi_model`
--

INSERT INTO `jdi_model` (`id`, `name`, `title`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `type`, `engine_type`, `pid`) VALUES
(22, 'download', '下载', '{"1":["122","125","133"],"2":["129","127","237","126","128"]}', '1:基础;2:扩展', '', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链\r\n', 'lists', 'add', 'edit', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链', 10, 'title', '', 1418978727, 1421066281, 1, 0, 'MyISAM', 0),
(18, 'base_article', '基础文档', '{"1":["82","85"],"2":["88","89","87","236","86"]}', '1:基础;2:扩展', '', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链\r\n', 'lists', 'add', 'edit', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链', 10, 'title', '', 1418802016, 1421066327, 1, 0, 'MyISAM', 0),
(20, 'article', '文章', '{"1":["93","106"],"2":["239","134","96","238"],"3":["108","107","100","98","235","104","105","97","99"]}', '1:基础;2:扩展;3:其他', '', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链\r\n', 'lists', 'add', 'edit', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链', 10, 'title', '', 1418954565, 1421134006, 1, 0, 'MyISAM', 0),
(32, 'article_picture', '图片模型', '{"1":["248","245","251"],"2":["253","249","243","252","244","242","254","255"]}', '1:基础;2:扩展', NULL, 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链\r\n', 'lists', 'add', 'edit', 'title:标题\r\nview:浏览数量\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\ndeadline:截至日期\r\nlink:外链', 10, 'title', '', 1421632257, 1421662503, 1, 0, 'MyISAM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_module`
--

CREATE TABLE `jdi_module` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=30 ;

--
-- Dumping data for table `jdi_module`
--

INSERT INTO `jdi_module` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`) VALUES
(29, 'Goods', '商品管理', '商品管理', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'tp', '0.1', 1422444590);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_node`
--

CREATE TABLE `jdi_node` (
`id` int(11) unsigned NOT NULL,
  `type` tinyint(4) unsigned NOT NULL COMMENT '1是栏目,2是单页面,3是外部链接',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `symbol` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目英文名称',
  `pid` int(11) NOT NULL COMMENT '父级栏目',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `model_id` int(11) NOT NULL DEFAULT '0' COMMENT '模型',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_user` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  `temp_category` char(40) NOT NULL DEFAULT '' COMMENT '栏目页模版',
  `temp_list` char(40) NOT NULL DEFAULT '' COMMENT '列表页模版',
  `temp_content` char(40) NOT NULL DEFAULT '' COMMENT '内容页模版',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '要跳转的url',
  `list_num` int(11) NOT NULL COMMENT '每页显示的记录数量',
  `index_show` tinyint(1) DEFAULT '1' COMMENT '是否在主页显示',
  `status` tinyint(1) DEFAULT '0' COMMENT '-1代表以删除,0代表禁用,1代表正常',
  `verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要审核'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jdi_node`
--

INSERT INTO `jdi_node` (`id`, `type`, `name`, `symbol`, `pid`, `sort`, `model_id`, `create_time`, `update_time`, `create_user`, `temp_category`, `temp_list`, `temp_content`, `url`, `list_num`, `index_show`, `status`, `verify`) VALUES
(3, 2, '关于我们', 'wo', 0, 3, 20, 1422006329, 1422006329, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(4, 1, '案例展示', 'sui', 0, 1, 20, 1422006329, 1422006329, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(6, 1, '人才招聘', 'php', 0, 2, 20, 1422006329, 1422006329, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0),
(7, 1, '新闻中心', 'jiagou', 0, 0, 20, 1422006329, 1422006329, 0, 'category.html', 'list.html', 'content.html', '', 10, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_picture`
--

CREATE TABLE `jdi_picture` (
`id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `jdi_picture`
--

INSERT INTO `jdi_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2014-11-13/54642c43484a9.jpg', '', '71dc21797cfb7dca66515adcc4abe93b', 'f96f72d919ce79498f8608a647e5ab534c12c9ab', 1, 1415851075),
(2, '/Uploads/Picture/2014-11-20/546dc0c7c7ef4.png', '', 'd8438e506d466ed38ee6b9dc4a232b40', 'b1191b0a06d36f92bb9fb21bc94daaab80265f03', 1, 1416478919),
(3, '/Uploads/Picture/2014-11-21/546ec9e8d24ec.png', '', '5d1d5d4195258797a0b6fcffadcd8511', '5e6d0c581d800dd0622a76f091b2701456f8e351', 1, 1416546792),
(4, '/Uploads/Picture/2014-11-21/546ed0ddc3cba.png', '', '3c838b9f71bc517a3b8028415bb59cb1', '09ac100f01411da86664b69250aba8f0b83d1491', 1, 1416548573),
(5, '/Uploads/Picture/2014-11-21/546edffc7d2a6.png', '', '2f2493b43169047408921c245572d250', 'b108c0a832627b36e047a473231221e9d58619a2', 1, 1416552444),
(6, '/Uploads/Picture/2014-11-21/546ee04d260c2.png', '', '333e3d1dd2ca98d7e989131b7d9a338f', '45e103b823372a5a033d9d317008c7ed218752f9', 1, 1416552525),
(7, '/Uploads/Picture/2014-11-21/546ee16ca61b1.png', '', '2791e727022d2d863e17a02e57c8237f', 'eb067c0e3dbe17297247c7307b956daab3ea0bad', 1, 1416552812),
(8, '/Uploads/Picture/2014-11-21/546ee1c64539c.png', '', 'f9d7f9a78cc852a599bc301cda134145', 'ef2502b45938da6de9c7321b428737eb4d9a3884', 1, 1416552902),
(9, '/Uploads/picture/2014-12-19/5493ea16ba73f.png', '', '1f990d9695bf79fe5fdcd0f0840f01b7', '18abc3278d6bc1bee0af5ba2272d99b19f5554f5', 1, 1418979862),
(10, '/Uploads/picture/2014-12-19/5493ea229e330.png', '', 'f321e4d05f11c423b4c76fa0730d90bc', '7d8471d49aae560c4c90986f3cef78719f1c5e59', 1, 1418979874),
(11, '/Uploads/picture/2014-12-20/549550c3cf9fc.png', '', '780281674310278a3d6a3956aa3beb2f', 'e04954ee182439a53d4b751577abdc1749463d72', 1, 1419071683),
(12, '/Uploads/picture/2014-12-21/5495eb082a0b8.png', '', '4cacbb3d8c186b4092c625b6337b83b1', '0c4383749ef8ae4fa4c68374939c14efb707e525', 1, 1419111176),
(13, '/Uploads/picture/2014-12-22/5497ef6776144.jpg', '', 'cc26a9e19822e00bf5dade2423f98a1f', '98d8c84d6c849632d2e678eed3c9c1a857ed52f9', 1, 1419243367),
(14, '/Uploads/picture/2014-12-25/549c20281f270.jpg', '', '84672df6d0e467a72564cfd0a4d2e32b', '9683a7d74dc9bd74c40c6d86890cccb83822c3d9', 1, 1419517992),
(15, '/Uploads/picture/2014-12-27/549e71dcc1c01.jpg', '', '907e4a686127af79a7833d2dee568118', '704d6be61ee914e2a01fb91d694a95b4ffdf63c1', 1, 1419669980),
(16, '/Uploads/picture/2014-12-27/549e71e46d603.jpg', '', 'f87e138aec148c5b260d38705dcd1f5a', 'bbeeb497bd5c0f8a490cd7f55a3ab1019a71cb34', 1, 1419669988),
(17, '/Uploads/picture/2014-12-27/549e74799ef25.jpg', '', '0fb4348fd1b792903cfa9b9e7c5706ab', '58acb5a6adae9c0e208da697de6d268802cb1a33', 1, 1419670649),
(18, '/Uploads/picture/2014-12-27/549e77c53d74c.jpg', '', '8721fc6c1a94e5c33aad61983e03847d', 'b8e9d43000caddd41b9400d9190ebdd7cdc0f720', 1, 1419671493),
(19, '/Uploads/picture/2014-12-27/549e78c9df6d5.jpg', '', '500c06dcc1ec4b4be08edea35f1b185b', 'f2b07bbd919763aca6c99031684342a5934d5890', 1, 1419671753),
(20, '/Uploads/picture/2014-12-27/549e799756fbe.jpg', '', '17735a9573e7f839c35bf187972cbf04', 'e1cfc45e5d314d7c5093273aa56e8bc9239c45e7', 1, 1419671959),
(21, '/Uploads/picture/2014-12-27/549e7ada2b54d.jpg', '', 'bbc99dc973eb6631f269858d1929ca69', '0008d143a47164eb1e72997434ea3106cb6cb824', 1, 1419672276),
(22, '/Uploads/picture/2014-12-27/549e7bf07ce95.jpg', '', '0145cee52cbda8b3b756669358872c37', 'f7c434b1786b2baec5be33d1aa19c141ce0cffa1', 1, 1419672560),
(23, '/Uploads/picture/2014-12-29/54a0b7038c685.jpg', '', 'ed9d57f48a5f9e8d3ec4a67746c3e8bf', '40c70a77c4e42a28443bf057df2c8ee8ced23bb1', 1, 1419818755),
(24, '/Uploads/picture/2014-12-29/54a0ba0fc3f61.jpg', '', 'be6192e2556ad8eac853feb88cfcd12b', '996e59c3dfdf511568dc76e88d8851fe95d98912', 1, 1419819535),
(25, '/Uploads/picture/2014-12-31/54a36f62c9af6.jpg', '', 'a55d63bf2084090fbc1a944f835d3bca', 'c492f20815d7b66832f9166225e33288a662d65c', 1, 1419997026),
(26, '/Uploads/picture/2014-12-31/54a3858f1db10.jpg', '', 'da1b29b1c904da4d009b4bcb8f8d30ac', '070050538b0daa96f59af7d5b0434940fab1ced4', 1, 1420002703),
(27, '/Uploads/picture/2014-12-31/54a3a50c733c5.jpg', '', 'acc9d12f04e4e9fddb61c74fbfa6c7ef', '851554e25a426d7fa71ef0d8dfa2ef6d394cb1db', 1, 1420010764),
(28, '/Uploads/picture/2015-01-05/54aa3eaed359f.png', '', '983f3be2ed0eaf9c5c979ad53e159b0f', '09ae19b2a9e3020f562edc8a96d9562d4a8b086f', 1, 1420443310),
(29, '/Uploads/picture/2015-01-06/54ab3db85f888.gif', '', 'ff3d9c4cfa363bbf9405ed222281d1f6', '91a856e0f2a43f167e03686d177dc2b9ea8526cc', 1, 1420508600),
(30, '/Uploads/picture/2015-01-06/54ab3e0b55a60.gif', '', '0ed7a856091c60842c705acdbe4cbd62', 'eda763bf4388b8ca4f5c0cb178658315ba8d1a2d', 1, 1420508683),
(31, '/Uploads/picture/2015-01-06/54ab3e30ea2f1.gif', '', '37239c2b1ba2831f3b13f36628e80557', '75dc0150edef877869a164e63bd8805daf7051d2', 1, 1420508720),
(32, '/Uploads/picture/2015-01-06/54ab3fb99f91f.png', '', 'eebae605140f25e19798fad0ed7c6779', '50a9f02b1473f7540816e22fbe64a6a7d8edbd6b', 1, 1420509113),
(33, '/Uploads/picture/2015-01-06/54ab400ad84fd.png', '', '4e7a9fae02eec00d3cd09300160557ee', '6e638d3ef61bc177a6e645a96a36f2184b5199e7', 1, 1420509194),
(34, '/Uploads/picture/2015-01-06/54ab4462eaf05.jpg', '', '8283c08e2413c82268777e632e2063f7', 'b36b4d0198f86766c1b3c36f6b51790b7d8819ee', 1, 1420510306),
(35, '/Uploads/picture/2015-01-06/54ab4474c6c67.jpg', '', '47d8eed24baafab78fd4e7e2ef42eaf4', 'c3239f7933186a7fc10e00f4c8f0a12f4157d277', 1, 1420510324),
(36, '/Uploads/picture/2015-01-06/54ab448ea0a03.jpg', '', '69f8b9b88891dc1196c387fff45616d1', '5871b15e0f9ad6b2b8469eb5ad34047b7466e5f3', 1, 1420510350),
(37, '/Uploads/picture/2015-01-06/54ab449d91482.jpg', '', '6dc8c4dc681b058f549c7ddcadb069c3', 'b02d0b26018a4af98347346bc98d16bb352a51cd', 1, 1420510365),
(38, '/Uploads/picture/2015-01-06/54ab44adc8dbb.jpg', '', '629022e20a40ca1af7b29eee316a0efb', '33b6db2d162fa4ca9ab041bf798355aad97c8f98', 1, 1420510381),
(39, '/Uploads/picture/2015-01-06/54ab44bfc0202.jpg', '', '05e47a69fc23a62b99918fb853264057', 'dd8c1b53803993a5d029e18c55ad4a8025bbb04a', 1, 1420510399),
(40, '/Uploads/picture/2015-01-09/54af7cc6ed63b.jpg', '', 'd75cb2655b38383b87984a63b852f0cf', 'e70c3b22f591945d1db125f4f974846a1a03a19d', 1, 1420786886),
(41, '/Uploads/picture/2015-01-09/54af7cd09cea6.jpg', '', 'b63a4635a4853f02013e19e684220f31', '7f91c71c614678b21846721a91b40a6eca97dd67', 1, 1420786896),
(42, '/Uploads/picture/2015-01-09/54af7ddbd944a.gif', '', '619382435048a8e7fd7711382b6d4226', '2050ea55da96242ebb82615d01cc2dddea88e877', 1, 1420787163),
(43, '/Uploads/picture/2015-01-09/54af7e08391c9.gif', '', 'b9c6fc79bea2d3e2284a8edcdecd5f63', 'be11f542318778fe091da66dcf718fe22507a66d', 1, 1420787208),
(44, '/Uploads/picture/2015-01-22/54c05f079a491.png', '', '1e77cbbb3e124986bc1f22c7285b062c', '64ad9a387b6f5676aa9f9dc2268e6df2ba723dfb', 1, 1421893383),
(45, '/Uploads/picture/2015-01-22/54c05f07b3a44.png', '', 'd8439ca6aab2ebab7f92fbb8ad268c63', '5b975c633ba5031014c10dbee8d7c4c1cd47fd33', 1, 1421893383),
(46, '/Uploads/picture/2015-01-22/54c05f084780d.png', '', '4c432738f2fef85167892264cbe1d12e', 'de6d9a04b3d0d765cf9f5c4ac2ae07f07c5218ea', 1, 1421893384),
(47, '/Uploads/picture/2015-01-22/54c05f08bd359.png', '', '8650d4d80da6667907a462fecae3d57a', '9feec21835bb328db27dcfe81f179b07f8d9a824', 1, 1421893384),
(48, '/Uploads/picture/2015-01-22/54c05f0944574.png', '', '9d484768d6956431930e6ab04b32d38e', '4567d4be6d84034d2211ca688acb94affeae68f6', 1, 1421893385),
(49, '/Uploads/picture/2015-01-22/54c05f09c0a62.png', '', '02d04e13a4b80ce5bc0a3c6ff889544d', 'adae9168e09cb9526d892ec999c239cec064b775', 1, 1421893385),
(50, '/Uploads/picture/2015-01-22/54c05f0a612c9.png', '', '9e9193ed9041944621dd69e6fad8751d', 'c7412dbdcf5a3fb29a91fc1b1bc8a1839be2cae8', 1, 1421893386),
(51, '/Uploads/picture/2015-01-22/54c05f0adf313.png', '', 'cfe9d80046fd8468153e4bf2ce4a0b34', '5c73c2289612560c7c738bc06834a4c8abf201b5', 1, 1421893386);

-- --------------------------------------------------------

--
-- Table structure for table `jdi_verify`
--

CREATE TABLE `jdi_verify` (
`id` int(11) NOT NULL,
  `topic_table` char(40) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `result` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `tp_message`
--

CREATE TABLE `tp_message` (
`id` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '留言id',
  `nickname` varchar(224) NOT NULL COMMENT '留言昵称',
  `link` varchar(225) NOT NULL COMMENT '留言者联系方式',
  `content` varchar(225) NOT NULL COMMENT '留言内容',
  `create_time` int(10) NOT NULL COMMENT '留言时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `reply_time` int(10) NOT NULL COMMENT '回复时间',
  `reply` varchar(225) NOT NULL COMMENT '回复内容'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tp_message`
--

INSERT INTO `tp_message` (`id`, `uid`, `nickname`, `link`, `content`, `create_time`, `update_time`, `reply_time`, `reply`) VALUES
(2, 1, 'dasd', 'dasd', 'dasda', 1422339274, 1422342795, 0, 'asdasdadsdasdadsad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jdi_action`
--
ALTER TABLE `jdi_action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_action_log`
--
ALTER TABLE `jdi_action_log`
 ADD PRIMARY KEY (`id`), ADD KEY `action_ip_ix` (`action_ip`), ADD KEY `action_id_ix` (`action_id`), ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `jdi_addons`
--
ALTER TABLE `jdi_addons`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_article`
--
ALTER TABLE `jdi_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_article_picture`
--
ALTER TABLE `jdi_article_picture`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_attribute`
--
ALTER TABLE `jdi_attribute`
 ADD PRIMARY KEY (`id`), ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `jdi_auth_extend`
--
ALTER TABLE `jdi_auth_extend`
 ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`), ADD KEY `uid` (`group_id`), ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `jdi_auth_group`
--
ALTER TABLE `jdi_auth_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_auth_group_access`
--
ALTER TABLE `jdi_auth_group_access`
 ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`), ADD KEY `uid` (`uid`), ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `jdi_auth_rule`
--
ALTER TABLE `jdi_auth_rule`
 ADD PRIMARY KEY (`id`), ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `jdi_base_article`
--
ALTER TABLE `jdi_base_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_config`
--
ALTER TABLE `jdi_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_name` (`name`), ADD KEY `type` (`type`), ADD KEY `group` (`group`);

--
-- Indexes for table `jdi_download`
--
ALTER TABLE `jdi_download`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_file`
--
ALTER TABLE `jdi_file`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `jdi_hooks`
--
ALTER TABLE `jdi_hooks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `jdi_link`
--
ALTER TABLE `jdi_link`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_member`
--
ALTER TABLE `jdi_member`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD KEY `status` (`status`);

--
-- Indexes for table `jdi_menu`
--
ALTER TABLE `jdi_menu`
 ADD PRIMARY KEY (`id`), ADD KEY `pid` (`pid`);

--
-- Indexes for table `jdi_model`
--
ALTER TABLE `jdi_model`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_module`
--
ALTER TABLE `jdi_module`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_node`
--
ALTER TABLE `jdi_node`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_picture`
--
ALTER TABLE `jdi_picture`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jdi_verify`
--
ALTER TABLE `jdi_verify`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_message`
--
ALTER TABLE `tp_message`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jdi_action`
--
ALTER TABLE `jdi_action`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `jdi_action_log`
--
ALTER TABLE `jdi_action_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=736;
--
-- AUTO_INCREMENT for table `jdi_addons`
--
ALTER TABLE `jdi_addons`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `jdi_article`
--
ALTER TABLE `jdi_article`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jdi_article_picture`
--
ALTER TABLE `jdi_article_picture`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `jdi_attribute`
--
ALTER TABLE `jdi_attribute`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `jdi_auth_group`
--
ALTER TABLE `jdi_auth_group`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `jdi_auth_rule`
--
ALTER TABLE `jdi_auth_rule`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `jdi_base_article`
--
ALTER TABLE `jdi_base_article`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `jdi_config`
--
ALTER TABLE `jdi_config`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `jdi_download`
--
ALTER TABLE `jdi_download`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `jdi_file`
--
ALTER TABLE `jdi_file`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `jdi_hooks`
--
ALTER TABLE `jdi_hooks`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `jdi_link`
--
ALTER TABLE `jdi_link`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jdi_member`
--
ALTER TABLE `jdi_member`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `jdi_menu`
--
ALTER TABLE `jdi_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=287;
--
-- AUTO_INCREMENT for table `jdi_model`
--
ALTER TABLE `jdi_model`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `jdi_module`
--
ALTER TABLE `jdi_module`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `jdi_node`
--
ALTER TABLE `jdi_node`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `jdi_picture`
--
ALTER TABLE `jdi_picture`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `jdi_verify`
--
ALTER TABLE `jdi_verify`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tp_message`
--
ALTER TABLE `tp_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
