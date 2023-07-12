/*
 Navicat Premium Data Transfer

 Source Server         : mysql@localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : shoka_blog

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 12/07/2023 13:53:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_album
-- ----------------------------
DROP TABLE IF EXISTS `t_album`;
CREATE TABLE `t_album`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '相册名',
  `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '相册封面',
  `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '相册描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 (1公开 2私密)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_album
-- ----------------------------

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '作者id',
  `category_id` int NOT NULL DEFAULT 0 COMMENT '分类id',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `article_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型 (1原创 2转载 3翻译)',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 (0否 1是）',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除 (0否 1是)',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐 (0否 1是)',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 (1公开 2私密 3评论可见)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag`;
CREATE TABLE `t_article_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 0 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comment_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型 (1文章 2友链 3说说)',
  `type_id` int NOT NULL DEFAULT 0 COMMENT '类型id (类型为友链则没有值)',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父评论id',
  `reply_id` int NOT NULL DEFAULT 0 COMMENT '回复评论id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `from_uid` int NOT NULL DEFAULT 0 COMMENT '评论用户id',
  `to_uid` int NOT NULL DEFAULT 0 COMMENT '回复用户id',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `t_exception_log`;
CREATE TABLE `t_exception_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '异常id',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '异常模块',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '异常uri',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '异常名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作描述',
  `error_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '异常方法',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '异常信息',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作地址',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_favourite
-- ----------------------------
DROP TABLE IF EXISTS `t_favourite`;
CREATE TABLE `t_favourite`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '收藏夹id',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `classify` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类',
  `icon` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '链接',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件url',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_size` int NOT NULL DEFAULT 0 COMMENT '文件大小',
  `extend_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `is_dir` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为目录 (0否 1是)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '友链id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友链名称',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友链颜色',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友链头像',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友链地址',
  `introduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '友链介绍',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `friend_user`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父菜单id (paren_id为0且type为M则是一级菜单)',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限类型 (M目录 C菜单 B按钮)',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '菜单组件',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏 (0否 1是)',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `order_num` int NOT NULL DEFAULT 1 COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, 'M', '文章管理', 'article', 'archives', '', '', 0, 0, 1, '2023-04-07 13:05:09', '2023-04-07 13:05:09');
INSERT INTO `t_menu` VALUES (2, 0, 'M', '消息管理', 'news', 'email', '', '', 0, 0, 2, '2023-04-07 13:08:36', '2023-05-27 19:11:55');
INSERT INTO `t_menu` VALUES (3, 0, 'M', '系统管理', 'system', 'system', '', '', 0, 0, 4, '2023-04-08 13:59:57', '2023-06-24 14:23:28');
INSERT INTO `t_menu` VALUES (4, 0, 'M', '日志管理', 'log', 'log', '', '', 0, 0, 5, '2023-05-27 19:05:55', '2023-06-24 14:23:28');
INSERT INTO `t_menu` VALUES (5, 0, 'M', '系统监控', 'monitor', 'monitor', '', '', 0, 1, 6, '2023-05-27 19:11:31', '2023-06-24 14:23:28');
INSERT INTO `t_menu` VALUES (6, 0, 'M', '其它', 'other', 'other', '', '', 0, 0, 3, '2023-06-24 14:13:57', '2023-06-24 14:31:01');
INSERT INTO `t_menu` VALUES (101, 1, 'C', '文章列表', 'list', 'chart', 'article/list', 'article:list', 0, 0, 1, '2023-04-07 13:09:50', '2023-04-07 13:09:50');
INSERT INTO `t_menu` VALUES (102, 1, 'C', '发布文章', 'write', 'edit', 'article/write', 'article:write', 0, 0, 2, '2023-04-07 13:12:57', '2023-04-07 13:13:08');
INSERT INTO `t_menu` VALUES (103, 1, 'C', '修改文章', 'write/:articleId', 'edit', 'article/write', 'article:update', 1, 0, 3, '2023-04-07 13:12:57', '2023-04-07 13:17:47');
INSERT INTO `t_menu` VALUES (104, 1, 'C', '分类管理', 'category', 'category', 'article/category', 'category:list', 0, 0, 5, '2023-04-07 13:12:57', '2023-05-27 19:14:57');
INSERT INTO `t_menu` VALUES (105, 1, 'C', '标签管理', 'tag', 'tag', 'article/tag', 'tag:list', 0, 0, 6, '2023-04-07 13:12:57', '2023-05-27 19:14:57');
INSERT INTO `t_menu` VALUES (106, 6, 'C', '说说管理', 'talk', 'talk', 'talk', 'talk:list', 0, 0, 1, '2023-05-27 18:06:00', '2023-06-24 14:32:33');
INSERT INTO `t_menu` VALUES (109, 2, 'C', '评论管理', 'comment', 'comment', 'news/comment', 'comment:list', 0, 0, 1, '2023-04-07 13:17:47', '2023-05-27 19:13:33');
INSERT INTO `t_menu` VALUES (110, 2, 'C', '留言管理', 'message', 'form', 'news/message', 'message:list', 0, 0, 2, '2023-04-07 13:17:47', '2023-05-27 19:13:33');
INSERT INTO `t_menu` VALUES (111, 3, 'C', '菜单管理', 'menu', 'tree-table', 'system/menu', 'menu:list', 0, 1, 1, '2023-04-08 14:07:25', '2023-05-28 14:08:54');
INSERT INTO `t_menu` VALUES (112, 3, 'C', '角色管理', 'role', 'peoples', 'system/role', 'role:list', 0, 1, 2, '2023-04-08 14:07:25', '2023-05-28 14:08:53');
INSERT INTO `t_menu` VALUES (113, 3, 'C', '用户管理', 'user', 'user', 'system/user', 'user:list', 0, 0, 3, '2023-04-08 14:07:25', '2023-05-27 19:13:52');
INSERT INTO `t_menu` VALUES (114, 3, 'C', '文件管理', 'file', 'file', 'system/file', 'file:list', 0, 1, 4, '2023-04-08 14:07:25', '2023-05-28 14:08:53');
INSERT INTO `t_menu` VALUES (115, 3, 'C', '网站配置', 'site', 'example', 'system/site', 'site:list', 0, 0, 5, '2023-04-08 14:07:25', '2023-05-27 19:13:52');
INSERT INTO `t_menu` VALUES (116, 4, 'C', '操作日志', 'operation', 'form', 'log/operation', 'log:operation:list', 0, 0, 1, '2023-05-27 19:20:34', '2023-05-27 19:23:24');
INSERT INTO `t_menu` VALUES (117, 4, 'C', '异常日志', 'exception', 'bug', 'log/exception', 'log:exception:list', 0, 0, 2, '2023-05-27 19:20:34', '2023-05-27 19:23:24');
INSERT INTO `t_menu` VALUES (118, 4, 'C', '访问日志', 'visit', 'logininfor', 'log/visit', 'log:visit:list', 0, 0, 3, '2023-05-27 19:20:34', '2023-05-27 19:23:24');
INSERT INTO `t_menu` VALUES (119, 4, 'C', '任务日志', 'task', 'job', 'log/task', 'log:task:list', 0, 1, 4, '2023-05-27 19:20:34', '2023-05-27 23:16:41');
INSERT INTO `t_menu` VALUES (120, 5, 'C', '定时任务', 'task', 'job', 'monitor/task/index', 'task:list', 0, 1, 1, '2023-05-27 19:22:43', '2023-05-27 23:16:41');
INSERT INTO `t_menu` VALUES (121, 5, 'C', '在线用户', 'online', 'online', 'monitor/online/index', 'online:list', 0, 1, 2, '2023-05-27 19:22:43', '2023-05-28 19:22:28');
INSERT INTO `t_menu` VALUES (122, 6, 'C', '收藏管理', 'favourite', 'favourite', 'favourite', 'favourite:list', 0, 0, 2, '2023-06-24 14:31:34', '2023-06-24 15:26:15');
INSERT INTO `t_menu` VALUES (1001, 102, 'B', '添加文章', '', '', '', 'article:add', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1002, 102, 'B', '修改文章', '', '', '', 'article:update', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1003, 101, 'B', '编辑文章', '', '', '', 'article:edit', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1004, 101, 'B', '删除文章', '', '', '', 'article:delete', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1005, 101, 'B', '回收文章', '', '', '', 'article:recycle', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1006, 101, 'B', '恢复文章', '', '', '', 'article:recover', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1007, 102, 'B', '上传文章图片', '', '', '', 'article:upload', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1008, 101, 'B', '置顶文章', '', '', '', 'article:top', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1009, 101, 'B', '推荐文章', '', '', '', 'article:featured', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1010, 101, 'B', '点赞文章', '', '', '', 'article:like', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1011, 104, 'B', '添加分类', '', '', '', 'category:add', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1012, 104, 'B', '修改分类', '', '', '', 'category:update', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1013, 104, 'B', '删除分类', '', '', '', 'category:delete', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1014, 105, 'B', '添加标签', '', '', '', 'tag:add', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1015, 105, 'B', '修改标签', '', '', '', 'tag:update', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1016, 105, 'B', '删除标签', '', '', '', 'tag:delete', 0, 0, 1, '2023-04-07 13:29:59', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1017, 106, 'B', '添加说说', '', '', '', 'talk:add', 0, 0, 1, '2023-04-07 13:34:36', '2023-05-27 18:15:42');
INSERT INTO `t_menu` VALUES (1018, 106, 'B', '修改说说', '', '', '', 'talk:update', 0, 0, 1, '2023-04-07 13:34:36', '2023-05-27 18:15:42');
INSERT INTO `t_menu` VALUES (1019, 106, 'B', '编辑说说', '', '', '', 'talk:edit', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1020, 106, 'B', '删除说说', '', '', '', 'talk:delete', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1021, 106, 'B', '上传说说图片', '', '', '', 'talk:upload', 0, 0, 1, '2023-04-07 13:34:36', '2023-05-27 18:15:42');
INSERT INTO `t_menu` VALUES (1022, 106, 'B', '点赞说说', '', '', '', 'talk:like', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1023, 109, 'B', '添加评论', '', '', '', 'comment:add', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1024, 109, 'B', '删除评论', '', '', '', 'comment:delete', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1025, 109, 'B', '审核评论', '', '', '', 'comment:check', 0, 0, 1, '2023-04-07 13:34:36', '2023-05-19 12:19:40');
INSERT INTO `t_menu` VALUES (1026, 109, 'B', '点赞评论', '', '', '', 'comment:like', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1027, 110, 'B', '添加留言', '', '', '', 'message:add', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1028, 110, 'B', '删除留言', '', '', '', 'message:delete', 0, 0, 1, '2023-04-07 13:34:36', '2023-04-08 14:02:41');
INSERT INTO `t_menu` VALUES (1029, 110, 'B', '审核留言', '', '', '', 'message:check', 0, 0, 1, '2023-04-07 13:34:36', '2023-05-19 12:19:40');
INSERT INTO `t_menu` VALUES (1030, 115, 'B', '修改网站配置', '', '', '', 'site:update', 0, 0, 1, '2023-04-08 14:08:31', '2023-04-08 14:08:31');
INSERT INTO `t_menu` VALUES (1031, 115, 'B', '上传网站配置图片', '', '', '', 'site:upload', 0, 0, 1, '2023-04-08 14:08:55', '2023-04-08 14:08:55');
INSERT INTO `t_menu` VALUES (1032, 116, 'B', '删除操作日志', '', '', '', 'log:operation:delete', 0, 0, 1, '2023-05-27 19:20:34', '2023-05-28 13:17:24');
INSERT INTO `t_menu` VALUES (1033, 117, 'B', '删除异常日志', '', '', '', 'log:exception:delete', 0, 0, 1, '2023-05-27 19:20:34', '2023-05-28 13:17:24');
INSERT INTO `t_menu` VALUES (1034, 118, 'B', '删除访问日志', '', '', '', 'log:visit:delete', 0, 0, 1, '2023-05-27 19:20:34', '2023-05-28 13:17:24');
INSERT INTO `t_menu` VALUES (1035, 119, 'B', '删除任务日志', '', '', '', 'log:task:delete', 0, 0, 1, '2023-05-27 19:20:34', '2023-05-28 13:17:24');
INSERT INTO `t_menu` VALUES (1036, 119, 'B', '清空任务日志', '', '', '', 'log:task:clear', 0, 0, 1, '2023-05-27 19:20:34', '2023-05-28 13:17:24');
INSERT INTO `t_menu` VALUES (1037, 113, 'B', '查看用户信息', '', '', '', 'user:list', 0, 0, 1, '2023-05-28 13:18:39', '2023-05-28 13:18:39');
INSERT INTO `t_menu` VALUES (1038, 113, 'B', '修改用户信息', '', '', '', 'user:update', 0, 0, 1, '2023-05-28 13:18:39', '2023-05-28 13:18:39');
INSERT INTO `t_menu` VALUES (1039, 113, 'B', '修改用户状态', '', '', '', 'user:status', 0, 0, 1, '2023-05-28 13:18:39', '2023-05-28 13:18:39');
INSERT INTO `t_menu` VALUES (1040, 122, 'B', '添加收藏', '', '', '', 'favourite:add', 0, 0, 1, '2023-06-24 14:37:30', '2023-06-24 14:37:30');
INSERT INTO `t_menu` VALUES (1041, 122, 'B', '修改收藏', '', '', '', 'favourite:update', 0, 0, 1, '2023-06-24 14:37:30', '2023-06-24 14:37:30');
INSERT INTO `t_menu` VALUES (1042, 122, 'B', '删除收藏', '', '', '', 'favourite:delete', 0, 0, 1, '2023-06-24 14:37:30', '2023-06-24 14:37:30');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '头像',
  `message_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '留言内容',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户地址',
  `is_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否通过 (0否 1是)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '操作id',
  `module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作模块',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作类型',
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作uri',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '方法名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作描述',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '请求参数',
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返回数据',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作地址',
  `times` int NOT NULL DEFAULT 0 COMMENT '操作耗时 (毫秒)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_photo
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '照片id',
  `album_id` int NOT NULL DEFAULT 0 COMMENT '相册id',
  `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '照片名',
  `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '照片描述',
  `photo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '照片链接',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'admin', '管理员', 0, '2022-11-03 17:41:57', '2023-03-10 23:12:59');
INSERT INTO `t_role` VALUES (2, 'user', '普通用户', 0, '2022-11-03 17:42:17', '2023-03-10 23:13:11');
INSERT INTO `t_role` VALUES (3, 'test', '测试账号', 0, '2022-11-03 17:42:31', '2023-03-10 23:13:17');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int NOT NULL DEFAULT 0 COMMENT '角色id',
  `menu_id` int NOT NULL DEFAULT 0 COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 3, 1);
INSERT INTO `t_role_menu` VALUES (2, 3, 2);
INSERT INTO `t_role_menu` VALUES (3, 3, 3);
INSERT INTO `t_role_menu` VALUES (4, 3, 4);
INSERT INTO `t_role_menu` VALUES (5, 3, 5);
INSERT INTO `t_role_menu` VALUES (6, 3, 101);
INSERT INTO `t_role_menu` VALUES (7, 3, 102);
INSERT INTO `t_role_menu` VALUES (8, 3, 103);
INSERT INTO `t_role_menu` VALUES (9, 3, 104);
INSERT INTO `t_role_menu` VALUES (10, 3, 105);
INSERT INTO `t_role_menu` VALUES (11, 3, 106);
INSERT INTO `t_role_menu` VALUES (12, 3, 109);
INSERT INTO `t_role_menu` VALUES (13, 3, 110);
INSERT INTO `t_role_menu` VALUES (14, 3, 111);
INSERT INTO `t_role_menu` VALUES (15, 3, 112);
INSERT INTO `t_role_menu` VALUES (16, 3, 113);
INSERT INTO `t_role_menu` VALUES (17, 3, 114);
INSERT INTO `t_role_menu` VALUES (18, 3, 115);
INSERT INTO `t_role_menu` VALUES (19, 3, 116);
INSERT INTO `t_role_menu` VALUES (20, 3, 117);
INSERT INTO `t_role_menu` VALUES (21, 3, 118);
INSERT INTO `t_role_menu` VALUES (22, 3, 119);
INSERT INTO `t_role_menu` VALUES (23, 3, 120);
INSERT INTO `t_role_menu` VALUES (24, 3, 121);
INSERT INTO `t_role_menu` VALUES (25, 2, 1010);
INSERT INTO `t_role_menu` VALUES (26, 2, 1022);
INSERT INTO `t_role_menu` VALUES (27, 2, 1023);
INSERT INTO `t_role_menu` VALUES (28, 2, 1026);
INSERT INTO `t_role_menu` VALUES (29, 2, 1027);

-- ----------------------------
-- Table structure for t_site_config
-- ----------------------------
DROP TABLE IF EXISTS `t_site_config`;
CREATE TABLE `t_site_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `tourist_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '游客头像',
  `site_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '网站名称',
  `site_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '网站地址',
  `site_intro` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '网站简介',
  `site_notice` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '网站公告',
  `create_site_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '建站日期',
  `record_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备案号',
  `author_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '作者头像',
  `site_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '网站作者',
  `article_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文章默认封面',
  `about_me` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关于我',
  `github` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'Github',
  `gitee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'Gitee',
  `bilibili` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '哔哩哔哩',
  `qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'QQ',
  `comment_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否评论审核 (0否 1是)',
  `message_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否留言审核 (0否 1是)',
  `email_notice` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否邮箱通知 (0否 1是)',
  `social_list` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '社交列表',
  `login_list` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录方式',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_site_config
-- ----------------------------
INSERT INTO `t_site_config` VALUES (1, '', '', 'shoka-blog', '', '(●ˇ∀ˇ●) 哎嘿~', '这是一条测试公告<br/>可以显示html内容<br/>如:<b>加粗</b>,<span style=\"color: red\">变色</span>,\' +\n      \'或者是<a class=\"underline-a\" href=\"https://bing.com\">超链接</a>', '2023-01-01', '苏ICP备XXXXXXXXXX号', 'http://static.juliy.top/site-imgs/author-avatar.jpg', 'juliy', '', '写点什么...', 'https://github.com/juliy819', 'https://gitee.com/juliy819', 'https://space.bilibili.com/646795371', '799399654', 0, 0, 1, 'qq,github,gitee', 'email', '2023-04-14 14:42:48', '2023-06-23 21:05:52');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '标签名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_talk
-- ----------------------------
DROP TABLE IF EXISTS `t_talk`;
CREATE TABLE `t_talk`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '说说id',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `talk_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '说说内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '说说图片',
  `is_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否置顶 (0否 1是)',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 (1公开  2私密)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `task_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '调用目标',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(1) NOT NULL DEFAULT 3 COMMENT '计划执行错误策略 (1立即执行 2执行一次 3放弃执行)',
  `concurrent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否并发执行 (0否 1是)',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务状态 (0运行 1暂停)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务备注信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_task_log
-- ----------------------------
DROP TABLE IF EXISTS `t_task_log`;
CREATE TABLE `t_task_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `task_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `task_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `invoke_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '调用目标字符串',
  `task_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '日志信息',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '执行状态 (0失败 1正常)',
  `error_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '错误信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '头像',
  `web_site` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '个人网站',
  `intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '个人简介',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '登录地址',
  `login_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '登录方式 (1邮箱 2QQ 3Gitee 4Github)',
  `is_disable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 (0否 1是)',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'juliy', 'admin@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'http://static.juliy.top/site-imgs/author-avatar.jpg', 'www.juliy.top', '没想好写什么', '799399654@qq.com', '10.0.47.254', '内网IP|内网IP', 1, 0, '2023-06-24 20:50:41', '2023-04-07 13:01:48', '2023-06-24 20:50:41');
INSERT INTO `t_user` VALUES (2, '测试账号', 'test@qq.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 'http://static.juliy.top/site-imgs/def-avatar.png', '', '个人简介', 'test@qq.com', '157.0.72.145', '中国|江苏省|南京市|联通', 1, 0, '2023-05-29 12:12:27', '2023-04-07 13:01:26', '2023-05-29 12:12:27');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户id',
  `role_id` int NOT NULL DEFAULT 0 COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1, 1);
INSERT INTO `t_user_role` VALUES (2, 2, 3);

-- ----------------------------
-- Table structure for t_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `t_visit_log`;
CREATE TABLE `t_visit_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `page` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '访问页面',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '访问ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '访问地址',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
