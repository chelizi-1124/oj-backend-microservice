/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : oj_db

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 23/01/2024 15:06:01
*/
create database if not exists oj_db;
use oj_db;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `thumbNum` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int(11) NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '帖子' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for post_favour
-- ----------------------------
DROP TABLE IF EXISTS `post_favour`;
CREATE TABLE `post_favour`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '帖子收藏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_favour
-- ----------------------------

-- ----------------------------
-- Table structure for post_thumb
-- ----------------------------
DROP TABLE IF EXISTS `post_thumb`;
CREATE TABLE `post_thumb`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `postId` bigint(20) NOT NULL COMMENT '帖子 id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_postId`(`postId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '帖子点赞' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_thumb
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT ' 題目答案',
  `submitNum` int(11) NOT NULL DEFAULT 0 COMMENT '題目提交数',
  `acceptedNum` int(11) NOT NULL DEFAULT 0 COMMENT '題目通过数',
  `judgeCase` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题用例（json数组）',
  `judgeConfig` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题配置（json数组）',
  `thumbNum` int(11) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `favourNum` int(11) NOT NULL DEFAULT 0 COMMENT '收藏数',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1749064763410841602 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '題目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1738790934979833858, 'A+B', '题目内容', '[\"栈\",\"简单\",\"二叉树\"]', '3', 0, 0, '[{\"input\":\"1 3\",\"output\":\"4\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1003}', 0, 0, 1737086735523008513, '2023-12-24 13:17:18', '2024-01-18 21:53:41', 0);
INSERT INTO `question` VALUES (1739288556459057154, '给定一所学校学生的 C 语言成绩，请你统计全班的平均成绩和男生、女生的平均成绩。', '输入格式：\n输入首先在第一行中给出一个正整数 N（≤10000），即全校学生人数。最后 N 行，每行按照格式 性别 成绩 给出一位学生的信息。其中 性别 为 1 表示男生，0 表示女生；成绩 是一个 0 到 100 之间的整数。\n\n输出格式：\n在一行中依次输出全班的平均成绩、男生的平均成绩、女生的平均成绩。输出小数点后1位，数字间有一个空格分隔。\n\n注意：如果全是男生或全是女生，则缺少的性别就没有办法计算平均分，相应的位置应该输出一个 X 表示没有。', '[\"简单题\"]', '3', 0, 0, '[{\"input\":\"1 3\",\"output\":\"4\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1737086735523008513, '2023-12-25 22:14:40', '2023-12-27 10:04:18', 1);
INSERT INTO `question` VALUES (1739831559056097282, '自动编程', '**输出语句是每个程序员首先要掌握的语句。Python 的输出语句很简单，只要写一个 print(X) 即可，其中 X 是需要输出的内容。**\n\n本题就请你写一个自动编程机，对任何一个要输出的整数 N，给出输出这个整数的 Python 语句。\n\n**输入格式：**\n输入给出一个不超过 105的正整数。\n\n**输出格式：**\n在一行中打印输出这个整数的 Python 语句，其中不包含任何空格。', '[\"简单\"]', '```\nimport java.util.Scanner;\npublic class Main {\n    public static void main(String[] args) {\n        Scanner in = new Scanner(System.in);\n            int a = in.nextInt();\n            System.out.println(\"print\"+\"(\"+a+\")\");\n        }\n    }\n```', 0, 0, '[{\"input\":\"520\",\"output\":\"print(520)\"}]', '{\"timeLimit\":16,\"memoryLimit\":400,\"stackLimit\":1000}', 0, 0, 1737086735523008513, '2023-12-27 10:12:22', '2023-12-27 13:12:09', 0);
INSERT INTO `question` VALUES (1749064763410841601, '两数之和', '请输出a+b\n\n## 示例输入\n1 2\n\n## 示例输出\n3', '[\"简单\"]', '`public class Main {\n        public static void main(String[] args) {\n                 int a = Integer.parseInt(args[0]);\n                 int b = Integer.parseInt(args[1]);\n                 System.out.println((a + b));\n         }\n }`', 82, 17, '[{\"input\":\"1 2\",\"output\":\"3\"},{\"input\":\"3 4\",\"output\":\"7\"}]', '{\"timeLimit\":1000,\"memoryLimit\":1000,\"stackLimit\":1000}', 0, 0, 1749062742406369282, '2024-01-21 21:41:50', '2024-01-22 13:34:01', 0);

-- ----------------------------
-- Table structure for question_submit
-- ----------------------------
DROP TABLE IF EXISTS `question_submit`;
CREATE TABLE `question_submit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '编程语言',
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户代码',
  `judgeInfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '判题信息（json对象）',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '判题状态（0 -待判题、1 - 判题中、2-成功、3-失败）',
  `questionId` bigint(20) NOT NULL COMMENT '题目id',
  `userId` bigint(20) NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_questionId`(`questionId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1749643522270674947 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '題目提交' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_submit
-- ----------------------------
INSERT INTO `question_submit` VALUES (1747979412583784450, 'java', '实打实', '{}', 1, 1738790934979833858, 1737086735523008513, '2024-01-18 21:49:02', '2024-01-18 21:49:02', 0);
INSERT INTO `question_submit` VALUES (1747981563863277570, 'java', 'public class Main {\r\n            public static void main(String[] args) {\r\n                int a = Integer.parseInt(args[0]);\r\n                int b = Integer.parseInt(args[1]);\r\n                System.out.println((a + b));\r\n                }\r\n}', '{\"message\":\"成功\",\"memory\":0,\"time\":4479}', 2, 1738790934979833858, 1737086735523008513, '2024-01-18 21:57:35', '2024-01-18 21:58:33', 0);
INSERT INTO `question_submit` VALUES (1748000295595565057, 'java', '是的是的', '{}', 1, 1739831559056097282, 1737086735523008513, '2024-01-18 23:12:01', '2024-01-18 23:12:01', 0);
INSERT INTO `question_submit` VALUES (1748702210893664258, 'java', 'sss', '{}', 1, 1738790934979833858, 1737086735523008513, '2024-01-20 21:41:11', '2024-01-20 21:41:11', 0);
INSERT INTO `question_submit` VALUES (1748702284600168450, 'java', 'sss', '{}', 1, 1738790934979833858, 1737086735523008513, '2024-01-20 21:41:28', '2024-01-20 21:41:28', 0);
INSERT INTO `question_submit` VALUES (1749068611688882178, 'java', 'public class Main{\r\n    public static void main(String[] args){\r\n        int a  = Integer.parseInt(args[0]);\r\n        int b  = Integer.parseInt(args[1]);\r\n        System.out.println((a+b));\r\n    }\r\n}', '{}', 0, 1749064763410841601, 1749062742406369282, '2024-01-21 21:57:07', '2024-01-21 21:57:07', 0);
INSERT INTO `question_submit` VALUES (1749072784673230850, 'java', '   public class Main {\r\n                 public static void main(String[] args) {\r\n                     int a = Integer.parseInt(args[0]);\r\n                      int b = Integer.parseInt(args[1]);\r\n                   System.out.println((a + b));\r\n                 }\r\n   }', '{}', 0, 1749064763410841601, 1749062742406369282, '2024-01-21 22:13:42', '2024-01-21 22:13:42', 0);
INSERT INTO `question_submit` VALUES (1749074280576008193, 'java', '   public class Main {\r\n                 public static void main(String[] args) {\r\n                     int a = Integer.parseInt(args[0]);\r\n                      int b = Integer.parseInt(args[1]);\r\n                   System.out.println((a + b));\r\n                 }\r\n   }', '{}', 0, 1749064763410841601, 1749062742406369282, '2024-01-21 22:19:39', '2024-01-21 22:19:39', 0);
INSERT INTO `question_submit` VALUES (1749078558011113474, 'java', 'public class Main {\r\n                  public static void main(String[] args) {\r\n                        int a = Integer.parseInt(args[0]);\r\n                    int b = Integer.parseInt(args[1]);\r\n                      System.out.println(  (a + b));\r\n                  }\r\n}', '{}', 0, 1749064763410841601, 1749062742406369282, '2024-01-21 22:36:39', '2024-01-21 22:36:39', 0);
INSERT INTO `question_submit` VALUES (1749080279877709826, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-21 22:43:29', '2024-01-21 22:43:30', 0);
INSERT INTO `question_submit` VALUES (1749081429343498241, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-21 22:48:03', '2024-01-21 22:48:04', 0);
INSERT INTO `question_submit` VALUES (1749082046526943233, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"答案错误\",\"memory\":0,\"time\":5709}', 2, 1749064763410841601, 1749062742406369282, '2024-01-21 22:50:30', '2024-01-21 22:51:44', 0);
INSERT INTO `question_submit` VALUES (1749083623186788354, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":578}', 2, 1749064763410841601, 1749062742406369282, '2024-01-21 22:56:46', '2024-01-21 22:57:27', 0);
INSERT INTO `question_submit` VALUES (1749094385666023426, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"答案错误\",\"memory\":0,\"time\":5458}', 2, 1749064763410841601, 1749062742406369282, '2024-01-21 23:39:32', '2024-01-21 23:42:27', 0);
INSERT INTO `question_submit` VALUES (1749095225994829825, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":1309}', 2, 1738790934979833858, 1749062742406369282, '2024-01-21 23:42:53', '2024-01-21 23:43:25', 0);
INSERT INTO `question_submit` VALUES (1749295040678686721, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"答案错误\",\"memory\":0,\"time\":5148}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 12:56:52', '2024-01-22 12:57:54', 0);
INSERT INTO `question_submit` VALUES (1749295645115641858, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"答案错误\",\"memory\":0,\"time\":5148}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 12:59:16', '2024-01-22 13:02:41', 0);
INSERT INTO `question_submit` VALUES (1749297202276188161, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":544}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 13:05:28', '2024-01-22 13:07:04', 0);
INSERT INTO `question_submit` VALUES (1749297948363177986, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 13:08:25', '2024-01-22 13:08:54', 0);
INSERT INTO `question_submit` VALUES (1749299684494659585, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":1028}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 13:15:19', '2024-01-22 13:15:32', 0);
INSERT INTO `question_submit` VALUES (1749299797581484034, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":1847}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 13:15:46', '2024-01-22 13:16:05', 0);
INSERT INTO `question_submit` VALUES (1749300481781518337, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":803}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 13:18:29', '2024-01-22 13:18:46', 0);
INSERT INTO `question_submit` VALUES (1749307665894354945, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"答案错误\",\"memory\":0,\"time\":7969}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 13:47:02', '2024-01-22 13:56:36', 0);
INSERT INTO `question_submit` VALUES (1749328066418585601, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:08:06', '2024-01-22 15:08:06', 0);
INSERT INTO `question_submit` VALUES (1749329714159296514, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:14:39', '2024-01-22 15:14:39', 0);
INSERT INTO `question_submit` VALUES (1749330155702067201, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:16:24', '2024-01-22 15:16:24', 0);
INSERT INTO `question_submit` VALUES (1749330410355040258, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:17:25', '2024-01-22 15:17:25', 0);
INSERT INTO `question_submit` VALUES (1749332021873745922, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:23:49', '2024-01-22 15:23:49', 0);
INSERT INTO `question_submit` VALUES (1749335557084815361, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:37:52', '2024-01-22 15:37:52', 0);
INSERT INTO `question_submit` VALUES (1749336820476289026, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:42:53', '2024-01-22 15:42:53', 0);
INSERT INTO `question_submit` VALUES (1749337565804109825, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:45:51', '2024-01-22 15:45:51', 0);
INSERT INTO `question_submit` VALUES (1749339749685927938, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 15:54:32', '2024-01-22 15:54:32', 0);
INSERT INTO `question_submit` VALUES (1749340721061568514, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":449}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 15:58:23', '2024-01-22 15:58:46', 0);
INSERT INTO `question_submit` VALUES (1749341262399414274, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":134}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 16:00:32', '2024-01-22 16:00:43', 0);
INSERT INTO `question_submit` VALUES (1749341453005365250, 'java', 'sdfsds', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:01:18', '2024-01-22 16:01:18', 0);
INSERT INTO `question_submit` VALUES (1749343314328453122, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":197}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:08:42', '2024-01-22 16:08:50', 0);
INSERT INTO `question_submit` VALUES (1749344244985790465, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":234}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 16:12:23', '2024-01-22 16:12:29', 0);
INSERT INTO `question_submit` VALUES (1749344383095832577, 'java', 'bjklhjikl', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:12:56', '2024-01-22 16:12:56', 0);
INSERT INTO `question_submit` VALUES (1749344710046023682, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b+b));\r\n         }\r\n }', '{\"message\":\"答案错误\",\"memory\":0,\"time\":132}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 16:14:14', '2024-01-22 16:14:22', 0);
INSERT INTO `question_submit` VALUES (1749345518875607042, 'java', 'Edward', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:17:27', '2024-01-22 16:17:27', 0);
INSERT INTO `question_submit` VALUES (1749347337399992321, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":139}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 16:24:41', '2024-01-22 16:24:49', 0);
INSERT INTO `question_submit` VALUES (1749347490169126913, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":398}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 16:25:17', '2024-01-22 16:25:23', 0);
INSERT INTO `question_submit` VALUES (1749348571196456962, 'java', '杀毒啥', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:29:35', '2024-01-22 16:29:35', 0);
INSERT INTO `question_submit` VALUES (1749348965159043073, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":606}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:31:09', '2024-01-22 16:31:15', 0);
INSERT INTO `question_submit` VALUES (1749349431066525698, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":501}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:33:00', '2024-01-22 16:33:07', 0);
INSERT INTO `question_submit` VALUES (1749351531120984065, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":559}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 16:41:21', '2024-01-22 16:41:27', 0);
INSERT INTO `question_submit` VALUES (1749351641359876098, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b-b));\r\n         }\r\n }', '{\"message\":\"答案错误\",\"memory\":0,\"time\":466}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 16:41:47', '2024-01-22 16:41:53', 0);
INSERT INTO `question_submit` VALUES (1749351773136519169, 'java', 'interesting', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:42:18', '2024-01-22 16:42:18', 0);
INSERT INTO `question_submit` VALUES (1749352576660307970, 'java', '试点房产税', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:45:30', '2024-01-22 16:45:30', 0);
INSERT INTO `question_submit` VALUES (1749353077204353025, 'java', '十大', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 16:47:29', '2024-01-22 16:49:09', 0);
INSERT INTO `question_submit` VALUES (1749371800489328642, 'java', '是的是的', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 18:01:53', '2024-01-22 18:01:53', 0);
INSERT INTO `question_submit` VALUES (1749371981083475969, 'java', '是的是的', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 18:02:36', '2024-01-22 18:02:36', 0);
INSERT INTO `question_submit` VALUES (1749372154941571073, 'java', '是的是的', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 18:03:18', '2024-01-22 18:03:18', 0);
INSERT INTO `question_submit` VALUES (1749372210553847810, 'java', '是的是的', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 18:03:31', '2024-01-22 18:03:31', 0);
INSERT INTO `question_submit` VALUES (1749372686762618881, 'java', '是的是的', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 18:05:24', '2024-01-22 18:07:37', 0);
INSERT INTO `question_submit` VALUES (1749373547035340801, 'java', 'kjnjk', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 18:08:50', '2024-01-22 18:09:42', 0);
INSERT INTO `question_submit` VALUES (1749373786924363777, 'java', 'kjnjk', '{}', 0, 1749064763410841601, 1749062742406369282, '2024-01-22 18:09:47', '2024-01-22 18:09:47', 0);
INSERT INTO `question_submit` VALUES (1749375524146360321, 'java', 'kjnjk', '{}', 0, 1749064763410841601, 1749062742406369282, '2024-01-22 18:16:41', '2024-01-22 18:16:41', 0);
INSERT INTO `question_submit` VALUES (1749375832322850817, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":495}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 18:17:54', '2024-01-22 18:18:00', 0);
INSERT INTO `question_submit` VALUES (1749378038010855425, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":564}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 18:26:40', '2024-01-22 18:26:47', 0);
INSERT INTO `question_submit` VALUES (1749378529000275969, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":465}', 2, 1749064763410841601, 1749062742406369282, '2024-01-22 18:28:37', '2024-01-22 18:28:57', 0);
INSERT INTO `question_submit` VALUES (1749391496324431873, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 19:20:09', '2024-01-22 19:20:09', 0);
INSERT INTO `question_submit` VALUES (1749391797651619842, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 19:21:21', '2024-01-22 19:21:21', 0);
INSERT INTO `question_submit` VALUES (1749392452713824257, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 19:23:57', '2024-01-22 19:23:57', 0);
INSERT INTO `question_submit` VALUES (1749393743397634050, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 19:29:05', '2024-01-22 19:29:05', 0);
INSERT INTO `question_submit` VALUES (1749394873078890497, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 19:33:34', '2024-01-22 19:33:34', 0);
INSERT INTO `question_submit` VALUES (1749395996217032706, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 19:38:02', '2024-01-22 19:38:02', 0);
INSERT INTO `question_submit` VALUES (1749409494741401601, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 20:31:40', '2024-01-22 20:31:40', 0);
INSERT INTO `question_submit` VALUES (1749410718895161345, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 20:36:32', '2024-01-22 20:36:32', 0);
INSERT INTO `question_submit` VALUES (1749413046868099074, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 20:45:47', '2024-01-22 20:45:47', 0);
INSERT INTO `question_submit` VALUES (1749413123250569218, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 20:46:05', '2024-01-22 20:46:05', 0);
INSERT INTO `question_submit` VALUES (1749414160577445889, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 20:50:13', '2024-01-22 20:50:13', 0);
INSERT INTO `question_submit` VALUES (1749416977182605314, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:01:24', '2024-01-22 21:01:24', 0);
INSERT INTO `question_submit` VALUES (1749418303312478210, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:06:40', '2024-01-22 21:06:40', 0);
INSERT INTO `question_submit` VALUES (1749420361813966850, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:14:51', '2024-01-22 21:14:51', 0);
INSERT INTO `question_submit` VALUES (1749422245685608450, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:22:20', '2024-01-22 21:22:20', 0);
INSERT INTO `question_submit` VALUES (1749422817042087938, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:24:36', '2024-01-22 21:24:36', 0);
INSERT INTO `question_submit` VALUES (1749423571731595266, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:27:36', '2024-01-22 21:27:36', 0);
INSERT INTO `question_submit` VALUES (1749424235413094401, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:30:15', '2024-01-22 21:30:15', 0);
INSERT INTO `question_submit` VALUES (1749428937873801217, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 21:48:56', '2024-01-22 21:48:56', 0);
INSERT INTO `question_submit` VALUES (1749436309509881857, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:18:13', '2024-01-22 22:18:13', 0);
INSERT INTO `question_submit` VALUES (1749436958012194818, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:20:48', '2024-01-22 22:20:48', 0);
INSERT INTO `question_submit` VALUES (1749438518574301185, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:27:00', '2024-01-22 22:27:00', 0);
INSERT INTO `question_submit` VALUES (1749440200100134913, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:33:41', '2024-01-22 22:33:41', 0);
INSERT INTO `question_submit` VALUES (1749441795009396738, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:40:01', '2024-01-22 22:40:01', 0);
INSERT INTO `question_submit` VALUES (1749443633712578562, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:47:20', '2024-01-22 22:47:20', 0);
INSERT INTO `question_submit` VALUES (1749444566773252098, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:51:02', '2024-01-22 22:51:02', 0);
INSERT INTO `question_submit` VALUES (1749445265959534594, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 22:53:49', '2024-01-22 22:53:49', 0);
INSERT INTO `question_submit` VALUES (1749448212416151554, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-22 23:05:31', '2024-01-22 23:05:31', 0);
INSERT INTO `question_submit` VALUES (1749630029333118978, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-23 11:08:00', '2024-01-23 11:08:00', 0);
INSERT INTO `question_submit` VALUES (1749631583691849730, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-23 11:14:10', '2024-01-23 11:14:10', 0);
INSERT INTO `question_submit` VALUES (1749632445352886274, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-23 11:17:36', '2024-01-23 11:17:36', 0);
INSERT INTO `question_submit` VALUES (1749637216990248962, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":240}', 2, 1749064763410841601, 1749062742406369282, '2024-01-23 11:36:33', '2024-01-23 11:37:37', 0);
INSERT INTO `question_submit` VALUES (1749637579583635458, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":161}', 2, 1749064763410841601, 1749062742406369282, '2024-01-23 11:38:00', '2024-01-23 11:38:12', 0);
INSERT INTO `question_submit` VALUES (1749639575782932481, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-23 11:45:56', '2024-01-23 11:45:56', 0);
INSERT INTO `question_submit` VALUES (1749641128405221377, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":329}', 2, 1749064763410841601, 1749062742406369282, '2024-01-23 11:52:06', '2024-01-23 11:52:29', 0);
INSERT INTO `question_submit` VALUES (1749642569626796034, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":173}', 2, 1749064763410841601, 1749062742406369282, '2024-01-23 11:57:50', '2024-01-23 11:58:07', 0);
INSERT INTO `question_submit` VALUES (1749642834253824002, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{}', 1, 1749064763410841601, 1749062742406369282, '2024-01-23 11:58:53', '2024-01-23 11:58:53', 0);
INSERT INTO `question_submit` VALUES (1749643088881631234, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":134}', 2, 1749064763410841601, 1749062742406369282, '2024-01-23 11:59:53', '2024-01-23 11:59:57', 0);
INSERT INTO `question_submit` VALUES (1749643218011668481, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":138}', 2, 1749064763410841601, 1749062742406369282, '2024-01-23 12:00:24', '2024-01-23 12:00:40', 0);
INSERT INTO `question_submit` VALUES (1749643522270674946, 'java', 'public class Main {\r\n        public static void main(String[] args) {\r\n                 int a = Integer.parseInt(args[0]);\r\n                 int b = Integer.parseInt(args[1]);\r\n                 System.out.println((a + b));\r\n         }\r\n }', '{\"message\":\"成功\",\"memory\":0,\"time\":140}', 2, 1749064763410841601, 1749062742406369282, '2024-01-23 12:01:37', '2024-01-23 12:01:49', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1749264540647841794 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1737086735523008513, 'luas', 'b0dd3697a192885d7c055db46155b26a', NULL, NULL, '泡泡糖恶魔', NULL, NULL, 'admin', '2023-12-19 20:25:25', '2023-12-24 17:04:30', 0);
INSERT INTO `user` VALUES (1738892240402825218, 'user', '2fc86aef424d53b7c080f19b320460d5', NULL, NULL, '', NULL, NULL, 'user', '2023-12-24 19:59:51', '2024-01-21 21:35:05', 0);
INSERT INTO `user` VALUES (1749062742406369282, 'admin', 'fd279055ab6358956c447a5bafc668f2', NULL, NULL, '顾西西🍐', NULL, NULL, 'admin', '2024-01-21 21:33:48', '2024-01-21 21:42:30', 0);
INSERT INTO `user` VALUES (1749264540647841793, '花傲天yu', '176cdcd2d718cb1dd2f25d7e2edb14d1', NULL, NULL, '花傲天yu', NULL, NULL, 'user', '2024-01-22 10:55:40', '2024-01-22 10:55:40', 0);

SET FOREIGN_KEY_CHECKS = 1;
