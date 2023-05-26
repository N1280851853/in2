/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : books

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 26/05/2023 17:37:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `Book_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '书的编号',
  `Name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '书名',
  `Author` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `Inventery` int(0) NULL DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`Book_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('001', '三国演义', '罗贯中', 9);
INSERT INTO `book` VALUES ('002', '水浒传', '施耐庵', 10);
INSERT INTO `book` VALUES ('003', '西游记', '吴承恩', 10);
INSERT INTO `book` VALUES ('004', '红楼梦', '曹雪芹', 10);
INSERT INTO `book` VALUES ('005', '倚天屠龙记', '金庸', 10);
INSERT INTO `book` VALUES ('006', '雪中悍刀行', '烽火戏诸侯', 10);
INSERT INTO `book` VALUES ('007', '瓦尔登湖', '梭罗', 10);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `Stu_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `Book_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '图书编号',
  `Borrow_time` datetime(0) NULL DEFAULT NULL COMMENT '借阅时间',
  `Return_time` datetime(0) NULL DEFAULT NULL COMMENT '归还时间',
  `State` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图书状态',
  INDEX `Stu_id`(`Stu_id`) USING BTREE,
  INDEX `Book_id`(`Book_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('111', '001', '2023-05-25 18:57:43', '2024-03-25 18:57:43', '三国演义(借阅中)');
INSERT INTO `borrow` VALUES ('222', '005', '2023-05-25 18:53:52', NULL, '已归还');
INSERT INTO `borrow` VALUES ('333', '003', '2023-05-26 10:29:40', NULL, '已归还');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `Account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `Annotation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Account`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('111', '111', '普通用户');
INSERT INTO `login` VALUES ('222', '222', '普通用户');
INSERT INTO `login` VALUES ('333', '333', '普通用户');
INSERT INTO `login` VALUES ('444', '444', '普通用户');
INSERT INTO `login` VALUES ('admin', 'admin', '管理员');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Stu_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `Stu_tel` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`Stu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('111', 'tom', '男', 22, '15628498352');
INSERT INTO `student` VALUES ('222', 'jack', '男', 26, '18262944856');
INSERT INTO `student` VALUES ('333', 'roce', '女', 40, '16283499652');
INSERT INTO `student` VALUES ('444', '赵四', '男', 18, '12903976478');

SET FOREIGN_KEY_CHECKS = 1;
