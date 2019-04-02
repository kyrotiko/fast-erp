/*
 Navicat Premium Data Transfer

 Source Server         : localhost5.7
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3307
 Source Schema         : fasterp

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 02/04/2019 15:23:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login_time` datetime(0) NULL DEFAULT NULL,
  `platform` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (1, 1, '2019-02-12 15:15:59', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (2, 1, '2019-02-23 00:33:45', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (3, 1, '2019-02-23 17:17:07', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (4, 1, '2019-02-23 17:19:34', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (5, 1, '2019-02-23 17:21:42', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (6, 1, '2019-02-23 17:23:55', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (7, 1, '2019-02-23 17:32:41', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (8, 1, '2019-02-23 17:34:26', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (9, 1, '2019-02-23 17:40:43', NULL, NULL, NULL, NULL, 0);
INSERT INTO `login_log` VALUES (10, 1, '2019-03-23 01:48:10', 'PC', '0:0:0:0:0:0:0:1', '2019-03-23 01:48:10', '2019-03-23 01:48:10', 0);
INSERT INTO `login_log` VALUES (11, 1, '2019-03-23 01:53:51', 'PC', '0:0:0:0:0:0:0:1', '2019-03-23 01:53:51', '2019-03-23 01:53:51', 0);
INSERT INTO `login_log` VALUES (12, 1, '2019-03-23 08:19:55', 'PC', '0:0:0:0:0:0:0:1', '2019-03-23 08:19:55', '2019-03-23 08:19:55', 0);
INSERT INTO `login_log` VALUES (13, 1, '2019-03-25 01:57:47', 'PC', '0:0:0:0:0:0:0:1', '2019-03-25 01:57:47', '2019-03-25 01:57:47', 0);
INSERT INTO `login_log` VALUES (14, 1, '2019-03-25 02:15:11', 'PC', '0:0:0:0:0:0:0:1', '2019-03-25 02:15:11', '2019-03-25 02:15:11', 0);
INSERT INTO `login_log` VALUES (15, 1, '2019-03-25 03:10:38', 'PC', '0:0:0:0:0:0:0:1', '2019-03-25 03:10:38', '2019-03-25 03:10:38', 0);
INSERT INTO `login_log` VALUES (16, 1, '2019-03-25 06:46:25', 'PC', '0:0:0:0:0:0:0:1', '2019-03-25 06:46:25', '2019-03-25 06:46:25', 0);
INSERT INTO `login_log` VALUES (17, 1, '2019-03-26 00:23:01', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 00:23:01', '2019-03-26 00:23:01', 0);
INSERT INTO `login_log` VALUES (18, 1, '2019-03-26 00:39:36', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 00:39:36', '2019-03-26 00:39:36', 0);
INSERT INTO `login_log` VALUES (19, 1, '2019-03-26 01:02:40', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 01:02:40', '2019-03-26 01:02:40', 0);
INSERT INTO `login_log` VALUES (20, 1, '2019-03-26 01:20:43', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 01:20:43', '2019-03-26 01:20:43', 0);
INSERT INTO `login_log` VALUES (21, 41, '2019-03-26 01:39:49', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 01:39:49', '2019-03-26 01:39:49', 0);
INSERT INTO `login_log` VALUES (22, 1, '2019-03-26 02:16:41', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 02:16:41', '2019-03-26 02:16:41', 0);
INSERT INTO `login_log` VALUES (23, 1, '2019-03-26 02:43:37', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 02:43:37', '2019-03-26 02:43:37', 0);
INSERT INTO `login_log` VALUES (24, 1, '2019-03-26 02:45:48', 'PC', '0:0:0:0:0:0:0:1', '2019-03-26 02:45:48', '2019-03-26 02:45:48', 0);
INSERT INTO `login_log` VALUES (25, 1, '2019-04-01 09:18:21', 'PC', '0:0:0:0:0:0:0:1', '2019-04-01 09:18:21', '2019-04-01 09:18:21', 0);
INSERT INTO `login_log` VALUES (26, 1, '2019-04-02 01:01:08', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 01:01:08', '2019-04-02 01:01:08', 0);
INSERT INTO `login_log` VALUES (27, 1, '2019-04-02 01:38:18', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 01:38:18', '2019-04-02 01:38:18', 0);
INSERT INTO `login_log` VALUES (28, 1, '2019-04-02 01:38:33', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 01:38:33', '2019-04-02 01:38:33', 0);
INSERT INTO `login_log` VALUES (29, 1, '2019-04-02 01:56:19', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 01:56:19', '2019-04-02 01:56:19', 0);
INSERT INTO `login_log` VALUES (30, 1, '2019-04-02 02:00:59', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 02:00:59', '2019-04-02 02:00:59', 0);
INSERT INTO `login_log` VALUES (31, 1, '2019-04-02 02:08:21', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 02:08:21', '2019-04-02 02:08:21', 0);
INSERT INTO `login_log` VALUES (32, 1, '2019-04-02 02:10:53', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 02:10:53', '2019-04-02 02:10:53', 0);
INSERT INTO `login_log` VALUES (33, 1, '2019-04-02 05:11:06', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 05:11:06', '2019-04-02 05:11:06', 0);
INSERT INTO `login_log` VALUES (34, 1, '2019-04-02 05:11:14', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 05:11:14', '2019-04-02 05:11:14', 0);
INSERT INTO `login_log` VALUES (35, 1, '2019-04-02 07:08:32', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 07:08:32', '2019-04-02 07:08:32', 0);
INSERT INTO `login_log` VALUES (36, 1, '2019-04-02 07:09:10', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 07:09:10', '2019-04-02 07:09:10', 0);
INSERT INTO `login_log` VALUES (37, 1, '2019-04-02 07:15:48', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 07:15:48', '2019-04-02 07:15:48', 0);
INSERT INTO `login_log` VALUES (38, 1, '2019-04-02 07:19:17', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 07:19:17', '2019-04-02 07:19:17', 0);
INSERT INTO `login_log` VALUES (39, 1, '2019-04-02 07:20:11', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 07:20:11', '2019-04-02 07:20:11', 0);
INSERT INTO `login_log` VALUES (40, 1, '2019-04-02 07:21:25', 'PC', '0:0:0:0:0:0:0:1', '2019-04-02 07:21:25', '2019-04-02 07:21:25', 0);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NULL DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'MENU或者FUNCTION',
  `order` int(5) NOT NULL DEFAULT 0 COMMENT '排序字段',
  `content` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限字符串或者菜单名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ico` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限注释',
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `content_UNIQUE`(`content`) USING BTREE,
  INDEX `fk_parent_idx`(`parentid`) USING BTREE,
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, NULL, 'MENU', 999, '管理员管理', NULL, NULL, '管理员管理', '2019-03-26 09:44:49', '2019-04-02 13:32:48', 0);
INSERT INTO `permission` VALUES (2, 1, 'MENU', 0, '用户管理', '/static/modules/user/user.html', NULL, '用户管理', '2019-03-26 09:44:51', '2019-03-26 09:45:00', 0);
INSERT INTO `permission` VALUES (3, 1, 'MENU', 1, '角色管理', '/static/modules/user/role.html', NULL, '角色管理', '2019-03-26 09:44:52', '2019-04-02 15:14:29', 0);
INSERT INTO `permission` VALUES (4, 1, 'MENU', 2, '权限管理', '/static/modules/user/rule.html', NULL, '权限管理', '2019-03-26 09:44:53', '2019-04-02 15:14:34', 0);
INSERT INTO `permission` VALUES (5, 2, 'FUNCTION', 0, 'user:list', NULL, NULL, '用户查询功能', '2019-03-26 09:50:30', '2019-03-26 09:50:33', 0);
INSERT INTO `permission` VALUES (6, 2, 'FUNCTION', 0, 'user:del', NULL, NULL, '删除用户', '2019-03-26 10:57:34', '2019-04-01 17:34:03', 0);
INSERT INTO `permission` VALUES (7, 2, 'FUNCTION', 0, 'user:add', NULL, NULL, '新增用户', '2019-03-26 10:58:04', '2019-03-26 10:58:06', 0);
INSERT INTO `permission` VALUES (8, 2, 'FUNCTION', 0, 'user:update', NULL, NULL, '更新用户', '2019-03-26 10:58:28', '2019-03-26 10:58:30', 0);
INSERT INTO `permission` VALUES (9, NULL, 'MENU', 99999, '系统设置', NULL, NULL, '系统设置', '2019-04-02 13:15:29', '2019-04-02 15:14:14', 0);
INSERT INTO `permission` VALUES (12, 9, 'MENU', 9, '修改密码', '/static/modules/setting/pwd.html', NULL, '修改密码', '2019-04-02 13:33:52', '2019-04-02 13:35:06', 0);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_UNIQUE`(`role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员权限', 0);
INSERT INTO `role` VALUES (2, '管理员', '管理员', 0);
INSERT INTO `role` VALUES (7, '用户管理', '只能管理用户', 0);
INSERT INTO `role` VALUES (8, '测试', '不知道', 0);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `permissionid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role_idx`(`roleid`) USING BTREE,
  INDEX `fk_premission_idx`(`permissionid`) USING BTREE,
  CONSTRAINT `fk_premission` FOREIGN KEY (`permissionid`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (5, 2, 1);
INSERT INTO `role_permission` VALUES (6, 2, 4);
INSERT INTO `role_permission` VALUES (7, 7, 1);
INSERT INTO `role_permission` VALUES (8, 7, 2);
INSERT INTO `role_permission` VALUES (18, 8, 1);
INSERT INTO `role_permission` VALUES (19, 8, 3);
INSERT INTO `role_permission` VALUES (50, 1, 1);
INSERT INTO `role_permission` VALUES (51, 1, 2);
INSERT INTO `role_permission` VALUES (52, 1, 5);
INSERT INTO `role_permission` VALUES (53, 1, 6);
INSERT INTO `role_permission` VALUES (54, 1, 7);
INSERT INTO `role_permission` VALUES (55, 1, 8);
INSERT INTO `role_permission` VALUES (56, 1, 3);
INSERT INTO `role_permission` VALUES (57, 1, 4);
INSERT INTO `role_permission` VALUES (58, 1, 9);
INSERT INTO `role_permission` VALUES (59, 1, 12);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_time` datetime(0) NULL DEFAULT NULL,
  `updated_time` datetime(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', '21c55d0edc3f8d4af4008eb0ed71240b', 'o9FjZj52AE2y8jD6', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:02:36', '2019-04-02 15:08:59', 0);
INSERT INTO `user` VALUES (5, '婷宝宝', 'tingbaobao', '905cdab26c399ed2cddbecf7a3169592', 'cqkGJ8SvVIeFWUav', '18860902920', '417168601@qq.com', 1, '2019-03-25 09:02:40', '2019-04-02 11:26:42', 0);
INSERT INTO `user` VALUES (6, 'admiefen', 'huen', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:02:43', '2019-04-02 11:26:42', 0);
INSERT INTO `user` VALUES (7, 'admifefn', 'hjjufen', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:02:45', '2019-03-25 09:02:59', 0);
INSERT INTO `user` VALUES (9, 'as', 'hun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:01', '2019-03-25 09:03:21', 0);
INSERT INTO `user` VALUES (11, 'adfefmin', 'huwdn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:04', '2019-04-02 11:27:40', 0);
INSERT INTO `user` VALUES (12, 'adfefmin', 'hsdun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:06', '2019-03-25 09:03:26', 0);
INSERT INTO `user` VALUES (14, 'adfefmin', 'huawsddsn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:09', '2019-03-25 09:03:28', 0);
INSERT INTO `user` VALUES (15, 'adfefmin', 'husdn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:11', '2019-03-25 09:03:31', 0);
INSERT INTO `user` VALUES (16, 'adfefmin', 'hasddun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:14', '2019-03-25 09:03:33', 0);
INSERT INTO `user` VALUES (41, 'yuanyang', 'yuanyang', '7cf1f620fb55653545595b4768e03810', 'OectJr9cHyZJCGnL', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:16', '2019-04-02 09:16:29', 0);
INSERT INTO `user` VALUES (42, 'hhh', 'yuan', 'd35f19eb1b13e2a4de2a55762ae289cf', 'PR96qAN73h2YrmO3', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:18', '2019-04-02 13:04:29', 0);
INSERT INTO `user` VALUES (43, 'yyuuu', 'yyyyyy', '19be05f1a7c12aba47f82d3280c9f003', 'g4rD8zWiweJhNEP7', '13548884955', '444@ss.com', 1, '2019-03-25 09:58:40', '2019-03-25 10:19:01', 1);
INSERT INTO `user` VALUES (44, 'tttt', 'rr', 'f9378e6fe1f94b817022a67703b336f2', 'Pr6VbYHAUbVe0WjF', '13548958888', 'eee@448.com', 1, '2019-03-26 09:37:29', '2019-04-02 10:28:15', 1);
INSERT INTO `user` VALUES (45, 'dwdw', 's8w8w5s', 'd6950321d27f14da0e44564ce5fe9917', '4CqunKrTo1QzFL09', '13548449966', 'dwwdwd@qq.com', 1, '2019-03-26 10:59:56', '2019-03-26 11:00:19', 1);
INSERT INTO `user` VALUES (47, 'ssss', 'dwdw', '91e393dbd87ca5c610470249eb31e68e', '3WGZaVBtFYnIx9XE', '13548888888', '4448@qq.com', 1, '2019-04-02 10:24:07', '2019-04-02 10:26:04', 1);
INSERT INTO `user` VALUES (48, 'ssss', 'dwdwww', '4e7a657af6d17d755f36e5a07a6b1141', 'EIBjoMDtwMQDbLvM', '13548888888', '4448@qq.com', 1, '2019-04-02 10:24:36', '2019-04-02 10:26:01', 1);
INSERT INTO `user` VALUES (50, '123456', 'huanghu', '6d5ff26a1fc46d21d051fe7d6d940404', 'v20OkfE7C9mplLv3', '13015144488', '448s@qq.com', 1, '2019-04-02 10:28:39', '2019-04-02 13:03:12', 1);
INSERT INTO `user` VALUES (51, 'sdwdwd', 'ting', 'acec1d1858d36618187749f0e933767a', 'epVpobhtmwq03ZhO', '13548956625', 'wdwd@qq.com', 1, '2019-04-02 10:33:37', '2019-04-02 13:03:12', 1);
INSERT INTO `user` VALUES (52, 'sdwdwd', 'tings', '19a21f7016f611ab9e07e88ac9e96843', 'u3MGZIaXZ5f9Ucez', '13548956625', 'wdwd@qq.com', 1, '2019-04-02 10:35:01', '2019-04-02 11:10:15', 1);
INSERT INTO `user` VALUES (53, 'sdwdwd', 'tingss', '2a6af74d10c8ea7c973ca522bd9fcaf4', 'gqojaU0BHLB1Cqfr', '13548956625', 'wdwd@qq.com', 1, '2019-04-02 10:35:10', '2019-04-02 11:10:09', 1);
INSERT INTO `user` VALUES (54, '1dw4d', 'tingbass', 'c9afe42f818bbf227213afc939a7d9ff', 'bkmSt6Ov2SZgvBl5', '13548444444', '4as4d8w@qq.com', 1, '2019-04-02 10:41:36', '2019-04-02 11:05:38', 1);
INSERT INTO `user` VALUES (55, '1dw4d', 'tingbass2', '602177ba7dd25c057eb3f2843ab2d462', '6gzlZwazjGyjjvLJ', '13548444444', '4as4d8w@qq.com', 1, '2019-04-02 10:43:21', '2019-04-02 11:04:04', 1);
INSERT INTO `user` VALUES (56, '1dw4d', 'tingbass22', '5e95ed2d5a702826ed6f8fffd9fa7c84', 'G9Jc10S8d9F1G9xE', '13548444444', '4as4d8w@qq.com', 1, '2019-04-02 10:43:37', '2019-04-02 11:03:56', 1);
INSERT INTO `user` VALUES (57, 'dwdwd', 'dwdwdad2e2', 'e1e895859bbb4a4a44adb3bc7ebff88f', 'bZWFKRBI5SUHbMKe', '13548484444', 'adwdw@qq.com', 1, '2019-04-02 10:44:57', '2019-04-02 10:59:56', 1);
INSERT INTO `user` VALUES (58, 'uahd', 'ahshdu', 'cbef7eaad71486146eb7498c13efc605', '2NNSumPcwdwJ3nb6', '13548995556', 'asd488w@qq.com', 1, '2019-04-02 10:45:51', '2019-04-02 10:59:51', 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_idx`(`userid`) USING BTREE,
  INDEX `fl_role`(`roleid`) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fl_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (17, 15, 1);
INSERT INTO `user_role` VALUES (18, 15, 2);
INSERT INTO `user_role` VALUES (33, 9, 1);
INSERT INTO `user_role` VALUES (34, 9, 2);
INSERT INTO `user_role` VALUES (37, 12, 1);
INSERT INTO `user_role` VALUES (38, 12, 2);
INSERT INTO `user_role` VALUES (40, 14, 2);
INSERT INTO `user_role` VALUES (41, 16, 2);
INSERT INTO `user_role` VALUES (43, 6, 1);
INSERT INTO `user_role` VALUES (45, 7, 1);
INSERT INTO `user_role` VALUES (61, 11, 1);
INSERT INTO `user_role` VALUES (62, 11, 2);
INSERT INTO `user_role` VALUES (65, 42, 7);
INSERT INTO `user_role` VALUES (69, 43, 1);
INSERT INTO `user_role` VALUES (70, 44, 1);
INSERT INTO `user_role` VALUES (71, 44, 2);
INSERT INTO `user_role` VALUES (72, 41, 8);
INSERT INTO `user_role` VALUES (74, 45, 8);
INSERT INTO `user_role` VALUES (89, 47, 8);
INSERT INTO `user_role` VALUES (90, 48, 8);
INSERT INTO `user_role` VALUES (91, 50, 8);
INSERT INTO `user_role` VALUES (92, 51, 8);
INSERT INTO `user_role` VALUES (93, 52, 8);
INSERT INTO `user_role` VALUES (94, 53, 8);
INSERT INTO `user_role` VALUES (95, 54, 8);
INSERT INTO `user_role` VALUES (96, 55, 8);
INSERT INTO `user_role` VALUES (97, 56, 8);
INSERT INTO `user_role` VALUES (98, 57, 8);
INSERT INTO `user_role` VALUES (99, 58, 8);
INSERT INTO `user_role` VALUES (108, 5, 1);
INSERT INTO `user_role` VALUES (109, 5, 2);

SET FOREIGN_KEY_CHECKS = 1;
