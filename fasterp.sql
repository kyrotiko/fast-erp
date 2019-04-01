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

 Date: 01/04/2019 08:29:15
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
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NULL DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'MENU或者FUNCTION',
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, NULL, 'MENU', '管理员管理', NULL, NULL, '管理员管理', '2019-03-26 09:44:49', '2019-03-26 09:44:59', 0);
INSERT INTO `permission` VALUES (2, 1, 'MENU', '用户管理', '/static/modules/user/user.html', NULL, '用户管理', '2019-03-26 09:44:51', '2019-03-26 09:45:00', 0);
INSERT INTO `permission` VALUES (3, 1, 'MENU', '角色管理', '/static/modules/user/role.html', NULL, '角色管理', '2019-03-26 09:44:52', '2019-03-26 09:45:02', 0);
INSERT INTO `permission` VALUES (4, 1, 'MENU', '权限管理', '/static/modules/user/rule.html', NULL, '权限管理', '2019-03-26 09:44:53', '2019-03-30 17:11:33', 0);
INSERT INTO `permission` VALUES (5, 2, 'FUNCTION', 'user:list', NULL, NULL, '用户查询功能', '2019-03-26 09:50:30', '2019-03-26 09:50:33', 0);
INSERT INTO `permission` VALUES (6, 2, 'FUNCTION', 'user:del', NULL, NULL, '删除用户', '2019-03-26 10:57:34', '2019-03-26 10:57:36', 0);
INSERT INTO `permission` VALUES (7, 2, 'FUNCTION', 'user:add', NULL, NULL, '新增用户', '2019-03-26 10:58:04', '2019-03-26 10:58:06', 0);
INSERT INTO `permission` VALUES (8, 2, 'FUNCTION', 'user:update', NULL, NULL, '更新用户', '2019-03-26 10:58:28', '2019-03-26 10:58:30', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (5, 2, 1);
INSERT INTO `role_permission` VALUES (6, 2, 4);
INSERT INTO `role_permission` VALUES (7, 7, 1);
INSERT INTO `role_permission` VALUES (8, 7, 2);
INSERT INTO `role_permission` VALUES (14, 1, 1);
INSERT INTO `role_permission` VALUES (15, 1, 2);
INSERT INTO `role_permission` VALUES (16, 1, 3);
INSERT INTO `role_permission` VALUES (17, 1, 4);
INSERT INTO `role_permission` VALUES (18, 8, 1);
INSERT INTO `role_permission` VALUES (19, 8, 3);
INSERT INTO `role_permission` VALUES (20, 1, 5);
INSERT INTO `role_permission` VALUES (21, 1, 6);
INSERT INTO `role_permission` VALUES (22, 1, 7);
INSERT INTO `role_permission` VALUES (23, 1, 8);

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 'b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:02:36', '2019-03-25 09:02:51', 0);
INSERT INTO `user` VALUES (5, '婷宝宝', 'hsdfun', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:02:40', '2019-03-25 09:02:53', 0);
INSERT INTO `user` VALUES (6, 'admiefen', 'huen', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:02:43', '2019-03-25 09:02:56', 0);
INSERT INTO `user` VALUES (7, 'admifefn', 'hjjufen', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:02:45', '2019-03-25 09:02:59', 0);
INSERT INTO `user` VALUES (9, 'as', 'hun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:01', '2019-03-25 09:03:21', 0);
INSERT INTO `user` VALUES (11, 'adfefmin', 'huwdn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:04', '2019-03-25 09:03:23', 0);
INSERT INTO `user` VALUES (12, 'adfefmin', 'hsdun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:06', '2019-03-25 09:03:26', 0);
INSERT INTO `user` VALUES (14, 'adfefmin', 'huawsddsn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:09', '2019-03-25 09:03:28', 0);
INSERT INTO `user` VALUES (15, 'adfefmin', 'husdn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:11', '2019-03-25 09:03:31', 0);
INSERT INTO `user` VALUES (16, 'adfefmin', 'hasddun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:14', '2019-03-25 09:03:33', 0);
INSERT INTO `user` VALUES (41, 'yuanyang', 'yuanyang', '7cf1f620fb55653545595b4768e03810', 'OectJr9cHyZJCGnL', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:16', '2019-03-26 09:39:36', 0);
INSERT INTO `user` VALUES (42, 'hhh', 'yuan', 'd35f19eb1b13e2a4de2a55762ae289cf', 'PR96qAN73h2YrmO3', '18860902920', '417168602@qq.com', 1, '2019-03-25 09:03:18', '2019-03-25 09:03:37', 0);
INSERT INTO `user` VALUES (43, 'yyuuu', 'yyyyyy', '19be05f1a7c12aba47f82d3280c9f003', 'g4rD8zWiweJhNEP7', '13548884955', '444@ss.com', 1, '2019-03-25 09:58:40', '2019-03-25 10:19:01', 1);
INSERT INTO `user` VALUES (44, 'tttt', 'rr', 'f9378e6fe1f94b817022a67703b336f2', 'Pr6VbYHAUbVe0WjF', '13548958888', 'eee@448.com', 1, '2019-03-26 09:37:29', '2019-03-26 09:37:29', 0);
INSERT INTO `user` VALUES (45, 'dwdw', 's8w8w5s', 'd6950321d27f14da0e44564ce5fe9917', '4CqunKrTo1QzFL09', '13548449966', 'dwwdwd@qq.com', 1, '2019-03-26 10:59:56', '2019-03-26 11:00:19', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `user_role` VALUES (66, 5, 1);
INSERT INTO `user_role` VALUES (67, 5, 2);
INSERT INTO `user_role` VALUES (68, 5, 7);
INSERT INTO `user_role` VALUES (69, 43, 1);
INSERT INTO `user_role` VALUES (70, 44, 1);
INSERT INTO `user_role` VALUES (71, 44, 2);
INSERT INTO `user_role` VALUES (72, 41, 8);
INSERT INTO `user_role` VALUES (74, 45, 8);

SET FOREIGN_KEY_CHECKS = 1;
