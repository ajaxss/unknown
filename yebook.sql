-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 yebook 的数据库结构
CREATE DATABASE IF NOT EXISTS `yebook` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yebook`;

-- 导出  表 yebook.admin 结构
CREATE TABLE IF NOT EXISTS `admin` (
  `a_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adminname` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员名',
  `passwd` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员密码',
  `tel` char(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员手机号',
  `ip` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP地址',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `deltimes` datetime DEFAULT NULL COMMENT '注销时间',
  `updatatimes` datetime DEFAULT NULL COMMENT '修改时间',
  `lasttimes` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：注销；1：正常',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`a_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员表';

-- 正在导出表  yebook.admin 的数据：4 rows
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`a_id`, `adminname`, `passwd`, `tel`, `ip`, `addtimes`, `deltimes`, `updatatimes`, `lasttimes`, `status`, `nums`) VALUES
	(1, '黄思贤', '123456', '12345678911', '192.168.5.151', '2020-10-27 16:50:10', NULL, NULL, NULL, 1, 0),
	(2, '李娟', '234567', '12345678912', '192.168.11.124', '2020-10-27 16:51:34', NULL, NULL, NULL, 1, 0),
	(3, '李茜', '345678', '12345678913', '192.168.5.152', '2020-10-27 16:52:31', NULL, NULL, NULL, 1, 0),
	(4, '候蔼琳', '456789', '12345678914', '192.168.5.158', '2020-10-27 16:53:00', NULL, NULL, NULL, 1, 0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 导出  表 yebook.comment 结构
CREATE TABLE IF NOT EXISTS `comment` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `n_id` int(10) NOT NULL COMMENT '与笔记表外键',
  `u_id` int(10) NOT NULL COMMENT '与用户表外键',
  `c1_id` int(10) NOT NULL DEFAULT '0' COMMENT '0：顶层评论',
  `comments` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `deltimes` datetime DEFAULT NULL COMMENT '删除时间',
  `updatetiems` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：删除；1：正常',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='评论表';

-- 正在导出表  yebook.comment 的数据：26 rows
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`c_id`, `n_id`, `u_id`, `c1_id`, `comments`, `addtimes`, `deltimes`, `updatetiems`, `status`) VALUES
	(4, 23, 6, 3, '456', '2020-11-01 19:22:18', NULL, NULL, 1),
	(3, 23, 5, 0, '123', '2020-11-01 19:21:54', NULL, NULL, 1),
	(5, 23, 6, 3, '789', '2020-11-01 19:38:06', NULL, NULL, 1),
	(6, 23, 6, 3, '147', '2020-11-01 19:38:24', NULL, NULL, 1),
	(7, 23, 5, 0, 'fuck', '2020-11-02 19:06:35', NULL, NULL, 1),
	(8, 23, 5, 0, '哈哈哈啊哈', '2020-11-02 19:13:13', NULL, NULL, 1),
	(9, 23, 5, 0, '123412414', '2020-11-02 19:13:31', NULL, NULL, 1),
	(10, 23, 5, 0, '123414', '2020-11-02 19:20:57', NULL, NULL, 1),
	(11, 23, 5, 0, '653636', '2020-11-02 19:22:05', NULL, NULL, 1),
	(12, 23, 5, 0, '65636', '2020-11-02 19:24:18', NULL, NULL, 1),
	(13, 23, 5, 0, '747347', '2020-11-02 19:33:16', NULL, NULL, 1),
	(14, 23, 5, 0, '公司的公司', '2020-11-02 19:34:34', NULL, NULL, 1),
	(15, 23, 5, 0, '广东韶关市', '2020-11-02 19:35:16', NULL, NULL, 1),
	(16, 23, 5, 0, '3255', '2020-11-02 19:36:06', NULL, NULL, 1),
	(17, 23, 5, 0, '2143124', '2020-11-02 19:36:15', NULL, NULL, 1),
	(18, 23, 5, 0, '636221', '2020-11-02 19:36:35', NULL, NULL, 1),
	(19, 23, 5, 0, '110', '2020-11-02 19:36:44', NULL, NULL, 1),
	(20, 23, 5, 7, '钱钱钱钱钱钱钱', '2020-11-02 19:59:17', NULL, NULL, 1),
	(21, 23, 5, 9, '可以评论了', '2020-11-02 20:00:38', NULL, NULL, 1),
	(22, 23, 5, 3, '评论', '2020-11-02 20:01:39', NULL, NULL, 1),
	(23, 23, 5, 7, '评论', '2020-11-02 20:01:54', NULL, NULL, 1),
	(24, 22, 5, 0, '这是评论内容', '2020-11-03 11:53:58', NULL, NULL, 1),
	(25, 22, 5, 24, '哈哈哈', '2020-11-03 11:54:07', NULL, NULL, 1),
	(26, 23, 5, 3, '2222', '2020-11-03 12:42:25', NULL, NULL, 1),
	(27, 23, 8, 0, '哈哈哈', '2020-11-03 16:51:57', NULL, NULL, 1),
	(28, 23, 8, 7, '哈哈哈啊哈哈哈哈哈', '2020-11-03 16:53:16', NULL, NULL, 1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 导出  表 yebook.favour 结构
CREATE TABLE IF NOT EXISTS `favour` (
  `f_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `n_id` int(10) NOT NULL COMMENT '与笔记表外键',
  `u_id` int(10) NOT NULL COMMENT '与用户表外键',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '点赞时间',
  `deltimes` datetime DEFAULT NULL COMMENT '取消时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：点赞；1：默认不点赞',
  PRIMARY KEY (`f_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='点赞关联表';

-- 正在导出表  yebook.favour 的数据：45 rows
DELETE FROM `favour`;
/*!40000 ALTER TABLE `favour` DISABLE KEYS */;
INSERT INTO `favour` (`f_id`, `n_id`, `u_id`, `addtimes`, `deltimes`, `status`) VALUES
	(1, 23, 5, '2020-10-29 09:42:37', '2020-11-03 12:55:20', 0),
	(2, 23, 5, '2020-11-02 13:43:49', '2020-11-03 12:55:20', 0),
	(3, 23, 5, '2020-11-02 13:43:53', '2020-11-03 12:55:20', 0),
	(4, 23, 5, '2020-11-02 13:43:55', '2020-11-03 12:55:20', 0),
	(5, 23, 5, '2020-11-02 13:43:56', '2020-11-03 12:55:20', 0),
	(6, 23, 5, '2020-11-02 13:43:57', '2020-11-03 12:55:20', 0),
	(7, 23, 5, '2020-11-02 13:43:57', '2020-11-03 12:55:20', 0),
	(8, 23, 5, '2020-11-02 13:45:22', '2020-11-03 12:55:20', 0),
	(9, 23, 5, '2020-11-02 13:45:23', '2020-11-03 12:55:20', 0),
	(10, 23, 5, '2020-11-02 13:45:25', '2020-11-03 12:55:20', 0),
	(11, 23, 5, '2020-11-02 13:45:28', '2020-11-03 12:55:20', 0),
	(12, 23, 5, '2020-11-02 13:45:29', '2020-11-03 12:55:20', 0),
	(13, 23, 5, '2020-11-02 13:45:30', '2020-11-03 12:55:20', 0),
	(14, 23, 5, '2020-11-02 13:45:33', '2020-11-03 12:55:20', 0),
	(15, 23, 5, '2020-11-02 13:46:02', '2020-11-03 12:55:20', 0),
	(16, 23, 5, '2020-11-02 14:46:03', '2020-11-03 12:55:20', 0),
	(17, 26, 5, '2020-11-02 16:53:05', '2020-11-02 16:53:10', 0),
	(18, 26, 5, '2020-11-02 16:53:07', '2020-11-02 16:53:10', 0),
	(19, 26, 5, '2020-11-02 16:53:07', '2020-11-02 16:53:10', 0),
	(20, 26, 5, '2020-11-02 16:53:08', '2020-11-02 16:53:10', 0),
	(21, 26, 5, '2020-11-02 16:53:08', '2020-11-02 16:53:10', 0),
	(22, 26, 5, '2020-11-02 16:53:08', '2020-11-02 16:53:10', 0),
	(23, 26, 5, '2020-11-02 16:53:09', '2020-11-02 16:53:10', 0),
	(24, 26, 5, '2020-11-02 16:53:09', '2020-11-02 16:53:10', 0),
	(25, 26, 5, '2020-11-02 16:53:09', '2020-11-02 16:53:10', 0),
	(26, 26, 5, '2020-11-02 16:53:10', NULL, 1),
	(27, 23, 7, '2020-11-02 17:35:23', '2020-11-02 17:37:59', 0),
	(28, 23, 7, '2020-11-02 17:35:32', '2020-11-02 17:37:59', 0),
	(29, 23, 7, '2020-11-02 17:35:53', '2020-11-02 17:37:59', 0),
	(30, 23, 7, '2020-11-02 17:35:54', '2020-11-02 17:37:59', 0),
	(31, 27, 7, '2020-11-02 17:37:35', NULL, 1),
	(32, 23, 7, '2020-11-02 17:37:59', NULL, 1),
	(33, 25, 5, '2020-11-02 18:05:58', NULL, 1),
	(34, 23, 5, '2020-11-02 18:06:20', '2020-11-03 12:55:20', 0),
	(35, 23, 5, '2020-11-02 20:03:14', '2020-11-03 12:55:20', 0),
	(36, 22, 5, '2020-11-03 11:53:43', '2020-11-03 11:54:23', 0),
	(37, 22, 5, '2020-11-03 11:54:24', NULL, 1),
	(38, 23, 5, '2020-11-03 12:42:21', '2020-11-03 12:55:20', 0),
	(39, 23, 5, '2020-11-03 12:54:16', '2020-11-03 12:55:20', 0),
	(40, 23, 5, '2020-11-03 12:54:17', '2020-11-03 12:55:20', 0),
	(41, 23, 5, '2020-11-03 12:54:17', '2020-11-03 12:55:20', 0),
	(42, 23, 5, '2020-11-03 12:54:18', '2020-11-03 12:55:20', 0),
	(43, 23, 5, '2020-11-03 12:54:18', '2020-11-03 12:55:20', 0),
	(44, 23, 5, '2020-11-03 12:54:18', '2020-11-03 12:55:20', 0),
	(45, 23, 8, '2020-11-03 16:52:44', NULL, 1);
/*!40000 ALTER TABLE `favour` ENABLE KEYS */;

-- 导出  表 yebook.node 结构
CREATE TABLE IF NOT EXISTS `node` (
  `n_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nodetitle` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `imgs` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '封面',
  `video` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '视频',
  `content` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT '帖子内容',
  `u_id` int(10) DEFAULT NULL COMMENT '与用户表的外键关联',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `deltimes` datetime DEFAULT NULL COMMENT '删除时间',
  `updatetimes` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：删除；1：正常',
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='笔记表';

-- 正在导出表  yebook.node 的数据：9 rows
DELETE FROM `node`;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` (`n_id`, `nodetitle`, `imgs`, `video`, `content`, `u_id`, `addtimes`, `deltimes`, `updatetimes`, `status`) VALUES
	(23, '把秋日胡杨捧在手｜华为Mate40 Pro真香！', 'http://localhost:88/public/img/b3047272-95e5-42ae-b9b9-508bbab57c8a.jpg', 'http://localhost:88/public/mp4/fc065e4d-ff1a-4c92-8cc3-1a64d0f02140.mp4', '<p>猪猪们换手机啦！华为Mate40 Pro来啰～我入手新款已经好几天啦，刚出门拍了美美的照片，就迫不及待来和你们分享啦！</p><p>我选择的是秋日胡杨黄色，素皮版本的后壳手感也超好，摸起来有一点像奢侈品包包的质感，秋冬用起来温暖又十分显气质，同质感还有一个夏日胡杨绿色也很好看！</p><p>我最期待，也是对于我来说有非常大需求的摄影功能！这次的后置摄像组从外观上来说完全可以用完美来形容，打造了“星环”设计，极具未来感和科技感。5000万像素的超感知徕卡主摄，2000万像素的电影摄像头，让每次的拍摄都有比肩大片的质感，完全能够满足我对照片的要求。</p><p>除了镜头，还要夸夸它的前后摄像头都支持超广角功能，后置超广角在我拍旅游vlog的时候就非常实用，可以给大家展示更多的美景！前置超广角在合照的时候也是非常贴心！华为超广角摄像头有智能抗畸变功能，再也不会出现合照里脸部“变形”这种尴尬的情况了。</p><p>“好马配好鞍”华为创新环闪保护壳猪猪们都给我配齐了！它专门为华为Mate40系列的基础款量身定做，就是你的随身专属灯光师，随时随地给你补光，补的还是不一样的专业光！它有三档亮度可以调节，白光、暖光、混合光三种光效可以选择！不拍照的时候，可以把它当作一个手机壳，拍照的时候，可以随时弹出。而且不需要专门为它充电，手机操作就可以为它无线反向供电！不禁感叹，华为对我们女生也太好了吧！</p><p>好啦～今天的分享就到这了，明天晚上7点亚妞直播间，再继续和大家细细聊一下华为Mate40 Pro和华为全家桶其它的产品！猪猪们记得来哦～</p>', 5, '2020-11-01 11:57:04', NULL, NULL, 1),
	(22, '书桌日常｜来了！大家问的最多的这个', 'http://localhost:88/public/img/f87100b4-8469-4a88-91d9-08cb61a6d2b1.jpg', 'http://localhost:88/public/mp4/d60b53e2-2320-4b3c-9f3b-7fc9cd286903.mp4', '<p>最近大家问的最多的就是这个支架了</p><p>这是我有一天逛</p><p>偶遇的</p><p>以前的那个支架在韩国没带回来</p><p>感觉自己还是需要一个小巧的方便携带的多功能支架</p><p>就搜到了这个</p><p>目前来说还不错</p><p>很稳定</p><p>特别轻巧</p><p>附赠了一个绒布袋小小的一个方便携带</p>', 5, '2020-11-01 11:54:50', NULL, NULL, 1),
	(21, '学习日常｜分享好物', 'http://localhost:88/public/img/e6062ec9-d2ce-4661-a8e4-2f428a05b4e0.jpg', 'http://localhost:88/public/mp4/09075add-166d-4bbb-a3e1-4cd2f884119f.mp4', '<p>「原声配音 二转注明并@我」</p><p>分享近期学习好物｜喵喵机</p><p>错题打印拍照搜题 一键打印</p><p>节省了很多抄题时间 超级方便a</p><p>拍照搜题还有解析 可以一起打印出来</p><p>有很多模板提供 课程表 代办清单…</p><p>可以打印出来制定一天的计划行程安排</p><p>APP中还有真题试卷 可以刷题</p><p>分辨率300dpi 供电方便 持久续航~</p>', 5, '2020-11-01 11:50:00', NULL, NULL, 1),
	(20, '这是我的笔记', 'http://localhost:88/public/img/f50e9e3b-dab4-458a-a65e-2d8b44a339a5.jpg', 'http://localhost:88/public/mp4/6cd91521-1c94-433f-8e92-f53bdfb10208.mp4', '<p>笔记内容是不知道</p>', 5, '2020-10-31 22:05:10', '2020-11-04 11:18:47', NULL, 0),
	(19, '我的笔记', 'http://localhost:88/public/img/05d1b9ea-caae-4a10-9bc9-855e3e7efb62.jpg', 'http://localhost:88/public/mp4/5d435f51-24b6-46ec-84b1-36a3cc498a7d.mp4', '<p>笔记内容</p>', 5, '2020-10-31 21:42:17', '2020-10-31 22:46:43', NULL, 0),
	(24, '奔跑吧，去丈量每一寸土地', 'http://localhost:88/public/img/e3217b9d-55e3-4997-8514-a75bdb5ed025.jpg', 'http://localhost:88/public/mp4/d676cdca-350b-42aa-91fa-8fb34f1ec074.mp4', '<p><br></p><main><p>▫️每到一个城市，为了更好地感受当地的氛围，除了观光我一定会找时间去街边跑跑步。</p><p>.</p><p>▫️大学时在美国佛罗里达实习，早晨沿着海边跑步，在海浪声和海风的相伴下，是我最轻松的时刻；和卢总在西西里旅行时，一起奔跑在古老小镇的石板路，再在街角的面包店买上几个牛角包，便感觉像本地人一样生活着；生活在上海，我们常去苏州河夜跑，路过跳广场舞的大妈还是擦肩而过的路人，都让我感觉到这个城市的生命力。</p><p>.</p><p>▫️时值北京最好的季节，当然少不了跑步这项固定活动。从北池子大街出发绕着故宫跑了几圈，早晨的北池子大街难得清净，没有成群结队拍照打卡的游客，路边整齐的银杏正是黄叶的季节，街边飘来烤红薯栗子的香味，经过故宫角楼，护城河边驾着三脚架拍角楼的摄影爱好者，或是看着河水发呆的大爷，每一次奔跑，都让我感觉自己是这个城市的一部分。跑步不仅仅是运动，更是去丈量一方土地。</p><p>.</p><p>关于穿搭：</p><p>一套好的运动服，总能让我更有动力去跑步，这次穿的整套都是MAIA ACTIVE，上衣是双面抓绒的质地，很适合这个季节户外跑步，云感裤一如既往地舒服，已经是我入的MAIA ACTIVE第五条运动裤了！饱和度不高的绿色也不挑肤色，我这种黄皮可以轻松驾驭！</p><p>.</p><p>关于跑步：</p><p>▫️想要身体线条好，运动后一定要充分拉伸！详细动作可以参照keep教程。</p><p>▫️想要燃脂，一般需要跑步至少30分钟以上。</p><p>▫️跑步适宜心率=（220-年龄）x 60%</p><p>▫️选择舒适的运动服和鞋子 ，可以减少对身体的运动损伤。</p></main>', 5, '2020-11-01 11:59:15', NULL, NULL, 1),
	(25, '学习日记', 'http://localhost:88/public/img/f602ef36-b794-4a8f-9f41-c5c17bd53e2a.jpg', 'http://localhost:88/public/mp4/d297480d-948d-454c-bd34-ab8384085210.mp4', '<p>今天做了2020国考试卷，1小时46分钟完成。和去年相比不仅时间有余分数也高了7分。像我这种笨人还是适合多学好几遍～</p><p>今天终于搞出了分层的咖啡哈哈哈哈一直觉得拿铁分层超级好看，顺带心理作用认为它更好喝嘿嘿</p><p>新买了一个平板壳还买了配套的耳机壳，之前的小紫壳是三折的是能固定角度不方便，而且由于它折痕多导致我的贴纸都翘起来了5555 只能重新买了一个。新买的壳好好看！图案是牛角面包色调很暖～店主送的贴纸蛮可爱的，我全部都贴上去了哈哈哈哈～</p><p>俺也整了一个what\'s in my bag嘿嘿，几乎我日常会带出去的东西都在里面了！平板型号啥的都标注清楚啦，各位宝贝不要再问了我有强迫症，必须每条评论都要回复过去不然心里难受[doge]书包是bm的绿格子，俺在上海的朋友送滴，好看是真的好看 小也是真的小...我的一些书根本塞不下。最近看中了jansport的奶油白书包可惜缺货了</p><p>倍思的快充头挺好用，简直就是都市丽人必备！充电速度飞快，去教室用平板学习必须带着！</p><p>前几天朋友送了我李茶德的奶盖茶，一开始觉得花里胡哨的，结果依旧是真香。太太太好喝了！图片上的樱花乌龙玛奇朵，味道真的不输奶茶店！特别是奶盖 有一股玫瑰花的香味（樱花玫瑰花傻傻分不清楚）我暴风吸入，一会就没了！不过喝的时候不要像我一样猴急，我想吸奶盖便抛弃了吸管直接挤，结果奶茶差点冲到鼻子上我还有盒海盐味的，打算明天装在杯子里喝再加点牛奶自己diy哈哈哈哈</p><p>muji的这个茶我yue了，好酸酸酸酸酸.....刚泡完那香味简直沁人心脾，结果我满怀期待猛吸一口酸的我泪水直流（夸张</p><p>怒推雅诗兰黛333，相信我真的宇宙无敌第一好看！显白白白白白，而且和其他口红叠加也很百搭！自从我买了它其他的口红都被闲置了[doge]</p>', 5, '2020-11-01 12:06:32', NULL, NULL, 1),
	(26, ' 女生车里都有啥？女司机的车载好物清单来啦', 'http://localhost:88/public/img/64d22b7e-f88b-45c0-88b5-1cc54fbd3c6b.jpg', 'http://localhost:88/public/mp4/bdaa9a98-eeb6-47e4-995e-8ab272ffeedf.mp4', '<p>-<br></p><main><p>我可能不是一个女生，车子都买了半年了，我才想起来应该给它装饰一下</p><p>不喜欢毛茸茸的坐垫什么的，就买了几个小装饰</p><p>-</p><p>迪士尼公仔摆件</p><p>送了无痕胶，可以随便贴在自己想贴的地方。贴在中控上，排排坐简直太可爱了</p><p>-</p><p>洛瑞欧车载香薰</p><p>我买了他们家的两款香薰，一个是下午茶系列的香包，柚子绿茶。可以用丝带挂在后视镜上当车挂，也可以用支架夹在出风口，我把它夹在了后排的空调出风口。</p><p>另一个是放在出风口的扩香，一个铝合金的小球球，有不同的颜色，男女都适用。</p><p>-</p><p>手机支架</p><p>因为我的车要用数据线连接手机才能连接Carplay，就没有买可以无线充电的手机支架，只买了一个常规款，没什么特别的</p><p>-</p><p>拳头挂钩</p><p>这个对于女生来说真的超实用，副驾座有人的时候，包包就没地方放了，有了这个挂钩就超方便</p></main>', 5, '2020-11-01 12:12:18', '2020-11-02 18:15:49', NULL, 0),
	(27, 'cccrush', 'http://localhost:88/public/img/f7b118c0-d528-499e-9362-73fa5975bb41.jpg', 'http://localhost:88/public/mp4/d93fa27d-e180-4e75-b530-6c76655e64bd.mp4', '<p>又到一年吃土日</p><p>疯狂的剁手之后就是可怜的吃土日，今天小Q和其他6个小伙伴给大家准备了回血礼包哦～快来领取吧！</p><p><br></p><p>活动参与方式</p><p>ㅤ</p><p>奖品设置：</p><p>1⃣<a href="https://www.xiaohongshu.com/user/profile/55aa33ce41a2b30f789897cc">@MAY COOP枚柯</a></p><p>小木瓶精华水 40ml：王霏霏同款，一瓶换季维稳缩毛孔</p><p>ㅤ</p><p>2⃣<a href="https://www.xiaohongshu.com/user/profile/5c2dc0c10000000006029be9">@AOSO</a></p><p>氨基酸洗面奶 100g: 集保湿、抗炎、养肤多重功效为一体，洗出健康润泽肌。ㅤ</p><p><br></p><p>3⃣<a href="https://www.xiaohongshu.com/user/profile/5af90c5911be107f0497e275">@Milk Skin奶肌</a></p><p>牛奶精华气垫霜 15g: 一拍焕白透亮,拥有无暇牛奶肌</p><p>ㅤ</p><p>4⃣<a href="https://www.xiaohongshu.com/user/profile/5b45735011be1026e7bf05c3">@Bb Laboratories</a></p><p>复活草面膜套盒 35g：460倍巨补水，还原嘭弹水养肌</p>', 7, '2020-11-02 17:37:22', NULL, NULL, 1);
/*!40000 ALTER TABLE `node` ENABLE KEYS */;

-- 导出  表 yebook.press 结构
CREATE TABLE IF NOT EXISTS `press` (
  `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `a_id` int(10) NOT NULL COMMENT '与管理员表外键',
  `release` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '新闻公告',
  `publishing` char(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发布社',
  `regional` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：热门报道；1：近期动态；2：荣誉奖项',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `deltimes` datetime DEFAULT NULL COMMENT '删除时间',
  `updatetiems` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：删除；1：正常',
  `newscontent` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='新闻中心表';

-- 正在导出表  yebook.press 的数据：15 rows
DELETE FROM `press`;
/*!40000 ALTER TABLE `press` DISABLE KEYS */;
INSERT INTO `press` (`p_id`, `a_id`, `release`, `publishing`, `regional`, `addtimes`, `deltimes`, `updatetiems`, `status`, `newscontent`) VALUES
	(1, 2, '民宿预定首次亮相小绿书直播间 交易量转化率领跑行业', '中国经济', 0, '2020-11-02 19:46:13', NULL, NULL, 1, '10月18日晚，小红书旅游博主“人字拖游记”的直播间里出现了一个新的带货品类——民宿，作为填补小红书旅游人群需求空白的产品，当晚直播间互动率超过22%，总交易金额破百万，相比十一之前同类产品在其他OTA平台的直播带货交易金额翻倍。'),
	(2, 2, '小红书联合“国际商标协会”，将共同推进“正品”保护', NULL, 1, '2020-11-03 19:39:24', NULL, NULL, 1, '111111111111111111111111111111'),
	(3, 2, '新商业引领者', '36氪', 2, '2020-11-03 19:48:48', NULL, NULL, 1, '22222222222222222222222222'),
	(4, 1, '小红书创始人瞿芳：品牌与用户沟通正从“教学模式”转向“恋爱模式” ', '新华网', 0, '2020-11-03 20:02:42', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(5, 1, '小红书啄木鸟计划处置账号7383个 处理21.3万篇笔记 中国日报网', '中国日报网', 0, '2020-11-03 20:03:07', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(6, 1, '小红书：发力在线新经济 让年轻一代找到归属 ', '人民网', 0, '2020-11-03 20:03:25', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(7, 1, '小红书测试视频互动功能 降低用户视频创作门槛 ', '环球网', 0, '2020-11-03 20:03:43', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(8, 1, '央视来访小红书宁波保税仓：货物分拨提速让商品“跑”起来', '', 1, '2020-11-03 20:04:06', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(9, 1, '小红书推出Living Inspired系列活动，第一站落地洛杉矶', '', 1, '2020-11-03 20:04:19', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(10, 1, '小红书六周年，月活突破8500万', '', 1, '2020-11-03 20:04:34', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(11, 1, '小红书推出“小红心”评分体系，一人一票选出年轻人的生活方式', '', 1, '2020-11-03 20:04:47', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(12, 1, '创始人瞿芳获“中国商业创变者50人”称号 36氪', '36氪', 2, '2020-11-03 20:05:29', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(13, 1, '蝉联“福布斯中国最具创新力企业榜” ', '福布斯', 2, '2020-11-03 20:05:45', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(14, 1, '创始人瞿芳获“2019全球商业最具创意人物”称号 ', '快公司', 2, '2020-11-03 20:05:58', NULL, NULL, 1, '333333333333333333333333333333333333'),
	(15, 1, '“全球颠覆者50”榜单TOP 10 CNBC ', 'CNBC', 2, '2020-11-03 20:06:14', NULL, NULL, 1, '333333333333333333333333333333333333');
/*!40000 ALTER TABLE `press` ENABLE KEYS */;

-- 导出  表 yebook.society 结构
CREATE TABLE IF NOT EXISTS `society` (
  `s_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `a_id` int(10) NOT NULL COMMENT '与管理员表外键',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `content` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `imgs` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '封面',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `deltimes` datetime DEFAULT NULL COMMENT '删除时间',
  `updatetiems` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：删除；1：正常',
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='社会责任表';

-- 正在导出表  yebook.society 的数据：5 rows
DELETE FROM `society`;
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
INSERT INTO `society` (`s_id`, `a_id`, `title`, `content`, `imgs`, `addtimes`, `deltimes`, `updatetiems`, `status`) VALUES
	(1, 2, '小红书上线抗疫心理援助平台 逾千名咨询师提供免费心理咨询', '2月10日，小红书上线抗疫心理援助平台，为受疫情影响的一线医护人员、患者及有需求的普通公众提供7*24小时的免费心理咨询。小红书会将援助专题页定向推送给湖北地区用户，以帮助热线直达疫情严重地区。', 'http://localhost:88/public/img/ff9f6921-2a52-467d-bcf2-1365e064f982.png', '2020-11-03 00:27:14', NULL, NULL, 1),
	(2, 2, '2019环保聚焦 小红书上“生活垃圾分类”一直在行动', '用新眼光审视环保，用“垃圾日记”为绿色生活代言，新青年们正通过新的生活方式，参与对“环保”这个宏大命题的独特理解和表达。', 'http://localhost:88/public/img/66059a75-cee2-49ca-8a3f-8c6a9877e2e1.jpg', '2020-11-03 00:28:39', NULL, NULL, 1),
	(3, 2, '小红书新一批援助物资运达武汉 已定向捐赠同济、协和等四家医院', '2月17日，继首批20万件物资运达武汉后，小红书的第二批援助物资也于日前运达武汉。这批9万件N95医用口罩已定向捐赠给同济医院中法新城院区、协和医院西院、武汉大学人民医院东院、同济医院光谷院区四家医院，用于新型冠状肺炎的疫情防疫工作。', 'http://localhost:88/public/img/502ee0ae-b79e-4159-aede-e4f3c89cf82b.png', '2020-11-03 00:37:14', NULL, NULL, 1),
	(4, 2, '小红书积极响应“争做中国好网民 上海网民在行动”网络举报宣传月活动', '9月10日上午，2019年上海市网络举报宣传月启动式暨网络举报志愿者培训开班仪式在上海报业大厦2楼报告厅举行，网络举报知识竞赛也同日上线。该活动由上海市委网信办指导，新民晚报新民网和上海互联网新闻研究中心（上海市互联网违法和不良信息举报中心）主办。这也是2019年上海市“争做中国好网民 上海网民在行动”有关“网络乱象我举报”活动的重要组成部分。', 'http://localhost:88/public/img/716d1ba6-21a3-412f-ad12-23c9282bda63.jpg', '2020-11-03 00:38:47', NULL, NULL, 1),
	(5, 2, '小红书出资1000万元用于新冠肺炎专项援助 支援武汉疫区', '1月31日，由小红书捐赠武汉疫区的首批20万件防护口罩已陆续到达武汉，相关物资已移交武汉东湖高新区防控指挥部，统一调度配给急需物资的医院及社区。同时，小红书在海外采购的包括欧标FFP2医用口罩在内的超过10万件医疗防疫物资，也已启程发往国内。', 'http://localhost:88/public/img/e0378803-8d6c-43f5-be74-6dd78ea3e608.jpg', '2020-11-03 00:39:37', NULL, NULL, 1);
/*!40000 ALTER TABLE `society` ENABLE KEYS */;

-- 导出  表 yebook.tag 结构
CREATE TABLE IF NOT EXISTS `tag` (
  `t_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tagname` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '标签名',
  `a_id` int(10) NOT NULL COMMENT '与管理员表外键关联',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `deltimes` datetime DEFAULT NULL COMMENT '删除时间',
  `updatetimes` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签表';

-- 正在导出表  yebook.tag 的数据：10 rows
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`t_id`, `tagname`, `a_id`, `addtimes`, `deltimes`, `updatetimes`) VALUES
	(1, '文化', 1, '2020-10-27 17:05:11', NULL, NULL),
	(2, '阅读', 1, '2020-10-27 17:05:24', NULL, NULL),
	(3, '懒癌', 1, '2020-10-27 17:05:34', NULL, NULL),
	(4, '睡前故事', 1, '2020-10-27 17:05:49', NULL, NULL),
	(5, 'DNF', 1, '2020-10-30 10:10:06', NULL, NULL),
	(6, 'CF', 1, '2020-10-30 10:10:13', NULL, NULL),
	(7, 'APEX', 1, '2020-10-30 10:10:20', NULL, NULL),
	(8, 'LOL', 1, '2020-10-30 10:10:30', NULL, NULL),
	(9, '家具家装', 1, '2020-11-03 16:38:35', NULL, NULL),
	(10, '家用电器', 1, '2020-11-03 16:38:51', NULL, NULL);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- 导出  表 yebook.tnode 结构
CREATE TABLE IF NOT EXISTS `tnode` (
  `tn_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `t_id` int(10) NOT NULL COMMENT '与标签表外键',
  `n_id` int(10) NOT NULL COMMENT '与笔记表外键',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`tn_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签笔记外联表';

-- 正在导出表  yebook.tnode 的数据：26 rows
DELETE FROM `tnode`;
/*!40000 ALTER TABLE `tnode` DISABLE KEYS */;
INSERT INTO `tnode` (`tn_id`, `t_id`, `n_id`, `addtimes`) VALUES
	(36, 1, 24, '2020-11-01 11:59:15'),
	(35, 3, 23, '2020-11-01 11:57:04'),
	(34, 4, 23, '2020-11-01 11:57:04'),
	(33, 2, 22, '2020-11-01 11:54:50'),
	(32, 5, 22, '2020-11-01 11:54:50'),
	(31, 1, 22, '2020-11-01 11:54:50'),
	(44, 1, 27, '2020-11-02 17:37:22'),
	(29, 2, 21, '2020-11-01 11:50:00'),
	(28, 3, 21, '2020-11-01 11:50:00'),
	(45, 5, 27, '2020-11-02 17:37:22'),
	(46, 2, 27, '2020-11-02 17:37:22'),
	(25, 1, 21, '2020-11-01 11:50:00'),
	(24, 5, 20, '2020-10-31 22:05:10'),
	(23, 2, 20, '2020-10-31 22:05:10'),
	(22, 1, 20, '2020-10-31 22:05:10'),
	(21, 6, 19, '2020-10-31 21:42:17'),
	(20, 1, 19, '2020-10-31 21:42:17'),
	(19, 5, 19, '2020-10-31 21:42:17'),
	(37, 6, 24, '2020-11-01 11:59:15'),
	(38, 3, 24, '2020-11-01 11:59:15'),
	(39, 1, 25, '2020-11-01 12:06:32'),
	(40, 6, 25, '2020-11-01 12:06:32'),
	(41, 6, 26, '2020-11-01 12:12:18'),
	(42, 2, 26, '2020-11-01 12:12:18'),
	(43, 3, 26, '2020-11-01 12:12:18'),
	(47, 3, 27, '2020-11-02 17:37:22');
/*!40000 ALTER TABLE `tnode` ENABLE KEYS */;

-- 导出  表 yebook.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `sexs` tinyint(1) NOT NULL COMMENT '用户性别1：男；0：女',
  `heads` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg' COMMENT '用户头像',
  `birthday` char(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户生日',
  `passwd` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `tel` char(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户登录电话',
  `ip` char(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IP地址',
  `addtimes` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `deltimes` datetime DEFAULT NULL COMMENT '注销时间',
  `updatatimes` datetime DEFAULT NULL COMMENT '修改时间',
  `lasttimes` datetime DEFAULT NULL COMMENT '最后一次登陆时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：注销；1：正常',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- 正在导出表  yebook.user 的数据：8 rows
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`u_id`, `username`, `sexs`, `heads`, `birthday`, `passwd`, `tel`, `ip`, `addtimes`, `deltimes`, `updatatimes`, `lasttimes`, `status`, `nums`) VALUES
	(1, '宝藏女孩芊皖', 0, 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg', '2000-11-11', 'baozang', '12345678919', '192.168.5.155', '2020-10-27 17:07:14', NULL, NULL, NULL, 0, 0),
	(2, 'Jonie', 1, 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg', '1998-09-06', 'j123456_', '12345678900', '192.168.5.195', '2020-10-27 17:12:33', NULL, NULL, NULL, 0, 0),
	(3, '晚晚星河.ADELINE', 0, 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg', '1999-01-01', 'xingxing', '12345678908', '192.168.5.123', '2020-10-29 09:31:07', NULL, NULL, NULL, 0, 0),
	(4, '蹦蹦跳跳小芝麻', 1, 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg', '1997-05-30', 'bengbeng', '12345678903', '192.168.15.151', '2020-10-29 09:40:37', NULL, NULL, NULL, 0, 0),
	(5, 'eee', 1, 'http://localhost:88/public/img/62822949-0ea5-47e3-83f9-31ac893b2554.jpg', '1999-04-04', 'hsx000_', '17738177447', '127.0.0.1', '2020-10-31 17:07:12', NULL, NULL, '2020-11-04 11:18:44', 1, 6),
	(6, 'cccrush', 0, 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg', '1999-04-04', 'hsx000_', '17738177447', '192.168.98.112', '2020-10-31 20:28:58', NULL, NULL, '2020-10-31 20:28:58', 1, 0),
	(7, 'funckyou', 1, 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg', NULL, 'hsx000_', '17738177447', 'localhost', '2020-11-02 17:34:31', NULL, NULL, '2020-11-02 17:35:08', 1, 1),
	(8, 'apex', 1, 'https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg', NULL, 'hsx000_', '17738177447', '127.0.0.1', '2020-11-03 16:50:53', NULL, NULL, '2020-11-03 16:51:03', 1, 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
