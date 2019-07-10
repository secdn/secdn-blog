/*
 Navicat Premium Data Transfer

 Source Server         : W-ulegal
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : secdn_rapid

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/03/2019 21:28:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_article
-- ----------------------------
DROP TABLE IF EXISTS `biz_article`;
CREATE TABLE `biz_article`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户ID',
  `cover_image` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章封面图片',
  `qrcode_path` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章专属二维码地址',
  `is_markdown` tinyint(1) UNSIGNED NULL DEFAULT 1,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `content_md` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'markdown版的文章内容',
  `top` tinyint(1) NULL DEFAULT 0 COMMENT '是否置顶',
  `type_id` bigint(20) UNSIGNED NOT NULL COMMENT '类型',
  `status` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文章简介，最多200字',
  `keywords` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章关键字，优化搜索',
  `comment` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否开启评论',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `approval` bigint(255) NULL DEFAULT 0 COMMENT '审批人',
  `approval_comment` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批意见',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `subtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30055527 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for biz_type
-- ----------------------------
DROP TABLE IF EXISTS `biz_type`;
CREATE TABLE `biz_type`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章类型名',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型介绍',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `available` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否可用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 287 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('022175ca-059b-404c-8b01-ef80b9174b3b', 'pwy63', '2019-03-25 18:52:36');
INSERT INTO `sys_captcha` VALUES ('086cdee4-ea75-4a82-84fa-2e916dcf8535', '6ff6f', '2019-03-12 13:19:12');
INSERT INTO `sys_captcha` VALUES ('1a30bc3c-3710-4ecb-8afa-8fa77bfe62cb', '6pd3b', '2019-03-21 12:31:04');
INSERT INTO `sys_captcha` VALUES ('205d3b7f-eb13-4fee-8b4e-56ca117b8fcc', 'pemp3', '2019-03-25 14:24:28');
INSERT INTO `sys_captcha` VALUES ('2ae07a5c-6a2a-44c0-8ccc-4eb32ae94dff', 'b8gb6', '2019-03-11 14:48:01');
INSERT INTO `sys_captcha` VALUES ('50ca31d8-af04-451b-8bf0-2f0c0b6be665', '8g2xf', '2019-03-25 14:25:18');
INSERT INTO `sys_captcha` VALUES ('5289c2f6-c805-4ced-81e6-6f7f537ce2e7', '7p7np', '2019-03-21 12:31:45');
INSERT INTO `sys_captcha` VALUES ('530ed98a-c647-44f2-8884-53e11459166f', '5bwpn', '2019-03-25 14:24:50');
INSERT INTO `sys_captcha` VALUES ('5e09d387-fa11-4806-80aa-b66c4b6e9522', 'm8m27', '2019-03-21 12:23:19');
INSERT INTO `sys_captcha` VALUES ('674150be-f584-4ad9-87e7-fb4365a380d0', '75738', '2019-03-26 19:08:05');
INSERT INTO `sys_captcha` VALUES ('71c37e94-37cc-4ca4-8986-124d7e084350', 'efnwb', '2019-03-25 14:22:37');
INSERT INTO `sys_captcha` VALUES ('93e4ddcc-da72-4d3c-8a86-6d0598d0269c', 'f37cc', '2019-03-25 17:37:49');
INSERT INTO `sys_captcha` VALUES ('95c78495-2456-4dbc-84cb-143257b9dd31', 'pwmcg', '2019-03-21 12:23:48');
INSERT INTO `sys_captcha` VALUES ('9609edf0-18e4-4d7c-895e-890fe291cfa9', 'gywn5', '2019-03-25 14:26:43');
INSERT INTO `sys_captcha` VALUES ('b424ef63-0402-4fba-8e92-f9a530b52602', '64ec4', '2019-03-21 12:30:02');
INSERT INTO `sys_captcha` VALUES ('c7f89544-d449-415c-860b-9e904dd345a5', '68ye4', '2019-03-25 18:49:19');
INSERT INTO `sys_captcha` VALUES ('cea20dd8-f0a7-42c7-8273-4c29f964b88e', 'cxn24', '2019-03-21 13:09:51');
INSERT INTO `sys_captcha` VALUES ('e612f22d-e8e9-469e-8317-204ddd7541f4', 'pegn7', '2019-03-21 12:34:52');
INSERT INTO `sys_captcha` VALUES ('ebb7924d-6289-4c6f-81c7-a61f4ff51bf7', 'ny7yc', '2019-03-21 14:09:54');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1110472421042184195 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1110436717729820673, 'admin', '保存角色', 'com.secdn.secdnrapid.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1110436717138423809,\"roleName\":\"admin\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,41,42,44,45,47,48,43,49,50,51,53,-666666],\"createTime\":\"Mar 26, 2019 3:01:58 PM\"}]', 690, '0:0:0:0:0:0:0:1', '2019-03-26 15:01:59');
INSERT INTO `sys_log` VALUES (1110467842581950466, 'admin', '修改角色', 'com.secdn.secdnrapid.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1110436717138423809,\"roleName\":\"admin\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,41,42,44,45,47,48,43,49,50,51,53,-666666]}]', 965, '0:0:0:0:0:0:0:1', '2019-03-26 17:05:40');
INSERT INTO `sys_log` VALUES (1110468041677172737, 'admin', '修改用户', 'com.secdn.secdnrapid.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@secdn.com\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', 99, '0:0:0:0:0:0:0:1', '2019-03-26 17:06:27');
INSERT INTO `sys_log` VALUES (1110472421042184194, 'admin', '修改菜单', 'com.secdn.secdnrapid.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":30,\"parentId\":1,\"name\":\"文件上传\",\"url\":\"oss/oss\",\"perms\":\"sys:oss:all\",\"type\":1,\"icon\":\"oss\",\"orderNum\":6}]', 15, '0:0:0:0:0:0:0:1', '2019-03-26 17:23:51');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (41, 0, '文章管理', NULL, NULL, 0, 'menu', 0);
INSERT INTO `sys_menu` VALUES (42, 41, '文章列表', 'app/apparticle', NULL, 1, 'zhedie', 6);
INSERT INTO `sys_menu` VALUES (43, 41, '栏目管理', 'app/apptype', NULL, 1, 'editor', 6);
INSERT INTO `sys_menu` VALUES (44, 42, '查看', NULL, 'business:BizArticle:list,business:BizArticle:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, 42, '新增', NULL, 'business:BizArticle:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (47, 42, '修改', NULL, 'business:BizArticle:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (48, 42, '删除', NULL, 'business:BizArticle:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (49, 43, '查看', NULL, 'business:BizType:list,business:BizType:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (50, 43, '新增', NULL, 'business:BizType:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (51, 43, '修改', NULL, 'business:BizType:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (53, 43, '删除', NULL, 'business:BizType:delete', 2, NULL, 6);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1110436717138423810 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1110436717138423809, 'admin', '管理员', 1, '2019-03-26 15:01:58');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1110467842154131461 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1110467841944416257, 1110436717138423809, 1);
INSERT INTO `sys_role_menu` VALUES (1110467841969582082, 1110436717138423809, 2);
INSERT INTO `sys_role_menu` VALUES (1110467841986359298, 1110436717138423809, 15);
INSERT INTO `sys_role_menu` VALUES (1110467841998942209, 1110436717138423809, 16);
INSERT INTO `sys_role_menu` VALUES (1110467841998942210, 1110436717138423809, 17);
INSERT INTO `sys_role_menu` VALUES (1110467842007330817, 1110436717138423809, 18);
INSERT INTO `sys_role_menu` VALUES (1110467842015719426, 1110436717138423809, 3);
INSERT INTO `sys_role_menu` VALUES (1110467842015719427, 1110436717138423809, 19);
INSERT INTO `sys_role_menu` VALUES (1110467842015719428, 1110436717138423809, 20);
INSERT INTO `sys_role_menu` VALUES (1110467842024108034, 1110436717138423809, 21);
INSERT INTO `sys_role_menu` VALUES (1110467842024108035, 1110436717138423809, 22);
INSERT INTO `sys_role_menu` VALUES (1110467842024108036, 1110436717138423809, 4);
INSERT INTO `sys_role_menu` VALUES (1110467842032496641, 1110436717138423809, 23);
INSERT INTO `sys_role_menu` VALUES (1110467842032496642, 1110436717138423809, 24);
INSERT INTO `sys_role_menu` VALUES (1110467842032496643, 1110436717138423809, 25);
INSERT INTO `sys_role_menu` VALUES (1110467842049273858, 1110436717138423809, 26);
INSERT INTO `sys_role_menu` VALUES (1110467842061856769, 1110436717138423809, 5);
INSERT INTO `sys_role_menu` VALUES (1110467842070245377, 1110436717138423809, 6);
INSERT INTO `sys_role_menu` VALUES (1110467842070245378, 1110436717138423809, 7);
INSERT INTO `sys_role_menu` VALUES (1110467842070245379, 1110436717138423809, 8);
INSERT INTO `sys_role_menu` VALUES (1110467842070245380, 1110436717138423809, 9);
INSERT INTO `sys_role_menu` VALUES (1110467842070245381, 1110436717138423809, 10);
INSERT INTO `sys_role_menu` VALUES (1110467842078633986, 1110436717138423809, 11);
INSERT INTO `sys_role_menu` VALUES (1110467842078633987, 1110436717138423809, 12);
INSERT INTO `sys_role_menu` VALUES (1110467842087022593, 1110436717138423809, 13);
INSERT INTO `sys_role_menu` VALUES (1110467842087022594, 1110436717138423809, 14);
INSERT INTO `sys_role_menu` VALUES (1110467842087022595, 1110436717138423809, 27);
INSERT INTO `sys_role_menu` VALUES (1110467842095411202, 1110436717138423809, 29);
INSERT INTO `sys_role_menu` VALUES (1110467842095411203, 1110436717138423809, 30);
INSERT INTO `sys_role_menu` VALUES (1110467842103799810, 1110436717138423809, 41);
INSERT INTO `sys_role_menu` VALUES (1110467842103799811, 1110436717138423809, 42);
INSERT INTO `sys_role_menu` VALUES (1110467842124771330, 1110436717138423809, 44);
INSERT INTO `sys_role_menu` VALUES (1110467842124771331, 1110436717138423809, 45);
INSERT INTO `sys_role_menu` VALUES (1110467842133159937, 1110436717138423809, 47);
INSERT INTO `sys_role_menu` VALUES (1110467842133159938, 1110436717138423809, 48);
INSERT INTO `sys_role_menu` VALUES (1110467842133159939, 1110436717138423809, 43);
INSERT INTO `sys_role_menu` VALUES (1110467842145742849, 1110436717138423809, 49);
INSERT INTO `sys_role_menu` VALUES (1110467842145742850, 1110436717138423809, 50);
INSERT INTO `sys_role_menu` VALUES (1110467842154131458, 1110436717138423809, 51);
INSERT INTO `sys_role_menu` VALUES (1110467842154131459, 1110436717138423809, 53);
INSERT INTO `sys_role_menu` VALUES (1110467842154131460, 1110436717138423809, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@secdn.com', '13612345678', 1, 1, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, '338101a26f443f17de11a25618b82a9b', '2019-03-27 07:04:17', '2019-03-26 19:04:17');


SET FOREIGN_KEY_CHECKS = 1;
