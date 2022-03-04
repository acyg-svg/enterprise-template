/*
 Navicat Premium Data Transfer

 Source Server         : 123
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : enterprise_template

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 05/03/2022 00:10:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about`  (
  `about_id` int(11) NOT NULL AUTO_INCREMENT,
  `about_rank` int(11) NOT NULL,
  `sub_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `about_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `about_title` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`about_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES (25, 900, '2021-12-07 11:19:39', '<p><b>&nbsp; &nbsp; &nbsp; &nbsp; 作为强生旗下的消费品子公司，强生消费品致力于提供源于科学并受专业人士推荐的产品，旗下拥有众多家喻户晓的品牌，在全球助力超过12亿人拥有更健康的生活。</b></p><p><b>&nbsp; &nbsp; &nbsp; &nbsp; 强生消费品业务——强生（中国）有限公司于1992年正式进入中国，在上海闵行经济技术开发区注册成立，业务包括基础护理和个人护理、健康护肤、专业养肤等领域。为满足消费者日益变化的需求，公司不断引入包括艾惟诺和城野医生在内的海外知名品牌。同时，包括强生婴儿、露得清、李施德林、大宝等驰名品牌也持续保持创新进步。此外，公司致力于在全球范围内对个人护理产品不断科研探索，同时基于对中国消费者洞察做出本土研发努力，打造更加适合中国老百姓的创新产品。</b><br/></p>', '强生');
INSERT INTO `about` VALUES (26, 600, '2021-12-08 23:33:06', '<p><b><i>在辉瑞，我们致力于运用科学以及我们的全球资源来改善每个生命阶段的健康状况。在药品的探索、开发和生产过程中，我们多样化的全球保健产品包括生物药品、小分子药品和疫苗。</i></b></p><p><b><i>每天，世界各地的辉瑞员工致力于推进健康，以及能够应对我们这个时代最为棘手的疾病的预防和治疗方案。</i></b></p><p><b><i>辉瑞还与世界各地的医疗卫生专业人士、政府和社区合作，支持世界各地的人们能够获得更为可靠和可承付的医疗卫生服务。这与辉瑞作为一家生物制药公司的责任是一致的。160多年来，辉瑞一直努力为人们提供更好、更优质的服务。</i></b></p>', '辉瑞');

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `locked` tinyint(4) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'eagle30', 0);
INSERT INTO `admin_user` VALUES (2, 'cyg', '25f9e794323b453885f5181f1b624d0b', 'cyg', 0);

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `uptime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (26, '临近双十二，本公司产品限时打8折', '2021-12-02 15:33:46');
INSERT INTO `announcement` VALUES (28, '响应国家号召，所有在本司购买了商品的用户都会收到本司赠送的一袋十个的口罩。', '2021-12-07 11:25:03');
INSERT INTO `announcement` VALUES (29, '已纳入国家医保的药物一律打7折。', '2021-12-08 23:35:05');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `carousel_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'##\'',
  `carousel_rank` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(11) NOT NULL DEFAULT 0,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (8, 'http://localhost:8081/upload/20211023_1652343.jpg', '##', 10, 1, '2021-10-23 16:52:39', 0, '2021-11-10 11:34:29', 0);
INSERT INTO `carousel` VALUES (9, 'http://localhost:8081/upload/20211110_10411884.jpg', '##', 0, 1, '2021-11-10 10:41:22', 0, '2021-11-10 10:57:01', 0);
INSERT INTO `carousel` VALUES (10, 'http://localhost:8081/upload/20211110_11341964.jpg', '##', 51, 1, '2021-11-10 11:34:23', 0, '2021-12-01 15:07:48', 0);
INSERT INTO `carousel` VALUES (11, 'http://localhost:8081/upload/20211110_11361717.jpg', '##', 20, 1, '2021-11-10 11:36:25', 0, '2021-12-01 15:07:33', 0);
INSERT INTO `carousel` VALUES (12, 'http://localhost:8081/upload/20211110_11363195.jpg', '##', 100, 1, '2021-11-10 11:36:35', 0, '2021-11-11 20:00:28', 0);
INSERT INTO `carousel` VALUES (13, 'http://localhost:8081/upload/20211110_15274837.jpg', '##', 50, 1, '2021-11-10 15:27:54', 0, '2021-12-01 15:07:48', 0);
INSERT INTO `carousel` VALUES (14, 'http://localhost:8081/upload/20211110_17005534.jpg', '##', 55, 1, '2021-11-10 17:01:00', 0, '2021-11-11 20:01:09', 0);
INSERT INTO `carousel` VALUES (15, 'http://localhost:8081/upload/20211110_17121888.jpg', '##', 999, 1, '2021-11-10 17:12:22', 0, '2021-11-11 10:24:46', 0);
INSERT INTO `carousel` VALUES (16, 'http://localhost:8081/upload/20211111_10250998.jpg', '##', 120, 1, '2021-11-11 10:25:13', 0, '2021-11-11 20:00:22', 0);
INSERT INTO `carousel` VALUES (17, 'http://localhost:8081/upload/20211111_20260551.jpg', '##', 0, 1, '2021-11-11 20:26:09', 0, '2021-12-01 15:07:33', 0);
INSERT INTO `carousel` VALUES (18, 'http://localhost:8081/upload/20211113_21302538.jpg', '##', 444, 1, '2021-11-13 20:44:05', 0, '2021-12-01 15:07:48', 0);
INSERT INTO `carousel` VALUES (19, 'http://localhost:8081/upload/20211119_10080148.PNG', '##', 1000, 1, '2021-11-19 10:08:09', 0, '2021-12-01 15:07:48', 0);
INSERT INTO `carousel` VALUES (20, 'http://localhost:8081/upload/20211125_1158059.PNG', '##', 200, 1, '2021-11-25 11:58:10', 0, '2021-12-01 15:07:48', 0);
INSERT INTO `carousel` VALUES (21, 'http://localhost:8081/upload/20211201_15063572.jpg', '##', 50, 0, '2021-12-01 15:06:44', 0, '2021-12-02 15:33:22', 0);
INSERT INTO `carousel` VALUES (22, 'http://localhost:8081/upload/20211201_15064980.jpg', '##', 100, 0, '2021-12-01 15:06:52', 0, '2021-12-05 13:47:23', 0);
INSERT INTO `carousel` VALUES (23, 'http://localhost:8081/upload/20211201_15065869.jpg', '##', 98, 0, '2021-12-01 15:07:02', 0, '2021-12-01 15:07:02', 0);
INSERT INTO `carousel` VALUES (24, 'http://localhost:8081/upload/20211201_1507090.jpg', '##', 97, 0, '2021-12-01 15:07:13', 0, '2021-12-01 15:07:13', 0);
INSERT INTO `carousel` VALUES (25, 'http://localhost:8081/upload/20211201_15071955.jpg', '##', 95, 0, '2021-12-01 15:07:22', 0, '2021-12-01 15:07:22', 0);
INSERT INTO `carousel` VALUES (26, 'http://localhost:8081/upload/20211205_13480963.jpg', '##', 2000, 0, '2021-12-05 13:48:14', 0, '2021-12-09 12:06:17', 0);
INSERT INTO `carousel` VALUES (27, 'http://localhost:8081/upload/20211206_11543617.jpg', '##', 100, 1, '2021-12-06 11:54:41', 0, '2021-12-06 11:55:08', 0);
INSERT INTO `carousel` VALUES (28, 'http://localhost:8081/upload/20211207_11205183.jpg', '##', 50, 1, '2021-12-07 11:20:56', 0, '2021-12-07 11:21:37', 0);
INSERT INTO `carousel` VALUES (29, 'http://localhost:8081/upload/20211208_1450244.jpg', '##', 22, 1, '2021-12-08 14:50:31', 0, '2021-12-08 14:50:35', 0);
INSERT INTO `carousel` VALUES (30, 'http://localhost:8081/upload/20211208_23342074.jpg', '##', 900, 0, '2021-12-08 23:34:27', 0, '2021-12-08 23:34:27', 0);

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item`  (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_count` int(11) NOT NULL DEFAULT 1,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 266 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_item
-- ----------------------------
INSERT INTO `cart_item` VALUES (69, 1, 10180, 1, 1, '2021-10-23 16:14:29', '2021-10-23 16:14:29');
INSERT INTO `cart_item` VALUES (70, 1, 10690, 1, 1, '2021-10-23 16:14:40', '2021-10-23 16:14:40');
INSERT INTO `cart_item` VALUES (71, 1, 10689, 1, 1, '2021-10-23 16:14:51', '2021-10-23 16:14:51');
INSERT INTO `cart_item` VALUES (72, 1, 10160, 1, 1, '2021-10-23 16:22:37', '2021-10-23 16:22:37');
INSERT INTO `cart_item` VALUES (73, 1, 10691, 1, 1, '2021-10-23 16:34:57', '2021-10-23 16:34:57');
INSERT INTO `cart_item` VALUES (74, 1, 10700, 1, 1, '2021-11-10 21:12:57', '2021-11-10 21:12:57');
INSERT INTO `cart_item` VALUES (75, 1, 10283, 1, 1, '2021-11-11 11:27:08', '2021-11-11 11:27:08');
INSERT INTO `cart_item` VALUES (76, 1, 10320, 1, 1, '2021-11-11 11:28:58', '2021-11-11 11:28:58');
INSERT INTO `cart_item` VALUES (77, 1, 10912, 1, 1, '2021-11-11 11:37:33', '2021-11-11 11:37:33');
INSERT INTO `cart_item` VALUES (78, 1, 10283, 1, 1, '2021-11-11 11:42:38', '2021-11-11 11:42:38');
INSERT INTO `cart_item` VALUES (79, 1, 10913, 1, 1, '2021-11-11 14:59:11', '2021-11-11 14:59:34');
INSERT INTO `cart_item` VALUES (80, 1, 10195, 2, 1, '2021-11-11 15:02:11', '2021-11-11 15:04:55');
INSERT INTO `cart_item` VALUES (81, 1, 10283, 1, 1, '2021-11-11 15:05:35', '2021-11-11 15:06:12');
INSERT INTO `cart_item` VALUES (82, 1, 10283, 1, 1, '2021-11-11 15:06:22', '2021-11-11 15:06:22');
INSERT INTO `cart_item` VALUES (83, 1, 10912, 1, 1, '2021-11-11 15:06:30', '2021-11-11 15:06:30');
INSERT INTO `cart_item` VALUES (84, 1, 10180, 2, 1, '2021-11-11 15:06:47', '2021-11-11 15:08:20');
INSERT INTO `cart_item` VALUES (85, 1, 10195, 1, 1, '2021-11-11 15:09:58', '2021-11-11 15:09:58');
INSERT INTO `cart_item` VALUES (86, 1, 10180, 1, 1, '2021-11-11 15:10:07', '2021-11-11 15:10:07');
INSERT INTO `cart_item` VALUES (87, 1, 10283, 2, 1, '2021-11-11 15:17:13', '2021-11-11 15:17:16');
INSERT INTO `cart_item` VALUES (88, 1, 10320, 2, 1, '2021-11-11 15:17:33', '2021-11-11 15:17:40');
INSERT INTO `cart_item` VALUES (89, 1, 10195, 2, 1, '2021-11-11 15:17:48', '2021-11-11 15:17:53');
INSERT INTO `cart_item` VALUES (90, 1, 10283, 2, 1, '2021-11-11 15:22:32', '2021-11-11 15:22:34');
INSERT INTO `cart_item` VALUES (91, 1, 10195, 2, 1, '2021-11-11 15:30:55', '2021-11-11 16:26:51');
INSERT INTO `cart_item` VALUES (92, 1, 10195, 3, 1, '2021-11-11 16:27:05', '2021-11-11 16:27:26');
INSERT INTO `cart_item` VALUES (93, 1, 10237, 3, 1, '2021-11-11 16:27:08', '2021-11-11 16:27:28');
INSERT INTO `cart_item` VALUES (94, 1, 10894, 4, 1, '2021-11-11 16:27:13', '2021-11-11 16:27:30');
INSERT INTO `cart_item` VALUES (95, 1, 10320, 5, 1, '2021-11-11 16:27:20', '2021-11-11 16:27:32');
INSERT INTO `cart_item` VALUES (96, 1, 10283, 3, 1, '2021-11-11 16:50:49', '2021-11-11 17:02:29');
INSERT INTO `cart_item` VALUES (97, 1, 10700, 4, 1, '2021-11-11 16:59:29', '2021-11-11 17:02:31');
INSERT INTO `cart_item` VALUES (98, 1, 10895, 3, 1, '2021-11-11 17:10:36', '2021-11-11 17:38:16');
INSERT INTO `cart_item` VALUES (99, 1, 10160, 1, 1, '2021-11-11 17:38:12', '2021-11-11 17:38:12');
INSERT INTO `cart_item` VALUES (100, 1, 10912, 3, 1, '2021-11-11 17:40:56', '2021-11-11 17:41:00');
INSERT INTO `cart_item` VALUES (101, 1, 10895, 1, 1, '2021-11-11 17:42:21', '2021-11-11 17:42:21');
INSERT INTO `cart_item` VALUES (102, 1, 10895, 3, 1, '2021-11-11 19:19:26', '2021-11-11 19:19:30');
INSERT INTO `cart_item` VALUES (103, 1, 10195, 5, 1, '2021-11-11 19:22:25', '2021-11-11 19:22:32');
INSERT INTO `cart_item` VALUES (104, 1, 10195, 2, 1, '2021-11-11 19:25:25', '2021-11-11 19:25:31');
INSERT INTO `cart_item` VALUES (105, 1, 10180, 3, 1, '2021-11-11 19:31:57', '2021-11-11 19:32:01');
INSERT INTO `cart_item` VALUES (106, 1, 10195, 3, 1, '2021-11-11 19:44:38', '2021-11-11 19:45:54');
INSERT INTO `cart_item` VALUES (107, 1, 10283, 3, 1, '2021-11-11 19:45:50', '2021-11-11 19:45:55');
INSERT INTO `cart_item` VALUES (108, 1, 10283, 2, 1, '2021-11-11 19:50:32', '2021-11-11 19:50:45');
INSERT INTO `cart_item` VALUES (109, 1, 10147, 2, 1, '2021-11-11 19:50:36', '2021-11-11 19:50:43');
INSERT INTO `cart_item` VALUES (110, 1, 10195, 3, 1, '2021-11-11 19:55:37', '2021-11-11 19:55:41');
INSERT INTO `cart_item` VALUES (111, 1, 10180, 3, 1, '2021-11-11 20:25:29', '2021-11-11 20:25:34');
INSERT INTO `cart_item` VALUES (112, 1, 10895, 3, 1, '2021-11-11 21:38:18', '2021-11-11 21:38:21');
INSERT INTO `cart_item` VALUES (113, 1, 10195, 3, 1, '2021-11-13 17:41:58', '2021-11-13 17:42:08');
INSERT INTO `cart_item` VALUES (114, 1, 10180, 1, 1, '2021-11-13 17:43:49', '2021-11-13 17:43:49');
INSERT INTO `cart_item` VALUES (115, 1, 10918, 2, 1, '2021-11-13 21:35:49', '2021-11-13 21:35:52');
INSERT INTO `cart_item` VALUES (116, 1, 10283, 4, 1, '2021-11-14 11:34:06', '2021-11-14 11:34:09');
INSERT INTO `cart_item` VALUES (117, 1, 10283, 5, 1, '2021-11-14 11:36:41', '2021-11-14 11:36:46');
INSERT INTO `cart_item` VALUES (118, 1, 10895, 1, 1, '2021-11-14 17:22:02', '2021-11-14 17:22:02');
INSERT INTO `cart_item` VALUES (119, 1, 10895, 1, 1, '2021-11-14 17:22:34', '2021-11-14 17:22:34');
INSERT INTO `cart_item` VALUES (120, 1, 10700, 4, 1, '2021-11-15 15:08:37', '2021-11-15 15:08:41');
INSERT INTO `cart_item` VALUES (121, 1, 10283, 3, 1, '2021-11-15 16:23:13', '2021-11-15 16:23:16');
INSERT INTO `cart_item` VALUES (122, 1, 10180, 1, 1, '2021-11-15 16:23:52', '2021-11-15 16:23:52');
INSERT INTO `cart_item` VALUES (123, 1, 10895, 1, 1, '2021-11-15 16:44:36', '2021-11-15 16:44:36');
INSERT INTO `cart_item` VALUES (124, 1, 10918, 3, 1, '2021-11-15 16:50:08', '2021-11-15 16:50:13');
INSERT INTO `cart_item` VALUES (125, 1, 10320, 3, 1, '2021-11-15 16:50:30', '2021-11-15 16:50:34');
INSERT INTO `cart_item` VALUES (126, 1, 10895, 1, 1, '2021-11-15 16:57:14', '2021-11-15 16:57:14');
INSERT INTO `cart_item` VALUES (127, 1, 10195, 1, 1, '2021-11-15 17:00:57', '2021-11-15 17:00:57');
INSERT INTO `cart_item` VALUES (128, 1, 10283, 1, 1, '2021-11-15 17:05:11', '2021-11-15 17:05:11');
INSERT INTO `cart_item` VALUES (129, 1, 10283, 3, 1, '2021-11-15 17:15:40', '2021-11-15 17:15:43');
INSERT INTO `cart_item` VALUES (130, 1, 10700, 1, 1, '2021-11-15 17:16:44', '2021-11-15 17:16:44');
INSERT INTO `cart_item` VALUES (131, 1, 10320, 1, 1, '2021-11-16 21:27:02', '2021-11-16 21:27:02');
INSERT INTO `cart_item` VALUES (132, 1, 10254, 1, 1, '2021-11-16 21:27:12', '2021-11-16 21:27:12');
INSERT INTO `cart_item` VALUES (133, 1, 10917, 1, 1, '2021-11-16 21:27:18', '2021-11-16 21:27:18');
INSERT INTO `cart_item` VALUES (134, 1, 10283, 1, 1, '2021-11-16 21:34:27', '2021-11-16 21:34:27');
INSERT INTO `cart_item` VALUES (135, 1, 10893, 1, 1, '2021-11-17 15:29:29', '2021-11-17 15:29:29');
INSERT INTO `cart_item` VALUES (136, 1, 10895, 1, 1, '2021-11-17 15:32:11', '2021-11-17 15:32:11');
INSERT INTO `cart_item` VALUES (137, 1, 10918, 1, 1, '2021-11-17 15:34:54', '2021-11-17 15:34:54');
INSERT INTO `cart_item` VALUES (138, 1, 10195, 1, 1, '2021-11-17 15:36:46', '2021-11-17 15:36:46');
INSERT INTO `cart_item` VALUES (139, 1, 10147, 1, 1, '2021-11-17 15:36:58', '2021-11-17 15:36:58');
INSERT INTO `cart_item` VALUES (140, 1, 10113, 1, 1, '2021-11-17 15:37:04', '2021-11-17 15:37:04');
INSERT INTO `cart_item` VALUES (141, 1, 10895, 1, 1, '2021-11-17 15:53:41', '2021-11-17 15:53:41');
INSERT INTO `cart_item` VALUES (142, 1, 10895, 1, 1, '2021-11-17 15:57:03', '2021-11-17 15:57:03');
INSERT INTO `cart_item` VALUES (143, 10, 10180, 3, 1, '2021-11-18 21:41:36', '2021-11-18 21:41:41');
INSERT INTO `cart_item` VALUES (144, 10, 10195, 1, 1, '2021-11-18 21:43:18', '2021-11-18 21:43:18');
INSERT INTO `cart_item` VALUES (145, 1, 10180, 4, 1, '2021-11-19 09:47:43', '2021-11-19 09:47:48');
INSERT INTO `cart_item` VALUES (146, 1, 10195, 1, 1, '2021-11-19 09:51:11', '2021-11-19 09:51:11');
INSERT INTO `cart_item` VALUES (147, 1, 10147, 2, 1, '2021-11-19 09:52:44', '2021-11-19 10:20:38');
INSERT INTO `cart_item` VALUES (148, 1, 10913, 3, 1, '2021-11-19 10:43:32', '2021-11-19 10:44:24');
INSERT INTO `cart_item` VALUES (149, 1, 10147, 4, 1, '2021-11-19 10:44:31', '2021-11-19 10:48:23');
INSERT INTO `cart_item` VALUES (150, 1, 10158, 1, 1, '2021-11-19 10:44:35', '2021-11-19 10:44:35');
INSERT INTO `cart_item` VALUES (151, 1, 10918, 4, 1, '2021-11-19 10:44:40', '2021-11-19 10:48:32');
INSERT INTO `cart_item` VALUES (152, 1, 10158, 1, 1, '2021-11-19 10:48:27', '2021-11-19 10:48:27');
INSERT INTO `cart_item` VALUES (153, 1, 10186, 2, 1, '2021-11-19 10:50:04', '2021-11-19 10:51:27');
INSERT INTO `cart_item` VALUES (154, 1, 10154, 2, 1, '2021-11-19 10:50:08', '2021-11-19 10:50:10');
INSERT INTO `cart_item` VALUES (155, 1, 10147, 4, 1, '2021-11-19 10:51:30', '2021-11-19 10:53:38');
INSERT INTO `cart_item` VALUES (156, 1, 10917, 1, 1, '2021-11-19 10:53:26', '2021-11-19 10:53:26');
INSERT INTO `cart_item` VALUES (157, 1, 10186, 3, 1, '2021-11-19 10:54:55', '2021-11-19 10:55:03');
INSERT INTO `cart_item` VALUES (158, 1, 10917, 1, 1, '2021-11-19 10:54:58', '2021-11-19 10:54:58');
INSERT INTO `cart_item` VALUES (159, 1, 10147, 1, 1, '2021-11-19 10:56:31', '2021-11-19 10:56:31');
INSERT INTO `cart_item` VALUES (160, 1, 10154, 4, 1, '2021-11-19 10:56:37', '2021-11-19 10:57:49');
INSERT INTO `cart_item` VALUES (161, 1, 10917, 3, 1, '2021-11-19 10:57:40', '2021-11-19 10:59:30');
INSERT INTO `cart_item` VALUES (162, 1, 10180, 3, 1, '2021-11-19 10:57:56', '2021-11-19 10:59:32');
INSERT INTO `cart_item` VALUES (163, 1, 10113, 1, 1, '2021-11-19 10:59:19', '2021-11-19 10:59:19');
INSERT INTO `cart_item` VALUES (164, 1, 10691, 1, 1, '2021-11-19 16:12:55', '2021-11-19 16:12:55');
INSERT INTO `cart_item` VALUES (165, 1, 10917, 1, 1, '2021-11-19 16:45:55', '2021-11-19 16:45:55');
INSERT INTO `cart_item` VALUES (166, 1, 10147, 1, 1, '2021-11-19 16:55:39', '2021-11-19 16:55:39');
INSERT INTO `cart_item` VALUES (167, 1, 10186, 1, 1, '2021-11-19 18:32:55', '2021-11-19 18:32:55');
INSERT INTO `cart_item` VALUES (168, 1, 10147, 1, 1, '2021-11-19 18:32:58', '2021-11-19 18:32:58');
INSERT INTO `cart_item` VALUES (169, 1, 10917, 1, 1, '2021-11-19 18:33:03', '2021-11-19 18:33:03');
INSERT INTO `cart_item` VALUES (170, 1, 10147, 1, 1, '2021-11-19 18:46:38', '2021-11-19 18:46:38');
INSERT INTO `cart_item` VALUES (171, 1, 10147, 3, 1, '2021-11-19 21:05:15', '2021-11-19 21:05:19');
INSERT INTO `cart_item` VALUES (172, 1, 10186, 1, 1, '2021-11-19 21:09:43', '2021-11-19 21:09:43');
INSERT INTO `cart_item` VALUES (173, 10, 10916, 1, 1, '2021-11-26 17:24:22', '2021-11-26 17:24:22');
INSERT INTO `cart_item` VALUES (174, 10, 10186, 4, 1, '2021-11-26 18:46:00', '2021-11-26 18:46:15');
INSERT INTO `cart_item` VALUES (175, 10, 10154, 4, 1, '2021-11-26 18:46:09', '2021-11-26 18:46:13');
INSERT INTO `cart_item` VALUES (176, 10, 10186, 1, 1, '2021-11-26 19:02:31', '2021-11-26 19:02:31');
INSERT INTO `cart_item` VALUES (177, 10, 10154, 2, 1, '2021-11-26 19:02:49', '2021-11-26 19:02:58');
INSERT INTO `cart_item` VALUES (178, 10, 10916, 2, 1, '2021-11-26 19:02:54', '2021-11-26 19:02:59');
INSERT INTO `cart_item` VALUES (179, 10, 10917, 4, 1, '2021-11-26 19:06:58', '2021-11-26 19:07:22');
INSERT INTO `cart_item` VALUES (180, 10, 10158, 5, 1, '2021-11-26 19:07:07', '2021-11-26 19:07:20');
INSERT INTO `cart_item` VALUES (181, 10, 10147, 4, 1, '2021-11-26 19:07:12', '2021-11-26 19:07:24');
INSERT INTO `cart_item` VALUES (182, 10, 10154, 3, 1, '2021-11-26 19:11:55', '2021-11-26 19:12:04');
INSERT INTO `cart_item` VALUES (183, 10, 10186, 1, 1, '2021-11-26 19:12:00', '2021-11-26 19:12:00');
INSERT INTO `cart_item` VALUES (184, 10, 10916, 1, 1, '2021-11-26 19:55:52', '2021-11-26 19:55:52');
INSERT INTO `cart_item` VALUES (185, 10, 10233, 2, 1, '2021-11-26 19:56:00', '2021-11-26 19:56:20');
INSERT INTO `cart_item` VALUES (186, 10, 10917, 3, 1, '2021-11-26 19:56:11', '2021-11-26 19:56:21');
INSERT INTO `cart_item` VALUES (187, 10, 10755, 3, 1, '2021-11-26 20:07:47', '2021-11-27 11:55:29');
INSERT INTO `cart_item` VALUES (188, 10, 10154, 1, 1, '2021-11-27 11:55:40', '2021-11-27 11:55:40');
INSERT INTO `cart_item` VALUES (189, 10, 10917, 1, 1, '2021-11-28 16:44:50', '2021-11-28 16:44:50');
INSERT INTO `cart_item` VALUES (190, 10, 10186, 3, 1, '2021-11-29 10:51:05', '2021-11-29 10:51:11');
INSERT INTO `cart_item` VALUES (191, 10, 10922, 1, 1, '2021-12-01 15:50:00', '2021-12-01 15:50:00');
INSERT INTO `cart_item` VALUES (192, 10, 10917, 1, 1, '2021-12-01 16:02:14', '2021-12-01 16:02:14');
INSERT INTO `cart_item` VALUES (193, 10, 10933, 1, 1, '2021-12-01 16:03:50', '2021-12-01 16:03:50');
INSERT INTO `cart_item` VALUES (194, 10, 10933, 1, 1, '2021-12-01 16:11:43', '2021-12-01 16:11:43');
INSERT INTO `cart_item` VALUES (195, 10, 10917, 1, 1, '2021-12-01 16:12:25', '2021-12-01 16:12:25');
INSERT INTO `cart_item` VALUES (196, 10, 10917, 1, 1, '2021-12-02 15:39:29', '2021-12-02 15:39:29');
INSERT INTO `cart_item` VALUES (197, 10, 10933, 5, 1, '2021-12-05 01:47:29', '2021-12-05 01:47:44');
INSERT INTO `cart_item` VALUES (198, 10, 10932, 5, 1, '2021-12-05 01:47:38', '2021-12-05 01:47:46');
INSERT INTO `cart_item` VALUES (199, 10, 10933, 5, 1, '2021-12-05 01:51:52', '2021-12-05 01:51:58');
INSERT INTO `cart_item` VALUES (200, 10, 10929, 5, 1, '2021-12-05 02:02:56', '2021-12-05 02:03:16');
INSERT INTO `cart_item` VALUES (201, 10, 10926, 5, 1, '2021-12-05 02:03:01', '2021-12-05 02:03:18');
INSERT INTO `cart_item` VALUES (202, 10, 10928, 5, 1, '2021-12-05 02:03:09', '2021-12-05 02:03:19');
INSERT INTO `cart_item` VALUES (203, 10, 10923, 5, 1, '2021-12-05 02:09:46', '2021-12-05 02:09:50');
INSERT INTO `cart_item` VALUES (204, 10, 10924, 5, 1, '2021-12-05 02:10:25', '2021-12-05 02:10:31');
INSERT INTO `cart_item` VALUES (205, 10, 10933, 4, 1, '2021-12-05 13:41:20', '2021-12-05 13:41:23');
INSERT INTO `cart_item` VALUES (206, 10, 10932, 1, 1, '2021-12-05 14:23:30', '2021-12-05 14:23:30');
INSERT INTO `cart_item` VALUES (207, 10, 10933, 1, 1, '2021-12-05 14:46:19', '2021-12-05 14:46:19');
INSERT INTO `cart_item` VALUES (208, 10, 10932, 1, 1, '2021-12-05 14:47:52', '2021-12-05 14:47:52');
INSERT INTO `cart_item` VALUES (209, 10, 10923, 5, 1, '2021-12-05 14:48:59', '2021-12-05 14:49:02');
INSERT INTO `cart_item` VALUES (210, 10, 10932, 5, 1, '2021-12-05 23:42:29', '2021-12-05 23:42:34');
INSERT INTO `cart_item` VALUES (211, 10, 10933, 3, 1, '2021-12-06 11:53:04', '2021-12-06 11:53:08');
INSERT INTO `cart_item` VALUES (212, 10, 10932, 3, 1, '2021-12-06 11:53:34', '2021-12-06 11:53:43');
INSERT INTO `cart_item` VALUES (213, 10, 10926, 4, 1, '2021-12-06 11:53:37', '2021-12-06 11:53:41');
INSERT INTO `cart_item` VALUES (214, 10, 10938, 1, 1, '2021-12-06 12:01:23', '2021-12-06 12:01:23');
INSERT INTO `cart_item` VALUES (215, 10, 10932, 6, 1, '2021-12-06 13:48:13', '2021-12-06 13:51:19');
INSERT INTO `cart_item` VALUES (216, 10, 10934, 6, 1, '2021-12-06 13:52:08', '2021-12-06 13:52:12');
INSERT INTO `cart_item` VALUES (217, 10, 10933, 5, 1, '2021-12-06 13:53:33', '2021-12-06 13:53:40');
INSERT INTO `cart_item` VALUES (218, 10, 10933, 7, 1, '2021-12-06 13:54:32', '2021-12-06 13:54:37');
INSERT INTO `cart_item` VALUES (219, 10, 10933, 8, 1, '2021-12-06 13:55:21', '2021-12-06 13:55:27');
INSERT INTO `cart_item` VALUES (220, 10, 10929, 1, 1, '2021-12-06 14:22:52', '2021-12-06 14:22:52');
INSERT INTO `cart_item` VALUES (221, 10, 10932, 1, 1, '2021-12-06 14:26:48', '2021-12-06 14:26:48');
INSERT INTO `cart_item` VALUES (222, 10, 10933, 1, 1, '2021-12-06 14:27:16', '2021-12-06 14:27:16');
INSERT INTO `cart_item` VALUES (223, 10, 10932, 1, 1, '2021-12-06 15:49:51', '2021-12-06 15:49:51');
INSERT INTO `cart_item` VALUES (224, 10, 10917, 1, 1, '2021-12-06 16:19:47', '2021-12-06 16:19:47');
INSERT INTO `cart_item` VALUES (225, 10, 10917, 1, 1, '2021-12-06 16:23:16', '2021-12-06 16:23:16');
INSERT INTO `cart_item` VALUES (226, 10, 10929, 1, 1, '2021-12-06 17:03:23', '2021-12-06 17:03:23');
INSERT INTO `cart_item` VALUES (227, 10, 10933, 4, 1, '2021-12-06 19:29:21', '2021-12-06 19:30:14');
INSERT INTO `cart_item` VALUES (228, 10, 10926, 4, 1, '2021-12-06 19:29:26', '2021-12-06 19:30:04');
INSERT INTO `cart_item` VALUES (229, 10, 10932, 4, 1, '2021-12-06 19:29:36', '2021-12-06 19:30:26');
INSERT INTO `cart_item` VALUES (230, 10, 10934, 4, 1, '2021-12-06 19:29:40', '2021-12-06 19:30:24');
INSERT INTO `cart_item` VALUES (231, 10, 10924, 5, 1, '2021-12-06 19:29:45', '2021-12-06 19:30:51');
INSERT INTO `cart_item` VALUES (232, 10, 10917, 1, 1, '2021-12-06 20:10:24', '2021-12-06 20:10:24');
INSERT INTO `cart_item` VALUES (233, 10, 10933, 1, 1, '2021-12-06 20:11:21', '2021-12-06 20:11:21');
INSERT INTO `cart_item` VALUES (234, 10, 10932, 2, 1, '2021-12-06 20:45:24', '2021-12-06 20:45:28');
INSERT INTO `cart_item` VALUES (235, 10, 10932, 1, 1, '2021-12-06 20:54:50', '2021-12-06 20:54:50');
INSERT INTO `cart_item` VALUES (236, 10, 10933, 4, 1, '2021-12-07 11:16:39', '2021-12-07 11:16:47');
INSERT INTO `cart_item` VALUES (237, 10, 10926, 4, 1, '2021-12-07 11:16:43', '2021-12-07 11:16:51');
INSERT INTO `cart_item` VALUES (238, 10, 10933, 4, 1, '2021-12-07 22:33:20', '2021-12-07 22:33:36');
INSERT INTO `cart_item` VALUES (239, 10, 10926, 3, 1, '2021-12-07 22:33:32', '2021-12-07 22:33:38');
INSERT INTO `cart_item` VALUES (240, 10, 10932, 3, 1, '2021-12-07 22:57:38', '2021-12-07 22:57:52');
INSERT INTO `cart_item` VALUES (241, 10, 10932, 1, 1, '2021-12-08 10:46:22', '2021-12-08 10:46:22');
INSERT INTO `cart_item` VALUES (242, 10, 10932, 2, 1, '2021-12-08 10:51:16', '2021-12-08 10:51:20');
INSERT INTO `cart_item` VALUES (243, 10, 10932, 1, 1, '2021-12-08 15:39:54', '2021-12-08 15:39:54');
INSERT INTO `cart_item` VALUES (244, 10, 10929, 3, 1, '2021-12-08 15:39:57', '2021-12-08 15:40:06');
INSERT INTO `cart_item` VALUES (245, 10, 10933, 1, 1, '2021-12-08 20:08:44', '2021-12-08 20:08:44');
INSERT INTO `cart_item` VALUES (246, 10, 10929, 1, 1, '2021-12-08 20:08:57', '2021-12-08 20:08:57');
INSERT INTO `cart_item` VALUES (247, 10, 10924, 1, 1, '2021-12-08 20:09:07', '2021-12-08 20:09:07');
INSERT INTO `cart_item` VALUES (248, 10, 10932, 1, 1, '2021-12-08 20:10:47', '2021-12-08 20:10:47');
INSERT INTO `cart_item` VALUES (249, 10, 10934, 1, 1, '2021-12-08 20:10:54', '2021-12-08 20:10:54');
INSERT INTO `cart_item` VALUES (250, 10, 10930, 1, 1, '2021-12-08 20:11:10', '2021-12-08 20:11:10');
INSERT INTO `cart_item` VALUES (251, 10, 10917, 1, 1, '2021-12-08 20:11:21', '2021-12-08 20:11:21');
INSERT INTO `cart_item` VALUES (252, 10, 10932, 3, 1, '2021-12-08 20:17:41', '2021-12-08 20:17:48');
INSERT INTO `cart_item` VALUES (253, 10, 10940, 1, 1, '2021-12-08 20:23:54', '2021-12-08 20:24:27');
INSERT INTO `cart_item` VALUES (254, 10, 10940, 1, 1, '2021-12-08 20:25:14', '2021-12-08 20:25:14');
INSERT INTO `cart_item` VALUES (255, 10, 10932, 1, 1, '2021-12-08 20:27:07', '2021-12-08 20:27:07');
INSERT INTO `cart_item` VALUES (256, 10, 10933, 1, 1, '2021-12-08 20:33:28', '2021-12-08 20:33:28');
INSERT INTO `cart_item` VALUES (257, 10, 10933, 4, 1, '2021-12-08 23:26:29', '2021-12-08 23:27:03');
INSERT INTO `cart_item` VALUES (258, 10, 10932, 3, 1, '2021-12-08 23:26:36', '2021-12-08 23:27:04');
INSERT INTO `cart_item` VALUES (259, 10, 10924, 3, 1, '2021-12-08 23:26:46', '2021-12-08 23:27:07');
INSERT INTO `cart_item` VALUES (260, 10, 10943, 9, 1, '2021-12-09 10:09:26', '2021-12-09 10:09:32');
INSERT INTO `cart_item` VALUES (261, 10, 10935, 5, 1, '2021-12-09 10:10:35', '2021-12-09 10:10:39');
INSERT INTO `cart_item` VALUES (262, 10, 10922, 2, 1, '2021-12-09 10:14:18', '2021-12-09 10:14:21');
INSERT INTO `cart_item` VALUES (263, 10, 10930, 3, 1, '2021-12-09 12:01:47', '2021-12-09 12:02:15');
INSERT INTO `cart_item` VALUES (264, 10, 10932, 3, 1, '2021-12-09 12:01:54', '2021-12-09 12:02:17');
INSERT INTO `cart_item` VALUES (265, 10, 10934, 1, 1, '2021-12-09 12:01:58', '2021-12-09 12:01:58');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `goods_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goods_intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联分类id',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png',
  `goods_detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `original_price` int(11) NOT NULL DEFAULT 1 COMMENT '原价',
  `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品实际售价',
  `stock_num` int(11) NOT NULL DEFAULT 0,
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '商品上架状态 0-下架 1-上架',
  `create_user` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(11) NOT NULL DEFAULT 0,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10945 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (10907, 'eminem', 'eminem', 113, 'http://localhost:8081/upload/20211023_19351847.jpg', 'http://localhost:8081/upload/20211023_19351847.jpg', '<p>\n	EMINEM YYDS！\n</p>', 5, 5, 600, 'eminem', 0, 0, '2021-10-23 19:36:03', 0, '2021-11-10 16:57:08');
INSERT INTO `goods` VALUES (10908, '华为荣耀20', '华为手机', 46, 'http://localhost:8081/upload/20211023_19381645.jpg', 'http://localhost:8081/upload/20211023_19381645.jpg', '<p>华为荣耀20</p>', 1499, 1900, 50, '华为手机', 0, 0, '2021-10-23 19:39:05', 0, '2021-10-23 19:39:05');
INSERT INTO `goods` VALUES (10909, 'Eminem海报22', '嘻哈天王Eminem海报22', 109, 'http://localhost:8081/upload/20211110_10404191.jpg', 'http://localhost:8081/upload/20211110_10404191.jpg', '嘻哈天王Eminem海报', 5, 5, 500, '海报22', 1, 0, '2021-11-10 10:40:44', 0, '2021-11-10 11:11:00');
INSERT INTO `goods` VALUES (10910, 'Eminem海报11', 'Eminem海报11', 109, 'http://localhost:8081/upload/20211110_11103687.jpg', 'http://localhost:8081/upload/20211110_11103687.jpg', 'Eminem海报11', 5, 5, 500, 'Eminem海报11', 0, 0, '2021-11-10 11:10:37', 0, '2021-11-10 11:10:37');
INSERT INTO `goods` VALUES (10911, '小埋', '小埋', 110, 'http://localhost:8081/upload/20211110_15065754.PNG', 'http://localhost:8081/upload/20211110_15065754.PNG', '小埋', 5, 5, 4999, '小埋', 0, 0, '2021-11-10 15:06:59', 0, '2021-11-10 15:17:12');
INSERT INTO `goods` VALUES (10912, '小埋2.0', '小埋2.0', 110, 'http://localhost:8081/upload/20211110_15162630.PNG', 'http://localhost:8081/upload/20211110_15162630.PNG', '小埋2.0', 7, 7, 196, '小埋2.0', 0, 0, '2021-11-10 15:16:30', 0, '2021-11-10 15:17:06');
INSERT INTO `goods` VALUES (10913, '戴尔G3', '戴尔', 114, 'http://localhost:8081/upload/20211110_15232698.jpg', 'http://localhost:8081/upload/20211110_15232698.jpg', '戴尔G3', 4500, 4500, 50, '戴尔G3', 1, 0, '2021-11-10 15:23:31', 0, '2021-11-11 10:37:16');
INSERT INTO `goods` VALUES (10914, '小埋3.0', '小埋3.0', 110, 'http://localhost:8081/upload/20211110_15302753.PNG', 'http://localhost:8081/upload/20211110_15302753.PNG', '小埋3.0', 10, 10, 300, '小埋3.0', 0, 0, '2021-11-10 15:30:28', 0, '2021-11-13 20:48:14');
INSERT INTO `goods` VALUES (10915, '微星', '微星', 114, 'http://localhost:8081/upload/20211110_15335512.jpg', 'http://localhost:8081/upload/20211110_15335512.jpg', '<p>22222<br/></p>', 5000, 5000, 300, '微星22', 0, 0, '2021-11-10 15:34:04', 0, '2021-11-11 10:47:44');
INSERT INTO `goods` VALUES (10916, 'apple', 'apple', 114, 'http://localhost:8081/upload/20211111_10485526.jpg', 'http://localhost:8081/upload/20211111_10485526.jpg', '<p>apple</p>', 20000, 20000, 296, 'apple', 0, 0, '2021-11-11 10:48:57', 0, '2021-11-11 10:48:57');
INSERT INTO `goods` VALUES (10917, '手套', '手套', 90, 'http://localhost:8081/upload/20211111_10510286.jpg', 'http://localhost:8081/upload/20211111_10510286.jpg', '<p>手套</p>', 2, 2, 1982, '手套', 0, 0, '2021-11-11 10:51:13', 0, '2021-11-11 10:51:13');
INSERT INTO `goods` VALUES (10918, 'sdfsfsfdasdfsaf', 'sdfasfdasdfasfaf', 90, 'http://localhost:8081/upload/20211113_21312474.jpg', 'http://localhost:8081/upload/20211113_21312474.jpg', '<p>dsfsadfasdf</p>', 1000, 1000, 294, 'dfsafdasdfasfsf', 0, 0, '2021-11-11 17:27:08', 0, '2021-11-14 11:15:58');
INSERT INTO `goods` VALUES (10919, 'xiuxiuxiuddddddd', 'ixuixuixuddddddd', 21, 'http://localhost:8081/upload/20211113_21171659.jpg', 'http://localhost:8081/upload/20211113_21171659.jpg', '<p>66</p>', 66, 66, 66, '66', 0, 0, '2021-11-13 21:17:29', 0, '2021-11-19 10:10:35');
INSERT INTO `goods` VALUES (10920, 'sdsdsdsdsddddddddddddddddddddddddddddddddd', 'sdddddddddddddddddddddddddddddddddd', 114, 'http://localhost:8081/upload/20211119_11514732.jpg', 'http://localhost:8081/upload/20211119_11514732.jpg', '<p>sdfsdfsdf</p>', 1, 1, 55, 'sdfsdfsdf', 1, 0, '2021-11-19 11:52:06', 0, '2021-12-02 15:38:49');
INSERT INTO `goods` VALUES (10921, 'sdsdedwed', 'wedwedwed', 76, 'http://localhost:8081/upload/20211201_10031869.jpg', 'http://localhost:8081/upload/20211201_10031869.jpg', '<p>dsdsdfs</p>', 1, 1, 2, 'dsdsd', 0, 0, '2021-12-01 10:03:30', 0, '2021-12-01 10:03:30');
INSERT INTO `goods` VALUES (10922, '医用外科口罩', '医用外科口罩', 148, 'http://localhost:8081/upload/20211201_11475089.jpg', 'http://localhost:8081/upload/20211201_11475089.jpg', '<p>医用外科口罩</p>', 1, 1, 197, '医用外科口罩', 0, 0, '2021-12-01 11:48:18', 0, '2021-12-01 11:48:18');
INSERT INTO `goods` VALUES (10923, '注射器', '注射器', 149, 'http://localhost:8081/upload/20211201_14385367.jpg', 'http://localhost:8081/upload/20211201_14385367.jpg', '<p>注射器</p>', 5, 5, 4990, '注射器', 0, 0, '2021-12-01 14:39:33', 0, '2021-12-01 14:39:33');
INSERT INTO `goods` VALUES (10924, '硝苯地平片', '硝苯地平片', 150, 'http://localhost:8081/upload/20211201_14404162.jpg', 'http://localhost:8081/upload/20211201_14404162.jpg', '<p>硝苯地平片</p>', 20, 20, 286, '硝苯地平片', 0, 0, '2021-12-01 14:41:13', 0, '2021-12-01 14:41:13');
INSERT INTO `goods` VALUES (10925, '蜜炼川贝枇杷膏', '蜜炼川贝枇杷膏', 151, 'http://localhost:8081/upload/20211201_14420399.jpg', 'http://localhost:8081/upload/20211201_14420399.jpg', '<p>蜜炼川贝枇杷膏</p>', 30, 30, 200, '蜜炼川贝枇杷膏', 0, 0, '2021-12-01 14:42:18', 0, '2021-12-01 14:42:18');
INSERT INTO `goods` VALUES (10926, '三九胃泰颗粒', '三九胃泰颗粒', 152, 'http://localhost:8081/upload/20211201_14424473.jpg', 'http://localhost:8081/upload/20211201_14424473.jpg', '<p>三九胃泰颗粒</p>', 25, 25, 280, '三九胃泰颗粒', 0, 0, '2021-12-01 14:43:04', 0, '2021-12-01 14:43:04');
INSERT INTO `goods` VALUES (10927, '氧氟沙星胶囊', '氧氟沙星胶囊', 153, 'http://localhost:8081/upload/20211201_14432982.jpg', 'http://localhost:8081/upload/20211201_14432982.jpg', '<p>氧氟沙星胶囊</p>', 30, 30, 150, '氧氟沙星胶囊', 0, 0, '2021-12-01 14:43:45', 0, '2021-12-01 14:43:45');
INSERT INTO `goods` VALUES (10928, '阿仑膦酸钠', '阿仑膦酸钠', 154, 'http://localhost:8081/upload/20211201_14441383.jpg', 'http://localhost:8081/upload/20211201_14441383.jpg', '<p>阿仑膦酸钠</p>', 15, 15, 145, '阿仑膦酸钠', 0, 0, '2021-12-01 14:44:28', 0, '2021-12-01 14:44:28');
INSERT INTO `goods` VALUES (10929, '补中益气颗粒', '补中益气颗粒', 155, 'http://localhost:8081/upload/20211201_14445495.jpg', 'http://localhost:8081/upload/20211201_14445495.jpg', '<p>补中益气颗粒</p>', 45, 45, 239, '补中益气颗粒', 0, 0, '2021-12-01 14:45:10', 0, '2021-12-01 14:45:10');
INSERT INTO `goods` VALUES (10930, '氯雷他定片', '氯雷他定片', 156, 'http://localhost:8081/upload/20211201_14452922.jpg', 'http://localhost:8081/upload/20211201_14452922.jpg', '<p>氯雷他定片</p>', 25, 25, 996, '氯雷他定片', 0, 0, '2021-12-01 14:45:40', 0, '2021-12-01 14:45:40');
INSERT INTO `goods` VALUES (10931, '玻璃酸钠', '玻璃酸钠', 157, 'http://localhost:8081/upload/20211201_14461137.jpg', 'http://localhost:8081/upload/20211201_14461137.jpg', '<p>治疗眼睛干燥</p>', 1, 1, 0, '玻璃酸钠', 0, 0, '2021-12-01 14:46:28', 0, '2021-12-01 14:46:28');
INSERT INTO `goods` VALUES (10932, '养乐多', '养乐多', 158, 'http://localhost:8081/upload/20211201_14463723.jpg', 'http://localhost:8081/upload/20211201_14463723.jpg', '<p>养乐多</p>', 34, 34, 295, '养乐多', 0, 0, '2021-12-01 14:47:16', 0, '2021-12-01 14:47:16');
INSERT INTO `goods` VALUES (10933, '维生素B', '维生素B', 159, 'http://localhost:8081/upload/20211201_14473477.jpg', 'http://localhost:8081/upload/20211201_14473477.jpg', '<p>维生素B</p>', 25, 25, 340, '维生素B', 0, 0, '2021-12-01 14:47:48', 0, '2021-12-01 14:47:48');
INSERT INTO `goods` VALUES (10934, '维生素C', '维生素C', 159, 'http://localhost:8081/upload/20211201_14480325.jpg', 'http://localhost:8081/upload/20211201_14480325.jpg', '<p>维生素C</p>', 7, 7, 438, '维生素C', 0, 0, '2021-12-01 14:48:28', 0, '2021-12-02 15:32:50');
INSERT INTO `goods` VALUES (10935, 'sdfsdf', 'sdfsdfs', 148, 'http://localhost:8081/upload/20211203_18594749.jpg', 'http://localhost:8081/upload/20211203_18594749.jpg', '<p><font face=\"仿宋\">①明确</font></p><p><font face=\"仿宋\"><span style=\"font-size: 1rem;\"></span>&nbsp; &nbsp; &nbsp; &nbsp; 中国特色社会主义最本质的特征是中国共产党领导，中国特色社会主义制度的最大优势是中国共产党领导，中国共产党是最高政治领导确力量，全党必须增强\"四个意识\"、坚定\"四个自信\"、做到\"两个维护\";</font></p><p><font face=\"仿宋\">②明确</font></p><p><font face=\"仿宋\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;坚持和发展中国特色社会主义，总任务是实现社会主义现代化和中华民族伟大复兴，在全面建成小康社会的基础上，分两步走在本世纪中叶建成富强民主文明和谐美丽的社会主义现代化强国，以中国式现代化推进中华民族伟大复兴;</font></p><p><font face=\"仿宋\">③明确</font></p><p><font face=\"仿宋\">&nbsp; &nbsp; &nbsp; &nbsp;明确新时代我国社会主要矛盾是人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾，必须坚持以人民为中心的发展思想，发展全过程人民民主，推动人的全面发展、全体人民共同富裕取得更为明显的实质性进展;</font></p>', 1, 1, 45, 'sdfsfd', 0, 0, '2021-12-03 19:01:51', 0, '2021-12-09 10:10:57');
INSERT INTO `goods` VALUES (10936, 'dsdfsdfsdfs', 'dsdfsdfsdfs', 149, 'http://localhost:8081/upload/20211203_19152599.jpg', 'http://localhost:8081/upload/20211203_19152599.jpg', '<p>dsdfsdfsdfs</p>', 1, 1, 0, 'dsdfsdfsdfs', 0, 0, '2021-12-03 19:15:39', 0, '2021-12-08 13:54:18');
INSERT INTO `goods` VALUES (10937, '辅导辅导辅导辅导', '辅导辅导辅导辅导', 150, 'http://localhost:8081/upload/20211205_13444450.jpg', 'http://localhost:8081/upload/20211205_13444450.jpg', '<p>辅导辅导辅导辅导</p>', 1, 1, 200, '辅导辅导辅导辅导', 0, 0, '2021-12-05 13:44:56', 0, '2021-12-08 13:54:18');
INSERT INTO `goods` VALUES (10938, 'efefwefw', 'wefwefwef', 163, 'http://localhost:8081/upload/20211206_1201107.jpg', 'http://localhost:8081/upload/20211206_1201107.jpg', '<p>wefwefwef</p>', 1, 1, 199, 'wefwefwef', 0, 0, '2021-12-06 12:01:14', 0, '2021-12-08 13:54:18');
INSERT INTO `goods` VALUES (10939, '血压器', '血压器', 164, 'http://localhost:8081/upload/20211207_11354097.jpg', 'http://localhost:8081/upload/20211207_11354097.jpg', '<p>血压器</p>', 1, 1, 200, '血压器', 0, 0, '2021-12-07 11:36:07', 0, '2021-12-08 13:54:18');
INSERT INTO `goods` VALUES (10940, '测测', '测测', 148, 'http://localhost:8081/upload/20211208_20233795.jpg', 'http://localhost:8081/upload/20211208_20233795.jpg', '<p>测测</p>', 1, 1, 0, '测测', 0, 0, '2021-12-08 20:23:40', 0, '2021-12-08 20:25:53');
INSERT INTO `goods` VALUES (10941, 'wewewew', 'wewewewe', 152, 'http://localhost:8081/upload/20211208_21582423.jpg', 'http://localhost:8081/upload/20211208_21582423.jpg', '<p>dfdfdfdfdfdfdf</p><h3>3.2&nbsp;英文名称</h3><p>Compound Aluminium Hydroxide</p><h3><a></a>3.3&nbsp;别名</h3><p><a href=\"https://doc.wiki8.cn/daweining_140020/\">达胃宁</a>；<a href=\"https://doc.wiki8.cn/weishuping_31346/\">胃舒平</a>；<a href=\"https://doc.wiki8.cn/fufangqingyanghualvpian_82813/\">复方氢氧化铝片</a>；<a href=\"https://doc.wiki8.cn/qingyanghualv.2Fqingyanghuamei.2Ferjiaguiyou_140021/\">氢氧化铝/氢氧化镁/二甲硅油</a>；Compound Aluminium Hydroxide；Aluminium Hydroxide Co；Aluminum Hydroxide Compound；Gastropine</p><p><img src=\"http://localhost:8081/upload/20211208_22003862.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><h3><a></a>3.4&nbsp;<a href=\"https://doc.wiki8.cn/fenlei_119101/\">分类</a></h3><p><a href=\"https://doc.wiki8.cn/xiaohuaxitongyaowu_101850/\">消化系统药物</a>&nbsp;&gt; 制酸及胃黏膜保护药</p><h3><a></a>3.5&nbsp;<a href=\"https://doc.wiki8.cn/jixing_13909/\">剂型</a></h3><p>每片含<a href=\"https://doc.wiki8.cn/ganzao_109113/\">干燥</a>氢氧化化化铝<a href=\"https://doc.wiki8.cn/ningjiao_109217/\">凝胶</a>0.245g、<a href=\"https://doc.wiki8.cn/sanguisuanmei_31293/\">三硅酸镁</a>0.105g、<a href=\"https://doc.wiki8.cn/dianqiejingao_53766/\">颠茄浸膏</a>0.0026g。</p><h3><a></a>3.6&nbsp;<a href=\"https://doc.wiki8.cn/fufangqingyanghualv_31347/\">复方氢氧化铝</a>的药理<a href=\"https://doc.wiki8.cn/zuoyong_105276/\">作用</a></h3><p><img src=\"http://localhost:8081/upload/20211208_22002745.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><p><a href=\"https://doc.wiki8.cn/fufangqingyanghualv_31347/\">复方氢氧化铝</a>为<a href=\"https://doc.wiki8.cn/kangsuanyao_101864/\">抗酸药</a>氢氧化化铝、<a href=\"https://doc.wiki8.cn/sanguisuanmei_31293/\">三硅酸镁</a>与<a href=\"https://doc.wiki8.cn/jiejing_13573/\">解痉</a>药<a href=\"https://doc.wiki8.cn/dianqiejingao_53766/\">颠茄浸膏</a>组成的<a href=\"https://doc.wiki8.cn/fufang_15607/\">复方</a><a href=\"https://doc.wiki8.cn/yaowu_3979/\">药物</a>。氢氧化化铝具有抗酸、<a href=\"https://doc.wiki8.cn/xifu_106350/\">吸附</a>、局部<a href=\"https://doc.wiki8.cn/zhixue_5426/\">止血</a>和保护<a href=\"https://doc.wiki8.cn/kuiyang_12796/\">溃疡</a>面等<a href=\"https://doc.wiki8.cn/zuoyong_105276/\">作用</a>，而<a href=\"https://doc.wiki8.cn/sanguisuanmei_31293/\">三硅酸镁</a>也有中<a href=\"https://doc.wiki8.cn/hewei_14663/\">和胃</a>酸和保护<a href=\"https://doc.wiki8.cn/kuiyang_12796/\">溃疡</a>面的<a href=\"https://doc.wiki8.cn/zuoyong_105276/\">作用</a>。<a href=\"https://doc.wiki8.cn/dianqie_31387/\">颠茄</a>既能<a href=\"https://doc.wiki8.cn/yizhi_107339/\">抑制</a><a href=\"https://doc.wiki8.cn/weiye_40742/\">胃液</a>分泌，解除胃肠<a href=\"https://doc.wiki8.cn/pinghuaji_47241/\">平滑肌</a>痉挛，又可使<a href=\"https://doc.wiki8.cn/weipaikong_107132/\">胃排空</a>延缓，有利于<a href=\"https://doc.wiki8.cn/shierzhichangkuiyang_35931/\">十二指肠溃疡</a>的愈合。故<a href=\"https://doc.wiki8.cn/fufangqingyanghualv_31347/\">复方氢氧化铝</a>可起到中<a href=\"https://doc.wiki8.cn/hewei_14663/\">和胃</a>酸、减少<a href=\"https://doc.wiki8.cn/weiye_40742/\">胃液</a>分泌<a href=\"https://doc.wiki8.cn/hejie_14668/\">和解</a>痉止痛的<a href=\"https://doc.wiki8.cn/zuoyong_105276/\">作用</a>。由于<a href=\"https://doc.wiki8.cn/Mg_47189/\">Mg</a><sup>2</sup>具有缓泻<a href=\"https://doc.wiki8.cn/zuoyong_105276/\">作用</a>，故<a href=\"https://doc.wiki8.cn/bianmi_18419/\">便秘</a>的<a href=\"https://doc.wiki8.cn/buliangfanying_101979/\">不良反应</a>减轻。此外，<a href=\"https://doc.wiki8.cn/fufangqingyanghualv_31347/\">复方氢氧化铝</a>能影响磷的<a href=\"https://doc.wiki8.cn/xishou_40743/\">吸收</a>，鸟粪石型结石<a href=\"https://doc.wiki8.cn/huanzhe_136239/\">患者</a>服用<a href=\"https://doc.wiki8.cn/fufangqingyanghualv_31347/\">复方氢氧化铝</a>，可因<a href=\"https://doc.wiki8.cn/linsuan_143295/\">磷酸</a>盐<a href=\"https://doc.wiki8.cn/xishou_40743/\">吸收</a>减少而减缓结石的<a href=\"https://doc.wiki8.cn/shengchang_107305/\">生长</a>或防止其复发。也可用于治疗<a href=\"https://doc.wiki8.cn/jiazhuangpangxiangongnengjiantuizheng_37034/\">甲状旁腺功能减退症</a>和<a href=\"https://doc.wiki8.cn/shenbing_8958/\">肾病</a>型<a href=\"https://doc.wiki8.cn/guruanhuazheng_154272/\">骨软化症</a><a href=\"https://doc.wiki8.cn/huanzhe_136239/\">患者</a>以调节钙磷<a href=\"https://doc.wiki8.cn/pingheng_119867/\">平衡</a>。</p>', 5, 5, 20, 'wewewe', 0, 0, '2021-12-08 22:00:41', 0, '2021-12-08 22:00:41');
INSERT INTO `goods` VALUES (10942, '白加黑', '白加黑', 161, 'http://localhost:8081/upload/20211208_23384094.jpg', 'http://localhost:8081/upload/20211208_23384094.jpg', '<p><img src=\"http://localhost:8081/upload/20211208_23395354.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/><!--[endif]--></p><p>商品名称<i>日夜百服咛</i></p><p>通用名称<i>氨酚伪麻美芬片</i></p><p>批准文号<i>国药准字</i><i>H10970388</i></p><p>规格<i>4+2</i><i>片</i></p><p>包装<i>4+2</i><i>片</i><i>/</i><i>盒</i></p><p>用法用量<i>日片（氨酚伪麻美芬片）口服，成人和</i><i>12</i><i>岁以上儿童</i><i> </i><i>一次</i><i>1</i><i>片，白天每</i><i>6</i><i>小时服一</i><i>1</i><i>次。</i></p><p>分类<i>化学药品</i></p><p>类型<i>处方药</i></p><p>剂型<i>片剂</i><i>(</i><i>薄膜衣</i><i>)</i></p><p>性状<i>本品日用片为深橙色薄膜衣片。夜用片为浅兰色薄膜衣片。</i></p><p>外用药<i>否</i></p><p>有效期<i>36</i><i>个月</i></p><p>国家/地区<i>国产</i></p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p><img src=\"http://localhost:8081/upload/20211208_23400744.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p>', 30, 20, 200, '白加黑', 0, 0, '2021-12-08 23:40:10', 0, '2021-12-08 23:40:10');
INSERT INTO `goods` VALUES (10943, 'cece', 'cece', 165, 'http://localhost:8081/upload/20211209_10091470.jpg', 'http://localhost:8081/upload/20211209_10091470.jpg', '<p>cece</p>', 1, 1, 11, 'cece', 0, 0, '2021-12-09 10:09:18', 0, '2021-12-09 10:09:18');
INSERT INTO `goods` VALUES (10944, '4564646', '456564', 150, 'http://localhost:8081/upload/20211209_12114450.jpg', 'http://localhost:8081/upload/20211209_12114450.jpg', '<p>滚滚滚</p><p><img src=\"http://localhost:8081/upload/20211209_12130092.jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/><br/>4545464</p>', 20, 20, 20, '接口', 1, 0, '2021-12-09 12:13:08', 0, '2021-12-09 12:13:46');

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父分类id',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(11) NOT NULL DEFAULT 0,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES (116, 3, 68, '袜子', 20, 0, '2021-11-11 17:32:00', 0, '2021-11-11 17:32:00', 0);
INSERT INTO `goods_category` VALUES (117, 3, 75, '吉他', 20, 0, '2021-11-11 19:28:36', 0, '2021-11-11 19:28:36', 0);
INSERT INTO `goods_category` VALUES (118, 3, 17, 'sdsdsdsdsdsdsd', 300, 1, '2021-11-13 21:29:40', 0, '2021-11-13 21:29:47', 0);
INSERT INTO `goods_category` VALUES (119, 1, 0, '药品 保健品 医药器械', 50, 1, '2021-11-16 15:02:34', 0, '2021-11-16 15:04:42', 0);
INSERT INTO `goods_category` VALUES (120, 2, 119, '中药', 0, 0, '2021-11-16 15:02:52', 0, '2021-11-16 15:02:52', 0);
INSERT INTO `goods_category` VALUES (121, 3, 120, '成药', 0, 1, '2021-11-16 15:03:06', 0, '2021-11-16 15:03:06', 0);
INSERT INTO `goods_category` VALUES (122, 2, 119, '保健品', 20, 1, '2021-11-16 15:04:57', 0, '2021-11-16 15:04:57', 0);
INSERT INTO `goods_category` VALUES (123, 2, 119, '医疗器械', 0, 0, '2021-11-16 15:05:10', 0, '2021-11-16 15:06:28', 0);
INSERT INTO `goods_category` VALUES (124, 3, 123, '内服', 0, 1, '2021-11-16 15:06:52', 0, '2021-11-16 15:06:52', 0);
INSERT INTO `goods_category` VALUES (125, 3, 120, '内服', 0, 0, '2021-11-16 15:07:27', 0, '2021-11-16 15:07:27', 0);
INSERT INTO `goods_category` VALUES (126, 3, 120, '外用', 0, 0, '2021-11-16 15:07:34', 0, '2021-11-16 15:07:34', 0);
INSERT INTO `goods_category` VALUES (127, 2, 119, '手动阀手动阀', 0, 0, '2021-11-19 17:15:16', 0, '2021-11-19 17:15:16', 0);
INSERT INTO `goods_category` VALUES (128, 3, 120, '西药', 0, 0, '2021-11-19 17:16:49', 0, '2021-11-19 17:16:49', 0);
INSERT INTO `goods_category` VALUES (129, 1, 0, '中药 中药材 成药', 200, 1, '2021-12-01 10:20:57', 0, '2021-12-01 10:20:57', 0);
INSERT INTO `goods_category` VALUES (130, 1, 0, '防疫  器械', 100, 0, '2021-12-01 11:37:35', 0, '2021-12-01 11:40:36', 0);
INSERT INTO `goods_category` VALUES (131, 1, 0, '心血管       呼吸道', 99, 0, '2021-12-01 11:37:52', 0, '2021-12-01 11:38:07', 0);
INSERT INTO `goods_category` VALUES (132, 1, 0, '消化 泌尿', 98, 0, '2021-12-01 11:38:30', 0, '2021-12-01 11:40:06', 0);
INSERT INTO `goods_category` VALUES (133, 1, 0, '骨科 内分泌', 97, 0, '2021-12-01 11:38:50', 0, '2021-12-01 11:39:54', 0);
INSERT INTO `goods_category` VALUES (134, 1, 0, '皮肤科 眼科', 96, 0, '2021-12-01 11:39:06', 0, '2021-12-01 11:39:06', 0);
INSERT INTO `goods_category` VALUES (135, 1, 0, '营养 保健品', 95, 0, '2021-12-01 11:39:19', 0, '2021-12-01 11:39:19', 0);
INSERT INTO `goods_category` VALUES (136, 2, 130, '防疫物资', 100, 0, '2021-12-01 11:41:09', 0, '2021-12-01 11:41:09', 0);
INSERT INTO `goods_category` VALUES (137, 2, 130, '医疗器具', 99, 0, '2021-12-01 11:42:21', 0, '2021-12-01 11:42:21', 0);
INSERT INTO `goods_category` VALUES (138, 2, 131, '心血管系统', 100, 0, '2021-12-01 11:42:47', 0, '2021-12-01 11:42:47', 0);
INSERT INTO `goods_category` VALUES (139, 2, 131, '呼吸道系统', 99, 0, '2021-12-01 11:42:57', 0, '2021-12-01 11:42:57', 0);
INSERT INTO `goods_category` VALUES (140, 2, 132, '消化系统', 100, 0, '2021-12-01 11:43:12', 0, '2021-12-01 11:43:12', 0);
INSERT INTO `goods_category` VALUES (141, 2, 132, '泌尿系统', 99, 0, '2021-12-01 11:43:31', 0, '2021-12-01 11:43:31', 0);
INSERT INTO `goods_category` VALUES (142, 2, 133, '骨科', 100, 0, '2021-12-01 11:44:12', 0, '2021-12-01 11:44:12', 0);
INSERT INTO `goods_category` VALUES (143, 2, 133, '内分泌', 99, 0, '2021-12-01 11:44:22', 0, '2021-12-01 11:44:22', 0);
INSERT INTO `goods_category` VALUES (144, 2, 134, '皮肤科', 100, 0, '2021-12-01 11:44:40', 0, '2021-12-01 11:44:40', 0);
INSERT INTO `goods_category` VALUES (145, 2, 134, '眼科', 99, 0, '2021-12-01 11:44:50', 0, '2021-12-01 11:44:50', 0);
INSERT INTO `goods_category` VALUES (146, 2, 135, '营养', 100, 0, '2021-12-01 11:45:08', 0, '2021-12-01 11:45:08', 0);
INSERT INTO `goods_category` VALUES (147, 2, 135, '保健品', 99, 0, '2021-12-01 11:45:17', 0, '2021-12-01 11:45:17', 0);
INSERT INTO `goods_category` VALUES (148, 3, 136, '防疫物品', 100, 0, '2021-12-01 11:47:23', 0, '2021-12-01 11:47:23', 0);
INSERT INTO `goods_category` VALUES (149, 3, 137, '生化注射', 100, 0, '2021-12-01 11:50:14', 0, '2021-12-01 11:50:14', 0);
INSERT INTO `goods_category` VALUES (150, 3, 138, '治疗心血管疾病', 100, 0, '2021-12-01 11:50:49', 0, '2021-12-01 11:50:49', 0);
INSERT INTO `goods_category` VALUES (151, 3, 139, '治疗咳嗽', 100, 0, '2021-12-01 11:51:20', 0, '2021-12-01 11:51:20', 0);
INSERT INTO `goods_category` VALUES (152, 3, 140, '养胃', 100, 0, '2021-12-01 11:52:02', 0, '2021-12-01 11:52:02', 0);
INSERT INTO `goods_category` VALUES (153, 3, 141, '治疗泌尿疾病', 100, 0, '2021-12-01 11:52:36', 0, '2021-12-01 11:52:36', 0);
INSERT INTO `goods_category` VALUES (154, 3, 142, '治疗骨质疏松', 100, 0, '2021-12-01 11:56:27', 0, '2021-12-01 11:56:27', 0);
INSERT INTO `goods_category` VALUES (155, 3, 143, '治疗内分泌紊乱', 100, 0, '2021-12-01 11:57:32', 0, '2021-12-01 11:57:32', 0);
INSERT INTO `goods_category` VALUES (156, 3, 144, '治疗皮肤瘙痒', 100, 0, '2021-12-01 11:58:59', 0, '2021-12-01 11:58:59', 0);
INSERT INTO `goods_category` VALUES (157, 3, 145, '治疗眼睛干燥', 100, 0, '2021-12-01 11:59:25', 0, '2021-12-01 11:59:25', 0);
INSERT INTO `goods_category` VALUES (158, 3, 146, '健胃消食', 100, 0, '2021-12-01 12:00:06', 0, '2021-12-05 23:44:08', 0);
INSERT INTO `goods_category` VALUES (159, 3, 147, '补充维生素', 100, 0, '2021-12-01 12:00:26', 0, '2021-12-05 13:45:30', 0);
INSERT INTO `goods_category` VALUES (160, 1, 0, '111111111111', 0, 1, '2021-12-02 15:41:14', 0, '2021-12-02 15:41:22', 0);
INSERT INTO `goods_category` VALUES (161, 3, 147, '补充矿物质', 99, 0, '2021-12-05 13:46:00', 0, '2021-12-05 13:46:00', 0);
INSERT INTO `goods_category` VALUES (162, 3, 136, '111111111111111', 1, 1, '2021-12-06 12:00:15', 0, '2021-12-06 12:00:33', 0);
INSERT INTO `goods_category` VALUES (163, 3, 136, '22222222222222222', 1, 1, '2021-12-06 12:00:52', 0, '2021-12-07 11:29:42', 0);
INSERT INTO `goods_category` VALUES (164, 3, 137, '血压器', 101, 0, '2021-12-07 11:31:50', 0, '2021-12-07 11:31:50', 0);
INSERT INTO `goods_category` VALUES (165, 3, 136, '防护服', 101, 0, '2021-12-08 23:37:53', 0, '2021-12-08 23:37:53', 0);
INSERT INTO `goods_category` VALUES (166, 3, 137, '医用砂轮', 101, 0, '2021-12-09 12:07:17', 0, '2021-12-09 12:07:17', 0);

-- ----------------------------
-- Table structure for index_config
-- ----------------------------
DROP TABLE IF EXISTS `index_config`;
CREATE TABLE `index_config`  (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `config_type` tinyint(4) NOT NULL DEFAULT 0,
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '##',
  `config_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user` int(11) NOT NULL DEFAULT 0,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_user` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of index_config
-- ----------------------------
INSERT INTO `index_config` VALUES (26, '新品上线 Eminem海报', 4, 10909, '##', 20, 1, '2021-11-10 10:44:01', 0, '2021-11-10 10:57:12', 0);
INSERT INTO `index_config` VALUES (35, '医用手套', 4, 10917, '##', 200, 1, '2021-11-11 20:36:17', 0, '2021-12-07 11:26:03', 0);
INSERT INTO `index_config` VALUES (36, '苹果电脑', 5, 10916, '##', 100, 0, '2021-11-11 20:36:43', 0, '2021-12-02 15:35:06', 0);
INSERT INTO `index_config` VALUES (37, 'dsfb', 3, 10918, '##', 320, 0, '2021-11-13 21:31:02', 0, '2021-11-19 10:08:44', 0);
INSERT INTO `index_config` VALUES (38, 'apple', 4, 10916, '##', 200, 1, '2021-11-25 16:22:16', 0, '2021-12-01 15:00:54', 0);
INSERT INTO `index_config` VALUES (39, '微星', 4, 10913, '##', 300, 1, '2021-11-25 16:25:18', 0, '2021-12-01 15:00:54', 0);
INSERT INTO `index_config` VALUES (40, '维生素C', 4, 10933, '##', 100, 0, '2021-12-01 14:55:43', 0, '2021-12-01 14:55:43', 0);
INSERT INTO `index_config` VALUES (41, '养乐多', 4, 10932, '##', 99, 0, '2021-12-01 14:56:04', 0, '2021-12-01 14:56:04', 0);
INSERT INTO `index_config` VALUES (42, '补中益气颗粒', 4, 10929, '##', 98, 0, '2021-12-01 14:56:34', 0, '2021-12-01 14:56:34', 0);
INSERT INTO `index_config` VALUES (43, '三九胃泰颗粒', 4, 10926, '##', 97, 0, '2021-12-01 14:57:01', 0, '2021-12-01 14:57:01', 0);
INSERT INTO `index_config` VALUES (44, '亲肤沙星胶囊', 4, 10927, '##', 96, 1, '2021-12-01 14:57:49', 0, '2021-12-07 11:28:43', 0);
INSERT INTO `index_config` VALUES (45, '蜜炼川贝枇杷膏', 4, 10925, '##', 500, 1, '2021-12-01 14:58:18', 0, '2021-12-06 11:56:30', 0);
INSERT INTO `index_config` VALUES (46, '维生素C', 5, 10934, '##', 100, 0, '2021-12-01 14:58:51', 0, '2021-12-01 14:58:51', 0);
INSERT INTO `index_config` VALUES (47, '硝苯地平片', 5, 10924, '##', 99, 0, '2021-12-01 14:59:25', 0, '2021-12-01 14:59:25', 0);
INSERT INTO `index_config` VALUES (48, '阿仑膦酸钠', 5, 10928, '##', 97, 0, '2021-12-01 14:59:49', 0, '2021-12-01 14:59:49', 0);
INSERT INTO `index_config` VALUES (49, '注射器', 5, 10923, '##', 95, 0, '2021-12-01 15:00:05', 0, '2021-12-01 15:00:05', 0);
INSERT INTO `index_config` VALUES (50, '医用外科口罩', 5, 10922, '##', 92, 0, '2021-12-01 15:00:39', 0, '2021-12-01 15:00:39', 0);
INSERT INTO `index_config` VALUES (51, '三九胃泰颗粒', 5, 10926, '##', 0, 0, '2021-12-02 15:34:43', 0, '2021-12-02 15:34:43', 0);
INSERT INTO `index_config` VALUES (52, '注射器', 4, 10913, '##', 50, 1, '2021-12-02 15:35:49', 0, '2021-12-02 15:36:00', 0);
INSERT INTO `index_config` VALUES (53, 'dfdfgdfgdfgdfg', 4, 10934, '##', 300, 1, '2021-12-06 11:56:57', 0, '2021-12-06 11:57:03', 0);
INSERT INTO `index_config` VALUES (54, '氯雷他定片', 4, 10930, '##', 101, 0, '2021-12-07 11:29:15', 0, '2021-12-07 11:29:15', 0);
INSERT INTO `index_config` VALUES (55, '医用外科口罩', 4, 10922, '##', 900, 0, '2021-12-08 23:36:42', 0, '2021-12-08 23:36:42', 0);
INSERT INTO `index_config` VALUES (56, '血压器', 4, 10939, '##', 1000, 1, '2021-12-09 00:56:25', 0, '2021-12-09 10:01:46', 0);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户主键id',
  `total_price` int(11) NOT NULL DEFAULT 1,
  `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime(0) NULL DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (21, '16349769091124732', 1, 3744, 1, 1, '2021-10-23 16:16:06', 3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2021-10-23 16:15:09', '2021-10-23 16:17:34');
INSERT INTO `orders` VALUES (22, '16349773719177307', 1, 129, 1, 1, '2021-10-23 16:23:08', -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2021-10-23 16:22:51', '2021-10-23 16:23:41');
INSERT INTO `orders` VALUES (23, '16349781018398563', 1, 1499, 1, 1, '2021-10-23 16:35:26', -1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2021-10-23 16:35:01', '2021-10-23 16:35:45');
INSERT INTO `orders` VALUES (24, '16366010755893307', 1, 999, 1, 1, '2021-11-11 11:24:43', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 11:24:35', '2021-11-11 11:25:33');
INSERT INTO `orders` VALUES (25, '16366012429427969', 1, 6799, 1, 2, '2021-11-11 11:27:35', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 11:27:22', '2021-11-11 11:28:26');
INSERT INTO `orders` VALUES (26, '16366013438329758', 1, 9999, 1, 1, '2021-11-11 11:29:14', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 11:29:03', '2021-11-11 11:29:51');
INSERT INTO `orders` VALUES (27, '16366018659629083', 1, 7, 1, 1, '2021-11-11 11:38:16', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 11:37:45', '2021-11-11 11:38:49');
INSERT INTO `orders` VALUES (28, '16366192579323275', 1, 79883, 1, 1, '2021-11-11 16:27:49', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 16:27:37', '2021-11-11 16:28:07');
INSERT INTO `orders` VALUES (29, '16366213535492265', 1, 24393, 1, 1, '2021-11-11 17:02:37', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 17:02:33', '2021-11-11 17:03:28');
INSERT INTO `orders` VALUES (30, '16366234981438797', 1, 12126, 1, 1, '2021-11-11 17:38:21', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 17:38:18', '2021-11-11 17:39:06');
INSERT INTO `orders` VALUES (31, '16366236617077492', 1, 21, 1, 2, '2021-11-11 17:41:05', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 17:41:01', '2021-11-11 17:41:05');
INSERT INTO `orders` VALUES (32, '16366295753108721', 1, 11997, 1, 1, '2021-11-11 19:19:38', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 19:19:35', '2021-11-11 19:20:58');
INSERT INTO `orders` VALUES (33, '16366297543006479', 1, 12995, 1, 1, '2021-11-11 19:22:48', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 19:22:34', '2021-11-11 19:23:14');
INSERT INTO `orders` VALUES (34, '16366299327441630', 1, 5198, 1, 2, '2021-11-11 19:25:35', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 19:25:32', '2021-11-11 19:26:03');
INSERT INTO `orders` VALUES (35, '16366303222928603', 1, 3738, 1, 2, '2021-11-11 19:32:05', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 19:32:02', '2021-11-11 19:32:29');
INSERT INTO `orders` VALUES (36, '16366311566339384', 1, 28194, 1, 1, '2021-11-11 19:46:02', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 19:45:56', '2021-11-11 19:46:22');
INSERT INTO `orders` VALUES (37, '16366314479811150', 1, 13728, 1, 2, '2021-11-11 19:50:52', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 19:50:47', '2021-11-11 19:51:09');
INSERT INTO `orders` VALUES (38, '16366317429617813', 1, 7797, 1, 2, '2021-11-11 19:55:46', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 19:55:42', '2021-11-11 19:55:59');
INSERT INTO `orders` VALUES (39, '16366335357444499', 1, 3738, 1, 1, '2021-11-11 20:25:38', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 20:25:35', '2021-11-11 20:25:52');
INSERT INTO `orders` VALUES (40, '16366379043031919', 1, 11997, 1, 1, '2021-11-11 21:38:27', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-11 21:38:24', '2021-11-11 21:38:42');
INSERT INTO `orders` VALUES (41, '16367965297133996', 1, 7797, 1, 2, '2021-11-13 17:42:13', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-13 17:42:09', '2021-11-13 17:43:05');
INSERT INTO `orders` VALUES (42, '16367966422622791', 1, 1246, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-13 17:44:02', '2021-11-13 17:44:18');
INSERT INTO `orders` VALUES (43, '16368105540565090', 1, 2000, 1, 2, '2021-11-13 21:35:57', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-13 21:35:54', '2021-11-13 21:36:20');
INSERT INTO `orders` VALUES (44, '16368608512605083', 1, 27196, 1, 1, '2021-11-14 11:34:15', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-14 11:34:11', '2021-11-14 11:34:32');
INSERT INTO `orders` VALUES (45, '16368610076251702', 1, 33995, 1, 2, '2021-11-14 11:36:50', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-14 11:36:47', '2021-11-14 11:37:05');
INSERT INTO `orders` VALUES (46, '16368817270988386', 1, 3999, 1, 2, '2021-11-14 17:22:10', -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-14 17:22:07', '2021-11-14 17:22:24');
INSERT INTO `orders` VALUES (47, '16368817591683705', 1, 3999, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-14 17:22:39', '2021-11-14 17:22:54');
INSERT INTO `orders` VALUES (48, '16369601231035295', 1, 3997, 1, 2, '2021-11-15 15:08:46', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 15:08:43', '2021-11-23 16:19:36');
INSERT INTO `orders` VALUES (49, '16369645983289015', 1, 20397, 1, 2, '2021-11-15 16:23:21', -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 16:23:18', '2021-11-15 16:23:44');
INSERT INTO `orders` VALUES (50, '16369646484104199', 1, 1246, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 16:24:08', '2021-11-15 16:24:15');
INSERT INTO `orders` VALUES (51, '16369658799584589', 1, 3999, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 16:44:39', '2021-11-15 16:44:49');
INSERT INTO `orders` VALUES (52, '16369662162665589', 1, 3000, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 16:50:16', '2021-11-15 16:50:23');
INSERT INTO `orders` VALUES (53, '16369662383214617', 1, 29997, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 16:50:38', '2021-11-15 16:50:43');
INSERT INTO `orders` VALUES (54, '16369666372596181', 1, 3999, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 16:57:17', '2021-11-15 16:57:22');
INSERT INTO `orders` VALUES (55, '16369668643727085', 1, 2599, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 17:01:04', '2021-11-15 17:01:08');
INSERT INTO `orders` VALUES (56, '16369671145953439', 1, 6799, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 17:05:14', '2021-11-15 17:05:27');
INSERT INTO `orders` VALUES (57, '16369677446121371', 1, 20397, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 17:15:44', '2021-11-15 17:15:49');
INSERT INTO `orders` VALUES (58, '16369678095265385', 1, 999, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-15 17:16:49', '2021-11-15 17:16:57');
INSERT INTO `orders` VALUES (59, '16371341756659274', 1, 15398, 1, 1, '2021-11-17 15:29:52', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-17 15:29:35', '2021-11-17 15:30:38');
INSERT INTO `orders` VALUES (60, '16371343409335591', 1, 3999, 0, 0, NULL, -3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-17 15:32:20', '2021-11-17 15:37:54');
INSERT INTO `orders` VALUES (61, '16371350827915631', 1, 3914, 1, 1, '2021-11-17 15:44:52', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-17 15:44:42', '2021-11-17 15:44:52');
INSERT INTO `orders` VALUES (62, '16371356319539936', 1, 3999, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-17 15:53:51', '2021-11-17 15:53:51');
INSERT INTO `orders` VALUES (63, '16371358262289503', 1, 3999, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-17 15:57:06', '2021-11-17 15:57:06');
INSERT INTO `orders` VALUES (64, '16372430037386618', 10, 6337, 1, 1, '2021-11-18 21:43:26', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-18 21:43:23', '2021-11-18 21:43:50');
INSERT INTO `orders` VALUES (65, '16372866771964483', 1, 7583, 1, 1, '2021-11-19 09:51:21', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx270', 0, '2021-11-19 09:51:17', '2021-11-19 09:51:58');
INSERT INTO `orders` VALUES (66, '16372884395839300', 1, 130, 1, 1, '2021-11-19 10:20:43', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 10:20:39', '2021-11-19 10:21:09');
INSERT INTO `orders` VALUES (67, '16372904229003146', 1, 432, 1, 2, '2021-11-19 10:53:45', 1, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 10:53:42', '2021-11-19 10:53:45');
INSERT INTO `orders` VALUES (68, '16372905080031539', 1, 2397, 1, 1, '2021-11-19 10:55:10', 1, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 10:55:08', '2021-11-19 10:55:10');
INSERT INTO `orders` VALUES (69, '16373111226815270', 1, 1814, 1, 1, '2021-11-19 16:38:45', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 16:38:42', '2021-11-19 16:39:07');
INSERT INTO `orders` VALUES (70, '16373121604217327', 1, 67, 1, 1, '2021-11-19 16:56:03', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 16:56:00', '2021-11-19 16:56:24');
INSERT INTO `orders` VALUES (71, '16373188019581674', 1, 866, 1, 2, '2021-11-19 18:46:44', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 18:46:41', '2021-11-19 18:47:02');
INSERT INTO `orders` VALUES (72, '16373271222967589', 1, 195, 1, 1, '2021-11-19 21:05:25', 1, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 21:05:22', '2021-11-19 21:05:25');
INSERT INTO `orders` VALUES (73, '16373273876984159', 1, 799, 1, 1, '2021-11-19 21:10:36', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-19 21:09:47', '2021-11-19 21:10:48');
INSERT INTO `orders` VALUES (74, '16379233527894664', 10, 20000, 1, 2, '2021-11-26 18:42:36', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-26 18:42:32', '2021-11-26 18:43:21');
INSERT INTO `orders` VALUES (75, '16379235790028013', 10, 3536, 1, 2, '2021-11-26 18:46:22', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-26 18:46:19', '2021-11-26 18:46:54');
INSERT INTO `orders` VALUES (76, '16379245815499671', 10, 40969, 1, 1, '2021-11-26 19:03:05', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-26 19:03:01', '2021-11-26 19:03:31');
INSERT INTO `orders` VALUES (77, '16379248453824659', 10, 618, 1, 1, '2021-11-26 19:07:28', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-26 19:07:25', '2021-11-26 19:07:47');
INSERT INTO `orders` VALUES (78, '16379251261366713', 10, 1054, 1, 1, '2021-11-26 19:12:09', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-26 19:12:06', '2021-11-26 19:12:24');
INSERT INTO `orders` VALUES (79, '16379277837818983', 10, 20716, 1, 2, '2021-11-26 19:56:26', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-26 19:56:23', '2021-11-26 19:56:52');
INSERT INTO `orders` VALUES (80, '16381540873057737', 10, 6684, 1, 1, '2021-11-29 10:48:15', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-29 10:48:07', '2021-11-29 10:48:53');
INSERT INTO `orders` VALUES (81, '16381542737641221', 10, 2397, 1, 2, '2021-11-29 10:51:16', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-11-29 10:51:13', '2021-11-29 10:51:39');
INSERT INTO `orders` VALUES (82, '16383461928916163', 10, 28, 0, 0, NULL, 0, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-01 16:09:52', '2021-12-01 16:09:52');
INSERT INTO `orders` VALUES (83, '16383463078499371', 10, 25, 0, 0, NULL, -3, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-01 16:11:47', '2021-12-05 19:01:52');
INSERT INTO `orders` VALUES (84, '16383463475436793', 10, 2, 1, 1, '2021-12-01 16:12:35', 1, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-01 16:12:27', '2021-12-01 16:12:35');
INSERT INTO `orders` VALUES (85, '16384307756357342', 10, 2, 1, 1, '2021-12-02 15:39:40', 4, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-02 15:39:35', '2021-12-02 15:39:59');
INSERT INTO `orders` VALUES (86, '16386400705531795', 10, 295, 1, 2, '2021-12-05 01:47:53', 4, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-05 01:47:50', '2021-12-05 01:48:35');
INSERT INTO `orders` VALUES (87, '16386403217092482', 10, 125, 1, 2, '2021-12-05 01:52:04', 4, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-05 01:52:01', '2021-12-05 01:52:14');
INSERT INTO `orders` VALUES (88, '16386410011997466', 10, 425, 1, 2, '2021-12-05 02:03:23', 4, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-05 02:03:21', '2021-12-05 02:03:46');
INSERT INTO `orders` VALUES (89, '16386413916961977', 10, 25, 1, 2, '2021-12-05 02:09:54', 1, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-05 02:09:51', '2021-12-05 02:09:54');
INSERT INTO `orders` VALUES (90, '16386414502127146', 10, 100, 0, 0, NULL, 0, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-05 02:10:50', '2021-12-05 02:10:50');
INSERT INTO `orders` VALUES (91, '16386828851537916', 10, 100, 1, 1, '2021-12-05 13:41:28', 4, '', '', '', '广东省广州市从化区太平镇', 0, '2021-12-05 13:41:25', '2021-12-05 13:41:52');
INSERT INTO `orders` VALUES (92, '16386854134333918', 10, 34, 1, 1, '2021-12-05 14:23:35', 4, '', '', '', '广东省广州市从化区太平镇ddd', 0, '2021-12-05 14:23:33', '2021-12-05 14:24:00');
INSERT INTO `orders` VALUES (93, '16386867818256622', 10, 25, 1, 2, '2021-12-05 14:46:32', 4, '', '', '', '广东省广州市从化区太平镇ddd', 0, '2021-12-05 14:46:21', '2021-12-05 14:46:57');
INSERT INTO `orders` VALUES (94, '16386868746681058', 10, 34, 1, 2, '2021-12-05 14:48:01', 4, '', '', '', '广东省广州市从化区太平镇ddd', 0, '2021-12-05 14:47:54', '2021-12-05 14:48:18');
INSERT INTO `orders` VALUES (95, '16386869441865006', 10, 25, 1, 1, '2021-12-05 14:49:07', 4, '', '', '', '广东省广州市从化区太平镇ddd', 0, '2021-12-05 14:49:04', '2021-12-05 14:49:14');
INSERT INTO `orders` VALUES (96, '16387189560236778', 10, 170, 1, 2, '2021-12-05 23:42:38', 4, '', '', '', '广东省广州市从化区太平镇ddd', 0, '2021-12-05 23:42:36', '2021-12-05 23:43:02');
INSERT INTO `orders` VALUES (97, '16387627895369106', 10, 75, 1, 2, '2021-12-06 11:53:12', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 11:53:09', '2021-12-06 11:53:23');
INSERT INTO `orders` VALUES (98, '16387628252557122', 10, 202, 1, 1, '2021-12-06 11:53:48', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 11:53:45', '2021-12-06 11:54:02');
INSERT INTO `orders` VALUES (99, '16387633030018466', 10, 1, 1, 2, '2021-12-06 12:01:46', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 12:01:43', '2021-12-06 12:02:04');
INSERT INTO `orders` VALUES (100, '16387699336968525', 10, 42, 1, 1, '2021-12-06 13:52:17', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 13:52:13', '2021-12-06 13:52:46');
INSERT INTO `orders` VALUES (101, '16387700220568138', 10, 125, 1, 1, '2021-12-06 13:53:44', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 13:53:42', '2021-12-06 13:54:19');
INSERT INTO `orders` VALUES (102, '16387700796771470', 10, 175, 1, 1, '2021-12-06 13:54:42', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 13:54:39', '2021-12-06 13:54:57');
INSERT INTO `orders` VALUES (103, '16387701284152299', 10, 200, 1, 1, '2021-12-06 13:55:31', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 13:55:28', '2021-12-06 13:55:45');
INSERT INTO `orders` VALUES (104, '16387721091495220', 10, 104, 1, 1, '2021-12-06 14:28:40', 1, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 14:28:29', '2021-12-06 14:28:40');
INSERT INTO `orders` VALUES (105, '16387770741611726', 10, 34, 1, 2, '2021-12-06 15:51:20', 4, '', '', '', '广东省广州市从化区太平镇222222222222', 0, '2021-12-06 15:51:14', '2021-12-06 15:56:38');
INSERT INTO `orders` VALUES (106, '16387787912942208', 10, 2, 1, 1, '2021-12-06 16:21:03', 4, '', '', '', '广东省广州市从化区太平镇111111111111111111111', 0, '2021-12-06 16:19:51', '2021-12-06 16:21:27');
INSERT INTO `orders` VALUES (107, '16387790388903972', 10, 2, 1, 1, '2021-12-06 16:58:45', 1, '', '', '', '广东省广州市从化区太平镇111111111111111111111', 0, '2021-12-06 16:23:58', '2021-12-06 16:58:45');
INSERT INTO `orders` VALUES (108, '16387814090692210', 10, 45, 1, 2, '2021-12-06 17:04:16', 1, '', '', '', '广东省广州市从化区太平镇111111111111111111111', 0, '2021-12-06 17:03:29', '2021-12-06 17:04:16');
INSERT INTO `orders` VALUES (109, '16387902626277483', 10, 464, 1, 1, '2021-12-06 19:31:07', 4, '', '', '', '广东省广州市从化区太平镇111111111111111111111', 0, '2021-12-06 19:31:02', '2021-12-06 19:32:11');
INSERT INTO `orders` VALUES (110, '16387927219192449', 10, 27, 1, 2, '2021-12-06 20:12:20', 4, '', '', '', '广东省广州市从化区太平镇111111111111111111111', 0, '2021-12-06 20:12:01', '2021-12-06 20:12:54');
INSERT INTO `orders` VALUES (111, '16387947299248433', 10, 68, 1, 2, '2021-12-06 20:45:34', 4, '', '', '', '广东省广州市从化区太平镇111111111111111111111', 0, '2021-12-06 20:45:29', '2021-12-06 20:46:10');
INSERT INTO `orders` VALUES (112, '16388470135112987', 10, 200, 1, 1, '2021-12-07 11:16:57', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院222222222222222', 0, '2021-12-07 11:16:53', '2021-12-07 11:17:13');
INSERT INTO `orders` VALUES (113, '16388876209281648', 10, 175, 1, 2, '2021-12-07 22:33:47', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院222222222222222', 0, '2021-12-07 22:33:40', '2021-12-07 22:34:16');
INSERT INTO `orders` VALUES (114, '16388890738281754', 10, 102, 1, 2, '2021-12-07 22:58:16', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院222222222222222', 0, '2021-12-07 22:57:53', '2021-12-07 22:59:17');
INSERT INTO `orders` VALUES (115, '16389315887088732', 10, 34, 1, 2, '2021-12-08 10:46:33', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院222222222222222', 0, '2021-12-08 10:46:28', '2021-12-08 10:46:55');
INSERT INTO `orders` VALUES (116, '16389318837993270', 10, 68, 1, 1, '2021-12-08 10:51:28', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院222222222222222', 0, '2021-12-08 10:51:23', '2021-12-08 10:51:49');
INSERT INTO `orders` VALUES (117, '16389546925505066', 10, 169, 1, 2, '2021-12-08 18:25:07', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 17:11:32', '2021-12-08 18:52:28');
INSERT INTO `orders` VALUES (118, '16389653289704986', 10, 25, 1, 2, '2021-12-08 20:08:53', 1, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:08:48', '2021-12-08 20:08:53');
INSERT INTO `orders` VALUES (119, '16389653417352000', 10, 45, 0, 0, NULL, -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:09:01', '2021-12-08 20:11:53');
INSERT INTO `orders` VALUES (120, '16389653497478823', 10, 20, 0, 0, NULL, -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:09:09', '2021-12-08 20:11:53');
INSERT INTO `orders` VALUES (121, '16389654502413073', 10, 34, 0, 0, NULL, -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:10:50', '2021-12-08 20:11:53');
INSERT INTO `orders` VALUES (122, '16389654568545763', 10, 7, 0, 0, NULL, -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:10:56', '2021-12-08 20:11:53');
INSERT INTO `orders` VALUES (123, '16389654733232622', 10, 25, 0, 0, NULL, -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:11:13', '2021-12-08 20:11:53');
INSERT INTO `orders` VALUES (124, '16389654842291336', 10, 2, 0, 0, NULL, -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:11:24', '2021-12-08 20:11:53');
INSERT INTO `orders` VALUES (125, '16389659247947648', 10, 102, 0, 0, NULL, 0, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:18:44', '2021-12-08 20:18:44');
INSERT INTO `orders` VALUES (126, '16389662711477244', 10, 1, 1, 1, '2021-12-08 20:24:34', -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:24:31', '2021-12-08 20:24:53');
INSERT INTO `orders` VALUES (127, '16389663667383731', 10, 1, 1, 2, '2021-12-08 20:26:37', -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:26:06', '2021-12-08 20:26:55');
INSERT INTO `orders` VALUES (128, '16389664295341402', 10, 34, 1, 2, '2021-12-08 20:27:12', -3, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:27:09', '2021-12-08 20:27:25');
INSERT INTO `orders` VALUES (129, '16389668396783216', 10, 25, 1, 1, '2021-12-08 20:34:15', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院', 0, '2021-12-08 20:33:59', '2021-12-08 20:35:32');
INSERT INTO `orders` VALUES (130, '16389772683025215', 10, 160, 1, 2, '2021-12-08 23:28:21', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院清风阁t123', 0, '2021-12-08 23:27:48', '2021-12-08 23:29:26');
INSERT INTO `orders` VALUES (131, '16390157742524979', 10, 9, 1, 2, '2021-12-09 10:09:37', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院清风阁t123', 0, '2021-12-09 10:09:34', '2021-12-09 10:09:53');
INSERT INTO `orders` VALUES (132, '16390158611783733', 10, 5, 1, 1, '2021-12-09 10:11:05', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院清风阁t123', 0, '2021-12-09 10:11:01', '2021-12-09 10:11:24');
INSERT INTO `orders` VALUES (133, '16390160625022079', 10, 2, 1, 1, '2021-12-09 10:14:25', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院清风阁t123', 0, '2021-12-09 10:14:22', '2021-12-09 10:14:36');
INSERT INTO `orders` VALUES (134, '16390225483966778', 10, 184, 1, 1, '2021-12-09 12:02:46', 4, '', '', '', '广东省广州市从化区太平镇广州软件学院清风阁t123', 0, '2021-12-09 12:02:28', '2021-12-09 12:03:53');

-- ----------------------------
-- Table structure for orders_item
-- ----------------------------
DROP TABLE IF EXISTS `orders_item`;
CREATE TABLE `orders_item`  (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `selling_price` int(11) NOT NULL DEFAULT 1,
  `goods_count` int(11) NOT NULL DEFAULT 1,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_item
-- ----------------------------
INSERT INTO `orders_item` VALUES (128, 82, 10922, '医用外科口罩', 'http://localhost:28089/upload/20211201_11475089.jpg', 1, 1, '2021-12-01 16:09:52');
INSERT INTO `orders_item` VALUES (129, 82, 10917, '手套', 'http://localhost:28089/upload/20211111_10510286.jpg', 2, 1, '2021-12-01 16:09:52');
INSERT INTO `orders_item` VALUES (130, 82, 10933, '维生素B', 'http://localhost:28089/upload/20211201_14473477.jpg', 25, 1, '2021-12-01 16:09:52');
INSERT INTO `orders_item` VALUES (131, 83, 10933, '维生素B', 'http://localhost:28089/upload/20211201_14473477.jpg', 25, 1, '2021-12-01 16:11:47');
INSERT INTO `orders_item` VALUES (132, 84, 10917, '手套', 'http://localhost:28089/upload/20211111_10510286.jpg', 2, 1, '2021-12-01 16:12:27');
INSERT INTO `orders_item` VALUES (133, 85, 10917, '手套', 'http://localhost:28089/upload/20211111_10510286.jpg', 2, 1, '2021-12-02 15:39:35');
INSERT INTO `orders_item` VALUES (134, 86, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 5, '2021-12-05 01:47:50');
INSERT INTO `orders_item` VALUES (135, 86, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 5, '2021-12-05 01:47:50');
INSERT INTO `orders_item` VALUES (136, 87, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 5, '2021-12-05 01:52:01');
INSERT INTO `orders_item` VALUES (137, 88, 10929, '补中益气颗粒', 'http://localhost:8081/upload/20211201_14445495.jpg', 45, 5, '2021-12-05 02:03:21');
INSERT INTO `orders_item` VALUES (138, 88, 10926, '三九胃泰颗粒', 'http://localhost:8081/upload/20211201_14424473.jpg', 25, 5, '2021-12-05 02:03:21');
INSERT INTO `orders_item` VALUES (139, 88, 10928, '阿仑膦酸钠', 'http://localhost:8081/upload/20211201_14441383.jpg', 15, 5, '2021-12-05 02:03:21');
INSERT INTO `orders_item` VALUES (140, 89, 10923, '注射器', 'http://localhost:8081/upload/20211201_14385367.jpg', 5, 5, '2021-12-05 02:09:51');
INSERT INTO `orders_item` VALUES (141, 90, 10924, '硝苯地平片', 'http://localhost:8081/upload/20211201_14404162.jpg', 20, 5, '2021-12-05 02:10:50');
INSERT INTO `orders_item` VALUES (142, 91, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 4, '2021-12-05 13:41:25');
INSERT INTO `orders_item` VALUES (143, 92, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-05 14:23:33');
INSERT INTO `orders_item` VALUES (144, 93, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 1, '2021-12-05 14:46:21');
INSERT INTO `orders_item` VALUES (145, 94, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-05 14:47:54');
INSERT INTO `orders_item` VALUES (146, 95, 10923, '注射器', 'http://localhost:8081/upload/20211201_14385367.jpg', 5, 5, '2021-12-05 14:49:04');
INSERT INTO `orders_item` VALUES (147, 96, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 5, '2021-12-05 23:42:36');
INSERT INTO `orders_item` VALUES (148, 97, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 3, '2021-12-06 11:53:09');
INSERT INTO `orders_item` VALUES (149, 98, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 3, '2021-12-06 11:53:45');
INSERT INTO `orders_item` VALUES (150, 98, 10926, '三九胃泰颗粒', 'http://localhost:8081/upload/20211201_14424473.jpg', 25, 4, '2021-12-06 11:53:45');
INSERT INTO `orders_item` VALUES (151, 99, 10938, 'efefwefw', 'http://localhost:8081/upload/20211206_1201107.jpg', 1, 1, '2021-12-06 12:01:43');
INSERT INTO `orders_item` VALUES (152, 100, 10934, '维生素C', 'http://localhost:8081/upload/20211201_14480325.jpg', 7, 6, '2021-12-06 13:52:13');
INSERT INTO `orders_item` VALUES (153, 101, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 5, '2021-12-06 13:53:42');
INSERT INTO `orders_item` VALUES (154, 102, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 7, '2021-12-06 13:54:39');
INSERT INTO `orders_item` VALUES (155, 103, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 8, '2021-12-06 13:55:28');
INSERT INTO `orders_item` VALUES (156, 104, 10929, '补中益气颗粒', 'http://localhost:8081/upload/20211201_14445495.jpg', 45, 1, '2021-12-06 14:28:29');
INSERT INTO `orders_item` VALUES (157, 104, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-06 14:28:29');
INSERT INTO `orders_item` VALUES (158, 104, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 1, '2021-12-06 14:28:29');
INSERT INTO `orders_item` VALUES (159, 105, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-06 15:51:14');
INSERT INTO `orders_item` VALUES (160, 106, 10917, '手套', 'http://localhost:8081/upload/20211111_10510286.jpg', 2, 1, '2021-12-06 16:19:51');
INSERT INTO `orders_item` VALUES (161, 107, 10917, '手套', 'http://localhost:8081/upload/20211111_10510286.jpg', 2, 1, '2021-12-06 16:23:58');
INSERT INTO `orders_item` VALUES (162, 108, 10929, '补中益气颗粒', 'http://localhost:8081/upload/20211201_14445495.jpg', 45, 1, '2021-12-06 17:03:29');
INSERT INTO `orders_item` VALUES (163, 109, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 4, '2021-12-06 19:31:02');
INSERT INTO `orders_item` VALUES (164, 109, 10926, '三九胃泰颗粒', 'http://localhost:8081/upload/20211201_14424473.jpg', 25, 4, '2021-12-06 19:31:02');
INSERT INTO `orders_item` VALUES (165, 109, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 4, '2021-12-06 19:31:02');
INSERT INTO `orders_item` VALUES (166, 109, 10934, '维生素C', 'http://localhost:8081/upload/20211201_14480325.jpg', 7, 4, '2021-12-06 19:31:02');
INSERT INTO `orders_item` VALUES (167, 109, 10924, '硝苯地平片', 'http://localhost:8081/upload/20211201_14404162.jpg', 20, 5, '2021-12-06 19:31:02');
INSERT INTO `orders_item` VALUES (168, 110, 10917, '手套', 'http://localhost:8081/upload/20211111_10510286.jpg', 2, 1, '2021-12-06 20:12:01');
INSERT INTO `orders_item` VALUES (169, 110, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 1, '2021-12-06 20:12:01');
INSERT INTO `orders_item` VALUES (170, 111, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 2, '2021-12-06 20:45:29');
INSERT INTO `orders_item` VALUES (171, 112, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 4, '2021-12-07 11:16:53');
INSERT INTO `orders_item` VALUES (172, 112, 10926, '三九胃泰颗粒', 'http://localhost:8081/upload/20211201_14424473.jpg', 25, 4, '2021-12-07 11:16:53');
INSERT INTO `orders_item` VALUES (173, 113, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 4, '2021-12-07 22:33:40');
INSERT INTO `orders_item` VALUES (174, 113, 10926, '三九胃泰颗粒', 'http://localhost:8081/upload/20211201_14424473.jpg', 25, 3, '2021-12-07 22:33:40');
INSERT INTO `orders_item` VALUES (175, 114, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 3, '2021-12-07 22:57:53');
INSERT INTO `orders_item` VALUES (176, 115, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-08 10:46:28');
INSERT INTO `orders_item` VALUES (177, 116, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 2, '2021-12-08 10:51:23');
INSERT INTO `orders_item` VALUES (178, 117, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-08 17:11:32');
INSERT INTO `orders_item` VALUES (179, 117, 10929, '补中益气颗粒', 'http://localhost:8081/upload/20211201_14445495.jpg', 45, 3, '2021-12-08 17:11:32');
INSERT INTO `orders_item` VALUES (180, 118, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 1, '2021-12-08 20:08:48');
INSERT INTO `orders_item` VALUES (181, 119, 10929, '补中益气颗粒', 'http://localhost:8081/upload/20211201_14445495.jpg', 45, 1, '2021-12-08 20:09:01');
INSERT INTO `orders_item` VALUES (182, 120, 10924, '硝苯地平片', 'http://localhost:8081/upload/20211201_14404162.jpg', 20, 1, '2021-12-08 20:09:09');
INSERT INTO `orders_item` VALUES (183, 121, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-08 20:10:50');
INSERT INTO `orders_item` VALUES (184, 122, 10934, '维生素C', 'http://localhost:8081/upload/20211201_14480325.jpg', 7, 1, '2021-12-08 20:10:56');
INSERT INTO `orders_item` VALUES (185, 123, 10930, '氯雷他定片', 'http://localhost:8081/upload/20211201_14452922.jpg', 25, 1, '2021-12-08 20:11:13');
INSERT INTO `orders_item` VALUES (186, 124, 10917, '手套', 'http://localhost:8081/upload/20211111_10510286.jpg', 2, 1, '2021-12-08 20:11:24');
INSERT INTO `orders_item` VALUES (187, 125, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 3, '2021-12-08 20:18:44');
INSERT INTO `orders_item` VALUES (188, 126, 10940, '测测', 'http://localhost:8081/upload/20211208_20233795.jpg', 1, 1, '2021-12-08 20:24:31');
INSERT INTO `orders_item` VALUES (189, 127, 10940, '测测', 'http://localhost:8081/upload/20211208_20233795.jpg', 1, 1, '2021-12-08 20:26:06');
INSERT INTO `orders_item` VALUES (190, 128, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 1, '2021-12-08 20:27:09');
INSERT INTO `orders_item` VALUES (191, 129, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 1, '2021-12-08 20:33:59');
INSERT INTO `orders_item` VALUES (192, 130, 10933, '维生素B', 'http://localhost:8081/upload/20211201_14473477.jpg', 25, 4, '2021-12-08 23:27:48');
INSERT INTO `orders_item` VALUES (193, 130, 10924, '硝苯地平片', 'http://localhost:8081/upload/20211201_14404162.jpg', 20, 3, '2021-12-08 23:27:48');
INSERT INTO `orders_item` VALUES (194, 131, 10943, 'cece', 'http://localhost:8081/upload/20211209_10091470.jpg', 1, 9, '2021-12-09 10:09:34');
INSERT INTO `orders_item` VALUES (195, 132, 10935, 'sdfsdf', 'http://localhost:8081/upload/20211203_18594749.jpg', 1, 5, '2021-12-09 10:11:01');
INSERT INTO `orders_item` VALUES (196, 133, 10922, '医用外科口罩', 'http://localhost:8081/upload/20211201_11475089.jpg', 1, 2, '2021-12-09 10:14:22');
INSERT INTO `orders_item` VALUES (197, 134, 10930, '氯雷他定片', 'http://localhost:8081/upload/20211201_14452922.jpg', 25, 3, '2021-12-09 12:02:28');
INSERT INTO `orders_item` VALUES (198, 134, 10932, '养乐多', 'http://localhost:8081/upload/20211201_14463723.jpg', 34, 3, '2021-12-09 12:02:28');
INSERT INTO `orders_item` VALUES (199, 134, 10934, '维生素C', 'http://localhost:8081/upload/20211201_14480325.jpg', 7, 1, '2021-12-09 12:02:28');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `introduce_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `locked_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (9, '15820317818', '15820317818', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '2021-10-23 19:40:06');
INSERT INTO `user` VALUES (10, '陈奕耿', '17827100179', '25f9e794323b453885f5181f1b624d0b', '计算机系学生', '广东省广州市从化区太平镇广州软件学院清风阁t123', 0, 0, '2021-11-10 11:53:31');
INSERT INTO `user` VALUES (11, '123456', '123456', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '2021-11-30 19:27:14');
INSERT INTO `user` VALUES (12, '13543139985', '13543139985', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '2021-12-07 15:34:38');

SET FOREIGN_KEY_CHECKS = 1;
