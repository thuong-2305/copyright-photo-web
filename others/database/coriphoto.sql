/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : coriphoto

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 05/06/2025 19:31:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_locks
-- ----------------------------
DROP TABLE IF EXISTS `account_locks`;
CREATE TABLE `account_locks`  (
  `accLkId` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `lockTime` datetime NOT NULL,
  `lockUntil` datetime NOT NULL,
  `lockReason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`accLkId`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  CONSTRAINT `account_locks_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_locks
-- ----------------------------
INSERT INTO `account_locks` VALUES (1, 117, '2025-06-05 03:51:50', '2025-06-06 03:51:34', 'lock');

-- ----------------------------
-- Table structure for activity_log
-- ----------------------------
DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE `activity_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `severity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uid` int NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `eventDate` datetime NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 284 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_log
-- ----------------------------
INSERT INTO `activity_log` VALUES (0, 'INFO', 1001, 'john_doe', '2025-04-06 14:30:00', 'User logged in');
INSERT INTO `activity_log` VALUES (4, 'INFO', 38, 'admin', '2025-04-06 21:34:41', 'User đã đăng nhập với email: admin');
INSERT INTO `activity_log` VALUES (5, 'INFO', 38, 'admin', '2025-04-09 22:40:27', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (6, 'INFO', 38, 'admin', '2025-04-09 22:54:33', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (7, 'INFO', 38, 'admin', '2025-04-09 22:59:21', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (8, 'INFO', 38, 'admin', '2025-04-11 08:09:31', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (9, 'INFO', 38, 'admin', '2025-04-11 08:23:17', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (10, 'INFO', 38, 'admin', '2025-04-11 08:37:56', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (11, 'INFO', 38, 'admin', '2025-04-12 19:53:10', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (12, 'INFO', 38, 'admin', '2025-04-12 21:08:53', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (13, 'INFO', 38, 'admin', '2025-04-12 21:21:49', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (14, 'INFO', 38, 'admin', '2025-04-12 21:26:01', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (15, 'INFO', 38, 'admin', '2025-04-12 21:46:46', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (16, 'INFO', 38, 'admin', '2025-04-12 22:30:59', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (17, 'INFO', 38, 'admin', '2025-04-12 22:36:51', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (18, 'INFO', 38, 'admin', '2025-04-12 22:43:27', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (19, 'INFO', 38, 'admin', '2025-04-12 22:50:52', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (20, 'INFO', 38, 'admin', '2025-04-12 23:01:59', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (21, 'INFO', 38, 'admin', '2025-04-13 21:24:08', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (22, 'INFO', 38, 'admin', '2025-04-13 21:51:25', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (23, 'INFO', 38, 'admin', '2025-04-13 21:58:30', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (24, 'INFO', 38, 'admin', '2025-04-13 22:09:48', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (25, 'INFO', 38, 'admin', '2025-04-13 22:11:59', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (26, 'INFO', 38, 'admin', '2025-04-13 22:15:13', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (27, 'INFO', 38, 'admin', '2025-04-17 04:49:17', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (28, 'INFO', 38, 'admin', '2025-04-17 05:24:10', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (29, 'INFO', 38, 'admin', '2025-04-17 09:12:59', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (30, 'INFO', 38, 'admin', '2025-04-17 09:22:28', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (31, 'INFO', 38, 'admin', '2025-04-17 09:24:54', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (32, 'INFO', 38, 'admin', '2025-04-17 09:32:35', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (33, 'INFO', 38, 'admin', '2025-04-17 09:38:02', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (34, 'INFO', 38, 'admin', '2025-04-17 09:54:32', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (35, 'INFO', 38, 'admin', '2025-04-17 10:02:09', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (36, 'INFO', 38, 'admin', '2025-04-17 14:59:57', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (37, 'INFO', 38, 'admin', '2025-04-17 15:03:48', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (38, 'INFO', 38, 'admin', '2025-04-20 22:13:27', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (39, 'INFO', 38, 'admin', '2025-05-02 21:43:10', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (40, 'INFO', 38, 'admin', '2025-05-10 21:40:24', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (41, 'INFO', 38, 'admin', '2025-05-10 22:14:11', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (42, 'INFO', 38, 'admin', '2025-05-11 22:52:05', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (43, 'INFO', 38, 'admin', '2025-05-11 23:41:07', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (44, 'INFO', 38, 'admin', '2025-05-12 00:02:30', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (45, 'INFO', 38, 'admin', '2025-05-12 00:07:14', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (46, 'INFO', 38, 'admin', '2025-05-12 00:19:25', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (47, 'INFO', 38, 'admin', '2025-05-12 19:19:27', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (48, 'INFO', 38, 'admin', '2025-05-12 21:27:45', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (49, 'INFO', 38, 'admin', '2025-06-01 19:30:26', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (50, 'INFO', -1, 'nguyenthanhthuong.23052004@gmail.com', '2025-06-01 20:01:38', 'Yêu cầu xác minh email cho nguyenthanhthuong.23052004@gmail.com');
INSERT INTO `activity_log` VALUES (51, 'INFO', 106, '112233', '2025-06-01 20:03:04', '112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (52, 'INFO', 38, 'admin', '2025-06-01 22:51:21', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (53, 'INFO', 106, '112233', '2025-06-01 22:52:06', '112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (54, 'INFO', 106, '112233', '2025-06-01 22:52:41', '112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (55, 'INFO', 106, '112233', '2025-06-01 22:52:57', '112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (56, 'INFO', 106, '112233', '2025-06-01 22:53:10', '112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (57, 'INFO', 106, '112233', '2025-06-01 23:00:23', '112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (58, 'INFO', 106, '112233', '2025-06-01 23:00:27', '112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (59, 'INFO', 104, 'thuong2305', '2025-06-01 23:02:15', 'thuong2305 đã đăng xuất');
INSERT INTO `activity_log` VALUES (60, 'INFO', -1, 'nguyenthanhthuong.23052004@gmail.com', '2025-06-01 23:04:28', 'Yêu cầu xác minh email cho nguyenthanhthuong.23052004@gmail.com');
INSERT INTO `activity_log` VALUES (61, 'INFO', 107, 't112233', '2025-06-01 23:05:11', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (62, 'INFO', 107, 't112233', '2025-06-01 23:05:19', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (63, 'INFO', 107, 't112233', '2025-06-01 23:22:32', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (64, 'INFO', 107, 't112233', '2025-06-01 23:29:55', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (65, 'INFO', 38, 'admin', '2025-06-01 23:30:06', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (66, 'INFO', 38, 'admin', '2025-06-01 23:39:01', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (67, 'INFO', 38, 'admin', '2025-06-01 23:50:53', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (68, 'INFO', 38, 'admin', '2025-06-02 06:34:49', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (69, 'INFO', 38, 'admin', '2025-06-02 07:24:06', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (70, 'INFO', 38, 'admin', '2025-06-02 07:25:05', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (71, 'INFO', 38, 'admin', '2025-06-02 07:26:56', 'admin đã thêm danh mục mới có tên:new category');
INSERT INTO `activity_log` VALUES (72, 'WARNING', 38, 'admin', '2025-06-02 07:27:14', 'admin đã cập nhật thông tin danh mục có id:50');
INSERT INTO `activity_log` VALUES (73, 'DANGER', 38, 'admin', '2025-06-02 07:27:21', 'admin đã xóa thông tin danh mục có id:50');
INSERT INTO `activity_log` VALUES (74, 'INFO', 38, 'admin', '2025-06-02 07:50:59', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (75, 'INFO', 107, 't112233', '2025-06-02 07:58:31', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (76, 'INFO', 38, 'admin', '2025-06-02 08:25:55', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (77, 'INFO', 107, 't112233', '2025-06-02 08:58:09', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (78, 'INFO', 107, 't112233', '2025-06-02 09:45:52', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (79, 'INFO', 107, 't112233', '2025-06-02 10:07:08', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (80, 'INFO', 38, 'admin', '2025-06-02 10:07:21', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (81, 'INFO', 107, 't112233', '2025-06-02 10:12:08', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (82, 'INFO', 107, 't112233', '2025-06-02 11:16:24', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (83, 'INFO', 107, 't112233', '2025-06-02 11:16:43', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (84, 'INFO', 38, 'admin', '2025-06-02 11:16:59', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (85, 'INFO', 107, 't112233', '2025-06-02 11:20:11', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (86, 'INFO', 107, 't112233', '2025-06-02 11:54:36', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (87, 'INFO', 107, 't112233', '2025-06-02 12:06:47', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (88, 'INFO', 107, 't112233', '2025-06-02 12:08:57', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (89, 'INFO', 107, 't112233', '2025-06-02 12:09:53', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (90, 'INFO', 107, 't112233', '2025-06-02 12:25:26', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (91, 'INFO', 107, 't112233', '2025-06-02 12:43:31', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (92, 'INFO', 107, 't112233', '2025-06-02 12:51:23', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (93, 'INFO', 38, 'admin', '2025-06-02 13:03:32', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (94, 'INFO', 107, 't112233', '2025-06-02 14:11:38', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (95, 'INFO', 107, 't112233', '2025-06-02 14:31:39', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (96, 'INFO', 107, 't112233', '2025-06-02 14:56:54', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (97, 'INFO', 107, 't112233', '2025-06-02 15:06:20', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (98, 'INFO', 107, 't112233', '2025-06-02 15:16:17', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (99, 'INFO', 107, 't112233', '2025-06-02 16:02:41', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (100, 'INFO', 38, 'admin', '2025-06-02 16:59:02', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (101, 'INFO', 38, 'admin', '2025-06-02 16:59:12', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (102, 'INFO', 107, 't112233', '2025-06-02 16:59:40', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (103, 'INFO', 38, 'admin', '2025-06-02 17:44:23', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (104, 'INFO', 38, 'admin', '2025-06-02 17:50:50', 'admin đã thanh toán thành công với đơn hàng có id là: 28');
INSERT INTO `activity_log` VALUES (105, 'INFO', 107, 't112233', '2025-06-02 20:22:57', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (106, 'INFO', 107, 't112233', '2025-06-02 20:31:22', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (107, 'INFO', 38, 'admin', '2025-06-02 20:31:35', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (108, 'INFO', 107, 't112233', '2025-06-02 21:20:46', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (109, 'DANGER', 107, 't112233', '2025-06-02 21:21:04', 't112233 đã xóa sản phẩm đã upload có id là : 1014');
INSERT INTO `activity_log` VALUES (110, 'INFO', 107, 't112233', '2025-06-02 21:21:29', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (111, 'INFO', 38, 'admin', '2025-06-02 21:21:46', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (112, 'INFO', 38, 'admin', '2025-06-02 21:32:10', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (113, 'INFO', 38, 'admin', '2025-06-02 21:44:03', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (114, 'INFO', 38, 'admin', '2025-06-02 22:03:27', 'admin đã rejected thông tin sản phẩm có 232');
INSERT INTO `activity_log` VALUES (115, 'INFO', 38, 'admin', '2025-06-02 22:13:33', 'admin đã rejected thông tin sản phẩm có 232');
INSERT INTO `activity_log` VALUES (116, 'INFO', 38, 'admin', '2025-06-02 22:14:05', 'admin đã rejected thông tin sản phẩm có 232');
INSERT INTO `activity_log` VALUES (117, 'INFO', 38, 'admin', '2025-06-02 22:14:35', 'admin đã accepted thông tin sản phẩm có 228');
INSERT INTO `activity_log` VALUES (118, 'INFO', 38, 'admin', '2025-06-02 22:14:36', 'admin đã accepted thông tin sản phẩm có 228');
INSERT INTO `activity_log` VALUES (119, 'INFO', 38, 'admin', '2025-06-02 22:14:37', 'admin đã accepted thông tin sản phẩm có 228');
INSERT INTO `activity_log` VALUES (120, 'INFO', 38, 'admin', '2025-06-02 22:14:38', 'admin đã accepted thông tin sản phẩm có 228');
INSERT INTO `activity_log` VALUES (121, 'INFO', 38, 'admin', '2025-06-02 22:15:06', 'admin đã accepted thông tin sản phẩm có 233');
INSERT INTO `activity_log` VALUES (122, 'INFO', 38, 'admin', '2025-06-02 22:15:48', 'admin đã accepted thông tin sản phẩm có 245');
INSERT INTO `activity_log` VALUES (123, 'INFO', 38, 'admin', '2025-06-02 22:32:13', 'admin đã rejected thông tin sản phẩm có 172');
INSERT INTO `activity_log` VALUES (124, 'INFO', 38, 'admin', '2025-06-02 22:32:14', 'admin đã accepted thông tin sản phẩm có 172');
INSERT INTO `activity_log` VALUES (125, 'INFO', 38, 'admin', '2025-06-02 22:35:11', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (126, 'INFO', 38, 'admin', '2025-06-02 22:36:35', 'admin đã accepted thông tin sản phẩm có 174');
INSERT INTO `activity_log` VALUES (127, 'INFO', 38, 'admin', '2025-06-02 22:41:22', 'admin đã accepted thông tin sản phẩm có 177');
INSERT INTO `activity_log` VALUES (128, 'INFO', 38, 'admin', '2025-06-02 22:41:29', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (129, 'INFO', 38, 'admin', '2025-06-02 22:41:34', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (130, 'INFO', 38, 'admin', '2025-06-02 22:41:36', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (131, 'INFO', 38, 'admin', '2025-06-02 22:41:36', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (132, 'INFO', 38, 'admin', '2025-06-02 22:41:36', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (133, 'INFO', 38, 'admin', '2025-06-02 22:41:36', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (134, 'INFO', 38, 'admin', '2025-06-02 22:41:36', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (135, 'INFO', 38, 'admin', '2025-06-02 22:41:37', 'admin đã accepted thông tin sản phẩm có 175');
INSERT INTO `activity_log` VALUES (136, 'INFO', 38, 'admin', '2025-06-02 22:44:18', 'admin đã accepted thông tin sản phẩm có 229');
INSERT INTO `activity_log` VALUES (137, 'INFO', 38, 'admin', '2025-06-02 22:44:24', 'admin đã accepted thông tin sản phẩm có 180');
INSERT INTO `activity_log` VALUES (138, 'INFO', 38, 'admin', '2025-06-02 22:44:26', 'admin đã rejected thông tin sản phẩm có 229');
INSERT INTO `activity_log` VALUES (139, 'INFO', 38, 'admin', '2025-06-02 22:44:46', 'admin đã accepted thông tin sản phẩm có 2');
INSERT INTO `activity_log` VALUES (140, 'INFO', 38, 'admin', '2025-06-02 22:47:50', 'admin đã accepted thông tin sản phẩm có 247');
INSERT INTO `activity_log` VALUES (141, 'INFO', 38, 'admin', '2025-06-02 22:48:10', 'admin đã accepted thông tin sản phẩm có 183');
INSERT INTO `activity_log` VALUES (142, 'INFO', 38, 'admin', '2025-06-02 22:51:06', 'admin đã accepted thông tin sản phẩm có 231');
INSERT INTO `activity_log` VALUES (143, 'INFO', 38, 'admin', '2025-06-02 22:52:47', 'admin đã accepted thông tin sản phẩm có 230');
INSERT INTO `activity_log` VALUES (144, 'INFO', 38, 'admin', '2025-06-02 22:54:29', 'admin đã accepted thông tin sản phẩm có 181');
INSERT INTO `activity_log` VALUES (145, 'INFO', 38, 'admin', '2025-06-02 22:58:11', 'admin đã accepted thông tin sản phẩm có 246');
INSERT INTO `activity_log` VALUES (146, 'INFO', 38, 'admin', '2025-06-02 22:58:48', 'admin đã accepted thông tin sản phẩm có 227');
INSERT INTO `activity_log` VALUES (147, 'INFO', 38, 'admin', '2025-06-02 23:00:46', 'admin đã accepted thông tin sản phẩm có 244');
INSERT INTO `activity_log` VALUES (148, 'INFO', 38, 'admin', '2025-06-02 23:09:21', 'admin đã accepted thông tin sản phẩm có 178');
INSERT INTO `activity_log` VALUES (149, 'INFO', 38, 'admin', '2025-06-02 23:44:26', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (150, 'DANGER', 38, 'admin', '2025-06-02 23:49:27', 'admin đã xóa đơn hàng có id:13');
INSERT INTO `activity_log` VALUES (151, 'DANGER', 38, 'admin', '2025-06-02 23:49:43', 'admin đã xóa đơn hàng có id:14');
INSERT INTO `activity_log` VALUES (152, 'DANGER', 38, 'admin', '2025-06-02 23:54:31', 'admin đã xóa đơn hàng có id:15');
INSERT INTO `activity_log` VALUES (153, 'DANGER', 38, 'admin', '2025-06-02 23:55:07', 'admin đã xóa đơn hàng có id:16');
INSERT INTO `activity_log` VALUES (154, 'INFO', 38, 'admin', '2025-06-03 00:02:47', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (155, 'DANGER', 38, 'admin', '2025-06-03 00:03:08', 'admin đã xóa đơn hàng có id:20');
INSERT INTO `activity_log` VALUES (156, 'INFO', 38, 'admin', '2025-06-03 07:23:57', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (157, 'INFO', 38, 'admin', '2025-06-03 08:57:04', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (158, 'INFO', 38, 'admin', '2025-06-03 08:58:32', 'admin đã thêm user mới có name:nn22tt');
INSERT INTO `activity_log` VALUES (159, 'INFO', 38, 'admin', '2025-06-03 09:30:01', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (160, 'INFO', 38, 'admin', '2025-06-03 13:18:55', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (161, 'INFO', 38, 'admin', '2025-06-03 13:53:53', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (162, 'INFO', 38, 'admin', '2025-06-03 14:06:11', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (163, 'INFO', 38, 'admin', '2025-06-03 14:19:14', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (164, 'INFO', 38, 'admin', '2025-06-03 15:57:04', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (165, 'INFO', 38, 'admin', '2025-06-03 15:58:46', 'admin đã thêm user mới có name:nnt');
INSERT INTO `activity_log` VALUES (166, 'INFO', 38, 'admin', '2025-06-03 16:03:51', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (167, 'INFO', 38, 'admin', '2025-06-03 16:14:22', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (168, 'INFO', 38, 'admin', '2025-06-03 16:27:24', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (169, 'INFO', 38, 'admin', '2025-06-03 17:11:08', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (170, 'INFO', 38, 'admin', '2025-06-03 20:27:44', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (171, 'INFO', 38, 'admin', '2025-06-03 20:33:35', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (172, 'INFO', 38, 'admin', '2025-06-03 20:41:23', 'admin đã thêm user mới có name:tnguyen');
INSERT INTO `activity_log` VALUES (173, 'INFO', 113, 'tnguyen', '2025-06-03 21:59:37', 'tnguyen đã đăng nhập');
INSERT INTO `activity_log` VALUES (174, 'INFO', 113, 'tnguyen', '2025-06-03 21:59:44', 'tnguyen đã đăng xuất');
INSERT INTO `activity_log` VALUES (175, 'INFO', 38, 'admin', '2025-06-03 22:00:18', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (176, 'INFO', 38, 'admin', '2025-06-03 22:05:56', 'admin đã thêm user mới có name:thuong2305');
INSERT INTO `activity_log` VALUES (177, 'INFO', 38, 'admin', '2025-06-03 22:07:25', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (178, 'INFO', 114, 'thuong2305', '2025-06-03 22:08:46', 'thuong2305 đã đăng nhập');
INSERT INTO `activity_log` VALUES (179, 'INFO', 38, 'admin', '2025-06-03 22:09:16', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (180, 'INFO', 114, 'thuong2305', '2025-06-03 22:11:10', 'thuong2305 đã đăng xuất');
INSERT INTO `activity_log` VALUES (181, 'INFO', 114, 'thuong2305', '2025-06-03 22:11:30', 'thuong2305 đã đăng nhập');
INSERT INTO `activity_log` VALUES (182, 'INFO', 114, 'thuong2305', '2025-06-03 22:25:04', 'thuong2305 đã đăng xuất');
INSERT INTO `activity_log` VALUES (183, 'INFO', 107, 't112233', '2025-06-03 22:25:35', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (184, 'INFO', 107, 't112233', '2025-06-03 22:26:22', 't112233 đã đăng hình ảnh sản phẩm mới tên là: anime');
INSERT INTO `activity_log` VALUES (185, 'INFO', 107, 't112233', '2025-06-03 22:26:39', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (186, 'INFO', 107, 't112233', '2025-06-03 22:27:58', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (187, 'INFO', 107, 't112233', '2025-06-03 22:47:36', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (188, 'INFO', 107, 't112233', '2025-06-03 22:48:03', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (189, 'INFO', 107, 't112233', '2025-06-03 22:53:36', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (190, 'INFO', 38, 'admin', '2025-06-03 23:35:56', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (191, 'INFO', 38, 'admin', '2025-06-03 23:40:05', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (192, 'INFO', 38, 'admin', '2025-06-03 23:43:47', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (193, 'INFO', 38, 'admin', '2025-06-03 23:43:57', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (194, 'INFO', 38, 'admin', '2025-06-03 23:45:19', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (195, 'INFO', 38, 'admin', '2025-06-04 00:01:22', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (196, 'INFO', 38, 'admin', '2025-06-04 00:25:36', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (197, 'INFO', 38, 'admin', '2025-06-04 00:31:37', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (198, 'INFO', 38, 'admin', '2025-06-04 00:34:30', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (199, 'INFO', 38, 'admin', '2025-06-04 00:40:43', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (200, 'INFO', 38, 'admin', '2025-06-04 00:43:44', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (201, 'INFO', 38, 'admin', '2025-06-04 00:46:33', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (202, 'INFO', 38, 'admin', '2025-06-04 00:46:54', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (203, 'INFO', 38, 'admin', '2025-06-04 00:47:49', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (204, 'INFO', 113, 'tnguyen', '2025-06-04 00:49:42', 'tnguyen đã đăng nhập');
INSERT INTO `activity_log` VALUES (205, 'INFO', 113, 'tnguyen', '2025-06-04 00:50:36', 'tnguyen đã đăng hình ảnh sản phẩm mới tên là: anime');
INSERT INTO `activity_log` VALUES (206, 'INFO', 113, 'tnguyen', '2025-06-04 00:51:03', 'tnguyen đã đăng xuất');
INSERT INTO `activity_log` VALUES (207, 'INFO', 113, 'tnguyen', '2025-06-04 00:51:26', 'tnguyen đã đăng nhập');
INSERT INTO `activity_log` VALUES (208, 'INFO', 38, 'admin', '2025-06-04 00:52:17', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (209, 'INFO', 113, 'tnguyen', '2025-06-04 00:52:32', 'tnguyen đã đăng nhập');
INSERT INTO `activity_log` VALUES (210, 'INFO', 113, 'tnguyen', '2025-06-04 00:53:33', 'tnguyen đã đăng xuất');
INSERT INTO `activity_log` VALUES (211, 'INFO', 38, 'admin', '2025-06-04 00:54:08', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (212, 'INFO', 38, 'admin', '2025-06-04 00:57:33', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (213, 'INFO', 113, 'tnguyen', '2025-06-04 00:57:57', 'tnguyen đã đăng nhập');
INSERT INTO `activity_log` VALUES (214, 'INFO', 113, 'tnguyen', '2025-06-04 01:01:53', 'tnguyen đã đăng nhập');
INSERT INTO `activity_log` VALUES (215, 'DANGER', 113, 'tnguyen', '2025-06-04 01:02:16', 'tnguyen đã xóa sản phẩm đã upload có id là : 1016');
INSERT INTO `activity_log` VALUES (216, 'INFO', 113, 'tnguyen', '2025-06-04 01:02:25', 'tnguyen đã đăng xuất');
INSERT INTO `activity_log` VALUES (217, 'INFO', 38, 'admin', '2025-06-04 01:02:47', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (218, 'INFO', 38, 'admin', '2025-06-04 01:06:50', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (219, 'INFO', 38, 'admin', '2025-06-04 01:08:51', 'admin đã thêm user mới có name:testaaa');
INSERT INTO `activity_log` VALUES (220, 'INFO', 38, 'admin', '2025-06-04 01:10:04', 'admin đã thêm user mới có name:abcxyz');
INSERT INTO `activity_log` VALUES (221, 'INFO', 38, 'admin', '2025-06-04 08:53:10', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (222, 'WARNING', 38, 'admin', '2025-06-04 08:55:41', 'admin đã cập nhật quyền hạn của user có id:117 thành role: 1');
INSERT INTO `activity_log` VALUES (223, 'WARNING', 38, 'admin', '2025-06-04 08:57:08', 'admin đã cập nhật quyền hạn của user có id:113 thành role: 2');
INSERT INTO `activity_log` VALUES (224, 'WARNING', 38, 'admin', '2025-06-04 08:57:38', 'admin đã cập nhật quyền hạn của user có id:113 thành role: 1');
INSERT INTO `activity_log` VALUES (225, 'INFO', 38, 'admin', '2025-06-04 09:14:34', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (226, 'INFO', 38, 'admin', '2025-06-04 09:21:27', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (227, 'DANGER', 38, 'admin', '2025-06-04 10:09:10', 'admin đã xóa đơn hàng có id:28');
INSERT INTO `activity_log` VALUES (228, 'INFO', 38, 'admin', '2025-06-04 10:11:35', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (229, 'INFO', 38, 'admin', '2025-06-04 10:49:29', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (230, 'INFO', 38, 'admin', '2025-06-04 10:52:05', 'admin đã thanh toán thành công với đơn hàng có id là: 30');
INSERT INTO `activity_log` VALUES (231, 'INFO', 107, 't112233', '2025-06-04 11:08:53', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (232, 'INFO', 38, 'admin', '2025-06-04 12:40:58', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (233, 'INFO', 38, 'admin', '2025-06-04 12:51:29', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (234, 'INFO', 107, 't112233', '2025-06-04 12:51:51', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (235, 'INFO', 107, 't112233', '2025-06-04 12:54:32', 't112233 đã thanh toán thành công với đơn hàng có id là: 31');
INSERT INTO `activity_log` VALUES (236, 'INFO', 38, 'admin', '2025-06-05 03:15:44', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (237, 'DANGER', 38, 'admin', '2025-06-05 03:17:27', 'admin dd xóa sản phẩm có id:12');
INSERT INTO `activity_log` VALUES (238, 'INFO', 38, 'admin', '2025-06-05 03:46:01', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (239, 'DANGER', 38, 'admin', '2025-06-05 03:51:19', 'admin dd xóa sản phẩm có id:1015');
INSERT INTO `activity_log` VALUES (240, 'WARNING', 38, 'admin', '2025-06-05 03:51:50', 'admin đã khóa tài khoản user có id:117 đến 2025-06-06 03:51:34');
INSERT INTO `activity_log` VALUES (241, 'INFO', 38, 'admin', '2025-06-05 03:52:09', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (242, 'INFO', 107, 't112233', '2025-06-05 03:54:33', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (243, 'INFO', 107, 't112233', '2025-06-05 03:55:36', 't112233 đã đăng hình ảnh sản phẩm mới tên là: anime');
INSERT INTO `activity_log` VALUES (244, 'INFO', 38, 'admin', '2025-06-05 03:56:23', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (245, 'INFO', 38, 'admin', '2025-06-05 03:56:46', 'admin đã accepted thông tin sản phẩm có 1017');
INSERT INTO `activity_log` VALUES (246, 'INFO', 38, 'admin', '2025-06-05 03:57:00', 'admin đã accepted thông tin sản phẩm có 1017');
INSERT INTO `activity_log` VALUES (247, 'INFO', 38, 'admin', '2025-06-05 04:00:23', 'admin đã thanh toán thành công với đơn hàng có id là: 32');
INSERT INTO `activity_log` VALUES (248, 'INFO', 107, 't112233', '2025-06-05 04:00:48', 't112233 đã đăng hình ảnh sản phẩm mới tên là: anime');
INSERT INTO `activity_log` VALUES (249, 'INFO', 107, 't112233', '2025-06-05 04:02:15', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (250, 'INFO', 38, 'admin', '2025-06-05 04:02:43', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (251, 'INFO', 38, 'admin', '2025-06-05 04:04:00', 'admin đã thêm user mới có name:abc123');
INSERT INTO `activity_log` VALUES (252, 'INFO', 38, 'admin', '2025-06-05 04:04:47', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (253, 'INFO', 118, 'abc123', '2025-06-05 04:05:04', 'abc123 đã đăng nhập');
INSERT INTO `activity_log` VALUES (254, 'INFO', 38, 'admin', '2025-06-05 04:06:17', 'admin đã thêm quyền mới có ID: 6 cho user ID: 118 thành công');
INSERT INTO `activity_log` VALUES (255, 'INFO', 118, 'abc123', '2025-06-05 04:06:41', 'abc123 đã đăng xuất');
INSERT INTO `activity_log` VALUES (256, 'INFO', 118, 'abc123', '2025-06-05 04:06:53', 'abc123 đã đăng nhập');
INSERT INTO `activity_log` VALUES (257, 'DANGER', 118, 'abc123', '2025-06-05 04:07:24', 'abc123 đã xóa đơn hàng có id:26');
INSERT INTO `activity_log` VALUES (258, 'INFO', 38, 'admin', '2025-06-05 07:52:01', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (259, 'INFO', 107, 't112233', '2025-06-05 08:07:09', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (260, 'INFO', 107, 't112233', '2025-06-05 08:11:22', 't112233 đã thanh toán thành công với đơn hàng có id là: 33');
INSERT INTO `activity_log` VALUES (261, 'INFO', 38, 'admin', '2025-06-05 08:26:44', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (262, 'INFO', 38, 'admin', '2025-06-05 09:25:49', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (263, 'DANGER', 38, 'admin', '2025-06-05 09:26:47', 'admin đã xóa thông tin user có id:3');
INSERT INTO `activity_log` VALUES (264, 'INFO', 38, 'admin', '2025-06-05 09:27:22', 'admin đã accepted thông tin sản phẩm có 1018');
INSERT INTO `activity_log` VALUES (265, 'DANGER', 38, 'admin', '2025-06-05 09:27:45', 'admin dd xóa sản phẩm có id:2');
INSERT INTO `activity_log` VALUES (266, 'INFO', 107, 't112233', '2025-06-05 09:28:41', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (267, 'INFO', 107, 't112233', '2025-06-05 09:31:30', 't112233 đã thanh toán thành công với đơn hàng có id là: 35');
INSERT INTO `activity_log` VALUES (268, 'INFO', 107, 't112233', '2025-06-05 09:33:37', 't112233 đã thanh toán thành công với đơn hàng có id là: 37');
INSERT INTO `activity_log` VALUES (269, 'INFO', 107, 't112233', '2025-06-05 09:34:01', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (270, 'INFO', 107, 't112233', '2025-06-05 09:36:46', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (271, 'INFO', 107, 't112233', '2025-06-05 09:37:52', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (272, 'INFO', 119, '', '2025-06-05 09:38:38', ' đã đăng nhập bằng Google');
INSERT INTO `activity_log` VALUES (273, 'INFO', 38, 'admin', '2025-06-05 15:43:04', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (274, 'INFO', 38, 'admin', '2025-06-05 15:47:03', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (275, 'INFO', 38, 'admin', '2025-06-05 15:51:18', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (276, 'DANGER', 38, 'admin', '2025-06-05 15:55:35', 'admin đã xóa đơn hàng có id:32');
INSERT INTO `activity_log` VALUES (277, 'INFO', 38, 'admin', '2025-06-05 15:57:58', 'admin đã đăng xuất');
INSERT INTO `activity_log` VALUES (278, 'INFO', 107, 't112233', '2025-06-05 15:58:09', 't112233 đã đăng nhập');
INSERT INTO `activity_log` VALUES (279, 'INFO', 107, 't112233', '2025-06-05 16:00:26', 't112233 đã đăng hình ảnh sản phẩm mới tên là: Mạng đồ thị neural ');
INSERT INTO `activity_log` VALUES (280, 'INFO', 107, 't112233', '2025-06-05 16:01:45', 't112233 đã đăng xuất');
INSERT INTO `activity_log` VALUES (281, 'INFO', 38, 'admin', '2025-06-05 16:01:54', 'admin đã đăng nhập');
INSERT INTO `activity_log` VALUES (282, 'DANGER', 38, 'admin', '2025-06-05 16:03:02', 'admin dd xóa sản phẩm có id:1018');
INSERT INTO `activity_log` VALUES (283, 'DANGER', 38, 'admin', '2025-06-05 16:03:05', 'admin dd xóa sản phẩm có id:1017');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartId` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `promotionId` int NULL DEFAULT 0,
  PRIMARY KEY (`cartId`) USING BTREE,
  UNIQUE INDEX `uid`(`uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 427 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (5, 1, 0);
INSERT INTO `cart` VALUES (53, 2, 0);
INSERT INTO `cart` VALUES (66, -1, 0);
INSERT INTO `cart` VALUES (71, -3, 0);
INSERT INTO `cart` VALUES (72, -4, 0);
INSERT INTO `cart` VALUES (73, -5, 0);
INSERT INTO `cart` VALUES (77, -6, 0);
INSERT INTO `cart` VALUES (78, -7, 0);
INSERT INTO `cart` VALUES (79, -8, 0);
INSERT INTO `cart` VALUES (82, -9, 0);
INSERT INTO `cart` VALUES (84, -10, 0);
INSERT INTO `cart` VALUES (88, -11, 0);
INSERT INTO `cart` VALUES (90, -12, 0);
INSERT INTO `cart` VALUES (93, -13, 0);
INSERT INTO `cart` VALUES (95, -14, 0);
INSERT INTO `cart` VALUES (96, -15, 0);
INSERT INTO `cart` VALUES (97, -16, 0);
INSERT INTO `cart` VALUES (98, -17, 0);
INSERT INTO `cart` VALUES (99, -18, 0);
INSERT INTO `cart` VALUES (100, -19, 0);
INSERT INTO `cart` VALUES (102, -20, 0);
INSERT INTO `cart` VALUES (106, -21, 0);
INSERT INTO `cart` VALUES (107, -22, 0);
INSERT INTO `cart` VALUES (110, -23, 0);
INSERT INTO `cart` VALUES (112, -24, 0);
INSERT INTO `cart` VALUES (115, -25, 0);
INSERT INTO `cart` VALUES (116, -26, 0);
INSERT INTO `cart` VALUES (117, -27, 0);
INSERT INTO `cart` VALUES (120, -28, 0);
INSERT INTO `cart` VALUES (122, -29, 0);
INSERT INTO `cart` VALUES (123, -30, 0);
INSERT INTO `cart` VALUES (125, -31, 0);
INSERT INTO `cart` VALUES (132, -32, 0);
INSERT INTO `cart` VALUES (135, -33, 0);
INSERT INTO `cart` VALUES (137, -34, 0);
INSERT INTO `cart` VALUES (138, -35, 0);
INSERT INTO `cart` VALUES (140, -36, 0);
INSERT INTO `cart` VALUES (141, -37, 0);
INSERT INTO `cart` VALUES (144, -38, 0);
INSERT INTO `cart` VALUES (145, -39, 0);
INSERT INTO `cart` VALUES (146, -40, 0);
INSERT INTO `cart` VALUES (150, -41, 0);
INSERT INTO `cart` VALUES (151, -42, 0);
INSERT INTO `cart` VALUES (153, -43, 0);
INSERT INTO `cart` VALUES (155, -44, 0);
INSERT INTO `cart` VALUES (157, -45, 0);
INSERT INTO `cart` VALUES (162, -46, 0);
INSERT INTO `cart` VALUES (165, -47, 0);
INSERT INTO `cart` VALUES (167, -48, 0);
INSERT INTO `cart` VALUES (170, -49, 0);
INSERT INTO `cart` VALUES (171, -50, 0);
INSERT INTO `cart` VALUES (173, -51, 0);
INSERT INTO `cart` VALUES (176, -52, 0);
INSERT INTO `cart` VALUES (181, -53, 0);
INSERT INTO `cart` VALUES (195, -54, 0);
INSERT INTO `cart` VALUES (199, -55, 0);
INSERT INTO `cart` VALUES (201, -56, 0);
INSERT INTO `cart` VALUES (205, -57, 0);
INSERT INTO `cart` VALUES (206, -58, 0);
INSERT INTO `cart` VALUES (211, -59, 0);
INSERT INTO `cart` VALUES (214, -60, 0);
INSERT INTO `cart` VALUES (217, -61, 0);
INSERT INTO `cart` VALUES (219, -62, 0);
INSERT INTO `cart` VALUES (221, -63, 0);
INSERT INTO `cart` VALUES (226, -64, 0);
INSERT INTO `cart` VALUES (238, -65, 0);
INSERT INTO `cart` VALUES (242, -66, 0);
INSERT INTO `cart` VALUES (243, -67, 0);
INSERT INTO `cart` VALUES (244, -68, 0);
INSERT INTO `cart` VALUES (246, -69, 0);
INSERT INTO `cart` VALUES (247, -70, 0);
INSERT INTO `cart` VALUES (248, -71, 0);
INSERT INTO `cart` VALUES (260, -72, 0);
INSERT INTO `cart` VALUES (262, 37, 0);
INSERT INTO `cart` VALUES (268, -74, 0);
INSERT INTO `cart` VALUES (269, -75, 0);
INSERT INTO `cart` VALUES (270, -76, 0);
INSERT INTO `cart` VALUES (273, -77, 0);
INSERT INTO `cart` VALUES (275, -78, 0);
INSERT INTO `cart` VALUES (285, -79, 0);
INSERT INTO `cart` VALUES (290, -80, 0);
INSERT INTO `cart` VALUES (310, -81, 0);
INSERT INTO `cart` VALUES (313, -82, 0);
INSERT INTO `cart` VALUES (314, 38, 0);
INSERT INTO `cart` VALUES (315, -84, 0);
INSERT INTO `cart` VALUES (320, 91, 0);
INSERT INTO `cart` VALUES (322, 93, 0);
INSERT INTO `cart` VALUES (326, 95, 0);
INSERT INTO `cart` VALUES (333, -88, 0);
INSERT INTO `cart` VALUES (335, -89, 0);
INSERT INTO `cart` VALUES (336, -90, 0);
INSERT INTO `cart` VALUES (338, -91, 0);
INSERT INTO `cart` VALUES (341, -92, 0);
INSERT INTO `cart` VALUES (351, -93, 0);
INSERT INTO `cart` VALUES (365, -94, 0);
INSERT INTO `cart` VALUES (368, -95, 0);
INSERT INTO `cart` VALUES (369, -96, 0);
INSERT INTO `cart` VALUES (375, 96, 0);
INSERT INTO `cart` VALUES (378, -98, 0);
INSERT INTO `cart` VALUES (383, -99, 0);
INSERT INTO `cart` VALUES (388, -100, 0);
INSERT INTO `cart` VALUES (389, 97, 0);
INSERT INTO `cart` VALUES (393, -102, 0);
INSERT INTO `cart` VALUES (395, 98, 0);
INSERT INTO `cart` VALUES (402, -104, 0);
INSERT INTO `cart` VALUES (404, -105, 0);
INSERT INTO `cart` VALUES (414, -106, 0);
INSERT INTO `cart` VALUES (415, -107, 0);
INSERT INTO `cart` VALUES (416, 108, 0);
INSERT INTO `cart` VALUES (417, -109, 0);
INSERT INTO `cart` VALUES (419, 107, 0);
INSERT INTO `cart` VALUES (421, -111, 0);

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail`  (
  `cartId` int NOT NULL,
  `pid` int NULL DEFAULT NULL,
  `licenseId` int NULL DEFAULT 1,
  `checked` int NULL DEFAULT 0,
  `price` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart_detail
-- ----------------------------
INSERT INTO `cart_detail` VALUES (53, 213, 1, 0, 238000);
INSERT INTO `cart_detail` VALUES (53, 189, 1, 0, 142000);
INSERT INTO `cart_detail` VALUES (53, 195, 1, 0, 282000);
INSERT INTO `cart_detail` VALUES (66, 213, 1, 0, 238000);
INSERT INTO `cart_detail` VALUES (66, 204, 1, 0, 125000);
INSERT INTO `cart_detail` VALUES (71, 118, 1, 0, 298000);
INSERT INTO `cart_detail` VALUES (72, 121, 1, 0, 623000);
INSERT INTO `cart_detail` VALUES (73, 440, 1, 0, 245000);
INSERT INTO `cart_detail` VALUES (73, 441, 1, 0, 260000);
INSERT INTO `cart_detail` VALUES (73, 431, 1, 0, 211000);
INSERT INTO `cart_detail` VALUES (77, 200, 1, 0, 130000);
INSERT INTO `cart_detail` VALUES (78, 48, 1, 0, 788000);
INSERT INTO `cart_detail` VALUES (79, 215, 1, 0, 106000);
INSERT INTO `cart_detail` VALUES (79, 189, 1, 0, 142000);
INSERT INTO `cart_detail` VALUES (79, 191, 1, 0, 204000);
INSERT INTO `cart_detail` VALUES (82, 8, 1, 0, 414000);
INSERT INTO `cart_detail` VALUES (82, 140, 1, 0, 239000);
INSERT INTO `cart_detail` VALUES (84, 236, 1, 0, 173000);
INSERT INTO `cart_detail` VALUES (84, 239, 1, 0, 118000);
INSERT INTO `cart_detail` VALUES (84, 238, 1, 0, 171000);
INSERT INTO `cart_detail` VALUES (88, 251, 1, 0, 282000);
INSERT INTO `cart_detail` VALUES (88, 250, 1, 0, 202000);
INSERT INTO `cart_detail` VALUES (90, 153, 1, 0, 208000);
INSERT INTO `cart_detail` VALUES (90, 162, 1, 0, 973000);
INSERT INTO `cart_detail` VALUES (93, 147, 1, 0, 477000);
INSERT INTO `cart_detail` VALUES (93, 143, 1, 0, 495000);
INSERT INTO `cart_detail` VALUES (95, 156, 1, 0, 480000);
INSERT INTO `cart_detail` VALUES (96, 139, 1, 0, 389000);
INSERT INTO `cart_detail` VALUES (97, 147, 1, 0, 477000);
INSERT INTO `cart_detail` VALUES (98, 238, 1, 0, 171000);
INSERT INTO `cart_detail` VALUES (102, 213, 1, 0, 238000);
INSERT INTO `cart_detail` VALUES (107, 213, 1, 0, 238000);
INSERT INTO `cart_detail` VALUES (110, 465, 1, 0, 162000);
INSERT INTO `cart_detail` VALUES (116, 188, 1, 0, 212000);
INSERT INTO `cart_detail` VALUES (117, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (117, 83, 1, 0, 459000);
INSERT INTO `cart_detail` VALUES (120, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (120, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (122, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (123, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (132, 318, 1, 1, 187000);
INSERT INTO `cart_detail` VALUES (132, 147, 1, 1, 477000);
INSERT INTO `cart_detail` VALUES (135, 318, 1, 1, 187000);
INSERT INTO `cart_detail` VALUES (135, 98, 1, 1, 536000);
INSERT INTO `cart_detail` VALUES (137, 318, 1, 1, 187000);
INSERT INTO `cart_detail` VALUES (138, 259, 1, 0, 179000);
INSERT INTO `cart_detail` VALUES (138, 365, 1, 1, 235000);
INSERT INTO `cart_detail` VALUES (140, 318, 1, 1, 187000);
INSERT INTO `cart_detail` VALUES (141, 289, 1, 1, 174000);
INSERT INTO `cart_detail` VALUES (141, 341, 1, 0, 281000);
INSERT INTO `cart_detail` VALUES (141, 365, 1, 0, 235000);
INSERT INTO `cart_detail` VALUES (144, 98, 1, 1, 536000);
INSERT INTO `cart_detail` VALUES (145, 91, 1, 1, 859000);
INSERT INTO `cart_detail` VALUES (146, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (146, 419, 1, 1, 183000);
INSERT INTO `cart_detail` VALUES (146, 318, 1, 0, 187000);
INSERT INTO `cart_detail` VALUES (146, 324, 1, 0, 227000);
INSERT INTO `cart_detail` VALUES (150, 324, 1, 0, 227000);
INSERT INTO `cart_detail` VALUES (151, 318, 1, 0, 187000);
INSERT INTO `cart_detail` VALUES (151, 324, 1, 1, 227000);
INSERT INTO `cart_detail` VALUES (153, 200, 1, 1, 130000);
INSERT INTO `cart_detail` VALUES (153, 91, 1, 0, 859000);
INSERT INTO `cart_detail` VALUES (155, 200, 1, 1, 130000);
INSERT INTO `cart_detail` VALUES (155, 23, 1, 1, 428000);
INSERT INTO `cart_detail` VALUES (157, 355, 1, 1, 218000);
INSERT INTO `cart_detail` VALUES (157, 341, 1, 1, 281000);
INSERT INTO `cart_detail` VALUES (157, 508, 1, 1, 243000);
INSERT INTO `cart_detail` VALUES (157, 440, 1, 1, 245000);
INSERT INTO `cart_detail` VALUES (157, 200, 1, 1, 130000);
INSERT INTO `cart_detail` VALUES (162, 161, 1, 1, 466000);
INSERT INTO `cart_detail` VALUES (165, 98, 0, 0, 536000);
INSERT INTO `cart_detail` VALUES (165, 82, 1, 0, 959000);
INSERT INTO `cart_detail` VALUES (167, 161, 0, 0, 466000);
INSERT INTO `cart_detail` VALUES (167, 440, 0, 0, 245000);
INSERT INTO `cart_detail` VALUES (167, 200, 0, 0, 130000);
INSERT INTO `cart_detail` VALUES (170, 200, 0, 0, 130000);
INSERT INTO `cart_detail` VALUES (171, 98, 2, 0, 254000);
INSERT INTO `cart_detail` VALUES (171, 499, 2, 0, 254000);
INSERT INTO `cart_detail` VALUES (176, 153, 1, 0, 208000);
INSERT INTO `cart_detail` VALUES (176, 162, 1, 0, 973000);
INSERT INTO `cart_detail` VALUES (176, 10, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (5, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (5, 20, 1, 0, 455000);
INSERT INTO `cart_detail` VALUES (195, 188, 1, 1, 212000);
INSERT INTO `cart_detail` VALUES (195, 200, 2, 1, 260000);
INSERT INTO `cart_detail` VALUES (195, 144, 1, 1, 846000);
INSERT INTO `cart_detail` VALUES (195, 341, 1, 0, 281000);
INSERT INTO `cart_detail` VALUES (199, 200, 1, 0, 130000);
INSERT INTO `cart_detail` VALUES (199, 10, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (201, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (201, 193, 1, 0, 249000);
INSERT INTO `cart_detail` VALUES (201, 200, 2, 0, 260000);
INSERT INTO `cart_detail` VALUES (201, 121, 2, 0, 1246000);
INSERT INTO `cart_detail` VALUES (205, 15, 1, 0, 927000);
INSERT INTO `cart_detail` VALUES (206, 15, 1, 0, 927000);
INSERT INTO `cart_detail` VALUES (206, 223, 1, 0, 190000);
INSERT INTO `cart_detail` VALUES (211, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (211, 10, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (211, 3, 1, 0, 217000);
INSERT INTO `cart_detail` VALUES (214, 140, 1, 0, 239000);
INSERT INTO `cart_detail` VALUES (214, 10, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (214, 1, 1, 0, 239000);
INSERT INTO `cart_detail` VALUES (217, 151, 1, 0, 774000);
INSERT INTO `cart_detail` VALUES (5, 10, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (219, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (219, 10, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (221, 200, 1, 0, 130000);
INSERT INTO `cart_detail` VALUES (221, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (221, 479, 1, 0, 134000);
INSERT INTO `cart_detail` VALUES (221, 10, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (221, 147, 1, 0, 477000);
INSERT INTO `cart_detail` VALUES (226, 3, 1, 1, 217000);
INSERT INTO `cart_detail` VALUES (226, 503, 1, 1, 242000);
INSERT INTO `cart_detail` VALUES (226, 15, 1, 1, 927000);
INSERT INTO `cart_detail` VALUES (226, 20, 1, 1, 455000);
INSERT INTO `cart_detail` VALUES (226, 98, 2, 1, 1072000);
INSERT INTO `cart_detail` VALUES (226, 84, 1, 0, 818000);
INSERT INTO `cart_detail` VALUES (226, 8, 1, 0, 414000);
INSERT INTO `cart_detail` VALUES (238, 355, 1, 0, 218000);
INSERT INTO `cart_detail` VALUES (238, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (242, 355, 1, 0, 218000);
INSERT INTO `cart_detail` VALUES (243, 146, 1, 0, 672000);
INSERT INTO `cart_detail` VALUES (246, 161, 1, 0, 466000);
INSERT INTO `cart_detail` VALUES (247, 503, 1, 0, 242000);
INSERT INTO `cart_detail` VALUES (268, 86, 1, 0, 864000);
INSERT INTO `cart_detail` VALUES (269, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (275, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (275, 490, 1, 0, 192000);
INSERT INTO `cart_detail` VALUES (275, 502, 1, 0, 231000);
INSERT INTO `cart_detail` VALUES (275, 493, 1, 0, 197000);
INSERT INTO `cart_detail` VALUES (275, 476, 1, 0, 278000);
INSERT INTO `cart_detail` VALUES (285, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (285, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (285, 200, 1, 0, 130000);
INSERT INTO `cart_detail` VALUES (285, 161, 2, 0, 932000);
INSERT INTO `cart_detail` VALUES (285, 154, 1, 0, 498000);
INSERT INTO `cart_detail` VALUES (290, 248, 1, 1, 187000);
INSERT INTO `cart_detail` VALUES (290, 147, 1, 1, 477000);
INSERT INTO `cart_detail` VALUES (290, 148, 1, 1, 483000);
INSERT INTO `cart_detail` VALUES (262, 253, 1, 1, 261000);
INSERT INTO `cart_detail` VALUES (262, 355, 1, 1, 218000);
INSERT INTO `cart_detail` VALUES (262, 9, 1, 1, 112000);
INSERT INTO `cart_detail` VALUES (262, 139, 1, 1, 389000);
INSERT INTO `cart_detail` VALUES (262, 18, 1, 1, 883000);
INSERT INTO `cart_detail` VALUES (262, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (310, 318, 1, 0, 187000);
INSERT INTO `cart_detail` VALUES (310, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (313, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (315, 499, 1, 1, 127000);
INSERT INTO `cart_detail` VALUES (320, 4, 1, 0, 548000);
INSERT INTO `cart_detail` VALUES (262, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (322, 118, 1, 1, 298000);
INSERT INTO `cart_detail` VALUES (322, 111, 1, 1, 745000);
INSERT INTO `cart_detail` VALUES (333, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (333, 499, 1, 0, 127000);
INSERT INTO `cart_detail` VALUES (335, 91, 1, 0, 859000);
INSERT INTO `cart_detail` VALUES (336, 341, 1, 0, 281000);
INSERT INTO `cart_detail` VALUES (336, 341, 1, 0, 281000);
INSERT INTO `cart_detail` VALUES (338, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (338, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (341, 91, 1, 0, 859000);
INSERT INTO `cart_detail` VALUES (341, 324, 1, 0, 227000);
INSERT INTO `cart_detail` VALUES (341, 324, 1, 0, 227000);
INSERT INTO `cart_detail` VALUES (351, 98, 1, 0, 536000);
INSERT INTO `cart_detail` VALUES (351, 91, 1, 0, 859000);
INSERT INTO `cart_detail` VALUES (351, 86, 1, 0, 864000);
INSERT INTO `cart_detail` VALUES (365, 318, 1, 0, 187000);
INSERT INTO `cart_detail` VALUES (365, 91, 1, 0, 859000);
INSERT INTO `cart_detail` VALUES (262, 151, 2, 0, 1548000);
INSERT INTO `cart_detail` VALUES (378, 332, 1, 0, 189000);
INSERT INTO `cart_detail` VALUES (383, 161, 1, 0, 466000);
INSERT INTO `cart_detail` VALUES (383, 365, 1, 0, 235000);
INSERT INTO `cart_detail` VALUES (402, 419, 1, 0, 183000);
INSERT INTO `cart_detail` VALUES (404, 490, 1, 1, 192000);
INSERT INTO `cart_detail` VALUES (416, 999, 1, 1, 300000);
INSERT INTO `cart_detail` VALUES (417, 190, 1, 1, 162000);
INSERT INTO `cart_detail` VALUES (421, 145, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (314, 145, 1, 0, 520000);
INSERT INTO `cart_detail` VALUES (314, 290, 1, 1, 128000);
INSERT INTO `cart_detail` VALUES (314, 174, 1, 0, 272000);
INSERT INTO `cart_detail` VALUES (314, 172, 1, 1, 250000);
INSERT INTO `cart_detail` VALUES (314, 178, 1, 1, 125000);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cpid` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 0, 'Trừu tượng');
INSERT INTO `categories` VALUES (2, 0, 'Trên không');
INSERT INTO `categories` VALUES (3, 1, 'Động vật');
INSERT INTO `categories` VALUES (5, 1, 'Kí tự');
INSERT INTO `categories` VALUES (6, 1, 'Thức ăn');
INSERT INTO `categories` VALUES (7, 1, 'Thế giới ảnh');
INSERT INTO `categories` VALUES (8, 1, 'Con số');
INSERT INTO `categories` VALUES (9, 1, 'Hoa sen');
INSERT INTO `categories` VALUES (10, 1, 'Viễn tưởng');
INSERT INTO `categories` VALUES (11, 1, 'Nhà trên mây');
INSERT INTO `categories` VALUES (12, 3, 'Đông vật');
INSERT INTO `categories` VALUES (13, 3, 'Thành phố và Kiến trúc');
INSERT INTO `categories` VALUES (14, 3, 'Thượng mại');
INSERT INTO `categories` VALUES (15, 3, 'Mỹ thuật');
INSERT INTO `categories` VALUES (16, 3, 'Thức ăn');
INSERT INTO `categories` VALUES (17, 3, 'Phong cảnh bàn tay');
INSERT INTO `categories` VALUES (18, 3, 'Phong cảnh');
INSERT INTO `categories` VALUES (19, 3, 'Vĩ mô');
INSERT INTO `categories` VALUES (20, 3, 'Tự nhiên');
INSERT INTO `categories` VALUES (21, 3, 'Đêm');
INSERT INTO `categories` VALUES (22, 3, 'Khác');
INSERT INTO `categories` VALUES (23, 3, 'Con người');
INSERT INTO `categories` VALUES (24, 3, 'Sự sống');
INSERT INTO `categories` VALUES (25, 3, 'Đường');
INSERT INTO `categories` VALUES (26, 3, 'Trẻ con');
INSERT INTO `categories` VALUES (27, 3, 'Gia đình');
INSERT INTO `categories` VALUES (28, 5, 'Dữ liệu');
INSERT INTO `categories` VALUES (29, 5, 'Người máy');
INSERT INTO `categories` VALUES (30, 0, 'Phương tiện đi lại');
INSERT INTO `categories` VALUES (31, 0, 'Du lịch');
INSERT INTO `categories` VALUES (32, 2, 'Hoạt hình');
INSERT INTO `categories` VALUES (33, 2, 'Hình nền');
INSERT INTO `categories` VALUES (34, 4, 'Con người');
INSERT INTO `categories` VALUES (35, 4, 'Địa điểm ');
INSERT INTO `categories` VALUES (36, 4, 'Quê hương');
INSERT INTO `categories` VALUES (37, 4, 'Đồng ruộng');

-- ----------------------------
-- Table structure for categories_parent
-- ----------------------------
DROP TABLE IF EXISTS `categories_parent`;
CREATE TABLE `categories_parent`  (
  `cpid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of categories_parent
-- ----------------------------
INSERT INTO `categories_parent` VALUES (1, 'ai');
INSERT INTO `categories_parent` VALUES (2, 'vector');
INSERT INTO `categories_parent` VALUES (3, 'photo');
INSERT INTO `categories_parent` VALUES (4, 'Việt Nam');

-- ----------------------------
-- Table structure for favourite
-- ----------------------------
DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite`  (
  `userId` int NOT NULL,
  `productId` int NOT NULL,
  `dateAdded` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`userId`, `productId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favourite
-- ----------------------------
INSERT INTO `favourite` VALUES (38, 135, '2025-06-05 15:51:36');
INSERT INTO `favourite` VALUES (38, 140, '2025-06-05 15:51:34');
INSERT INTO `favourite` VALUES (38, 155, '2025-06-05 15:51:33');
INSERT INTO `favourite` VALUES (38, 161, '2025-03-17 11:23:35');
INSERT INTO `favourite` VALUES (38, 190, '2025-06-05 15:51:37');
INSERT INTO `favourite` VALUES (107, 125, '2025-06-02 20:23:45');
INSERT INTO `favourite` VALUES (107, 205, '2025-06-02 20:23:48');
INSERT INTO `favourite` VALUES (119, 399, '2025-06-05 09:39:06');
INSERT INTO `favourite` VALUES (119, 401, '2025-06-05 09:39:07');
INSERT INTO `favourite` VALUES (119, 402, '2025-06-05 09:39:09');

-- ----------------------------
-- Table structure for licenses
-- ----------------------------
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses`  (
  `licenseId` int NOT NULL AUTO_INCREMENT,
  `licenseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`licenseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of licenses
-- ----------------------------
INSERT INTO `licenses` VALUES (1, 'Giấy phép tiêu chuẩn', 'Sử dụng không giới hạn trong in ấn, quảng cáo và đóng gói. Phân phối web không giới hạn.');
INSERT INTO `licenses` VALUES (2, 'Giấy phép nâng cao', 'Sử dụng không giới hạn trong in ấn, quảng cáo, đóng gói và trưng bày hàng hóa. Phân phối web không giới hạn.');

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts`  (
  `lgAttId` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `attemptTime` datetime NOT NULL,
  `lockUntil` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`lgAttId`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  CONSTRAINT `login_attempts_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of login_attempts
-- ----------------------------
INSERT INTO `login_attempts` VALUES (3, 34, '2025-06-05 04:02:33', NULL);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `orderId` int NOT NULL,
  `productId` int NOT NULL,
  `licenseId` int NOT NULL,
  `price` double(20, 2) NOT NULL,
  PRIMARY KEY (`orderId`, `productId`, `licenseId`) USING BTREE,
  INDEX `productId_idx`(`productId` ASC) USING BTREE,
  INDEX `licenseId_idx`(`licenseId` ASC) USING BTREE,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`licenseId`) REFERENCES `licenses` (`licenseId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (1, 419, 1, 183000.00);
INSERT INTO `order_details` VALUES (9, 159, 1, 634000.00);
INSERT INTO `order_details` VALUES (9, 161, 1, 466000.00);
INSERT INTO `order_details` VALUES (10, 98, 1, 536000.00);
INSERT INTO `order_details` VALUES (10, 143, 1, 495000.00);
INSERT INTO `order_details` VALUES (10, 146, 1, 672000.00);
INSERT INTO `order_details` VALUES (10, 235, 1, 230000.00);
INSERT INTO `order_details` VALUES (10, 241, 1, 151000.00);
INSERT INTO `order_details` VALUES (11, 91, 1, 859000.00);
INSERT INTO `order_details` VALUES (17, 362, 1, 107000.00);
INSERT INTO `order_details` VALUES (18, 235, 1, 230000.00);
INSERT INTO `order_details` VALUES (18, 240, 1, 192000.00);
INSERT INTO `order_details` VALUES (19, 256, 1, 189000.00);
INSERT INTO `order_details` VALUES (19, 258, 1, 265000.00);
INSERT INTO `order_details` VALUES (21, 235, 1, 230000.00);
INSERT INTO `order_details` VALUES (21, 240, 1, 192000.00);
INSERT INTO `order_details` VALUES (21, 256, 1, 189000.00);
INSERT INTO `order_details` VALUES (21, 258, 1, 265000.00);
INSERT INTO `order_details` VALUES (30, 124, 1, 982000.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `pmid` int NULL DEFAULT NULL,
  `promotionId` int NULL DEFAULT NULL,
  `orderDate` datetime NOT NULL,
  `totalPrice` double(20, 2) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderPaymentDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `uid_idx`(`uid` ASC) USING BTREE,
  INDEX `pmid_idx`(`pmid` ASC) USING BTREE,
  INDEX `promotionId_idx`(`promotionId` ASC) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`pmid`) REFERENCES `payment_method` (`pmid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`promotionId`) REFERENCES `promotions` (`promotionId`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 37, 6, 1, '2025-01-15 00:00:00', 183000.00, 'Completed', '2025-04-01 16:15:13');
INSERT INTO `orders` VALUES (9, 98, 10, 1, '2025-03-05 00:00:00', 1100000.00, 'Completed', '2025-04-01 17:09:24');
INSERT INTO `orders` VALUES (10, 98, 10, 2, '2025-03-05 00:00:00', 2084000.00, 'Completed', '2025-05-10 21:45:24');
INSERT INTO `orders` VALUES (11, 38, 11, 1, '2025-03-30 00:00:00', 859000.00, 'Completed', NULL);
INSERT INTO `orders` VALUES (17, 38, NULL, 1, '2025-04-01 00:00:00', 107000.00, 'Completed', NULL);
INSERT INTO `orders` VALUES (18, 38, NULL, 1, '2025-04-01 16:14:32', 422000.00, 'Completed', '2025-04-01 16:15:13');
INSERT INTO `orders` VALUES (19, 38, NULL, 1, '2025-04-01 17:08:41', 454000.00, 'Completed', '2025-04-01 17:09:24');
INSERT INTO `orders` VALUES (21, 38, NULL, 1, '2025-05-10 21:44:22', 876000.00, 'Completed', '2025-05-10 21:45:24');
INSERT INTO `orders` VALUES (30, 38, 1, 1, '2025-06-04 10:51:05', 982000.00, 'Completed', '2025-06-04 10:52:05');

-- ----------------------------
-- Table structure for payment_method
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method`  (
  `pmid` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `accountName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `accountNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pmTypeId` int NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expiryDate` date NULL DEFAULT NULL,
  `cvc` int NULL DEFAULT NULL,
  PRIMARY KEY (`pmid`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  INDEX `pmTypeId`(`pmTypeId` ASC) USING BTREE,
  CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `payment_method_ibfk_2` FOREIGN KEY (`pmTypeId`) REFERENCES `payment_type` (`pmTypeId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_method
-- ----------------------------
INSERT INTO `payment_method` VALUES (1, 1, 'Nguyễn Minh Huy', '1234567890123456', 1, 'BIDV', '2027-11-22', 123);
INSERT INTO `payment_method` VALUES (2, 1, 'Nguyễn Minh Huy', '215435333121', 2, 'Vietcombank', '2027-11-22', NULL);
INSERT INTO `payment_method` VALUES (6, 37, 'Nguyen thanh thuong', '12345232352', 1, 'Aribank', '2025-12-23', 123);
INSERT INTO `payment_method` VALUES (10, 98, 'hoangphuc', '4385275832', 1, 'BIDV', '2028-12-12', 231);
INSERT INTO `payment_method` VALUES (11, 38, 'Nguyen Van A', '1234 5678 9000', 1, 'BIDV', '2025-06-19', 123);
INSERT INTO `payment_method` VALUES (12, 38, 'NGUYEN VAN A', '9704198526191432198', 1, 'NCB', NULL, 0);

-- ----------------------------
-- Table structure for payment_type
-- ----------------------------
DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type`  (
  `pmTypeId` int NOT NULL AUTO_INCREMENT,
  `pmTypeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pmTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment_type
-- ----------------------------
INSERT INTO `payment_type` VALUES (1, 'Thẻ tín dụng/ghi nợ');
INSERT INTO `payment_type` VALUES (2, 'Tài khoản ngân hàng');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `idPR` int NOT NULL AUTO_INCREMENT,
  `idRole` int NULL DEFAULT NULL,
  `idPermission` int NULL DEFAULT NULL,
  PRIMARY KEY (`idPR`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (2, 2, 1);
INSERT INTO `permission_role` VALUES (3, 1, 1);
INSERT INTO `permission_role` VALUES (4, 1, 2);
INSERT INTO `permission_role` VALUES (5, 1, 3);
INSERT INTO `permission_role` VALUES (6, 0, 1);
INSERT INTO `permission_role` VALUES (7, 0, 2);
INSERT INTO `permission_role` VALUES (8, 0, 3);
INSERT INTO `permission_role` VALUES (9, 0, 4);
INSERT INTO `permission_role` VALUES (10, 0, 5);
INSERT INTO `permission_role` VALUES (11, 0, 6);
INSERT INTO `permission_role` VALUES (12, 0, 7);
INSERT INTO `permission_role` VALUES (13, 0, 8);
INSERT INTO `permission_role` VALUES (14, 0, 9);

-- ----------------------------
-- Table structure for permission_user
-- ----------------------------
DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user`  (
  `idPU` int NOT NULL AUTO_INCREMENT,
  `idPR` int NULL DEFAULT NULL,
  `uid` int NULL DEFAULT NULL,
  PRIMARY KEY (`idPU`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_user
-- ----------------------------
INSERT INTO `permission_user` VALUES (3, 2, 108);
INSERT INTO `permission_user` VALUES (4, 2, 110);
INSERT INTO `permission_user` VALUES (5, 4, 110);
INSERT INTO `permission_user` VALUES (6, 13, 110);
INSERT INTO `permission_user` VALUES (7, 9, 110);
INSERT INTO `permission_user` VALUES (8, 5, 110);
INSERT INTO `permission_user` VALUES (9, 2, 109);
INSERT INTO `permission_user` VALUES (11, 2, 113);
INSERT INTO `permission_user` VALUES (17, 2, 114);
INSERT INTO `permission_user` VALUES (18, 2, 107);
INSERT INTO `permission_user` VALUES (19, 4, 107);
INSERT INTO `permission_user` VALUES (20, 10, 38);
INSERT INTO `permission_user` VALUES (21, 9, 38);
INSERT INTO `permission_user` VALUES (22, 5, 38);
INSERT INTO `permission_user` VALUES (23, 4, 38);
INSERT INTO `permission_user` VALUES (24, 13, 38);
INSERT INTO `permission_user` VALUES (25, 2, 38);
INSERT INTO `permission_user` VALUES (26, 12, 38);
INSERT INTO `permission_user` VALUES (27, 11, 38);
INSERT INTO `permission_user` VALUES (28, 14, 38);
INSERT INTO `permission_user` VALUES (31, 2, 116);
INSERT INTO `permission_user` VALUES (32, 4, 116);
INSERT INTO `permission_user` VALUES (33, 2, 117);
INSERT INTO `permission_user` VALUES (34, 4, 117);
INSERT INTO `permission_user` VALUES (35, 2, 118);
INSERT INTO `permission_user` VALUES (36, 4, 118);
INSERT INTO `permission_user` VALUES (37, 5, 118);
INSERT INTO `permission_user` VALUES (38, 13, 118);
INSERT INTO `permission_user` VALUES (39, 11, 118);
INSERT INTO `permission_user` VALUES (40, 2, 119);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `idPermission` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idPermission`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'Đăng ký bán');
INSERT INTO `permissions` VALUES (2, 'Xem chi tiết bản thống kê sản phẩm bán');
INSERT INTO `permissions` VALUES (3, 'Xóa sản phẩm đã upload');
INSERT INTO `permissions` VALUES (4, 'Tạo mới thông tin hệ thống');
INSERT INTO `permissions` VALUES (5, 'Sửa thông tin trong hệ thống');
INSERT INTO `permissions` VALUES (6, 'Xóa thông tin trong hệ thống');
INSERT INTO `permissions` VALUES (7, 'Chấp nhận, từ chối ảnh chờ accept');
INSERT INTO `permissions` VALUES (8, 'Xem bảng quản trị hệ thống');
INSERT INTO `permissions` VALUES (9, 'Phân quyền người dùng');

-- ----------------------------
-- Table structure for product_license
-- ----------------------------
DROP TABLE IF EXISTS `product_license`;
CREATE TABLE `product_license`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NULL DEFAULT NULL,
  `licenseId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 534 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_license
-- ----------------------------
INSERT INTO `product_license` VALUES (1, 2, 1);
INSERT INTO `product_license` VALUES (2, 4, 1);
INSERT INTO `product_license` VALUES (3, 5, 1);
INSERT INTO `product_license` VALUES (4, 6, 1);
INSERT INTO `product_license` VALUES (5, 7, 1);
INSERT INTO `product_license` VALUES (6, 8, 1);
INSERT INTO `product_license` VALUES (7, 10, 1);
INSERT INTO `product_license` VALUES (8, 11, 1);
INSERT INTO `product_license` VALUES (9, 12, 1);
INSERT INTO `product_license` VALUES (10, 13, 1);
INSERT INTO `product_license` VALUES (11, 14, 1);
INSERT INTO `product_license` VALUES (12, 15, 1);
INSERT INTO `product_license` VALUES (13, 16, 1);
INSERT INTO `product_license` VALUES (14, 17, 1);
INSERT INTO `product_license` VALUES (15, 18, 1);
INSERT INTO `product_license` VALUES (16, 19, 1);
INSERT INTO `product_license` VALUES (17, 20, 1);
INSERT INTO `product_license` VALUES (18, 21, 1);
INSERT INTO `product_license` VALUES (19, 22, 1);
INSERT INTO `product_license` VALUES (20, 23, 1);
INSERT INTO `product_license` VALUES (21, 24, 1);
INSERT INTO `product_license` VALUES (22, 25, 1);
INSERT INTO `product_license` VALUES (23, 26, 1);
INSERT INTO `product_license` VALUES (24, 27, 1);
INSERT INTO `product_license` VALUES (25, 28, 1);
INSERT INTO `product_license` VALUES (26, 29, 1);
INSERT INTO `product_license` VALUES (27, 30, 1);
INSERT INTO `product_license` VALUES (28, 31, 1);
INSERT INTO `product_license` VALUES (29, 32, 1);
INSERT INTO `product_license` VALUES (30, 33, 1);
INSERT INTO `product_license` VALUES (31, 34, 1);
INSERT INTO `product_license` VALUES (32, 35, 1);
INSERT INTO `product_license` VALUES (33, 36, 1);
INSERT INTO `product_license` VALUES (34, 37, 1);
INSERT INTO `product_license` VALUES (35, 38, 1);
INSERT INTO `product_license` VALUES (36, 39, 1);
INSERT INTO `product_license` VALUES (37, 40, 1);
INSERT INTO `product_license` VALUES (38, 41, 1);
INSERT INTO `product_license` VALUES (39, 42, 1);
INSERT INTO `product_license` VALUES (40, 43, 1);
INSERT INTO `product_license` VALUES (41, 44, 1);
INSERT INTO `product_license` VALUES (42, 45, 1);
INSERT INTO `product_license` VALUES (43, 46, 1);
INSERT INTO `product_license` VALUES (44, 47, 1);
INSERT INTO `product_license` VALUES (45, 48, 1);
INSERT INTO `product_license` VALUES (46, 49, 1);
INSERT INTO `product_license` VALUES (47, 50, 1);
INSERT INTO `product_license` VALUES (48, 51, 1);
INSERT INTO `product_license` VALUES (49, 52, 1);
INSERT INTO `product_license` VALUES (50, 53, 1);
INSERT INTO `product_license` VALUES (51, 54, 1);
INSERT INTO `product_license` VALUES (52, 55, 1);
INSERT INTO `product_license` VALUES (53, 56, 1);
INSERT INTO `product_license` VALUES (54, 57, 1);
INSERT INTO `product_license` VALUES (55, 58, 1);
INSERT INTO `product_license` VALUES (56, 59, 1);
INSERT INTO `product_license` VALUES (57, 60, 1);
INSERT INTO `product_license` VALUES (58, 61, 1);
INSERT INTO `product_license` VALUES (59, 62, 1);
INSERT INTO `product_license` VALUES (60, 63, 1);
INSERT INTO `product_license` VALUES (61, 64, 1);
INSERT INTO `product_license` VALUES (62, 65, 1);
INSERT INTO `product_license` VALUES (63, 66, 1);
INSERT INTO `product_license` VALUES (64, 67, 1);
INSERT INTO `product_license` VALUES (65, 68, 1);
INSERT INTO `product_license` VALUES (66, 69, 1);
INSERT INTO `product_license` VALUES (67, 70, 1);
INSERT INTO `product_license` VALUES (68, 71, 1);
INSERT INTO `product_license` VALUES (69, 72, 1);
INSERT INTO `product_license` VALUES (70, 75, 1);
INSERT INTO `product_license` VALUES (71, 76, 1);
INSERT INTO `product_license` VALUES (72, 77, 1);
INSERT INTO `product_license` VALUES (73, 78, 1);
INSERT INTO `product_license` VALUES (74, 79, 1);
INSERT INTO `product_license` VALUES (75, 80, 1);
INSERT INTO `product_license` VALUES (76, 81, 1);
INSERT INTO `product_license` VALUES (77, 82, 1);
INSERT INTO `product_license` VALUES (78, 83, 1);
INSERT INTO `product_license` VALUES (79, 84, 1);
INSERT INTO `product_license` VALUES (80, 85, 1);
INSERT INTO `product_license` VALUES (81, 86, 1);
INSERT INTO `product_license` VALUES (82, 87, 1);
INSERT INTO `product_license` VALUES (83, 88, 1);
INSERT INTO `product_license` VALUES (84, 89, 1);
INSERT INTO `product_license` VALUES (85, 90, 1);
INSERT INTO `product_license` VALUES (86, 91, 1);
INSERT INTO `product_license` VALUES (87, 92, 1);
INSERT INTO `product_license` VALUES (88, 93, 1);
INSERT INTO `product_license` VALUES (89, 94, 1);
INSERT INTO `product_license` VALUES (90, 95, 1);
INSERT INTO `product_license` VALUES (91, 96, 1);
INSERT INTO `product_license` VALUES (92, 97, 1);
INSERT INTO `product_license` VALUES (93, 98, 1);
INSERT INTO `product_license` VALUES (94, 99, 1);
INSERT INTO `product_license` VALUES (95, 100, 1);
INSERT INTO `product_license` VALUES (96, 101, 1);
INSERT INTO `product_license` VALUES (97, 102, 1);
INSERT INTO `product_license` VALUES (98, 103, 1);
INSERT INTO `product_license` VALUES (99, 104, 1);
INSERT INTO `product_license` VALUES (100, 105, 1);
INSERT INTO `product_license` VALUES (101, 106, 1);
INSERT INTO `product_license` VALUES (102, 107, 1);
INSERT INTO `product_license` VALUES (103, 108, 1);
INSERT INTO `product_license` VALUES (104, 109, 1);
INSERT INTO `product_license` VALUES (105, 110, 1);
INSERT INTO `product_license` VALUES (106, 111, 1);
INSERT INTO `product_license` VALUES (107, 112, 1);
INSERT INTO `product_license` VALUES (108, 113, 1);
INSERT INTO `product_license` VALUES (109, 114, 1);
INSERT INTO `product_license` VALUES (110, 115, 1);
INSERT INTO `product_license` VALUES (111, 116, 1);
INSERT INTO `product_license` VALUES (112, 117, 1);
INSERT INTO `product_license` VALUES (113, 118, 1);
INSERT INTO `product_license` VALUES (114, 119, 1);
INSERT INTO `product_license` VALUES (115, 120, 1);
INSERT INTO `product_license` VALUES (116, 121, 1);
INSERT INTO `product_license` VALUES (117, 122, 1);
INSERT INTO `product_license` VALUES (118, 123, 1);
INSERT INTO `product_license` VALUES (119, 124, 1);
INSERT INTO `product_license` VALUES (120, 125, 1);
INSERT INTO `product_license` VALUES (121, 126, 1);
INSERT INTO `product_license` VALUES (122, 127, 1);
INSERT INTO `product_license` VALUES (123, 128, 1);
INSERT INTO `product_license` VALUES (124, 129, 1);
INSERT INTO `product_license` VALUES (125, 130, 1);
INSERT INTO `product_license` VALUES (126, 131, 1);
INSERT INTO `product_license` VALUES (127, 132, 1);
INSERT INTO `product_license` VALUES (128, 133, 1);
INSERT INTO `product_license` VALUES (129, 134, 1);
INSERT INTO `product_license` VALUES (130, 135, 1);
INSERT INTO `product_license` VALUES (131, 136, 1);
INSERT INTO `product_license` VALUES (132, 137, 1);
INSERT INTO `product_license` VALUES (133, 138, 1);
INSERT INTO `product_license` VALUES (134, 139, 1);
INSERT INTO `product_license` VALUES (135, 140, 1);
INSERT INTO `product_license` VALUES (136, 141, 1);
INSERT INTO `product_license` VALUES (137, 142, 1);
INSERT INTO `product_license` VALUES (138, 143, 1);
INSERT INTO `product_license` VALUES (139, 144, 1);
INSERT INTO `product_license` VALUES (140, 145, 1);
INSERT INTO `product_license` VALUES (141, 146, 1);
INSERT INTO `product_license` VALUES (142, 147, 1);
INSERT INTO `product_license` VALUES (143, 148, 1);
INSERT INTO `product_license` VALUES (144, 149, 1);
INSERT INTO `product_license` VALUES (145, 150, 1);
INSERT INTO `product_license` VALUES (146, 151, 1);
INSERT INTO `product_license` VALUES (147, 152, 1);
INSERT INTO `product_license` VALUES (148, 153, 1);
INSERT INTO `product_license` VALUES (149, 154, 1);
INSERT INTO `product_license` VALUES (150, 155, 1);
INSERT INTO `product_license` VALUES (151, 156, 1);
INSERT INTO `product_license` VALUES (152, 157, 1);
INSERT INTO `product_license` VALUES (153, 158, 1);
INSERT INTO `product_license` VALUES (154, 159, 1);
INSERT INTO `product_license` VALUES (155, 160, 1);
INSERT INTO `product_license` VALUES (156, 161, 1);
INSERT INTO `product_license` VALUES (157, 162, 1);
INSERT INTO `product_license` VALUES (158, 163, 1);
INSERT INTO `product_license` VALUES (159, 164, 1);
INSERT INTO `product_license` VALUES (160, 165, 1);
INSERT INTO `product_license` VALUES (161, 166, 1);
INSERT INTO `product_license` VALUES (162, 167, 1);
INSERT INTO `product_license` VALUES (163, 168, 1);
INSERT INTO `product_license` VALUES (164, 169, 1);
INSERT INTO `product_license` VALUES (165, 170, 1);
INSERT INTO `product_license` VALUES (166, 171, 1);
INSERT INTO `product_license` VALUES (167, 172, 1);
INSERT INTO `product_license` VALUES (168, 173, 1);
INSERT INTO `product_license` VALUES (169, 174, 1);
INSERT INTO `product_license` VALUES (170, 175, 1);
INSERT INTO `product_license` VALUES (171, 176, 1);
INSERT INTO `product_license` VALUES (172, 177, 1);
INSERT INTO `product_license` VALUES (173, 178, 1);
INSERT INTO `product_license` VALUES (174, 179, 1);
INSERT INTO `product_license` VALUES (175, 180, 1);
INSERT INTO `product_license` VALUES (176, 181, 1);
INSERT INTO `product_license` VALUES (177, 182, 1);
INSERT INTO `product_license` VALUES (178, 183, 1);
INSERT INTO `product_license` VALUES (179, 184, 1);
INSERT INTO `product_license` VALUES (180, 185, 1);
INSERT INTO `product_license` VALUES (181, 186, 1);
INSERT INTO `product_license` VALUES (182, 187, 1);
INSERT INTO `product_license` VALUES (183, 188, 1);
INSERT INTO `product_license` VALUES (184, 189, 1);
INSERT INTO `product_license` VALUES (185, 190, 1);
INSERT INTO `product_license` VALUES (186, 191, 1);
INSERT INTO `product_license` VALUES (187, 192, 1);
INSERT INTO `product_license` VALUES (188, 193, 1);
INSERT INTO `product_license` VALUES (189, 194, 1);
INSERT INTO `product_license` VALUES (190, 195, 1);
INSERT INTO `product_license` VALUES (191, 196, 1);
INSERT INTO `product_license` VALUES (192, 197, 1);
INSERT INTO `product_license` VALUES (193, 198, 1);
INSERT INTO `product_license` VALUES (194, 199, 1);
INSERT INTO `product_license` VALUES (195, 200, 1);
INSERT INTO `product_license` VALUES (196, 201, 1);
INSERT INTO `product_license` VALUES (197, 202, 1);
INSERT INTO `product_license` VALUES (198, 203, 1);
INSERT INTO `product_license` VALUES (199, 204, 1);
INSERT INTO `product_license` VALUES (200, 205, 1);
INSERT INTO `product_license` VALUES (201, 206, 1);
INSERT INTO `product_license` VALUES (202, 207, 1);
INSERT INTO `product_license` VALUES (203, 208, 1);
INSERT INTO `product_license` VALUES (204, 209, 1);
INSERT INTO `product_license` VALUES (205, 210, 1);
INSERT INTO `product_license` VALUES (206, 211, 1);
INSERT INTO `product_license` VALUES (207, 212, 1);
INSERT INTO `product_license` VALUES (208, 213, 1);
INSERT INTO `product_license` VALUES (209, 214, 1);
INSERT INTO `product_license` VALUES (210, 215, 1);
INSERT INTO `product_license` VALUES (211, 216, 1);
INSERT INTO `product_license` VALUES (212, 217, 1);
INSERT INTO `product_license` VALUES (213, 218, 1);
INSERT INTO `product_license` VALUES (214, 219, 1);
INSERT INTO `product_license` VALUES (215, 220, 1);
INSERT INTO `product_license` VALUES (216, 221, 1);
INSERT INTO `product_license` VALUES (217, 222, 1);
INSERT INTO `product_license` VALUES (218, 223, 1);
INSERT INTO `product_license` VALUES (219, 224, 1);
INSERT INTO `product_license` VALUES (220, 225, 1);
INSERT INTO `product_license` VALUES (221, 226, 1);
INSERT INTO `product_license` VALUES (222, 227, 1);
INSERT INTO `product_license` VALUES (223, 228, 1);
INSERT INTO `product_license` VALUES (224, 229, 1);
INSERT INTO `product_license` VALUES (225, 230, 1);
INSERT INTO `product_license` VALUES (226, 231, 1);
INSERT INTO `product_license` VALUES (227, 232, 1);
INSERT INTO `product_license` VALUES (228, 233, 1);
INSERT INTO `product_license` VALUES (229, 234, 1);
INSERT INTO `product_license` VALUES (230, 235, 1);
INSERT INTO `product_license` VALUES (231, 236, 1);
INSERT INTO `product_license` VALUES (232, 237, 1);
INSERT INTO `product_license` VALUES (233, 238, 1);
INSERT INTO `product_license` VALUES (234, 239, 1);
INSERT INTO `product_license` VALUES (235, 240, 1);
INSERT INTO `product_license` VALUES (236, 241, 1);
INSERT INTO `product_license` VALUES (237, 242, 1);
INSERT INTO `product_license` VALUES (238, 243, 1);
INSERT INTO `product_license` VALUES (239, 244, 1);
INSERT INTO `product_license` VALUES (240, 245, 1);
INSERT INTO `product_license` VALUES (241, 246, 1);
INSERT INTO `product_license` VALUES (242, 247, 1);
INSERT INTO `product_license` VALUES (243, 248, 1);
INSERT INTO `product_license` VALUES (244, 249, 1);
INSERT INTO `product_license` VALUES (245, 250, 1);
INSERT INTO `product_license` VALUES (246, 251, 1);
INSERT INTO `product_license` VALUES (247, 252, 1);
INSERT INTO `product_license` VALUES (248, 253, 1);
INSERT INTO `product_license` VALUES (249, 254, 1);
INSERT INTO `product_license` VALUES (250, 255, 1);
INSERT INTO `product_license` VALUES (251, 256, 1);
INSERT INTO `product_license` VALUES (252, 257, 1);
INSERT INTO `product_license` VALUES (253, 258, 1);
INSERT INTO `product_license` VALUES (254, 259, 1);
INSERT INTO `product_license` VALUES (255, 260, 1);
INSERT INTO `product_license` VALUES (256, 261, 1);
INSERT INTO `product_license` VALUES (257, 262, 1);
INSERT INTO `product_license` VALUES (258, 263, 1);
INSERT INTO `product_license` VALUES (259, 264, 1);
INSERT INTO `product_license` VALUES (260, 265, 1);
INSERT INTO `product_license` VALUES (261, 266, 1);
INSERT INTO `product_license` VALUES (262, 267, 1);
INSERT INTO `product_license` VALUES (263, 268, 1);
INSERT INTO `product_license` VALUES (264, 269, 1);
INSERT INTO `product_license` VALUES (265, 270, 1);
INSERT INTO `product_license` VALUES (266, 271, 1);
INSERT INTO `product_license` VALUES (267, 272, 1);
INSERT INTO `product_license` VALUES (268, 273, 1);
INSERT INTO `product_license` VALUES (269, 274, 1);
INSERT INTO `product_license` VALUES (270, 275, 1);
INSERT INTO `product_license` VALUES (271, 276, 1);
INSERT INTO `product_license` VALUES (272, 277, 1);
INSERT INTO `product_license` VALUES (273, 278, 1);
INSERT INTO `product_license` VALUES (274, 279, 1);
INSERT INTO `product_license` VALUES (275, 280, 1);
INSERT INTO `product_license` VALUES (276, 281, 1);
INSERT INTO `product_license` VALUES (277, 282, 1);
INSERT INTO `product_license` VALUES (278, 283, 1);
INSERT INTO `product_license` VALUES (279, 284, 1);
INSERT INTO `product_license` VALUES (280, 285, 1);
INSERT INTO `product_license` VALUES (281, 286, 1);
INSERT INTO `product_license` VALUES (282, 287, 1);
INSERT INTO `product_license` VALUES (283, 288, 1);
INSERT INTO `product_license` VALUES (284, 289, 1);
INSERT INTO `product_license` VALUES (285, 290, 1);
INSERT INTO `product_license` VALUES (286, 291, 1);
INSERT INTO `product_license` VALUES (287, 292, 1);
INSERT INTO `product_license` VALUES (288, 293, 1);
INSERT INTO `product_license` VALUES (289, 294, 1);
INSERT INTO `product_license` VALUES (290, 295, 1);
INSERT INTO `product_license` VALUES (291, 296, 1);
INSERT INTO `product_license` VALUES (292, 297, 1);
INSERT INTO `product_license` VALUES (293, 298, 1);
INSERT INTO `product_license` VALUES (294, 299, 1);
INSERT INTO `product_license` VALUES (295, 300, 1);
INSERT INTO `product_license` VALUES (296, 301, 1);
INSERT INTO `product_license` VALUES (297, 302, 1);
INSERT INTO `product_license` VALUES (298, 303, 1);
INSERT INTO `product_license` VALUES (299, 304, 1);
INSERT INTO `product_license` VALUES (300, 305, 1);
INSERT INTO `product_license` VALUES (301, 306, 1);
INSERT INTO `product_license` VALUES (302, 307, 1);
INSERT INTO `product_license` VALUES (303, 308, 1);
INSERT INTO `product_license` VALUES (304, 309, 1);
INSERT INTO `product_license` VALUES (305, 310, 1);
INSERT INTO `product_license` VALUES (306, 311, 1);
INSERT INTO `product_license` VALUES (307, 312, 1);
INSERT INTO `product_license` VALUES (308, 313, 1);
INSERT INTO `product_license` VALUES (309, 314, 1);
INSERT INTO `product_license` VALUES (310, 315, 1);
INSERT INTO `product_license` VALUES (311, 316, 1);
INSERT INTO `product_license` VALUES (312, 317, 1);
INSERT INTO `product_license` VALUES (313, 318, 1);
INSERT INTO `product_license` VALUES (314, 319, 1);
INSERT INTO `product_license` VALUES (315, 320, 1);
INSERT INTO `product_license` VALUES (316, 321, 1);
INSERT INTO `product_license` VALUES (317, 322, 1);
INSERT INTO `product_license` VALUES (318, 323, 1);
INSERT INTO `product_license` VALUES (319, 324, 1);
INSERT INTO `product_license` VALUES (320, 325, 1);
INSERT INTO `product_license` VALUES (321, 326, 1);
INSERT INTO `product_license` VALUES (322, 327, 1);
INSERT INTO `product_license` VALUES (323, 328, 1);
INSERT INTO `product_license` VALUES (324, 329, 1);
INSERT INTO `product_license` VALUES (325, 330, 1);
INSERT INTO `product_license` VALUES (326, 331, 1);
INSERT INTO `product_license` VALUES (327, 332, 1);
INSERT INTO `product_license` VALUES (328, 333, 1);
INSERT INTO `product_license` VALUES (329, 334, 1);
INSERT INTO `product_license` VALUES (330, 335, 1);
INSERT INTO `product_license` VALUES (331, 336, 1);
INSERT INTO `product_license` VALUES (332, 337, 1);
INSERT INTO `product_license` VALUES (333, 338, 1);
INSERT INTO `product_license` VALUES (334, 339, 1);
INSERT INTO `product_license` VALUES (335, 340, 1);
INSERT INTO `product_license` VALUES (336, 341, 1);
INSERT INTO `product_license` VALUES (337, 342, 1);
INSERT INTO `product_license` VALUES (338, 343, 1);
INSERT INTO `product_license` VALUES (339, 344, 1);
INSERT INTO `product_license` VALUES (340, 345, 1);
INSERT INTO `product_license` VALUES (341, 346, 1);
INSERT INTO `product_license` VALUES (342, 347, 1);
INSERT INTO `product_license` VALUES (343, 348, 1);
INSERT INTO `product_license` VALUES (344, 349, 1);
INSERT INTO `product_license` VALUES (345, 350, 1);
INSERT INTO `product_license` VALUES (346, 352, 1);
INSERT INTO `product_license` VALUES (347, 353, 1);
INSERT INTO `product_license` VALUES (348, 354, 1);
INSERT INTO `product_license` VALUES (349, 355, 1);
INSERT INTO `product_license` VALUES (350, 356, 1);
INSERT INTO `product_license` VALUES (351, 357, 1);
INSERT INTO `product_license` VALUES (352, 358, 1);
INSERT INTO `product_license` VALUES (353, 359, 1);
INSERT INTO `product_license` VALUES (354, 360, 1);
INSERT INTO `product_license` VALUES (355, 361, 1);
INSERT INTO `product_license` VALUES (356, 362, 1);
INSERT INTO `product_license` VALUES (357, 363, 1);
INSERT INTO `product_license` VALUES (358, 364, 1);
INSERT INTO `product_license` VALUES (359, 365, 1);
INSERT INTO `product_license` VALUES (360, 366, 1);
INSERT INTO `product_license` VALUES (361, 367, 1);
INSERT INTO `product_license` VALUES (362, 368, 1);
INSERT INTO `product_license` VALUES (363, 369, 1);
INSERT INTO `product_license` VALUES (364, 370, 1);
INSERT INTO `product_license` VALUES (365, 371, 1);
INSERT INTO `product_license` VALUES (366, 372, 1);
INSERT INTO `product_license` VALUES (367, 373, 1);
INSERT INTO `product_license` VALUES (368, 374, 1);
INSERT INTO `product_license` VALUES (369, 375, 1);
INSERT INTO `product_license` VALUES (370, 376, 1);
INSERT INTO `product_license` VALUES (371, 377, 1);
INSERT INTO `product_license` VALUES (372, 378, 1);
INSERT INTO `product_license` VALUES (373, 379, 1);
INSERT INTO `product_license` VALUES (374, 380, 1);
INSERT INTO `product_license` VALUES (375, 381, 1);
INSERT INTO `product_license` VALUES (376, 382, 1);
INSERT INTO `product_license` VALUES (377, 383, 1);
INSERT INTO `product_license` VALUES (378, 384, 1);
INSERT INTO `product_license` VALUES (379, 385, 1);
INSERT INTO `product_license` VALUES (380, 386, 1);
INSERT INTO `product_license` VALUES (381, 387, 1);
INSERT INTO `product_license` VALUES (382, 388, 1);
INSERT INTO `product_license` VALUES (383, 389, 1);
INSERT INTO `product_license` VALUES (384, 390, 1);
INSERT INTO `product_license` VALUES (385, 391, 1);
INSERT INTO `product_license` VALUES (386, 392, 1);
INSERT INTO `product_license` VALUES (387, 393, 1);
INSERT INTO `product_license` VALUES (388, 394, 1);
INSERT INTO `product_license` VALUES (389, 395, 1);
INSERT INTO `product_license` VALUES (390, 396, 1);
INSERT INTO `product_license` VALUES (391, 397, 1);
INSERT INTO `product_license` VALUES (392, 398, 1);
INSERT INTO `product_license` VALUES (393, 399, 1);
INSERT INTO `product_license` VALUES (394, 400, 1);
INSERT INTO `product_license` VALUES (395, 401, 1);
INSERT INTO `product_license` VALUES (396, 402, 1);
INSERT INTO `product_license` VALUES (397, 403, 1);
INSERT INTO `product_license` VALUES (398, 404, 1);
INSERT INTO `product_license` VALUES (399, 405, 1);
INSERT INTO `product_license` VALUES (400, 406, 1);
INSERT INTO `product_license` VALUES (401, 407, 1);
INSERT INTO `product_license` VALUES (402, 408, 1);
INSERT INTO `product_license` VALUES (403, 409, 1);
INSERT INTO `product_license` VALUES (404, 410, 1);
INSERT INTO `product_license` VALUES (405, 411, 1);
INSERT INTO `product_license` VALUES (406, 412, 1);
INSERT INTO `product_license` VALUES (407, 413, 1);
INSERT INTO `product_license` VALUES (408, 414, 1);
INSERT INTO `product_license` VALUES (409, 415, 1);
INSERT INTO `product_license` VALUES (410, 416, 1);
INSERT INTO `product_license` VALUES (411, 417, 1);
INSERT INTO `product_license` VALUES (412, 418, 1);
INSERT INTO `product_license` VALUES (413, 419, 1);
INSERT INTO `product_license` VALUES (414, 420, 1);
INSERT INTO `product_license` VALUES (415, 421, 1);
INSERT INTO `product_license` VALUES (416, 422, 1);
INSERT INTO `product_license` VALUES (417, 423, 1);
INSERT INTO `product_license` VALUES (418, 424, 1);
INSERT INTO `product_license` VALUES (419, 425, 1);
INSERT INTO `product_license` VALUES (420, 426, 1);
INSERT INTO `product_license` VALUES (421, 427, 1);
INSERT INTO `product_license` VALUES (422, 428, 1);
INSERT INTO `product_license` VALUES (423, 429, 1);
INSERT INTO `product_license` VALUES (424, 430, 1);
INSERT INTO `product_license` VALUES (425, 431, 1);
INSERT INTO `product_license` VALUES (426, 432, 1);
INSERT INTO `product_license` VALUES (427, 433, 1);
INSERT INTO `product_license` VALUES (428, 434, 1);
INSERT INTO `product_license` VALUES (429, 435, 1);
INSERT INTO `product_license` VALUES (430, 436, 1);
INSERT INTO `product_license` VALUES (431, 437, 1);
INSERT INTO `product_license` VALUES (432, 438, 1);
INSERT INTO `product_license` VALUES (433, 439, 1);
INSERT INTO `product_license` VALUES (434, 440, 1);
INSERT INTO `product_license` VALUES (435, 442, 1);
INSERT INTO `product_license` VALUES (436, 443, 1);
INSERT INTO `product_license` VALUES (437, 444, 1);
INSERT INTO `product_license` VALUES (438, 445, 1);
INSERT INTO `product_license` VALUES (439, 446, 1);
INSERT INTO `product_license` VALUES (440, 447, 1);
INSERT INTO `product_license` VALUES (441, 448, 1);
INSERT INTO `product_license` VALUES (442, 449, 1);
INSERT INTO `product_license` VALUES (443, 450, 1);
INSERT INTO `product_license` VALUES (444, 451, 1);
INSERT INTO `product_license` VALUES (445, 452, 1);
INSERT INTO `product_license` VALUES (446, 453, 1);
INSERT INTO `product_license` VALUES (447, 454, 1);
INSERT INTO `product_license` VALUES (448, 455, 1);
INSERT INTO `product_license` VALUES (449, 456, 1);
INSERT INTO `product_license` VALUES (450, 457, 1);
INSERT INTO `product_license` VALUES (451, 458, 1);
INSERT INTO `product_license` VALUES (452, 459, 1);
INSERT INTO `product_license` VALUES (453, 460, 1);
INSERT INTO `product_license` VALUES (454, 461, 1);
INSERT INTO `product_license` VALUES (455, 462, 1);
INSERT INTO `product_license` VALUES (456, 463, 1);
INSERT INTO `product_license` VALUES (457, 464, 1);
INSERT INTO `product_license` VALUES (458, 465, 1);
INSERT INTO `product_license` VALUES (459, 466, 1);
INSERT INTO `product_license` VALUES (460, 467, 1);
INSERT INTO `product_license` VALUES (461, 468, 1);
INSERT INTO `product_license` VALUES (462, 469, 1);
INSERT INTO `product_license` VALUES (463, 470, 1);
INSERT INTO `product_license` VALUES (464, 471, 1);
INSERT INTO `product_license` VALUES (465, 472, 1);
INSERT INTO `product_license` VALUES (466, 473, 1);
INSERT INTO `product_license` VALUES (467, 474, 1);
INSERT INTO `product_license` VALUES (468, 475, 1);
INSERT INTO `product_license` VALUES (469, 476, 1);
INSERT INTO `product_license` VALUES (470, 477, 1);
INSERT INTO `product_license` VALUES (471, 478, 1);
INSERT INTO `product_license` VALUES (472, 479, 1);
INSERT INTO `product_license` VALUES (473, 480, 1);
INSERT INTO `product_license` VALUES (474, 481, 1);
INSERT INTO `product_license` VALUES (475, 482, 1);
INSERT INTO `product_license` VALUES (476, 483, 1);
INSERT INTO `product_license` VALUES (477, 484, 1);
INSERT INTO `product_license` VALUES (478, 485, 1);
INSERT INTO `product_license` VALUES (479, 486, 1);
INSERT INTO `product_license` VALUES (480, 487, 1);
INSERT INTO `product_license` VALUES (481, 488, 1);
INSERT INTO `product_license` VALUES (482, 489, 1);
INSERT INTO `product_license` VALUES (483, 490, 1);
INSERT INTO `product_license` VALUES (484, 491, 1);
INSERT INTO `product_license` VALUES (485, 492, 1);
INSERT INTO `product_license` VALUES (486, 493, 1);
INSERT INTO `product_license` VALUES (487, 494, 1);
INSERT INTO `product_license` VALUES (488, 495, 1);
INSERT INTO `product_license` VALUES (489, 496, 1);
INSERT INTO `product_license` VALUES (490, 497, 1);
INSERT INTO `product_license` VALUES (491, 498, 1);
INSERT INTO `product_license` VALUES (492, 499, 1);
INSERT INTO `product_license` VALUES (493, 500, 1);
INSERT INTO `product_license` VALUES (494, 501, 1);
INSERT INTO `product_license` VALUES (495, 502, 1);
INSERT INTO `product_license` VALUES (496, 503, 1);
INSERT INTO `product_license` VALUES (497, 504, 1);
INSERT INTO `product_license` VALUES (498, 505, 1);
INSERT INTO `product_license` VALUES (499, 506, 1);
INSERT INTO `product_license` VALUES (500, 507, 1);
INSERT INTO `product_license` VALUES (501, 508, 1);
INSERT INTO `product_license` VALUES (502, 509, 1);
INSERT INTO `product_license` VALUES (503, 510, 1);
INSERT INTO `product_license` VALUES (504, 511, 1);
INSERT INTO `product_license` VALUES (505, 512, 1);
INSERT INTO `product_license` VALUES (506, 513, 1);
INSERT INTO `product_license` VALUES (507, 514, 1);
INSERT INTO `product_license` VALUES (508, 515, 1);
INSERT INTO `product_license` VALUES (509, 516, 1);
INSERT INTO `product_license` VALUES (513, 999, 1);
INSERT INTO `product_license` VALUES (514, 1000, 1);
INSERT INTO `product_license` VALUES (515, 1001, 1);
INSERT INTO `product_license` VALUES (516, 1002, 1);
INSERT INTO `product_license` VALUES (517, 1003, 1);
INSERT INTO `product_license` VALUES (518, 1004, 1);
INSERT INTO `product_license` VALUES (519, 1005, 1);
INSERT INTO `product_license` VALUES (520, 1006, 1);
INSERT INTO `product_license` VALUES (521, 1007, 1);
INSERT INTO `product_license` VALUES (522, 1008, 1);
INSERT INTO `product_license` VALUES (523, 1009, 1);
INSERT INTO `product_license` VALUES (524, 1010, 1);
INSERT INTO `product_license` VALUES (525, 1011, 1);
INSERT INTO `product_license` VALUES (526, 1012, 1);
INSERT INTO `product_license` VALUES (527, 1013, 1);
INSERT INTO `product_license` VALUES (528, 1014, 1);
INSERT INTO `product_license` VALUES (529, 1015, 1);
INSERT INTO `product_license` VALUES (530, 1016, 1);
INSERT INTO `product_license` VALUES (531, 1017, 1);
INSERT INTO `product_license` VALUES (532, 1018, 1);
INSERT INTO `product_license` VALUES (533, 1019, 1);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dimension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `dateUpload` datetime NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` decimal(20, 0) NULL DEFAULT NULL,
  `status` enum('accepted','waiting','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'waiting',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1020 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (4, 37, 1, 'Ánh sáng cực quang', 'Một hình tròn phát ra ánh sáng ảo diệu', '366 kB', '2048x1152', '2023-09-08 00:00:00', '../assets/images/Abstract/4.jpg', 548000, 'accepted');
INSERT INTO `products` VALUES (5, 37, 1, 'Đất đá nức nẻ', 'Hình ảnh một vùng đất bùn bị nẻ ra do nắng', '1489 kB', '2048x1365', '2024-02-02 00:00:00', '../assets/images/Abstract/5.jpg', 330000, 'accepted');
INSERT INTO `products` VALUES (6, 37, 1, 'Đồng hồ thời gian', 'Hình ảnh một chiếc đồng hồ thể hiện sự trôi nhanh của thời gian', '287 kB', '1024x650', '2024-02-23 00:00:00', '../assets/images/Abstract/6.jpg', 887000, 'accepted');
INSERT INTO `products` VALUES (7, 37, 1, 'Nương rẫy', 'Hình ảnh của một rẫy nhìn từ trên cao xuống', '1915 kB', '2048x1523', '2023-10-12 00:00:00', '../assets/images/Abstract/7.jpg', 852000, 'rejected');
INSERT INTO `products` VALUES (8, 34, 1, 'Hình bình hành ảo giác', 'Một hình ảnh trừu tượng về các ô hình bình hành', '268 kB', '2048x1222', '2024-08-12 00:00:00', '../assets/images/Abstract/8.jpg', 414000, 'accepted');
INSERT INTO `products` VALUES (10, 34, 1, 'Ảnh dưới kính hiển vi', 'Một hình ảnh trừu tượng về thế giới của các loài vi khuẩn', '885 kB', '2048x1356', '2024-07-16 00:00:00', '../assets/images/Abstract/10.jpg', 520000, 'accepted');
INSERT INTO `products` VALUES (11, 34, 2, 'Hoàng hôn bên bờ biển', 'Những chiếc thuyền nhỏ nghỉ ngơi trên bãi cát, ánh nắng vàng rực phủ kín mặt biển lặng.', '694 kB', '2048x1115', '2024-01-09 00:00:00', '../assets/images/Aerial/1.jpg', 482000, 'accepted');
INSERT INTO `products` VALUES (13, 34, 2, 'Đỉnh núi với mây', 'Một ngọn núi với mây che đỉnh', '893 kB', '2048x1536', '2023-09-19 00:00:00', '../assets/images/Aerial/3.jpg', 125000, 'accepted');
INSERT INTO `products` VALUES (14, 34, 2, 'Con đường ngoằn nghèo', 'Những con đường cao tốc  xen kẽ nhau', '1558 kB', '2048x1365', '2024-06-02 00:00:00', '../assets/images/Aerial/4.jpg', 390000, 'accepted');
INSERT INTO `products` VALUES (15, 34, 2, 'Thành phố', 'Hình ảnh một thành phố với những tòa nhà chi chít nhìn từ trên cao', '997 kB', '2048x1365', '2023-07-01 00:00:00', '../assets/images/Aerial/5.jpg', 927000, 'accepted');
INSERT INTO `products` VALUES (16, 34, 2, 'Bờ biển huyền diệu', 'Một bờ biển nhìn cực ký ảo diệu', '1347 kB', '2048x1536', '2023-07-23 00:00:00', '../assets/images/Aerial/6.jpg', 776000, 'accepted');
INSERT INTO `products` VALUES (17, 34, 2, 'Hoàng hôn thành phố', 'Một thành phố về hoàng hôn', '1210 kB', '2048x1367', '2023-05-12 00:00:00', '../assets/images/Aerial/7.jpg', 459000, 'accepted');
INSERT INTO `products` VALUES (18, 34, 2, 'Hồ tuyết', 'Một chiếc hồ trong không gian bị đóng băng của mùa đông', '543 kB', '2048x1152', '2023-07-19 00:00:00', '../assets/images/Aerial/8.jpg', 883000, 'accepted');
INSERT INTO `products` VALUES (19, 34, 2, 'Nông trại', 'Nông trại với những ruộng lúa thẳng tắp', '732 kB', '2048x1152', '2023-06-09 00:00:00', '../assets/images/Aerial/9.jpg', 594000, 'accepted');
INSERT INTO `products` VALUES (20, 34, 2, 'Hoàng hôn tại làng quê', 'Hình ảnh vào buổi hoàng hôn tại một ngôi làng nhỏ', '932 kB', '2048x1363', '2024-04-22 00:00:00', '../assets/images/Aerial/10.jpg', 455000, 'accepted');
INSERT INTO `products` VALUES (21, 34, 3, 'Mèo với quả cam', 'Một con mèo trên một cây cam', '197 kB', '964x1280', '2023-10-31 00:00:00', '../assets/images/ai/Animal/10.jpg', 147000, 'accepted');
INSERT INTO `products` VALUES (22, 34, 3, 'Mèo vũ trụ', 'Một con mèo với phông nền vũ trụ', '281 kB', '853x1280', '2023-09-25 00:00:00', '../assets/images/ai/Animal/021.jpg', 632000, 'accepted');
INSERT INTO `products` VALUES (23, 34, 3, 'Mèo hoa văn', 'Nhiều con mèo được mô tả một cách trừu tượng bằng những họa tiết', '284 kB', '853x1280', '2024-02-17 00:00:00', '../assets/images/ai/Animal/022.jpg', 428000, 'accepted');
INSERT INTO `products` VALUES (24, 34, 3, 'Mèo với bướm', 'Một con mèo và những chú bướm', '154 kB', '853x1280', '2023-10-14 00:00:00', '../assets/images/ai/Animal/023.jpg', 622000, 'accepted');
INSERT INTO `products` VALUES (25, 34, 3, 'Mèo với quả cam', 'Một chú mèo ngước mắt nhìn những quả cam trên cây', '230 kB', '964x1280', '2024-02-25 00:00:00', '../assets/images/ai/Animal/024.jpg', 311000, 'accepted');
INSERT INTO `products` VALUES (26, 34, 3, 'Mèo với quả nho', 'Một chú mèo ngước mắt nhìn những quả cam trên cây', '193 kB', '964x1280', '2023-12-02 00:00:00', '../assets/images/ai/Animal/025.jpg', 441000, 'accepted');
INSERT INTO `products` VALUES (27, 34, 3, 'Mèo với quả cam', 'Một chú mèo ngước mắt nhìn những quả cam trên cây', '200 kB', '964x1280', '2023-04-24 00:00:00', '../assets/images/ai/Animal/026.jpg', 765000, 'accepted');
INSERT INTO `products` VALUES (28, 34, 3, 'Mèo với quả nho', 'Một chú mèo đang trèo trên một cây nho và liếm chân', '221 kB', '964x1280', '2023-06-16 00:00:00', '../assets/images/ai/Animal/027.jpg', 292000, 'accepted');
INSERT INTO `products` VALUES (29, 34, 3, 'Mèo với quả vải', 'Một chú mèo trên cây vải', '191 kB', '964x1280', '2023-10-15 00:00:00', '../assets/images/ai/Animal/028.jpg', 855000, 'accepted');
INSERT INTO `products` VALUES (30, 34, 3, 'Mèo với quả vải', 'Một chú mèo trên cây vải', '235 kB', '964x1280', '2023-05-12 00:00:00', '../assets/images/ai/Animal/029.jpg', 502000, 'accepted');
INSERT INTO `products` VALUES (31, 34, 3, 'Mèo với quả xoài', 'Một chú mèo trên cây xoài', '182 kB', '964x1280', '2023-11-28 00:00:00', '../assets/images/ai/Animal/030.jpg', 908000, 'accepted');
INSERT INTO `products` VALUES (32, 34, 3, 'Mèo với quả xoài', 'Một chú mèo trên cây xoài', '182 kB', '1280x853', '2024-05-16 00:00:00', '../assets/images/ai/Animal/031.jpg', 433000, 'accepted');
INSERT INTO `products` VALUES (33, 34, 3, 'Mèo ngủ trên cây cam', 'Một chú mèo ngủ trên một cây cam', '217 kB', '964x1280', '2023-01-02 00:00:00', '../assets/images/ai/Animal/032.jpg', 801000, 'accepted');
INSERT INTO `products` VALUES (34, 34, 3, 'Ong chúa', 'Một con ong khổng lồ', '682 kB', '794x447', '2024-02-16 00:00:00', '../assets/images/ai/Animal/033.png', 571000, 'accepted');
INSERT INTO `products` VALUES (35, 34, 3, 'Ong mật', 'Một con ong mật đang đậu', '699 kB', '794x447', '2023-06-03 00:00:00', '../assets/images/ai/Animal/034.png', 542000, 'accepted');
INSERT INTO `products` VALUES (36, 34, 3, 'Ong mật nhìn phải', 'Một con ong mật đang đậu và nhìn bên phải', '633 kB', '794x447', '2023-05-29 00:00:00', '../assets/images/ai/Animal/035.png', 585000, 'accepted');
INSERT INTO `products` VALUES (37, 34, 3, 'Ong mật nhìn trái', 'Một con ong mật đang đậu bên trái', '580 kB', '794x447', '2023-02-10 00:00:00', '../assets/images/ai/Animal/036.png', 509000, 'accepted');
INSERT INTO `products` VALUES (38, 34, 3, 'Ong mật chiến', 'Một con ong mật đang nhìn thẳng rất chiến', '566 kB', '795x447', '2024-06-09 00:00:00', '../assets/images/ai/Animal/037.png', 138000, 'accepted');
INSERT INTO `products` VALUES (39, 34, 3, 'Ong mật', 'Một con ong mật đang đậu', '428 kB', '702x447', '2024-07-24 00:00:00', '../assets/images/ai/Animal/038.png', 320000, 'accepted');
INSERT INTO `products` VALUES (40, 34, 3, 'Ong mật béo', 'Một con ong mật đang đậu và nhìn rất béo', '574 kB', '794x447', '2024-03-15 00:00:00', '../assets/images/ai/Animal/039.png', 638000, 'accepted');
INSERT INTO `products` VALUES (41, 34, 3, 'Ong mật ba chân', 'Một con ong mật đang đậu và nó chỉ có ba chân', '575 kB', '795x447', '2024-07-30 00:00:00', '../assets/images/ai/Animal/040.png', 233000, 'accepted');
INSERT INTO `products` VALUES (42, 34, 3, 'Ong mật', 'Một con ong mật đang đậu', '665 kB', '794x447', '2024-02-26 00:00:00', '../assets/images/ai/Animal/041.png', 370000, 'accepted');
INSERT INTO `products` VALUES (43, 34, 3, 'Ong mật', 'Một con ong mật đang đậu', '574 kB', '794x447', '2023-03-19 00:00:00', '../assets/images/ai/Animal/042.png', 748000, 'accepted');
INSERT INTO `products` VALUES (44, 34, 3, 'Chó với rừng cây', 'Một chú chó đang nằm trong một rừng cây', '43 kB', '447x447', '2023-10-12 00:00:00', '../assets/images/ai/Animal/043.jpg', 318000, 'accepted');
INSERT INTO `products` VALUES (45, 34, 3, 'Avatar chó', 'Ảnh một chú chó đang thè lưỡi trong khung tròn được đan bằng lá cây', '50 kB', '447x447', '2023-04-08 00:00:00', '../assets/images/ai/Animal/044.jpg', 986000, 'accepted');
INSERT INTO `products` VALUES (46, 34, 3, 'Chó với cây liễu', 'Một chú chó với phông nền là lá cây liễu', '41 kB', '447x447', '2023-02-22 00:00:00', '../assets/images/ai/Animal/045.jpg', 422000, 'accepted');
INSERT INTO `products` VALUES (47, 34, 3, 'Chó với lá cây', 'Một chú chó với nhwunxg chiếc lá cây mùa thu', '49 kB', '447x447', '2023-05-12 00:00:00', '../assets/images/ai/Animal/046.jpg', 650000, 'accepted');
INSERT INTO `products` VALUES (48, 34, 3, 'Xoắn ốc trừu tượng', 'Xoắn ốc với những màu sắc kỳ lạ', '49 kB', '447x447', '2023-07-14 00:00:00', '../assets/images/ai/Animal/047.jpg', 788000, 'accepted');
INSERT INTO `products` VALUES (49, 34, 3, 'Chó lông xoắn', 'Một chú chó lông xoắn với ánh mắt long lanh', '33 kB', '447x447', '2024-01-11 00:00:00', '../assets/images/ai/Animal/048.jpg', 443000, 'accepted');
INSERT INTO `products` VALUES (50, 34, 3, 'Chó với bong bóng', 'Một chú chó với đầu bị dính sơn và phông nền với những chiếc bong bóng', '34 kB', '447x447', '2023-05-04 00:00:00', '../assets/images/ai/Animal/049.jpg', 404000, 'accepted');
INSERT INTO `products` VALUES (51, 34, 3, 'Chó với ly chè', 'Một chú chó đang ngồi với một ly chè phía trước', '35 kB', '447x447', '2023-11-08 00:00:00', '../assets/images/ai/Animal/050.jpg', 934000, 'accepted');
INSERT INTO `products` VALUES (52, 34, 3, 'Mèo với lát cam', 'Ảnh mặt của một chú mèo với sự trang trí của những lát cam', '211 kB', '298x447', '2024-06-15 00:00:00', '../assets/images/ai/Animal/051.png', 835000, 'accepted');
INSERT INTO `products` VALUES (53, 34, 3, 'Mèo quyến rũ', 'Một chú mèo cái với những bông hoa nhìn rất dễ thương', '205 kB', '298x447', '2024-03-03 00:00:00', '../assets/images/ai/Animal/052.png', 451000, 'accepted');
INSERT INTO `products` VALUES (54, 34, 3, 'Mèo với bông hoa', 'Một chú mèo cái với những bông hoa trang trí', '199 kB', '298x447', '2023-10-08 00:00:00', '../assets/images/ai/Animal/053.png', 871000, 'accepted');
INSERT INTO `products` VALUES (55, 34, 3, 'Mèo với lá cây', 'Mặt một chú mèo trong tán lá cây', '219 kB', '298x447', '2023-02-06 00:00:00', '../assets/images/ai/Animal/054.png', 296000, 'accepted');
INSERT INTO `products` VALUES (56, 34, 3, 'Mèo đen với hoa tím', 'Một chú mèo trang trí với những bông hoa tím', '236 kB', '298x447', '2023-11-28 00:00:00', '../assets/images/ai/Animal/055.png', 538000, 'accepted');
INSERT INTO `products` VALUES (57, 34, 3, 'Mèo với hoa', 'Một chú mèo trang trí với những bông hoa tím', '240 kB', '298x447', '2024-04-25 00:00:00', '../assets/images/ai/Animal/056.png', 585000, 'accepted');
INSERT INTO `products` VALUES (58, 34, 3, 'Mèo nằm trên hoa', 'Một chú mào trang trí với các bông hoa', '221 kB', '298x447', '2023-07-21 00:00:00', '../assets/images/ai/Animal/057.png', 841000, 'accepted');
INSERT INTO `products` VALUES (59, 34, 3, 'Mèo nhìn sang trái', 'Một chiếc mèo liếc mắt sang trái', '201 kB', '298x447', '2023-07-24 00:00:00', '../assets/images/ai/Animal/058.png', 261000, 'accepted');
INSERT INTO `products` VALUES (60, 34, 3, 'Mèo đám mây', 'Hình ảnh một chú mèo trừu tượng giống như một đám mây', '209 kB', '298x447', '2023-12-09 00:00:00', '../assets/images/ai/Animal/059.png', 587000, 'accepted');
INSERT INTO `products` VALUES (61, 34, 3, 'Mèo mắt xanh', 'Hình ảnh một chú mèo trừu tượng giống như một đám mây', '211 kB', '298x447', '2023-04-08 00:00:00', '../assets/images/ai/Animal/060.png', 812000, 'accepted');
INSERT INTO `products` VALUES (62, 34, 3, 'Mèo đang cười', 'Một chú mèo ngồi trên một đám và đang cười', '200 kB', '357x447', '2023-02-26 00:00:00', '../assets/images/ai/Animal/061.png', 791000, 'accepted');
INSERT INTO `products` VALUES (63, 34, 3, 'Mèo đeo vòng pha lê', 'Một chú mèo trong khung cảnh toàn pha lê đang cười', '213 kB', '357x447', '2023-12-25 00:00:00', '../assets/images/ai/Animal/062.png', 523000, 'accepted');
INSERT INTO `products` VALUES (64, 34, 3, 'Mèo đeo vòng pha lê và cười', 'Một chú mèo trong khung cảnh toàn pha lê đang cười', '212 kB', '357x447', '2023-11-14 00:00:00', '../assets/images/ai/Animal/063.png', 258000, 'accepted');
INSERT INTO `products` VALUES (65, 34, 3, 'Mèo cười nheo mắt', 'Một chú mèo đeo pha lê toàn pha lê đang cười nheo mắt', '220 kB', '357x447', '2024-03-17 00:00:00', '../assets/images/ai/Animal/064.png', 179000, 'accepted');
INSERT INTO `products` VALUES (66, 34, 3, 'Mèo cười mở mắt', 'Một chú mèo đeo pha lê toàn pha lê đang cười mở mắt', '216 kB', '357x447', '2023-02-21 00:00:00', '../assets/images/ai/Animal/065.png', 539000, 'accepted');
INSERT INTO `products` VALUES (67, 34, 3, 'Mèo cười với ánh sáng', 'Một chú mèo trong khung cảnh toàn pha lê đang cười', '218 kB', '357x447', '2023-03-17 00:00:00', '../assets/images/ai/Animal/066.png', 853000, 'accepted');
INSERT INTO `products` VALUES (68, 34, 3, 'Mèo nhìn lên trên', 'Một chú mèo trong khung cảnh toàn pha lê đang nhìn lên trên', '228 kB', '357x447', '2024-06-15 00:00:00', '../assets/images/ai/Animal/067.png', 768000, 'accepted');
INSERT INTO `products` VALUES (69, 34, 3, 'Mèo ngồi nheo mắt', 'Một chú mèo trong khung cảnh toàn pha lê đang nheo mắt', '234 kB', '357x447', '2024-07-08 00:00:00', '../assets/images/ai/Animal/068.png', 734000, 'accepted');
INSERT INTO `products` VALUES (70, 34, 3, 'Mèo đeo vòng pha lê', 'Một chú mèo trong khung cảnh toàn pha lê đang cười', '224 kB', '357x447', '2024-01-18 00:00:00', '../assets/images/ai/Animal/069.png', 237000, 'accepted');
INSERT INTO `products` VALUES (71, 34, 3, 'Mèo cười trên đám mây', 'Một chú mèo ngồi trên đám mây và cười', '202 kB', '357x447', '2023-02-21 00:00:00', '../assets/images/ai/Animal/070.png', 568000, 'accepted');
INSERT INTO `products` VALUES (72, 34, 3, 'Mèo đeo nơ', 'Hình ảnh một chú mèo cái với nơ đeo  trên cổ', '231 kB', '357x447', '2024-05-19 00:00:00', '../assets/images/ai/Animal/071.png', 359000, 'accepted');
INSERT INTO `products` VALUES (75, 34, 3, 'Mèo đeo trang sức', 'Hình ảnh một chú mèo đeo đủ loại trang sức', '247 kB', '357x447', '2023-11-24 00:00:00', '../assets/images/ai/Animal/080.png', 619000, 'accepted');
INSERT INTO `products` VALUES (76, 34, 3, 'Mèo hoa hậu', 'Một chú mèo cái với lông nhìn như một bộ đồ và đeo vương miệng', '227 kB', '357x447', '2023-12-09 00:00:00', '../assets/images/ai/Animal/081.png', 537000, 'accepted');
INSERT INTO `products` VALUES (77, 34, 3, 'Mèo hoa hậu đeo nơ', 'Một chú mèo cái đeo vương miệng trên đầu và nơ trên cô', '220 kB', '357x447', '2023-01-13 00:00:00', '../assets/images/ai/Animal/082.png', 400000, 'accepted');
INSERT INTO `products` VALUES (78, 34, 3, 'Mèo hoa hậu cute', 'Một chú mèo cái đeo vương miệng dễ thương', '218 kB', '357x447', '2024-08-20 00:00:00', '../assets/images/ai/Animal/083.png', 863000, 'accepted');
INSERT INTO `products` VALUES (79, 34, 3, 'Mèo tóc uốn cong', 'Hình ảnh mộ chú mèo cái với mái tóc cong', '221 kB', '357x447', '2023-01-23 00:00:00', '../assets/images/ai/Animal/084.png', 701000, 'accepted');
INSERT INTO `products` VALUES (80, 34, 3, 'Mèo đeo nơ pha lê', 'Một chú mèo đeo nơ với chất liệu pha lê', '241 kB', '357x447', '2024-06-22 00:00:00', '../assets/images/ai/Animal/085.png', 366000, 'accepted');
INSERT INTO `products` VALUES (81, 34, 5, 'Ký tự A lâu đài', 'Ký tự A được tạo thành từ lâu đài', '235 kB', '337x447', '2023-08-01 00:00:00', '../assets/images/ai/Character/A.png', 513000, 'accepted');
INSERT INTO `products` VALUES (82, 34, 5, 'Ký tự B lâu đài', 'Ký tự B được tạo thành từ lâu đài', '241 kB', '337x447', '2023-12-24 00:00:00', '../assets/images/ai/Character/B.png', 959000, 'accepted');
INSERT INTO `products` VALUES (83, 34, 5, 'Ký tự C lâu đài', 'Ký tự C được tạo thành từ lâu đài', '241 kB', '337x447', '2023-03-09 00:00:00', '../assets/images/ai/Character/C.png', 459000, 'accepted');
INSERT INTO `products` VALUES (84, 34, 5, 'Ký tự D hoa', 'Ký tự D được tạo thành từ lnhững bông hoa', '161 kB', '853x1280', '2023-03-01 00:00:00', '../assets/images/ai/Character/D.jpg', 818000, 'accepted');
INSERT INTO `products` VALUES (85, 34, 5, 'Ký tự D lâu đài', 'Ký tự D được tạo thành từ lâu đài', '249 kB', '337x447', '2023-07-20 00:00:00', '../assets/images/ai/Character/D.png', 135000, 'accepted');
INSERT INTO `products` VALUES (86, 34, 5, 'Ký tự E hoa', 'Ký tự E được tạo thành từ những bông hoa', '158 kB', '853x1280', '2024-01-03 00:00:00', '../assets/images/ai/Character/E.jpg', 864000, 'accepted');
INSERT INTO `products` VALUES (87, 34, 5, 'Ký tự I hoa', 'Ký tự I được tạo thành từ những bông hoa', '114 kB', '853x1280', '2023-07-01 00:00:00', '../assets/images/ai/Character/I.jpg', 487000, 'accepted');
INSERT INTO `products` VALUES (88, 34, 5, 'Ký tự J hoa', 'Ký tự J được tạo thành từ những bông hoa', '161 kB', '853x1280', '2023-06-02 00:00:00', '../assets/images/ai/Character/J.jpg', 673000, 'accepted');
INSERT INTO `products` VALUES (89, 34, 5, 'Ký tự L lâu đài', 'Ký tự L được tạo thành từ lâu đài', '196 kB', '337x447', '2023-12-07 00:00:00', '../assets/images/ai/Character/J.png', 516000, 'accepted');
INSERT INTO `products` VALUES (90, 34, 5, 'Ký tự K lâu đài', 'Ký tự K được tạo thành từ lâu đài', '231 kB', '337x447', '2024-06-30 00:00:00', '../assets/images/ai/Character/K.png', 380000, 'accepted');
INSERT INTO `products` VALUES (91, 34, 5, 'Ký tự M hoa', 'Ký tự M được tạo thành từ những bông hoa', '193 kB', '879x1280', '2023-10-18 00:00:00', '../assets/images/ai/Character/M.jpg', 859000, 'accepted');
INSERT INTO `products` VALUES (92, 34, 5, 'Ký tự N hoa', 'Ký tự N được tạo thành từ những bông hoa', '185 kB', '853x1280', '2024-03-28 00:00:00', '../assets/images/ai/Character/N.jpg', 370000, 'accepted');
INSERT INTO `products` VALUES (93, 34, 5, 'Ký tự N lâu đài', 'Ký tự N được tạo thành từ lâu đài', '240 kB', '337x447', '2024-06-28 00:00:00', '../assets/images/ai/Character/N.png', 778000, 'accepted');
INSERT INTO `products` VALUES (94, 34, 5, 'Ký tự O hoa', 'Ký tự O được tạo thành từ những bông hoa', '228 kB', '853x1280', '2023-03-20 00:00:00', '../assets/images/ai/Character/O.jpg', 112000, 'accepted');
INSERT INTO `products` VALUES (95, 34, 5, 'Ký tự O lâu đài', 'Ký tự O được tạo thành từ lâu đài', '247 kB', '337x447', '2024-07-15 00:00:00', '../assets/images/ai/Character/O.png', 139000, 'accepted');
INSERT INTO `products` VALUES (96, 34, 5, 'Ký tự R hoa', 'Ký tự R được tạo thành từ những bông hoa', '177 kB', '853x1280', '2023-10-28 00:00:00', '../assets/images/ai/Character/R.jpg', 770000, 'accepted');
INSERT INTO `products` VALUES (97, 34, 5, 'Ký tự R lâu đài', 'Ký tự R được tạo thành từ lâu đài', '218 kB', '337x447', '2023-12-06 00:00:00', '../assets/images/ai/Character/R.png', 473000, 'accepted');
INSERT INTO `products` VALUES (98, 34, 5, 'Ký tự S lâu đài', 'Ký tự S được tạo thành từ lâu đài', '190 kB', '337x447', '2023-09-23 00:00:00', '../assets/images/ai/Character/S.png', 536000, 'accepted');
INSERT INTO `products` VALUES (99, 34, 5, 'Ký tự U lâu đài', 'Ký tự U được tạo thành từ lâu đài', '213 kB', '853x1280', '2023-08-23 00:00:00', '../assets/images/ai/Character/U.jpg', 331000, 'accepted');
INSERT INTO `products` VALUES (100, 34, 7, 'Ký tự Y hoa', 'Ký tự Y được tạo thành từ những bông hoa', '141 kB', '853x1280', '2023-01-11 00:00:00', '../assets/images/ai/Character/Y.jpg', 476000, 'accepted');
INSERT INTO `products` VALUES (101, 34, 8, 'Bánh ngọt việt quốc', 'Bánh ngọt được trang trí bởi những quả việt quốc', '106 kB', '1280x717', '2023-01-14 00:00:00', '../assets/images/ai/Food/001.jpg', 118000, 'accepted');
INSERT INTO `products` VALUES (102, 34, 6, 'Gà nướng', 'Gà nướng với rau củ', '152 kB', '1280x717', '2023-12-20 00:00:00', '../assets/images/ai/Food/002.jpg', 148000, 'accepted');
INSERT INTO `products` VALUES (103, 34, 6, 'Salad rau củ', 'Một đĩa salad với nhiều loại rau củ', '84 kB', '1280x717', '2023-12-29 00:00:00', '../assets/images/ai/Food/003.jpg', 917000, 'accepted');
INSERT INTO `products` VALUES (104, 34, 6, 'Bánh kem dâu tây', 'Bánh kem được trang trí với nhiều quả dâu tây', '119 kB', '1280x717', '2024-03-08 00:00:00', '../assets/images/ai/Food/004.jpg', 606000, 'accepted');
INSERT INTO `products` VALUES (105, 34, 6, 'Mì trộn thịt băm', 'Một dĩa mì trộn với thịt băm và cà chua', '136 kB', '1280x717', '2023-07-29 00:00:00', '../assets/images/ai/Food/005.jpg', 686000, 'accepted');
INSERT INTO `products` VALUES (106, 34, 6, 'Pizza cà chua', 'Một bánh pizza trang trí với nhiều quả cà chua xung quanh', '136 kB', '1280x717', '2024-06-21 00:00:00', '../assets/images/ai/Food/006.jpg', 242000, 'accepted');
INSERT INTO `products` VALUES (107, 34, 6, 'Hamburger khoai tây chiên', 'Một chiếc hamburger đầy ắp và nhiều khoai tây chiên phía dưới', '114 kB', '1280x717', '2024-02-25 00:00:00', '../assets/images/ai/Food/007.jpg', 581000, 'accepted');
INSERT INTO `products` VALUES (108, 34, 6, 'Bánh tráng nướng', 'Bánh tráng nướng với nhân thịt và rau', '91 kB', '1280x717', '2023-02-22 00:00:00', '../assets/images/ai/Food/008.jpg', 524000, 'accepted');
INSERT INTO `products` VALUES (109, 34, 6, 'Cơm cuộn rong biển', 'Cơm cuộn bằng rong biển', '98 kB', '1280x717', '2023-10-15 00:00:00', '../assets/images/ai/Food/009.jpg', 572000, 'accepted');
INSERT INTO `products` VALUES (110, 34, 6, 'Salad thịt cá', 'Salad với rau và thịt cá', '99 kB', '1280x718', '2024-08-09 00:00:00', '../assets/images/ai/Food/010.webp', 258000, 'accepted');
INSERT INTO `products` VALUES (111, 34, 7, 'Salad thịt cá', 'Salad với rau và thịt cá', '144 kB', '1280x717', '2024-01-03 00:00:00', '../assets/images/ai/ImageWorld/000.jpg', 745000, 'accepted');
INSERT INTO `products` VALUES (112, 34, 7, 'Mô hình thị trấn', 'Hình ảnh một thị trấn nhỏ với những người dân làng', '51 kB', '624x416', '2024-03-05 00:00:00', '../assets/images/ai/ImageWorld/001.jpg', 798000, 'accepted');
INSERT INTO `products` VALUES (113, 34, 7, 'Thế giới đáy biển', 'Mô tả khung cảnh dưới đáy biển', '51 kB', '624x416', '2023-01-18 00:00:00', '../assets/images/ai/ImageWorld/002.jpg', 116000, 'accepted');
INSERT INTO `products` VALUES (114, 34, 7, 'Trang sách lâu đài', 'Một trang sách chứa hình ảnh của một lâu đài', '44 kB', '624x416', '2024-02-23 00:00:00', '../assets/images/ai/ImageWorld/003.jpg', 322000, 'accepted');
INSERT INTO `products` VALUES (115, 34, 7, 'Trang sách lâu đài hình nấm', 'Một trang sách chứa hình ảnh của một lâu đài hình nấm', '59 kB', '624x416', '2023-05-14 00:00:00', '../assets/images/ai/ImageWorld/004.jpg', 277000, 'accepted');
INSERT INTO `products` VALUES (116, 34, 7, 'Trang sách lâu đài san hô', 'Một trang sách chứa hình ảnh của một lâu đài hình san hô', '50 kB', '624x416', '2024-05-19 00:00:00', '../assets/images/ai/ImageWorld/005.jpg', 678000, 'accepted');
INSERT INTO `products` VALUES (117, 34, 7, 'Trang sách lâu đài núi', 'Một trang sách chứa hình ảnh của một lâu đài trên núi', '41 kB', '624x416', '2023-01-31 00:00:00', '../assets/images/ai/ImageWorld/006.jpg', 504000, 'accepted');
INSERT INTO `products` VALUES (118, 34, 7, 'Trang sách lâu đài cổ kính', 'Một trang sách chứa hình ảnh của một lâu đài cổ kính', '36 kB', '624x416', '2024-04-27 00:00:00', '../assets/images/ai/ImageWorld/007.jpg', 298000, 'accepted');
INSERT INTO `products` VALUES (119, 34, 7, 'Trang sách lâu đài trên đảo', 'Một trang sách chứa hình ảnh của một lâu đài trên một hòn đảo', '43 kB', '624x416', '2023-03-24 00:00:00', '../assets/images/ai/ImageWorld/008.jpg', 750000, 'accepted');
INSERT INTO `products` VALUES (120, 34, 7, 'Trang sách lâu đài tưởng tượng', 'Một trang sách chứa hình ảnh của một lâu đài tưởng tượng', '41 kB', '624x416', '2023-03-10 00:00:00', '../assets/images/ai/ImageWorld/009.jpg', 336000, 'accepted');
INSERT INTO `products` VALUES (121, 34, 7, 'Trang sách lâu đài bờ biển', 'Một trang sách chứa hình ảnh của một lâu đài bên bờ biển', '49 kB', '624x416', '2023-01-05 00:00:00', '../assets/images/ai/ImageWorld/010.jpg', 623000, 'accepted');
INSERT INTO `products` VALUES (122, 34, 7, 'Trang sách kim tự tháp', 'Một trang sách chứa hình ảnh của nhiều kim tự tháp', '196 kB', '1280x1024', '2023-11-08 00:00:00', '../assets/images/ai/ImageWorld/011.jpg', 205000, 'accepted');
INSERT INTO `products` VALUES (123, 34, 7, 'Trang sách tòa nhà cánh sen', 'Một trang sách chứa hình ảnh của tòa nhà cánh sen của Úc', '189 kB', '1280x976', '2024-05-29 00:00:00', '../assets/images/ai/ImageWorld/012.jpg', 609000, 'accepted');
INSERT INTO `products` VALUES (124, 34, 7, 'Trang sách đấu trường la mã', 'Một trang sách chứa hình ảnh của đấu trường la mã', '265 kB', '1280x1024', '2024-04-04 00:00:00', '../assets/images/ai/ImageWorld/013.jpg', 982000, 'accepted');
INSERT INTO `products` VALUES (125, 34, 7, 'Trang sách lâu đài phép thuật', 'Một trang sách chứa hình ảnh củalâu đài phép thuật', '181 kB', '1280x1024', '2023-11-28 00:00:00', '../assets/images/ai/ImageWorld/014.jpg', 708000, 'accepted');
INSERT INTO `products` VALUES (126, 34, 7, 'Trang sách lâu đài kiểu Ấn Độ', 'Một trang sách chứa hình ảnh của lâu đài kiểu Ấn', '188 kB', '1280x1024', '2024-03-06 00:00:00', '../assets/images/ai/ImageWorld/015.jpg', 562000, 'accepted');
INSERT INTO `products` VALUES (127, 34, 7, 'Trang sách vạn lý trường thành', 'Một trang sách chứa hình ảnh của vạn lý tường thành', '260 kB', '1280x1024', '2024-08-05 00:00:00', '../assets/images/ai/ImageWorld/016.jpg', 731000, 'accepted');
INSERT INTO `products` VALUES (128, 34, 7, 'Trang sách tượng nữ thần tự do', 'Một trang sách chứa hình ảnh của tượng nữu thần tự do', '187 kB', '1280x1024', '2023-08-24 00:00:00', '../assets/images/ai/ImageWorld/017.jpg', 944000, 'accepted');
INSERT INTO `products` VALUES (129, 34, 7, 'Trang sách tòa nhà cánh buồm', 'Một trang sách chứa hình ảnh của tòa nhà cánh buồm', '171 kB', '1280x1024', '2023-02-02 00:00:00', '../assets/images/ai/ImageWorld/018.jpg', 649000, 'accepted');
INSERT INTO `products` VALUES (130, 34, 7, 'Trang sách tháp eiffel', 'Một trang sách chứa hình ảnh của tháp eiffel', '204 kB', '1280x1280', '2024-06-19 00:00:00', '../assets/images/ai/ImageWorld/019.jpg', 710000, 'accepted');
INSERT INTO `products` VALUES (131, 34, 7, 'Trang sách lâu đài Hindu giáo', 'Một trang sách chứa hình ảnh của lâu đài hindu giáo', '226 kB', '1280x1024', '2023-07-26 00:00:00', '../assets/images/ai/ImageWorld/020.jpg', 591000, 'accepted');
INSERT INTO `products` VALUES (132, 34, 7, 'Kim tự tháp Ai Cập', 'Hình ảnh kim tự tháp Ai Cập', '195 kB', '341x453', '2023-04-20 00:00:00', '../assets/images/ai/ImageWorld/miniature-01.png', 570000, 'accepted');
INSERT INTO `products` VALUES (133, 34, 7, 'Tòa nhà cao nhất thế giới', 'Hình ảnh tòa nhà cao nhất thế giới', '187 kB', '313x416', '2024-05-10 00:00:00', '../assets/images/ai/ImageWorld/miniature-03.png', 687000, 'accepted');
INSERT INTO `products` VALUES (134, 34, 7, 'Khu di tích', 'Hình ảnh khu di tích', '219 kB', '313x416', '2024-03-11 00:00:00', '../assets/images/ai/ImageWorld/miniature-06.png', 291000, 'accepted');
INSERT INTO `products` VALUES (135, 34, 7, 'Tượng đầu người', 'Hình ảnh tượng đầu người trên đảo phục sinh', '166 kB', '313x416', '2023-11-18 00:00:00', '../assets/images/ai/ImageWorld/miniature-08.png', 413000, 'accepted');
INSERT INTO `products` VALUES (136, 34, 7, 'Lâu dài cổ kính', 'Hình ảnh lâu dài cổ kính', '219 kB', '313x416', '2023-08-26 00:00:00', '../assets/images/ai/ImageWorld/miniature-09.png', 288000, 'accepted');
INSERT INTO `products` VALUES (137, 34, 7, 'Lâu đài kiểu Ấn', 'Hình ảnh lâu kiểu ấn', '152 kB', '313x416', '2024-05-08 00:00:00', '../assets/images/ai/ImageWorld/miniature-11.png', 212000, 'accepted');
INSERT INTO `products` VALUES (138, 34, 7, 'Tượng nữu thần tự do', 'Hình ảnh Tượng nữu thần tự do', '170 kB', '313x416', '2024-06-02 00:00:00', '../assets/images/ai/ImageWorld/miniature-13.png', 575000, 'accepted');
INSERT INTO `products` VALUES (139, 34, 7, 'Tháp đông hồ', 'Hình ảnh Tháp đông hồ', '186 kB', '313x416', '2023-06-25 00:00:00', '../assets/images/ai/ImageWorld/miniature-14.png', 389000, 'accepted');
INSERT INTO `products` VALUES (140, 34, 7, 'Tháp eiffel', 'Hình ảnh Tháp eiffel', '184 kB', '313x416', '2023-08-06 00:00:00', '../assets/images/ai/ImageWorld/miniature-15.png', 239000, 'accepted');
INSERT INTO `products` VALUES (141, 34, 7, 'Vạn lý trương thành', 'Hình ảnh Vạn lý trương thành', '198 kB', '313x416', '2024-05-29 00:00:00', '../assets/images/ai/ImageWorld/miniature-16.png', 177000, 'accepted');
INSERT INTO `products` VALUES (142, 34, 8, 'Số 10', 'Hình ảnh số 10 được tạo từ những chiếc đồng hồ', '552 kB', '797x447', '2024-02-04 00:00:00', '../assets/images/ai/Number/01.png', 803000, 'accepted');
INSERT INTO `products` VALUES (143, 34, 8, 'Số 1', 'Hình ảnh số 1 được tạo từ những chiếc đồng hồ', '243 kB', '337x447', '2023-10-13 00:00:00', '../assets/images/ai/Number/02.png', 495000, 'accepted');
INSERT INTO `products` VALUES (144, 34, 8, 'Số 2', 'Hình ảnh số 2 được tạo từ những chiếc đồng hồ', '217 kB', '337x447', '2023-06-08 00:00:00', '../assets/images/ai/Number/03.png', 846000, 'accepted');
INSERT INTO `products` VALUES (145, 34, 8, 'Số 3', 'Hình ảnh số 3 được tạo từ những chiếc đồng hồ', '233 kB', '337x447', '2024-05-22 00:00:00', '../assets/images/ai/Number/04.png', 520000, 'accepted');
INSERT INTO `products` VALUES (146, 34, 8, 'Số 4', 'Hình ảnh số 4 được tạo từ những chiếc đồng hồ', '233 kB', '337x447', '2023-11-24 00:00:00', '../assets/images/ai/Number/05.png', 672000, 'accepted');
INSERT INTO `products` VALUES (147, 34, 8, 'Số 5', 'Hình ảnh số 5 được tạo từ những chiếc đồng hồ', '255 kB', '337x447', '2024-04-12 00:00:00', '../assets/images/ai/Number/06.png', 477000, 'accepted');
INSERT INTO `products` VALUES (148, 34, 8, 'Số 6', 'Hình ảnh số 6 được tạo từ những chiếc đồng hồ', '241 kB', '337x447', '2023-11-22 00:00:00', '../assets/images/ai/Number/07.png', 483000, 'accepted');
INSERT INTO `products` VALUES (149, 34, 8, 'Số 7', 'Hình ảnh số 7 được tạo từ những chiếc đồng hồ', '237 kB', '337x447', '2023-04-07 00:00:00', '../assets/images/ai/Number/08.png', 470000, 'accepted');
INSERT INTO `products` VALUES (150, 34, 8, 'Số 8', 'Hình ảnh số 8 được tạo từ những chiếc đồng hồ', '252 kB', '337x447', '2023-12-29 00:00:00', '../assets/images/ai/Number/09.png', 543000, 'accepted');
INSERT INTO `products` VALUES (151, 34, 8, 'Số 9', 'Hình ảnh số 9 được tạo từ những chiếc đồng hồ', '237 kB', '337x447', '2024-05-06 00:00:00', '../assets/images/ai/Number/10.png', 774000, 'accepted');
INSERT INTO `products` VALUES (152, 34, 9, 'Bông hoa thủy tinh', 'Hình ảnh bông hoa thủy tinh trên mặt nước', '494 kB', '797x447', '2023-09-05 00:00:00', '../assets/images/ai/Plant/01.png', 812000, 'accepted');
INSERT INTO `products` VALUES (153, 34, 9, 'Hoa sen', 'Hình ảnh hoa sen cùng với nhiều lá sen được phản chiếu trên mặt nước', '242 kB', '337x447', '2023-11-25 00:00:00', '../assets/images/ai/Plant/02.png', 208000, 'accepted');
INSERT INTO `products` VALUES (154, 34, 9, 'Hoa sen nhỏ', 'Hình ảnh hoa sen cùng với nhiều lá sen nhỏ', '234 kB', '337x447', '2023-06-07 00:00:00', '../assets/images/ai/Plant/03.png', 498000, 'accepted');
INSERT INTO `products` VALUES (155, 34, 9, 'Hoa sen thủy tinh', 'Hình ảnh hoa sen thủy tinh cùng với nhiều lá sen nhỏ', '220 kB', '337x447', '2023-11-04 00:00:00', '../assets/images/ai/Plant/04.png', 325000, 'accepted');
INSERT INTO `products` VALUES (156, 34, 9, 'Hoa sen nở rộ', 'Hình ảnh hoa sen nở rộ cùng với nhiều lá sen nhỏ', '212 kB', '337x447', '2023-02-10 00:00:00', '../assets/images/ai/Plant/05.png', 480000, 'accepted');
INSERT INTO `products` VALUES (157, 34, 9, 'Hoa sen trên đàn piano', 'Hình ảnh hoa sen trên cây đàn piano', '249 kB', '337x447', '2023-10-20 00:00:00', '../assets/images/ai/Plant/06.png', 369000, 'accepted');
INSERT INTO `products` VALUES (158, 34, 9, 'Hoa sen thủy tinh trên đàn piano', 'Hình ảnh hoa sen thủy tinh trên cây đàn piano', '225 kB', '337x447', '2024-06-13 00:00:00', '../assets/images/ai/Plant/07.png', 439000, 'accepted');
INSERT INTO `products` VALUES (159, 34, 9, 'Hoa sen trên mặt đất', 'Hình ảnh hoa sen thủy tinh trên mặt đất', '252 kB', '337x447', '2023-06-25 00:00:00', '../assets/images/ai/Plant/08.png', 634000, 'accepted');
INSERT INTO `products` VALUES (160, 34, 9, 'Hoa sen', 'Hình ảnh hoa sen thủy tinh trên mặt nước', '244 kB', '337x447', '2023-06-24 00:00:00', '../assets/images/ai/Plant/09.png', 988000, 'accepted');
INSERT INTO `products` VALUES (161, 34, 9, 'Hoa sen phản chiếu', 'Hình ảnh hoa sen thủy tinh trên mặt nước phản chiếu', '233 kB', '337x447', '2023-06-04 00:00:00', '../assets/images/ai/Plant/10.png', 466000, 'accepted');
INSERT INTO `products` VALUES (162, 34, 9, 'Hoa mọc trên đá', 'Hình ảnh một bông hoa lẻ loi với sức sông mãnh liệt sinh sôi trên một tảng đá', '503 kB', '797x447', '2024-06-26 00:00:00', '../assets/images/ai/Plant/11.png', 973000, 'accepted');
INSERT INTO `products` VALUES (163, 34, 9, 'Hoa trắng mọc giữa khe đá', 'Hình ảnh một bông hoa màu trắng sinh sôi trên một khe đá', '238 kB', '337x447', '2023-07-07 00:00:00', '../assets/images/ai/Plant/12.png', 870000, 'accepted');
INSERT INTO `products` VALUES (164, 34, 9, 'Hoa hồng mọc trên đá', 'Hình ảnh một bông hoa lẻ loi với sức sông mãnh liệt sinh sôi trên một tảng đá', '228 kB', '337x447', '2024-02-14 00:00:00', '../assets/images/ai/Plant/13.png', 679000, 'accepted');
INSERT INTO `products` VALUES (165, 34, 9, 'Hai bông hoa mọc trên đá', 'Hình ảnh một bông hoa lẻ loi với sức sông mãnh liệt sinh sôi trên một tảng đá', '221 kB', '337x447', '2023-03-07 00:00:00', '../assets/images/ai/Plant/14.png', 813000, 'accepted');
INSERT INTO `products` VALUES (166, 34, 9, 'Hoa tím mọc trên đá', 'Hình ảnh một bông màu tím sinh sôi trên một tảng đá', '226 kB', '337x447', '2023-01-05 00:00:00', '../assets/images/ai/Plant/15.png', 287000, 'accepted');
INSERT INTO `products` VALUES (167, 34, 9, 'Hoa hồng mọc giữa khe đá', 'Hình ảnh một bông màu hồng sinh sôi trên một khe đá', '235 kB', '337x447', '2023-04-26 00:00:00', '../assets/images/ai/Plant/16.png', 453000, 'accepted');
INSERT INTO `products` VALUES (168, 34, 9, 'Bốn bông hoa mọc giữa khe đá', 'Hình ảnh bốn bông màu hồng sinh sôi trên một khe đá', '229 kB', '337x447', '2024-03-07 00:00:00', '../assets/images/ai/Plant/17.png', 786000, 'accepted');
INSERT INTO `products` VALUES (169, 34, 9, 'Hoa nở trên đá', 'Hình ảnh một bông màu trắng cùng nhiều bông hoa chưa nở sinh sôi trên một khe đá', '257 kB', '337x447', '2023-09-06 00:00:00', '../assets/images/ai/Plant/18.png', 643000, 'accepted');
INSERT INTO `products` VALUES (170, 34, 9, 'Hoa trắng mọc trên đá', 'Hình ảnh một bông màu trắng  sinh sôi trên một khe đá', '224 kB', '337x447', '2023-04-29 00:00:00', '../assets/images/ai/Plant/19.png', 661000, 'accepted');
INSERT INTO `products` VALUES (171, 34, 9, 'Hoa tím mọc giữa khe đá', 'Hình ảnh một bông màu tím  sinh sôi giữa khe đá', '231 kB', '337x447', '2024-07-10 00:00:00', '../assets/images/ai/Plant/20.png', 755000, 'accepted');
INSERT INTO `products` VALUES (172, 32, 10, 'Hoàng hôn bên sông', 'Khung cảnh hoàng hôn tuyệt đẹp trên dòng sông yên ả, với ánh sáng ấm áp phản chiếu trên mặt nước', '536KB', '808x453', '2024-09-23 00:00:00', '../assets/images/ai/Scenery/001.png', 250000, 'accepted');
INSERT INTO `products` VALUES (173, 32, 10, 'Đỉnh núi hùng vĩ', 'Bức tranh toàn cảnh về những đỉnh núi sừng sững dưới bầu trời trong xanh, bao quanh là thảm thực vật xanh mướt', '484KB', '808x453 ', '2024-08-08 00:00:00', '../assets/images/ai/Scenery/002.png', 242000, 'waiting');
INSERT INTO `products` VALUES (174, 32, 10, 'Con đường rừng', 'Lối mòn yên bình trong rừng, phủ đầy lá rụng, uốn lượn giữa những cây cao vút', '287KB', '742x416 ', '2024-07-28 00:00:00', '../assets/images/ai/Scenery/003.png', 272000, 'accepted');
INSERT INTO `products` VALUES (175, 32, 10, 'Hồ nước phản chiếu', 'Hồ nước tĩnh lặng phản chiếu hoàn hảo hàng cây và bầu trời với sắc màu pastel dịu nhẹ', '271KB', '742x416 ', '2024-04-25 00:00:00', '../assets/images/ai/Scenery/004.png', 206000, 'accepted');
INSERT INTO `products` VALUES (176, 32, 10, 'Vách đá ven biển', 'Những vách đá ven biển đầy ấn tượng, nhìn ra đại dương với những con sóng vỗ mạnh vào đá', '568KB', '905x453', '2024-08-08 00:00:00', '../assets/images/ai/Scenery/005.png', 116000, 'waiting');
INSERT INTO `products` VALUES (177, 32, 10, 'Cánh đồng vàng', 'Cánh đồng lúa chín vàng rực trải dài đến chân trời, ngập trong ánh nắng chiều dịu dàng.', '691KB', '905x453', '2024-09-04 00:00:00', '../assets/images/ai/Scenery/006.png', 200000, 'accepted');
INSERT INTO `products` VALUES (178, 32, 10, 'Đồng cỏ yên bình', 'Đồng cỏ thanh bình lấm tấm hoa dại, trải dài dưới bầu trời trong sáng đầy nắng', '425KB', '831x416 ', '2023-12-31 00:00:00', '../assets/images/ai/Scenery/007.png', 125000, 'accepted');
INSERT INTO `products` VALUES (179, 32, 11, 'Ngôi Nhà Trên Mây', 'Một căn nhà nhỏ nằm giữa những đám mây trắng bồng bềnh, mang lại cảm giác thanh bình và mộng mơ.', '571KB', '680x453', '2024-01-24 00:00:00', '../assets/images/ai/SkyHouse/01.png', 277000, 'waiting');
INSERT INTO `products` VALUES (180, 32, 11, 'Lâu Đài Lơ Lửng', 'Một lâu đài hùng vĩ lơ lửng giữa bầu trời xanh, bao quanh bởi ánh sáng lấp lánh', '460KB', '624x416', '2024-03-11 00:00:00', '../assets/images/ai/SkyHouse/02.png', 270000, 'accepted');
INSERT INTO `products` VALUES (181, 32, 11, 'Thiên Đường Bay Cao', 'Ngôi nhà kỳ diệu tỏa sáng giữa mây trời, như một cánh cửa dẫn vào thiên đường', '394KB', '624x416', '2023-11-21 00:00:00', '../assets/images/ai/SkyHouse/03.png', 246000, 'accepted');
INSERT INTO `products` VALUES (182, 32, 11, 'Mái Nhà Bầu Trời', 'Căn nhà với mái hiên rộng lớn, hòa quyện vào màu xanh biếc của bầu trời.', '447KB', '624x416', '2024-01-12 00:00:00', '../assets/images/ai/SkyHouse/04.png', 196000, 'waiting');
INSERT INTO `products` VALUES (183, 32, 11, 'Tổ Ấm Giữa Không Trung', 'Ngôi nhà ấm cúng nổi bật giữa những tầng mây, mang lại cảm giác an yên khó tả', '410KB', '624x416', '2024-09-08 00:00:00', '../assets/images/ai/SkyHouse/05.png', 286000, 'accepted');
INSERT INTO `products` VALUES (184, 32, 11, 'Biệt Thự Bay Lên', 'ột biệt thự hiện đại lơ lửng giữa không trung, được bao bọc bởi ánh sáng huyền ảo', '432KB', '624x416', '2024-02-27 00:00:00', '../assets/images/ai/SkyHouse/06.png', 111000, 'waiting');
INSERT INTO `products` VALUES (185, 32, 11, 'Ngôi Nhà Hoàng Hôn', 'Ngôi nhà nhỏ ẩn mình trong ánh hoàng hôn rực rỡ, giữa bầu trời cam vàng tuyệt đẹp', '429KB', '624x416', '2024-07-24 00:00:00', '../assets/images/ai/SkyHouse/07.png', 183000, 'waiting');
INSERT INTO `products` VALUES (186, 32, 11, 'Bến Đỗ Trên Mây', 'Một căn nhà đơn sơ nhưng đầy ấm áp nằm yên bình giữa biển mây bồng bềnh.', '458KB', '624x416', '2023-11-22 00:00:00', '../assets/images/ai/SkyHouse/08.png', 234000, 'accepted');
INSERT INTO `products` VALUES (187, 32, 11, 'Chốn Ẩn Giữa Bầu Trời', 'Một ngôi nhà nhỏ gọn nép mình trong không trung rộng lớn, đem lại cảm giác yên bình', '441KB', '624x416', '2024-05-20 00:00:00', '../assets/images/ai/SkyHouse/09.png', 130000, 'accepted');
INSERT INTO `products` VALUES (188, 32, 11, 'Khu Vườn Trên Trời', 'Ngôi nhà với một khu vườn xanh tươi nằm lơ lửng trên bầu trời cao xanh thẳm', '401KB', '624x416', '2024-08-09 00:00:00', '../assets/images/ai/SkyHouse/10.png', 212000, 'accepted');
INSERT INTO `products` VALUES (189, 32, 11, 'Căn Nhà Đêm Sao', 'Ngôi nhà nhỏ tỏa sáng dưới bầu trời đầy sao, như một viên ngọc giữa đêm tối', '216KB', '1058x1280', '2023-11-04 00:00:00', '../assets/images/ai/SkyHouse/11.jpg', 142000, 'accepted');
INSERT INTO `products` VALUES (190, 32, 11, 'Hòn Đảo Bay', 'Một ngôi nhà tọa lạc trên một hòn đảo nhỏ lơ lửng giữa không trung.', '232KB', '1058x1280', '2023-11-29 00:00:00', '../assets/images/ai/SkyHouse/12.jpg', 162000, 'accepted');
INSERT INTO `products` VALUES (191, 32, 11, 'Căn Gác Trên Trời', 'Ngôi nhà hai tầng cổ kính ẩn mình trong những tầng mây trắng', '380KB', '1058x1280', '2024-07-07 00:00:00', '../assets/images/ai/SkyHouse/13.jpg', 204000, 'accepted');
INSERT INTO `products` VALUES (192, 32, 11, 'Nhà Mây Sớm Mai', 'Ngôi nhà giữa mây vào buổi sáng, khi ánh mặt trời len lỏi qua làn sương mờ.', '443KB', '1058x1280', '2024-04-14 00:00:00', '../assets/images/ai/SkyHouse/14.jpg', 218000, 'accepted');
INSERT INTO `products` VALUES (193, 32, 11, 'Ngôi Nhà Ánh Trăng', 'Một căn nhà nhỏ xinh, được ánh trăng chiếu sáng, lơ lửng trên cao.', '411Kb', '1058x1280', '2024-05-18 00:00:00', '../assets/images/ai/SkyHouse/15.jpg', 249000, 'accepted');
INSERT INTO `products` VALUES (194, 32, 11, 'Căn Nhà Cầu Vồng', 'Ngôi nhà với cầu vồng bao quanh, tạo nên một cảnh tượng rực rỡ giữa bầu trời.', '358KB', '1058x1280', '2024-10-28 00:00:00', '../assets/images/ai/SkyHouse/16.jpg', 267000, 'accepted');
INSERT INTO `products` VALUES (195, 32, 11, 'SkyHouse Tương Lai', 'Một căn nhà với thiết kế hiện đại, nổi bật giữa bầu trời xanh ngắt.', '331KB', '1058x1280', '2024-08-09 00:00:00', '../assets/images/ai/SkyHouse/17.jpg', 282000, 'accepted');
INSERT INTO `products` VALUES (196, 32, 11, 'Nhà Bay Trên Núi', 'Ngôi nhà nằm chênh vênh trên vách núi cao, hòa cùng mây trời bao la', '328KB', '1058x1280', '2024-10-05 00:00:00', '../assets/images/ai/SkyHouse/18.jpg', 201000, 'accepted');
INSERT INTO `products` VALUES (197, 32, 11, 'Tổ Ấm Bay Xa', 'Ngôi nhà gỗ ấm cúng, như đang bay trên những cánh chim bầu trời', '342KB', '1058x1280', '2023-10-20 00:00:00', '../assets/images/ai/SkyHouse/19.jpg', 158000, 'accepted');
INSERT INTO `products` VALUES (198, 32, 11, 'Căn Nhà Mặt Trời', 'Ngôi nhà nằm ngay tại tâm điểm của ánh nắng rực rỡ, chói lòa trên cao.', '376KB', '1058x1280', '2024-02-22 00:00:00', '../assets/images/ai/SkyHouse/20.jpg', 202000, 'accepted');
INSERT INTO `products` VALUES (199, 32, 11, 'Lâu Đài Bay Mơ Ước', 'Lâu đài khổng lồ ẩn hiện giữa bầu trời xanh và ánh sáng thần tiên.', '40.5KB', '797x447', '2023-10-30 00:00:00', '../assets/images/ai/SkyHouse/21.jpg', 290000, 'accepted');
INSERT INTO `products` VALUES (200, 32, 11, 'Căn Nhà Băng Trên Mây', 'Ngôi nhà với sắc xanh lạnh lẽo, như một viên pha lê bay giữa không trung', '37.5KB', '797x447', '2024-06-24 00:00:00', '../assets/images/ai/SkyHouse/22.jpg', 130000, 'accepted');
INSERT INTO `products` VALUES (201, 32, 11, 'SkyHouse Cổ Tích', 'Một ngôi nhà cổ tích với khung cửa sổ mở ra toàn cảnh bầu trời rộng lớn.', '40.5KB', '797x447', '2024-04-06 00:00:00', '../assets/images/ai/SkyHouse/23.jpg', 300000, 'accepted');
INSERT INTO `products` VALUES (202, 32, 11, 'Ngôi Nhà Mộng Mơ', 'Căn nhà nhẹ nhàng, xinh xắn, như bước ra từ một giấc mơ đẹp giữa trời', '41.6KB', '797x447', '2023-12-28 00:00:00', '../assets/images/ai/SkyHouse/24.jpg', 213000, 'accepted');
INSERT INTO `products` VALUES (203, 32, 11, 'Nhà Lửa Trên Trời', 'Ngôi nhà mang sắc đỏ ấm áp, sáng rực như ngọn lửa trong không gian bao la.', '39.1KB', '797x447', '2024-10-13 00:00:00', '../assets/images/ai/SkyHouse/25.jpg', 123000, 'accepted');
INSERT INTO `products` VALUES (204, 32, 11, 'Căn Nhà Gió Và Nắng', 'Ngôi nhà tràn đầy sức sống với nắng và gió len lỏi qua mọi ngóc ngách.', '47.3KB', '797x447', '2024-12-04 00:00:00', '../assets/images/ai/SkyHouse/26.jpg', 125000, 'accepted');
INSERT INTO `products` VALUES (205, 32, 11, 'Nhà Trên Vầng Trăng', 'Ngôi nhà nhỏ được đặt trên một mảnh trăng khuyết, lơ lửng giữa trời đêm.', '44.3KB', '797x447', '2023-11-02 00:00:00', '../assets/images/ai/SkyHouse/27.jpg', 290000, 'accepted');
INSERT INTO `products` VALUES (206, 32, 11, 'Ngôi Nhà Tia Chớp', 'Một căn nhà ẩn hiện giữa những tia chớp, đầy bí ẩn và uy lực', '41.2KB', '797x447', '2024-10-07 00:00:00', '../assets/images/ai/SkyHouse/28.jpg', 299000, 'accepted');
INSERT INTO `products` VALUES (207, 32, 11, 'SkyHouse Huyền Ảo', 'Căn nhà phủ đầy ánh sáng mờ ảo, lung linh như bước ra từ huyền thoại', '49.3KB', '797x447', '2023-11-06 00:00:00', '../assets/images/ai/SkyHouse/29.jpg', 179000, 'accepted');
INSERT INTO `products` VALUES (208, 32, 11, 'Nhà Bay Thần Tiên', 'Ngôi nhà mang vẻ đẹp thần tiên, nổi bật giữa biển mây bát ngát', '37.3KB', '797x447', '2024-02-24 00:00:00', '../assets/images/ai/SkyHouse/30.jpg', 147000, 'accepted');
INSERT INTO `products` VALUES (209, 32, 11, 'Nhà Trên Đám Mây Vàng', 'Ngôi nhà được bao quanh bởi đám mây vàng ươm trong ánh hoàng hôn.', '47.7KB', '750x447', '2024-07-01 00:00:00', '../assets/images/ai/SkyHouse/31.jpg', 172000, 'accepted');
INSERT INTO `products` VALUES (210, 32, 11, 'Căn Nhà Lơ Lửng Xanh Ngát', 'Ngôi nhà xanh giữa không trung, hòa quyện vào màu trời dịu dàng', '57.5KB', '750x447', '2024-09-01 00:00:00', '../assets/images/ai/SkyHouse/32.jpg', 265000, 'accepted');
INSERT INTO `products` VALUES (211, 32, 11, 'Ngôi Nhà Sấm Chớp', 'Ngôi nhà nhỏ ẩn mình trong cơn bão lớn với những tia sét sáng chói', '44.9KB', '750x447', '2024-12-03 00:00:00', '../assets/images/ai/SkyHouse/33.jpg', 296000, 'accepted');
INSERT INTO `products` VALUES (212, 32, 11, 'Căn Nhà Tuyết Trắng', 'Ngôi nhà phủ tuyết trắng tinh khiết, lơ lửng giữa những tầng mây', '47.4KB', '750x447', '2024-06-10 00:00:00', '../assets/images/ai/SkyHouse/34.jpg', 114000, 'accepted');
INSERT INTO `products` VALUES (213, 32, 11, 'Nhà Bay Ánh Bình Minh', 'Căn nhà tỏa sáng khi bình minh ló dạng, ánh sáng phủ khắp mây trời', '53.9KB', '750x447', '2024-10-31 00:00:00', '../assets/images/ai/SkyHouse/35.jpg', 238000, 'accepted');
INSERT INTO `products` VALUES (214, 32, 11, 'Nhà Bay Phong Cách Steampunk', 'Một ngôi nhà mang phong cách steampunk, nổi bật với bánh răng và động cơ giữa trời', '48.9KB', '750x447', '2024-08-04 00:00:00', '../assets/images/ai/SkyHouse/36.jpg', 245000, 'accepted');
INSERT INTO `products` VALUES (215, 32, 11, 'Tổ Ấm Trong Ánh Dương', 'Ngôi nhà nhỏ xinh đắm mình trong ánh nắng, bồng bềnh giữa mây trời', '50.0KB', '750x447', '2024-05-04 00:00:00', '../assets/images/ai/SkyHouse/37.jpg', 106000, 'accepted');
INSERT INTO `products` VALUES (216, 32, 11, 'Căn Nhà Màu Tím Mộng Mơ', 'Ngôi nhà lơ lửng trong sắc tím dịu dàng của bầu trời hoàng hôn', '55.0KB', '750x447', '2024-02-27 00:00:00', '../assets/images/ai/SkyHouse/38.jpg', 188000, 'accepted');
INSERT INTO `products` VALUES (217, 32, 11, 'Nhà Lưng Chừng Mây', 'Ngôi nhà độc đáo nằm giữa lưng chừng những tầng mây bồng bềnh.', '53.8KB', '750x447', '2024-03-27 00:00:00', '../assets/images/ai/SkyHouse/39.jpg', 212000, 'accepted');
INSERT INTO `products` VALUES (218, 32, 11, 'Ngôi Nhà Giữa Không Gian Vũ Trụ', 'Căn nhà siêu thực, lơ lửng giữa các vì sao và dải ngân hà rực rỡ.', '49.0KB', '750x447', '2024-03-14 00:00:00', '../assets/images/ai/SkyHouse/40.jpg', 194000, 'accepted');
INSERT INTO `products` VALUES (219, 32, 12, 'Chú Hổ Dũng Mãnh', 'Một chú hổ với ánh mắt sắc lạnh, đứng giữa khu rừng rậm xanh, toát lên vẻ uy nghi và mạnh mẽ.', '597KB', '2048x1363', '2024-05-30 00:00:00', '../assets/images/Animal/1.jpg', 183000, 'accepted');
INSERT INTO `products` VALUES (220, 32, 12, 'Hươu Cao Cổ Trên Thảo Nguyên', 'Chú hươu cao cổ vươn mình dưới bầu trời trong xanh, lững thững bước đi trên đồng cỏ rộng lớn', '744KB', '2048x1293', '2024-04-08 00:00:00', '../assets/images/Animal/2.jpg', 280000, 'accepted');
INSERT INTO `products` VALUES (221, 32, 12, 'Đàn Cá Tung Tăng Dưới Biển', 'Đàn cá đầy màu sắc bơi lội tung tăng trong làn nước xanh biếc của đại dương sâu thẳm', '726KB', '2048x1365', '2024-07-07 00:00:00', '../assets/images/Animal/3.jpg', 271000, 'accepted');
INSERT INTO `products` VALUES (222, 32, 12, 'Chim Đại Bàng Tung Cánh', 'Chú đại bàng dang rộng đôi cánh bay vút lên bầu trời cao, biểu tượng của sự tự do và quyền lực', '604KB', '2048x1362', '2024-04-17 00:00:00', '../assets/images/Animal/4.jpg', 200000, 'accepted');
INSERT INTO `products` VALUES (223, 32, 12, 'Sư Tử Chúa Tể Rừng Xanh', 'Chú sư tử oai vệ nằm thư giãn trên đồng cỏ vàng, xung quanh là ánh nắng hoàng hôn ấm áp', '650KB', '2048x1365', '2024-01-25 00:00:00', '../assets/images/Animal/5.jpg', 190000, 'accepted');
INSERT INTO `products` VALUES (224, 32, 12, 'Cún Con Dễ Thương', 'Một chú cún nhỏ lông xù, với ánh mắt long lanh ngây thơ, đang tò mò nhìn mọi thứ xung quanh', '561KB', '2048x1365', '2024-04-07 00:00:00', '../assets/images/Animal/6.jpg', 168000, 'accepted');
INSERT INTO `products` VALUES (225, 32, 12, 'Mèo Con Và Cành Hoa', 'Chú mèo con tinh nghịch với bộ lông mượt mà, đang chơi đùa với một bông hoa dại nhỏ xinh', '277KB', '1400x933', '2024-01-16 00:00:00', '../assets/images/Animal/7.jpg', 162000, 'accepted');
INSERT INTO `products` VALUES (226, 32, 12, 'Bầy Chim Cánh Cụt Bên Nam Cực', 'Đàn chim cánh cụt đáng yêu đứng san sát bên nhau trên mặt băng trắng xóa giữa vùng Nam Cực lạnh giá', '968KB', '2048x1536', '2024-02-27 00:00:00', '../assets/images/Animal/8.jpg', 230000, 'accepted');
INSERT INTO `products` VALUES (227, 32, 12, 'Voi Con Trên Đồng Cỏ', 'Chú voi con đi cạnh mẹ giữa đồng cỏ bao la, vẻ ngây ngô dễ thương khiến ai cũng yêu mến', '843KB', '2048x1536', '2024-02-10 00:00:00', '../assets/images/Animal/9.jpg', 276000, 'accepted');
INSERT INTO `products` VALUES (228, 32, 12, 'Cú Mèo Dưới Ánh Trăng', 'Chú cú mèo đứng trên cành cây khô, đôi mắt tròn sáng rực dưới ánh trăng huyền ảo của đêm khuya', '664KB', '2048x1365', '2024-09-07 00:00:00', '../assets/images/Animal/11.avif', 285000, 'accepted');
INSERT INTO `products` VALUES (229, 32, 12, 'Chú Mèo Ngủ Say', 'Một chú mèo nằm cuộn tròn trong giấc ngủ, với bộ lông mềm mại và những bước thở nhẹ nhàng, tượng trưng cho sự yên bình và thoải mái trong thế giới động vật', '34.5KB', '626x417', '2024-06-02 00:00:00', '../assets/images/Animal/12.avif', 142000, 'rejected');
INSERT INTO `products` VALUES (230, 32, 12, 'Voi Băng Qua Cánh Rừng', 'Một con voi lớn đang di chuyển qua khu rừng rậm, từng bước chân vững chãi để lại dấu ấn trên mặt đất, thể hiện sự mạnh mẽ và uy nghi của loài động vật này', '23.0KB', '626x358', '2023-11-22 00:00:00', '../assets/images/Animal/13.avif', 116000, 'accepted');
INSERT INTO `products` VALUES (231, 32, 12, 'Chim Hót Vào Bình Minh', 'Một đàn chim nhỏ đậu trên cành cây, cất tiếng hót chào đón bình minh, tạo nên một bức tranh sống động về sự tự do và vẻ đẹp của thiên nhiên', '79.9KB', '626x417', '2023-12-17 00:00:00', '../assets/images/Animal/14.avif', 245000, 'accepted');
INSERT INTO `products` VALUES (232, 32, 12, 'Đôi Mắt Của Sư Tử', 'Chân dung gần của một con sư tử với ánh mắt sắc bén và dũng mãnh, biểu trưng cho sự quyền lực và vẻ đẹp hoang dã của thế giới động vật', '22.8KB', '626x417', '2024-11-20 00:00:00', '../assets/images/Animal/10.jpg', 296000, 'rejected');
INSERT INTO `products` VALUES (233, 32, 13, 'Thành Phố Ban Đêm', 'Khung cảnh thành phố hiện đại với những tòa nhà chọc trời lấp lánh ánh đèn trong màn đêm huyền ảo', '388KB', '2048x1024', '2024-11-29 00:00:00', '../assets/images/CityandArchitecture/1.jpg', 159000, 'accepted');
INSERT INTO `products` VALUES (234, 32, 13, 'Cầu Ánh Sáng', 'Chiếc cầu hiện đại lung linh ánh đèn, bắc ngang dòng sông yên bình trong ánh sáng rực rỡ', '397KB', '2048x1365', '2024-09-03 00:00:00', '../assets/images/CityandArchitecture/2.jpg', 284000, 'waiting');
INSERT INTO `products` VALUES (235, 32, 13, 'Tòa Tháp Biểu Tượng', 'Một tòa tháp cao chọc trời với thiết kế độc đáo, trở thành điểm nhấn biểu tượng của thành phố', '381KB', '2048x1365', '2024-01-25 00:00:00', '../assets/images/CityandArchitecture/3.jpg', 230000, 'accepted');
INSERT INTO `products` VALUES (236, 32, 13, 'Phố Cổ Đầy Sắc Màu', 'Con phố cổ kính với những ngôi nhà sơn màu rực rỡ, tạo nên không gian hoài cổ và sống động', '650KB', '2048x1331', '2024-04-19 00:00:00', '../assets/images/CityandArchitecture/4.jpg', 173000, 'accepted');
INSERT INTO `products` VALUES (237, 32, 13, 'Kiến Trúc Tương Lai', 'Tòa nhà với thiết kế siêu thực, mang đậm phong cách tương lai, nổi bật giữa bầu trời xanh', '539KB', '2048x1165', '2024-11-20 00:00:00', '../assets/images/CityandArchitecture/5.jpg', 283000, 'accepted');
INSERT INTO `products` VALUES (238, 32, 13, 'Quảng Trường Sôi Động', 'Quảng trường rộng lớn với đài phun nước và những ngọn đèn sáng rực, nơi mọi người tụ họp náo nhiệt', '539KB', '2048x1165', '2024-05-08 00:00:00', '../assets/images/CityandArchitecture/6.jpg', 171000, 'accepted');
INSERT INTO `products` VALUES (239, 32, 13, 'Đại Lộ Đêm Lấp Lánh', 'Con đường lớn của thành phố với hàng cây đèn lấp lánh, tạo nên khung cảnh tuyệt đẹp về đêm', '568KB', '2048x1365', '2024-03-15 00:00:00', '../assets/images/CityandArchitecture/7.jpg', 118000, 'accepted');
INSERT INTO `products` VALUES (240, 32, 13, 'Thành Phố Ven Biển', 'Thành phố nằm cạnh bờ biển xanh, với những tòa nhà hiện đại soi bóng trên mặt nước lặng lẽ.', '693KB', '2048x1365', '2024-10-06 00:00:00', '../assets/images/CityandArchitecture/8.jpg', 192000, 'accepted');
INSERT INTO `products` VALUES (241, 32, 13, 'Ngôi Nhà Cổ Kính', 'Một ngôi nhà nhỏ mang phong cách kiến trúc cổ điển, nằm nép mình giữa những con phố yên bình', '1.09MB', '2048x1365', '2024-03-04 00:00:00', '../assets/images/CityandArchitecture/9.jpg', 151000, 'accepted');
INSERT INTO `products` VALUES (242, 32, 13, 'Khu Phố Nghệ Thuật', 'Khu phố đầy sáng tạo với các bức tường graffiti rực rỡ và kiến trúc phá cách hiện đại', '359KB', '2048x1536', '2024-07-01 00:00:00', '../assets/images/CityandArchitecture/10.jpg', 214000, 'accepted');
INSERT INTO `products` VALUES (243, 32, 14, 'Trung Tâm Thương Mại Hiện Đại', 'Một trung tâm mua sắm với thiết kế kính và thép sang trọng, nơi mọi người tất bật giao thương', '679KB', '2048x1466', '2024-08-30 00:00:00', '../assets/images/Commercial/1.jpg', 249000, 'accepted');
INSERT INTO `products` VALUES (244, 32, 14, 'Phố Thương Mại Sầm Uất', 'Con phố tấp nập với các cửa hàng rực rỡ sắc màu và dòng người qua lại nhộn nhịp', '1.20MB', '2048x1365', '2023-10-24 00:00:00', '../assets/images/Commercial/2.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (245, 32, 14, 'Sàn Giao Dịch Tài Chính', 'Hình ảnh bên trong một sàn giao dịch với các màn hình số liệu và nhân viên làm việc sôi nổi.', '872KB', '2048x1356', '2024-09-26 00:00:00', '../assets/images/Commercial/3.jpg', 268000, 'accepted');
INSERT INTO `products` VALUES (246, 32, 14, 'Chợ Truyền Thống Sáng Sớm', 'Khu chợ đầy sắc màu với hàng hóa đa dạng và những người bán hàng niềm nở vào buổi sớm', '720KB', '2048x1356', '2023-11-14 00:00:00', '../assets/images/Commercial/4.jpg', 286000, 'accepted');
INSERT INTO `products` VALUES (247, 32, 14, 'Cửa Hàng Thời Trang Cao Cấp', 'Một cửa hàng thời trang sang trọng, với những bộ trang phục tinh tế được trưng bày trong ánh đèn lung linh', '663KB', '2048x1356', '2024-09-14 00:00:00', '../assets/images/Commercial/5.jpg', 177000, 'accepted');
INSERT INTO `products` VALUES (248, 32, 14, 'Cảng Biển Quốc Tế', 'Cảng biển nhộn nhịp với các container xếp chồng và tàu hàng đang bốc dỡ', '685KB', '2048x1356', '2023-12-28 00:00:00', '../assets/images/Commercial/6.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (249, 32, 14, 'Hội Chợ Triển Lãm', 'Khu triển lãm đông đúc với các gian hàng trưng bày sản phẩm sáng tạo, thu hút hàng ngàn khách tham quan', '372KB', '2048x1356', '2024-08-11 00:00:00', '../assets/images/Commercial/7.jpg', 252000, 'accepted');
INSERT INTO `products` VALUES (250, 32, 14, 'Tòa Nhà Văn Phòng Thương Mại', 'Một tòa nhà hiện đại với kiến trúc kính sáng bóng, trung tâm của các giao dịch thương mại lớn', '417KB', '2048x1500', '2023-12-28 00:00:00', '../assets/images/Commercial/8.jpg', 202000, 'accepted');
INSERT INTO `products` VALUES (251, 32, 14, 'Khu Phố Ăn Uống', 'Phố ăn uống sầm uất với các nhà hàng và quầy hàng ẩm thực, mang đến trải nghiệm đa dạng cho thực khách', '671KB', '2048x1356', '2024-06-05 00:00:00', '../assets/images/Commercial/9.jpg', 282000, 'accepted');
INSERT INTO `products` VALUES (252, 32, 14, 'Gian Hàng Điện Tử Hiện Đại', 'Cửa hàng điện tử sáng bóng với các sản phẩm công nghệ cao được trưng bày gọn gàng và thu hút', '844KB', '2048x1365', '2023-11-23 00:00:00', '../assets/images/Commercial/10.jpg', 102000, 'accepted');
INSERT INTO `products` VALUES (253, 32, 15, 'Bản Giao Hưởng Màu Sắc', 'Một bức tranh trừu tượng đầy màu sắc rực rỡ, tạo nên những cảm xúc phong phú và sâu lắng', '1.06MB', '2048x1365', '2024-02-22 00:00:00', '../assets/images/FineArt/1.jpg', 261000, 'accepted');
INSERT INTO `products` VALUES (254, 32, 15, 'Tĩnh Vật Với Hoa Và Quả', 'Tác phẩm tĩnh vật cổ điển với một bình hoa tươi sắc và các loại trái cây được bày trí hài hòa', '125KB', '1280x858', '2024-04-30 00:00:00', '../assets/images/FineArt/2.jpg', 197000, 'accepted');
INSERT INTO `products` VALUES (255, 32, 15, 'Bút Pháp Đương Đại', 'Bức tranh mang phong cách hiện đại với những nét vẽ mạnh mẽ, thể hiện sự tự do và sáng tạo không giới hạn.', '821KB', '2048x1341', '2024-11-13 00:00:00', '../assets/images/FineArt/3.jpg', 271000, 'accepted');
INSERT INTO `products` VALUES (256, 32, 15, 'Chân Dung Cổ Điển', 'Bức chân dung người phụ nữ trong trang phục cổ điển, ánh nhìn sâu lắng như kể một câu chuyện thời gian', '227KB', '2048x1638', '2023-12-15 00:00:00', '../assets/images/FineArt/4.jpg', 189000, 'accepted');
INSERT INTO `products` VALUES (257, 32, 15, 'Hài Hòa Trong Hỗn Độn', 'Tác phẩm nghệ thuật trừu tượng với những hình khối và màu sắc tưởng chừng lộn xộn nhưng đầy ý nghĩa.', '284KB', '2048x1372', '2024-02-27 00:00:00', '../assets/images/FineArt/5.jpg', 225000, 'accepted');
INSERT INTO `products` VALUES (258, 32, 15, 'Nghệ Thuật Đường Phố', 'Một bức tường graffiti sống động với những hình ảnh và thông điệp độc đáo, mang đậm hơi thở đường phố', '948KB', '2048x1229', '2024-07-03 00:00:00', '../assets/images/FineArt/6.jpg', 265000, 'accepted');
INSERT INTO `products` VALUES (259, 32, 15, 'Phong Cảnh Thơ Mộng', 'Bức tranh sơn dầu mô tả cảnh đồng quê yên bình, với ánh nắng dịu nhẹ và dòng suối trong veo', '141KB', '2048x1152', '2024-11-14 00:00:00', '../assets/images/FineArt/7.jpg', 179000, 'accepted');
INSERT INTO `products` VALUES (260, 32, 15, 'Hình Khối Động Học', 'Một tác phẩm điêu khắc độc đáo với các hình khối đan xen, mang lại cảm giác chuyển động tinh tế', '303KB', '2048x1356', '2024-05-16 00:00:00', '../assets/images/FineArt/8.jpg', 217000, 'accepted');
INSERT INTO `products` VALUES (261, 32, 15, 'Vũ Điệu Của Ánh Sáng', 'Bức tranh kỹ thuật số lung linh với những đường sáng mềm mại, tạo cảm giác như ánh sáng đang nhảy múa.', '880KB', '2048x1493', '2024-11-07 00:00:00', '../assets/images/FineArt/9.jpg', 197000, 'accepted');
INSERT INTO `products` VALUES (262, 32, 15, 'Bản Vẽ Phác Thảo Kiến Trúc', 'Một bản vẽ tay tỉ mỉ của một công trình kiến trúc, thể hiện sự tinh tế và sáng tạo của người nghệ sĩ', '352KB', '2048x1152', '2024-04-21 00:00:00', '../assets/images/FineArt/10.jpg', 256000, 'accepted');
INSERT INTO `products` VALUES (263, 32, 16, 'Bữa Sáng Hoàn Hảo', 'Một bữa sáng hấp dẫn với bánh mì nướng vàng ruộm, trứng ốp la, thịt xông khói giòn tan và ly nước cam tươi mát', '103KB', '1280x717', '2024-09-01 00:00:00', '../assets/images/Food/001.jpg', 234000, 'accepted');
INSERT INTO `products` VALUES (264, 32, 16, 'Mỳ Ý Sốt Cà Chua', 'Đĩa mỳ Ý nóng hổi phủ sốt cà chua đỏ rực, kèm theo lá húng quế xanh mướt và phô mai Parmesan thơm ngậy', '148KB', '1280x717', '2024-07-24 00:00:00', '../assets/images/Food/002.jpg', 215000, 'accepted');
INSERT INTO `products` VALUES (265, 32, 16, 'Tiệc Buffet Hải Sản', 'Một bữa tiệc thịnh soạn với các món hải sản tươi sống như tôm hùm, cua, hàu và sushi đầy màu sắc', '82.4KB', '1280x717', '2023-11-17 00:00:00', '../assets/images/Food/003.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (266, 32, 16, 'Bánh Kem Nghệ Thuật', 'Chiếc bánh kem trang trí công phu với lớp kem mịn màng và những bông hoa đường đầy tinh tế', '115KB', '1280x717', '2023-10-27 00:00:00', '../assets/images/Food/004.jpg', 232000, 'accepted');
INSERT INTO `products` VALUES (267, 32, 16, 'Trà Chiều Sang Trọng', 'Một buổi trà chiều thanh lịch với các loại bánh ngọt nhỏ xinh, trà nóng và hoa quả tươi ngon', '132KB', '1280x717', '2024-04-25 00:00:00', '../assets/images/Food/005.jpg', 134000, 'accepted');
INSERT INTO `products` VALUES (268, 32, 16, 'Hamburger Siêu Ngon', 'Chiếc hamburger hấp dẫn với lớp bánh nướng vàng, nhân thịt bò đậm vị, rau tươi và phô mai tan chảy.', '132KB', '1280x717', '2024-04-25 00:00:00', '../assets/images/Food/006.jpg', 113000, 'accepted');
INSERT INTO `products` VALUES (269, 32, 16, 'Pizza Phô Mai Kéo Sợi', 'Chiếc pizza vừa ra lò, phô mai kéo sợi béo ngậy hòa quyện cùng lớp nhân đầy đặn và viền bánh giòn tan', '111KB', '1280x717', '2024-10-02 00:00:00', '../assets/images/Food/007.jpg', 177000, 'accepted');
INSERT INTO `products` VALUES (270, 32, 16, 'Salad Tươi Mát', 'Đĩa salad đầy sắc màu với rau xanh, cà chua bi, bơ, và nước sốt chanh dầu ô liu thơm ngon', '88.9KB', '1280x717', '2024-08-04 00:00:00', '../assets/images/Food/008.jpg', 143000, 'accepted');
INSERT INTO `products` VALUES (271, 32, 16, 'Món Tráng Miệng Ngọt Ngào', 'Chén kem mát lạnh với các lớp trái cây tươi, siro chocolate và chút hạt giòn tan bên trên', '95.8KB', '1280x717', '2024-03-20 00:00:00', '../assets/images/Food/009.jpg', 139000, 'accepted');
INSERT INTO `products` VALUES (272, 32, 16, 'Cơm Tấm Đậm Đà', 'Phần cơm tấm hấp dẫn với sườn nướng thơm lừng, bì, chả và chén nước mắm chua ngọt đặc trưng', '88.9KB', '1280x717', '2024-11-22 00:00:00', '../assets/images/Food/10.jpg', 252000, 'accepted');
INSERT INTO `products` VALUES (273, 32, 17, 'Bàn Tay Đỡ Lấy Mặt Trời', 'Hình ảnh bàn tay khổng lồ vươn lên từ mặt đất, như đang nâng niu ánh mặt trời rực rỡ trong buổi hoàng hôn', '86.7KB', '1280x717', '2024-08-23 00:00:00', '../assets/images/HandScenery/001.jpg', 127000, 'accepted');
INSERT INTO `products` VALUES (274, 32, 17, 'Cầu Bàn Tay Giữa Mây Trời', 'Chiếc cầu độc đáo được đỡ bởi hai bàn tay khổng lồ, nổi bật giữa khung cảnh núi non mây mù huyền ảo', '128KB', '1280x717', '2024-05-09 00:00:00', '../assets/images/HandScenery/002.jpg', 179000, 'accepted');
INSERT INTO `products` VALUES (275, 32, 17, 'Bàn Tay Sỏi Giữa Thảo Nguyên', 'Tác phẩm điêu khắc hình bàn tay bằng đá sỏi, nằm giữa đồng cỏ xanh bát ngát, tạo nên sự kết nối giữa con người và thiên nhiên.', '95.9KB', '1280x853', '2024-10-16 00:00:00', '../assets/images/HandScenery/003.jpg', 179000, 'accepted');
INSERT INTO `products` VALUES (276, 32, 17, 'Bàn Tay Và Thác Nước', 'Bàn Tay Và Thác Nước', '140KB', '1280x717', '2023-11-12 00:00:00', '../assets/images/HandScenery/004.jpg', 134000, 'accepted');
INSERT INTO `products` VALUES (277, 32, 17, 'Bàn Tay Vàng Giữa Đại Ngàn', 'Bàn Tay Vàng Giữa Đại Ngàn', '112KB', '1280x717', '2024-06-02 00:00:00', '../assets/images/HandScenery/005.jpg', 177000, 'accepted');
INSERT INTO `products` VALUES (278, 32, 17, 'Bàn Tay Đá Chạm Vào Bầu Trời', 'Hình ảnh bàn tay bằng đá khổng lồ vươn lên cao, như muốn chạm vào những đám mây trắng bồng bềnh', '133KB', '1280x717', '2024-11-28 00:00:00', '../assets/images/HandScenery/006.jpg', 287000, 'accepted');
INSERT INTO `products` VALUES (279, 32, 17, 'Hơi Thở Từ Đôi Bàn Tay', 'Một đôi bàn tay điêu khắc nằm trên bãi cát bên bờ biển, như thể đang nâng niu từng làn sóng vỗ', '114KB', '1280x717', '2023-12-15 00:00:00', '../assets/images/HandScenery/007.jpg', 239000, 'accepted');
INSERT INTO `products` VALUES (280, 32, 17, 'Bàn Tay Nâng Đỡ Cuộc Sống', 'Tượng bàn tay khổng lồ giữa cánh đồng hoa đầy sắc màu, thể hiện sự bảo vệ và nuôi dưỡng thiên nhiên', '115KB', '1280x717', '2024-06-28 00:00:00', '../assets/images/HandScenery/008.jpg', 279000, 'accepted');
INSERT INTO `products` VALUES (281, 32, 17, 'Dấu Ấn Bàn Tay Thời Gian', 'Bàn tay đá phủ rêu phong, nằm giữa một khu rừng cổ thụ, mang đậm dấu ấn của thời gian và lịch sử', '100KB', '1280x853', '2024-04-02 00:00:00', '../assets/images/HandScenery/009.jpg', 168000, 'accepted');
INSERT INTO `products` VALUES (282, 32, 17, 'Bàn Tay Đỡ Lấy Mặt Trăng', 'Một bàn tay điêu khắc khổng lồ nâng mặt trăng sáng rực giữa đêm đen, tạo nên khung cảnh huyền bí và thơ mộng', '112KB', '1280x717', '2024-11-10 00:00:00', '../assets/images/HandScenery/10.jpg', 202000, 'accepted');
INSERT INTO `products` VALUES (283, 32, 18, 'Bình Minh Trên Núi Cao', 'Ánh mặt trời đầu ngày ló rạng, chiếu sáng những đỉnh núi phủ sương mờ, tạo nên khung cảnh yên bình và hùng vĩ', '856KB', '2048x1363', '2024-03-12 00:00:00', '../assets/images/Landscape/1.jpg', 100000, 'accepted');
INSERT INTO `products` VALUES (284, 32, 18, 'Hồ Nước Phẳng Lặng', 'Mặt hồ trong vắt như gương, phản chiếu bầu trời xanh và những hàng cây bao quanh, mang lại cảm giác tĩnh lặng và thư thái', '1.37MB', '1600x1200', '2024-04-18 00:00:00', '../assets/images/Landscape/2.jpg', 284000, 'accepted');
INSERT INTO `products` VALUES (285, 32, 18, 'Đồng Lúa Chín Rực Rỡ', 'Cánh đồng lúa vàng óng trải dài bất tận dưới ánh nắng, điểm xuyết những chiếc nón lá của người nông dân đang gặt hái.', '970KB', '1865x1060', '2024-01-04 00:00:00', '../assets/images/Landscape/3.jpg', 134000, 'accepted');
INSERT INTO `products` VALUES (286, 32, 18, 'Thác Nước Hùng Vĩ', 'Dòng thác trắng xóa đổ xuống từ độ cao chóng mặt, bao quanh là rừng cây xanh mát tạo nên vẻ đẹp đầy uy nghiêm', '1.09MB', '2048x1367', '2024-11-07 00:00:00', '../assets/images/Landscape/4.jpg', 149000, 'accepted');
INSERT INTO `products` VALUES (287, 32, 18, 'Con Đường Ven Biển', 'Con đường nhỏ chạy dọc theo bờ biển, nơi sóng vỗ rì rào và ánh nắng chiều phủ vàng những vách đá hùng vĩ', '724KB', '2000x1226', '2024-07-20 00:00:00', '../assets/images/Landscape/5.jpg', 191000, 'accepted');
INSERT INTO `products` VALUES (288, 32, 18, 'Cánh Rừng Thu Lãng Mạn', 'Những hàng cây thay lá vàng cam rực rỡ, trải thảm lá mềm mại dưới chân, tạo nên khung cảnh như trong truyện cổ tích', '1.54MB', '2048x1365', '2024-10-18 00:00:00', '../assets/images/Landscape/6.jpg', 254000, 'accepted');
INSERT INTO `products` VALUES (289, 32, 18, 'Cánh Đồng Hoa Tuyệt Đẹp', 'Một biển hoa rực rỡ đủ màu sắc trải dài dưới bầu trời xanh ngắt, mang đến vẻ đẹp sống động và tươi mới', '1.41MB', '2048x1550', '2024-06-22 00:00:00', '../assets/images/Landscape/7.jpg', 174000, 'accepted');
INSERT INTO `products` VALUES (290, 32, 18, 'Hoàng Hôn Trên Biển Cát', 'Ánh hoàng hôn đỏ rực soi rọi bãi biển rộng lớn, tạo nên những mảng bóng dài trên nền cát mịn màng', '1.03MB', '2048x1365', '2024-05-28 00:00:00', '../assets/images/Landscape/8.jpg', 128000, 'accepted');
INSERT INTO `products` VALUES (291, 32, 18, 'Thảo Nguyên Bát Ngát', 'Những đồng cỏ xanh trải dài đến tận chân trời, nơi đàn gia súc gặm cỏ và bầu trời trong lành ôm trọn không gian', '781KB', '2048x1365', '2023-11-29 00:00:00', '../assets/images/Landscape/9.jpg', 267000, 'accepted');
INSERT INTO `products` VALUES (292, 32, 18, 'Đêm Dưới Bầu Trời Sao', 'Bầu trời đêm lung linh đầy sao, chiếu sáng khu rừng yên tĩnh và mặt hồ phản chiếu ánh sáng huyền ảo.', '665KB', '2048x1003', '2024-06-06 00:00:00', '../assets/images/Landscape/10.jpg', 196000, 'accepted');
INSERT INTO `products` VALUES (293, 32, 19, 'Vũ Trụ Hùng Vĩ', 'Một bức ảnh rộng lớn của không gian vũ trụ, với các hành tinh, ngôi sao và dải ngân hà lấp lánh, khắc họa sự bao la và vô tận của vũ trụ.', '503KB', '2048x1364', '2024-08-16 00:00:00', '../assets/images/Macro/1.jpg', 283000, 'accepted');
INSERT INTO `products` VALUES (294, 32, 19, 'Thế Giới Từ Trên Cao', 'Hình ảnh toàn cảnh của trái đất nhìn từ không gian, với đại dương xanh thẳm và những dãy núi hùng vĩ, cho thấy vẻ đẹp vĩ đại của hành tinh chúng ta', '631KB', '2048x1634', '2023-12-02 00:00:00', '../assets/images/Macro/2.jpg', 145000, 'accepted');
INSERT INTO `products` VALUES (295, 32, 19, 'Sự Kết Nối Toàn Cầu', 'Mạng lưới kết nối giữa các thành phố lớn trên thế giới, thể hiện sự kết nối không biên giới của công nghệ và con người trong thời đại hiện đại', '709KB', '2048x1362', '2024-10-14 00:00:00', '../assets/images/Macro/3.jpg', 113000, 'accepted');
INSERT INTO `products` VALUES (296, 32, 19, 'Cơn Bão Vũ Trụ', 'Cảnh tượng vũ trụ đầy năng lượng với những cơn bão sao, phản ánh sự mạnh mẽ và bất ngờ của các hiện tượng thiên nhiên vĩ mô', '515KB', '2048x1274', '2024-01-20 00:00:00', '../assets/images/Macro/4.jpg', 175000, 'accepted');
INSERT INTO `products` VALUES (297, 32, 19, 'Cuộc Sống Dưới Góc Nhìn Vĩ Mô', 'Hình ảnh thành phố từ trên cao, với những con đường, tòa nhà và dòng người tạo nên một hệ sinh thái phức tạp và tấp nập', '343KB', '2048x1197', '2024-12-07 00:00:00', '../assets/images/Macro/5.jpg', 176000, 'accepted');
INSERT INTO `products` VALUES (298, 32, 19, 'Dòng Chảy Thời Gian', 'Sự di chuyển không ngừng của các hành tinh và thiên thể, tượng trưng cho dòng chảy vĩnh cửu của thời gian trong vũ trụ', '433KB', '2048x1365', '2024-01-27 00:00:00', '../assets/images/Macro/6.jpg', 167000, 'accepted');
INSERT INTO `products` VALUES (299, 32, 19, 'Bầu Trời Vô Tận', 'Khung cảnh bầu trời rộng lớn, mây lướt qua và ánh sáng mặt trời chiếu rọi, tạo cảm giác về sự bao la và sức mạnh vĩ mô của thiên nhiên', '543KB', '2048x1365', '2024-10-25 00:00:00', '../assets/images/Macro/7.jpg', 227000, 'accepted');
INSERT INTO `products` VALUES (300, 32, 19, 'Thế Giới Năng Lượng', 'Cảnh tượng các đám mây bão lớn và các dòng điện từ, tượng trưng cho các nguồn năng lượng vĩ mô trong vũ trụ và Trái Đất', '731KB', '2048x1365', '2024-06-25 00:00:00', '../assets/images/Macro/8.jpg', 217000, 'accepted');
INSERT INTO `products` VALUES (301, 32, 19, 'Sự Mở Rộng Vũ Trụ', 'Các dải ngân hà xa xôi đang tách ra, biểu trưng cho sự mở rộng không ngừng của vũ trụ và những bí ẩn chưa được khám phá.', '621KB', '2048x1455', '2023-11-25 00:00:00', '../assets/images/Macro/9.jpg', 191000, 'accepted');
INSERT INTO `products` VALUES (302, 32, 19, 'Đại Dương Thời Gian', 'Cảnh tượng thời gian trôi đi qua các hệ mặt trời, hành tinh và ngôi sao, như là một đại dương khổng lồ nơi mọi thứ đều đang thay đổi và chuyển động', '430KB', '2048x1354', '2024-02-21 00:00:00', '../assets/images/Macro/10.jpg', 280000, 'accepted');
INSERT INTO `products` VALUES (303, 32, 20, 'Rừng Mưa Nhiệt Đới', 'Một khu rừng nhiệt đới tươi tốt với những cây cối xanh mướt, dòng suối trong vắt chảy qua và ánh sáng mặt trời lọt qua các tán lá dày đặc', '1.54MB', '2048x1366', '2024-03-11 00:00:00', '../assets/images/Nature/1.jpg', 179000, 'accepted');
INSERT INTO `products` VALUES (304, 32, 20, 'Cảnh Biển Hoang Dã', 'Bờ biển hoang sơ với sóng vỗ dạt dào, cát trắng mịn màng và những đám mây bồng bềnh trên nền trời xanh ngắt', '1.50MB', '2048x1393', '2024-10-01 00:00:00', '../assets/images/Nature/2.jpg', 114000, 'accepted');
INSERT INTO `products` VALUES (305, 32, 20, 'Sự Sống Trong Đầm Lầy', 'Khung cảnh đầm lầy hoang sơ, nơi các loài động vật hoang dã sinh sống trong hệ sinh thái đặc biệt với cây cỏ dày đặc và những làn sương nhẹ.', '1.47MB', '2048x1536', '2024-08-30 00:00:00', '../assets/images/Nature/3.jpg', 297000, 'accepted');
INSERT INTO `products` VALUES (306, 32, 20, 'Cánh Đồng Hoa Dại', 'Một cánh đồng hoa dại ngập tràn sắc màu tươi mới, tạo nên khung cảnh thiên nhiên thơ mộng và bình yên', '1.88MB', '2048x1366', '2023-11-11 00:00:00', '../assets/images/Nature/4.jpg', 269000, 'accepted');
INSERT INTO `products` VALUES (307, 32, 20, 'Ngọn Núi Im Lặng', 'Ngọn núi cao, phủ tuyết trắng xóa, nổi bật giữa bầu trời trong xanh và những đám mây bay lơ lửng, tạo nên một cảnh sắc hùng vĩ và yên bình', '943KB', '2048x1365', '2023-12-21 00:00:00', '../assets/images/Nature/5.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (308, 32, 20, 'Mặt Hồ Bình Lặng', 'Mặt hồ phẳng lặng như gương, phản chiếu cây cối và bầu trời trong sáng, mang lại cảm giác thư giãn và yên tĩnh tuyệt đối', '823KB', '2048x1106', '2024-09-01 00:00:00', '../assets/images/Nature/6.jpg', 213000, 'accepted');
INSERT INTO `products` VALUES (309, 32, 20, 'Thác Nước Mạnh Mẽ', 'Dòng thác đổ mạnh mẽ từ trên cao, tạo ra màn nước mờ ảo và âm thanh vỗ ào ào, giữa không gian rừng xanh bạt ngàn', '1.09MB', '2048x1365', '2024-01-21 00:00:00', '../assets/images/Nature/7.jpg', 214000, 'accepted');
INSERT INTO `products` VALUES (310, 32, 20, 'Mùa Thu Cổ Kính', 'Cảnh sắc mùa thu tuyệt đẹp với những chiếc lá vàng rơi rụng trên mặt đất, tạo nên một không gian trầm lắng và lãng mạn.', '1.97MB', '2048x1536', '2024-07-18 00:00:00', '../assets/images/Nature/8.jpg', 219000, 'accepted');
INSERT INTO `products` VALUES (311, 32, 20, 'Hoàng Hôn Trên Đồng Cỏ', 'Ánh hoàng hôn đỏ rực trải dài trên cánh đồng cỏ xanh, tạo ra bức tranh thiên nhiên đầy sắc màu và cảm xúc', '949KB', '2048x920', '2023-10-26 00:00:00', '../assets/images/Nature/9.jpg', 238000, 'accepted');
INSERT INTO `products` VALUES (312, 32, 20, 'Đại Dương Mênh Mông', 'Khung cảnh đại dương bao la, với những cơn sóng vỗ mạnh mẽ vào bờ, mang đến cảm giác về sự hùng vĩ và bất tận của thiên nhiên', '1.15MB', '2048x1366', '2024-07-11 00:00:00', '../assets/images/Nature/10.jpg', 280000, 'accepted');
INSERT INTO `products` VALUES (313, 32, 21, 'Ánh Sáng Đêm Tinh Tú', 'Bầu trời đêm đầy sao sáng lấp lánh, chiếu sáng mặt đất tĩnh lặng, tạo nên một không gian huyền bí và mộng mơ', '1.57MB', '2048x1536', '2024-09-28 00:00:00', '../assets/images/Night/1.jpg', 225000, 'accepted');
INSERT INTO `products` VALUES (314, 32, 21, 'Đêm Bình Yên Trên Hồ', 'Mặt hồ phẳng lặng như gương, phản chiếu ánh trăng sáng và những ngôi sao, mang lại cảm giác bình yên và thư thái', '791KB', '2048x953', '2024-01-02 00:00:00', '../assets/images/Night/2.jpg', 122000, 'accepted');
INSERT INTO `products` VALUES (315, 32, 21, 'Đêm Thành Phố Sôi Động', 'Cảnh thành phố rực rỡ ánh đèn vào ban đêm, với các tòa nhà cao chọc trời và dòng xe cộ tấp nập, tạo nên một bức tranh năng động và hiện đại', '375KB', '2048x1366', '2024-02-26 00:00:00', '../assets/images/Night/3.jpg', 249000, 'accepted');
INSERT INTO `products` VALUES (316, 32, 21, 'Bầu Trời Đêm Mở Rộng', 'Không gian bầu trời đêm rộng lớn, với những đám mây nhẹ trôi và ánh sáng từ các ngôi sao xa xôi, tạo nên một cảnh vật vĩ mô đầy huyền bí', '107KB', '1450x967', '2024-05-27 00:00:00', '../assets/images/Night/4.jpg', 181000, 'accepted');
INSERT INTO `products` VALUES (317, 32, 21, 'Đêm Trong Rừng Yên Tĩnh', 'Rừng rậm vào ban đêm, với những tiếng lá rơi xào xạc và ánh sáng mờ ảo của những ngọn đèn lửa, tạo nên bầu không khí huyền bí và tĩnh lặng', '951KB', '2048x1365', '2023-12-01 00:00:00', '../assets/images/Night/5.jpg', 264000, 'accepted');
INSERT INTO `products` VALUES (318, 32, 21, 'Đêm Vắng Lặng Ven Biển', 'Bãi biển yên bình dưới ánh trăng, nơi sóng vỗ nhè nhẹ vào bờ cát và không gian lặng lẽ mang đến cảm giác thanh thản', '981KB', '2048x1536', '2024-03-28 00:00:00', '../assets/images/Night/6.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (319, 32, 21, 'Ánh Trăng Mơ Mộng', 'Ánh trăng mờ ảo chiếu xuống mặt đất, bao phủ cảnh vật xung quanh trong một làn ánh sáng dịu dàng và đầy lãng mạn', '472KB', '2048x1282', '2024-03-30 00:00:00', '../assets/images/Night/7.jpg', 294000, 'accepted');
INSERT INTO `products` VALUES (320, 32, 21, 'Cảnh Đêm Tuyết Rơi', 'Khung cảnh đêm mùa đông với những bông tuyết nhẹ nhàng rơi xuống, tạo nên một không gian huyền bí và lãng mạn.', '983KB', '2048x1366', '2024-08-05 00:00:00', '../assets/images/Night/8.jpg', 176000, 'accepted');
INSERT INTO `products` VALUES (321, 32, 21, 'Bầu Trời Đêm Thành Thị', 'Khung cảnh bầu trời đêm trên một thành phố lớn, với ánh đèn chiếu sáng các con phố, tạo ra một bức tranh nhộn nhịp nhưng đầy quyến rũ', '201KB', '2048x1192', '2024-05-29 00:00:00', '../assets/images/Night/9.jpg', 246000, 'accepted');
INSERT INTO `products` VALUES (322, 32, 21, 'Cảnh Đêm Bên Cửa Sổ', 'Ánh đèn từ căn phòng ấm cúng chiếu qua cửa sổ, đối diện là một khung cảnh đêm lãng mạn với những ngôi sao sáng trên bầu trời', '274KB', '1000x667', '2024-08-14 00:00:00', '../assets/images/Night/10.jpg', 192000, 'accepted');
INSERT INTO `products` VALUES (323, 32, 22, 'Chuyến Du Lịch Bí Ẩn', 'Một chuyến đi kỳ lạ qua các con đường vắng vẻ, với những dấu hiệu và cảnh vật xa lạ, mang đến cảm giác phiêu lưu và khám phá', '321KB', '2048x1365', '2024-05-28 00:00:00', '../assets/images/Other/1.jpg', 260000, 'accepted');
INSERT INTO `products` VALUES (324, 32, 22, 'Hình Ảnh Siêu Thực', 'Cảnh vật mờ ảo với các hình thù kỳ lạ và màu sắc biến đổi, tạo nên một không gian siêu thực, vượt ra ngoài giới hạn của thực tế', '1.53MB', '2048x1366', '2024-12-07 00:00:00', '../assets/images/Other/2.jpg', 227000, 'accepted');
INSERT INTO `products` VALUES (325, 32, 22, 'Cảnh Quay Thời Gian', 'Hình ảnh về một chiếc đồng hồ cổ điển, với kim quay ngược lại, tượng trưng cho việc trở lại quá khứ và khám phá sự bí ẩn của thời gian', '1.06MB', '2048x1436', '2024-06-18 00:00:00', '../assets/images/Other/3.jpg', 162000, 'accepted');
INSERT INTO `products` VALUES (326, 32, 22, 'Thế Giới Màu Sắc', 'Một bức tranh tràn ngập màu sắc tươi sáng, với các hình khối và họa tiết đầy sáng tạo, tạo ra một thế giới kỳ diệu và đầy màu sắc', '1.10MB', '2048x1365', '2024-03-05 00:00:00', '../assets/images/Other/4.jpg', 210000, 'accepted');
INSERT INTO `products` VALUES (327, 32, 22, 'Ánh Sáng Huyền Bí', 'Một ánh sáng mờ ảo xuyên qua không gian tối tăm, tạo ra một cảnh tượng đầy huyền bí, kích thích trí tưởng tượng và sự tò mò', '674KB', '2048x1365', '2024-08-31 00:00:00', '../assets/images/Other/5.jpg', 249000, 'accepted');
INSERT INTO `products` VALUES (328, 32, 22, 'Chuyến Bay Trong Mơ', 'Cảnh tượng một chiếc máy bay bay trên bầu trời mờ ảo, với những đám mây mềm mại và ánh sáng huyền bí, như một chuyến bay trong giấc mơ', '648KB', '2048x1367', '2024-03-28 00:00:00', '../assets/images/Other/6.jpg', 248000, 'accepted');
INSERT INTO `products` VALUES (329, 32, 22, 'Màn Sương Kỳ Diệu', 'Một lớp sương mù nhẹ nhàng phủ kín cảnh vật, tạo nên một không gian mờ ảo và đầy lãng mạn, như một câu chuyện thần thoại', '1.58MB', '2048x1361', '2024-08-21 00:00:00', '../assets/images/Other/7.jpg', 197000, 'accepted');
INSERT INTO `products` VALUES (330, 32, 22, 'Vũ Khí Từ Tương Lai', 'Hình ảnh về một vũ khí công nghệ cao, với thiết kế sáng tạo và độc đáo, tượng trưng cho tương lai và sự tiến bộ của khoa học', '220KB', '900x598', '2024-10-22 00:00:00', '../assets/images/Other/8.jpg', 163000, 'accepted');
INSERT INTO `products` VALUES (331, 32, 22, 'Bức Tranh Trừu Tượng', 'Một bức tranh trừu tượng với những đường nét sắc nét và các mảng màu sắp xếp ngẫu nhiên, thể hiện sự tự do trong sáng tạo và cảm xúc', '1.71MB', '2048x1281', '2023-10-20 00:00:00', '../assets/images/Other/9.jpg', 261000, 'accepted');
INSERT INTO `products` VALUES (332, 32, 22, 'Con Đường Bí Ẩn', 'Một con đường uốn lượn qua rừng cây dày đặc, dẫn đến một điểm đến không xác định, mang đến sự tò mò và khao khát khám phá.', '600KB', '2048x1357', '2024-01-16 00:00:00', '../assets/images/Other/10.jpg', 189000, 'accepted');
INSERT INTO `products` VALUES (333, 32, 23, 'Cuộc Sống Thành Phố Sôi Động', 'Cảnh tượng nhộn nhịp của những người đi bộ trên các con phố đô thị, với những chiếc xe cộ qua lại và ánh đèn sáng rực, phản ánh nhịp sống nhanh chóng và đầy năng lượng', '557KB', '2048x1349', '2024-04-17 00:00:00', '../assets/images/People/1.jpg', 232000, 'accepted');
INSERT INTO `products` VALUES (334, 32, 23, 'Giai Điệu Cuộc Sống', 'Một người đàn ông đang chơi đàn violin trên phố, âm nhạc hòa quyện với không gian xung quanh, tạo nên một khoảnh khắc thư giãn giữa nhịp sống hối hả', '629KB', '2048x1365', '2024-01-02 00:00:00', '../assets/images/People/2.jpg', 170000, 'accepted');
INSERT INTO `products` VALUES (335, 32, 23, 'Chân Dung Cảm Xúc', 'Một bức chân dung gần gũi của một người phụ nữ, với ánh mắt đầy cảm xúc và nụ cười nhẹ, phản chiếu vẻ đẹp nội tâm và sự sâu sắc', '792KB', '2048x1249', '2023-10-31 00:00:00', '../assets/images/People/3.jpg', 238000, 'accepted');
INSERT INTO `products` VALUES (336, 32, 23, 'Ngày Mới, Hi vọng Mới', 'Một nhóm người bắt đầu ngày mới với những bước chân vững chãi, tạo nên một hình ảnh tượng trưng cho hy vọng và sự khởi đầu mới', '891KB', '2048x1371', '2024-01-22 00:00:00', '../assets/images/People/4.jpg', 169000, 'accepted');
INSERT INTO `products` VALUES (337, 32, 23, 'Tình Bạn Bền Chặt', 'Một nhóm bạn cùng nhau tận hưởng khoảnh khắc vui vẻ ngoài trời, thể hiện sự gắn kết và tình bạn đẹp đẽ trong cuộc sống', '860KB', '2048x1363', '2024-05-29 00:00:00', '../assets/images/People/5.jpg', 166000, 'accepted');
INSERT INTO `products` VALUES (338, 32, 23, 'Những Giây Phút Thư Giãn', 'Một người đang thư giãn trên bãi biển, tận hưởng ánh nắng và không khí trong lành, là biểu tượng của sự bình yên và thư thái', '586KB', '2048x1243', '2024-05-31 00:00:00', '../assets/images/People/6.jpg', 139000, 'accepted');
INSERT INTO `products` VALUES (339, 32, 23, 'Nghệ Thuật Và Sáng Tạo', 'Một họa sĩ đang miệt mài vẽ tranh trên giá vẽ, đắm chìm trong công việc sáng tạo, thể hiện niềm đam mê và sự cống hiến cho nghệ thuật', '423KB', '1010x999', '2024-07-23 00:00:00', '../assets/images/People/7.jpg', 143000, 'accepted');
INSERT INTO `products` VALUES (340, 32, 23, 'Chạy Đua Với Thời Gian', 'Một người chạy bộ trong công viên vào lúc bình minh, thể hiện sự năng động và quyết tâm trong việc duy trì sức khỏe và sự cân bằng cuộc sống', '911KB', '2048x1365', '2024-08-23 00:00:00', '../assets/images/People/8.jpg', 298000, 'accepted');
INSERT INTO `products` VALUES (341, 32, 23, 'Những Đoạn Đường Chia Sẻ', 'Hai người cùng nhau đi bộ trên con đường mòn, chia sẻ những câu chuyện và niềm vui, biểu tượng của tình bạn và sự đồng hành trong cuộc sống', '715KB', '2048x1367', '2024-04-22 00:00:00', '../assets/images/People/9.jpg', 281000, 'accepted');
INSERT INTO `products` VALUES (342, 32, 23, 'Khám Phá Bản Thân', 'Một người ngồi thiền trong không gian yên tĩnh, tìm kiếm sự cân bằng và bình an trong tâm hồn, tượng trưng cho hành trình tự khám phá và trưởng thành.', '153KB', '900x600', '2024-09-09 00:00:00', '../assets/images/People/10.jpg', 267000, 'accepted');
INSERT INTO `products` VALUES (343, 32, 24, 'Chồi Non Mới Mọc', 'Một chồi non tươi xanh mọc lên từ đất mẹ, tượng trưng cho sự khởi đầu mới và sự sống mạnh mẽ, đầy hy vọng trong thiên nhiên', '939KB', '2048x1387', '2024-03-29 00:00:00', '../assets/images/StillLife/1.jpg', 117000, 'accepted');
INSERT INTO `products` VALUES (344, 32, 24, 'Bình Minh Sự Sống', 'Ánh sáng đầu ngày chiếu rọi qua các tán lá cây, tạo ra một bức tranh sinh động, là biểu tượng của sự sống mới và sự phục sinh mỗi ngày', '376KB', '2048x1361', '2024-05-20 00:00:00', '../assets/images/StillLife/2.jpg', 142000, 'accepted');
INSERT INTO `products` VALUES (345, 32, 24, 'Vườn Tươi Sáng', 'Một khu vườn đầy hoa nở rực rỡ, các loài côn trùng bay lượn, và những chú chim đậu trên cành cây, tạo nên một bức tranh sống động về sự sinh sôi và phát triển của cuộc sống', '621KB', '2048x1361', '2024-09-06 00:00:00', '../assets/images/StillLife/3.jpg', 177000, 'accepted');
INSERT INTO `products` VALUES (346, 32, 24, 'Dòng Sông Mãi Chảy', 'Dòng sông êm đềm chảy qua, mang theo nguồn nước sự sống đến mọi nơi, thể hiện sự liên kết và chu kỳ bất tận của tự nhiên', '781KB', '2048x1276', '2024-05-18 00:00:00', '../assets/images/StillLife/4.jpg', 184000, 'accepted');
INSERT INTO `products` VALUES (347, 32, 24, 'Mầm Sống Từ Bụi Đất', 'Một hạt giống bé nhỏ vươn mình ra khỏi mặt đất, mang lại hy vọng về sự sinh trưởng và sức sống mãnh liệt trong thế giới tự nhiên', '1.24MB', '2048x1365', '2024-05-24 00:00:00', '../assets/images/StillLife/5.jpg', 199000, 'accepted');
INSERT INTO `products` VALUES (348, 32, 24, 'Hoa Nở Vào Buổi Sáng', 'Một bông hoa đẹp nở trong ánh sáng ban mai, là biểu tượng cho sự tươi mới và sức sống căng tràn của thiên nhiên vào mỗi ngày mới', '720KB', '2048x1365', '2024-01-05 00:00:00', '../assets/images/StillLife/6.jpg', 141000, 'accepted');
INSERT INTO `products` VALUES (349, 32, 24, 'Cây Cổ Thụ Kiên Cường', 'Một cây cổ thụ vững chãi giữa thiên nhiên rộng lớn, với những tán lá xanh mướt, thể hiện sự bền bỉ và sức sống lâu dài qua thời gian', '521KB', '2048x1638', '2024-03-17 00:00:00', '../assets/images/StillLife/7.jpg', 120000, 'accepted');
INSERT INTO `products` VALUES (350, 32, 24, 'Những Con Sóng Tươi Mới', 'Những con sóng vỗ vào bờ cát, mang lại nguồn năng lượng và sự sống cho bãi biển, tượng trưng cho sự liên tục và sức sống vĩnh hằng của đại dương', '772KB', '2048x1365', '2024-09-12 00:00:00', '../assets/images/StillLife/8.jpg', 258000, 'accepted');
INSERT INTO `products` VALUES (352, 32, 24, 'Nhịp Đập Cuộc Sống', 'Những bước chân vội vã trên con phố tấp nập, mỗi nhịp đi là một phần của nhịp sống không ngừng nghỉ trong xã hội hiện đại', '526KB', '2048x1361', '2024-03-15 00:00:00', '../assets/images/StillLife/10.jpg', 234000, 'accepted');
INSERT INTO `products` VALUES (353, 32, 25, 'Nhịp Sống Thành Phố', 'Một con phố đông đúc với người đi bộ, xe cộ và những tòa nhà cao tầng, phản ánh nhịp sống hối hả của thành phố hiện đại', '528KB', '2048x1365', '2024-02-16 00:00:00', '../assets/images/Street/1.jpg', 190000, 'accepted');
INSERT INTO `products` VALUES (354, 32, 25, 'Phố Đêm Lấp Lánh', 'Cảnh phố đêm với ánh đèn đường và cửa hàng sáng rực, tạo nên một không gian sống động và đầy sắc màu dưới bầu trời tối.', '1.00MB', '2048x1365', '2024-05-12 00:00:00', '../assets/images/Street/2.jpg', 194000, 'accepted');
INSERT INTO `products` VALUES (355, 32, 25, 'Con Đường Tĩnh Lặng', 'Một con phố vắng vẻ, với những hàng cây rợp bóng, tạo ra một không gian yên bình và tĩnh lặng, lý tưởng để thư giãn', '752KB', '2048x1396', '2024-07-31 00:00:00', '../assets/images/Street/3.jpg', 218000, 'accepted');
INSERT INTO `products` VALUES (356, 32, 25, 'Phố Cổ Vẫn Tồn Tại', 'Con phố cổ kính, với những ngôi nhà mái ngói và cửa sổ cổ điển, giữ gìn vẻ đẹp của quá khứ trong dòng chảy của thời gian', '1.06MB', '2048x1305', '2024-08-16 00:00:00', '../assets/images/Street/4.jpg', 178000, 'accepted');
INSERT INTO `products` VALUES (357, 32, 25, 'Phố Sáng Tạo', 'Con phố nghệ thuật với những bức tranh tường đầy màu sắc và các cửa hàng thủ công, tạo ra không gian đầy cảm hứng cho những người đam mê sáng tạo.', '563KB', '1200x929', '2024-02-14 00:00:00', '../assets/images/Street/5.jpg', 272000, 'accepted');
INSERT INTO `products` VALUES (358, 32, 25, 'Dưới Ánh Đèn Phố', 'Cảnh tượng những chiếc đèn đường chiếu sáng con phố vắng vào ban đêm, mang đến một không gian huyền bí và thơ mộng', '908KB', '2048x1365', '2024-08-19 00:00:00', '../assets/images/Street/6.jpg', 140000, 'accepted');
INSERT INTO `products` VALUES (359, 32, 25, 'Chợ Phố Tươi Sáng', 'Một con phố chợ đông đúc với các gian hàng đầy màu sắc, bày bán hoa quả tươi ngon và những món đồ thủ công đặc trưng của địa phương', '563KB', '1200x929', '2024-09-29 00:00:00', '../assets/images/Street/7.jpg', 256000, 'accepted');
INSERT INTO `products` VALUES (360, 32, 25, 'Phố Dọc Biển', 'Con phố ven biển với những hàng quán nhỏ xinh, và làn gió nhẹ từ đại dương, tạo ra một không gian thư giãn và thoải mái', '666KB', '2048x1356', '2024-01-13 00:00:00', '../assets/images/Street/8.jpg', 101000, 'accepted');
INSERT INTO `products` VALUES (361, 32, 25, 'Cuộc Sống Đường Phố', 'Một con phố sôi động với những người bán hàng rong, người đi bộ, và những chiếc xe buýt đầy ắp hành khách, phản ánh nhịp sống nhanh chóng và đa dạng', '1.10MB', '2048x1366', '2024-03-02 00:00:00', '../assets/images/Street/9.jpg', 223000, 'accepted');
INSERT INTO `products` VALUES (362, 32, 25, 'Con Đường Cổ Kính', 'Một con đường lát đá cổ, uốn lượn qua các ngôi nhà cổ kính, mang lại cảm giác hoài niệm và sự quyến rũ của quá khứ', '1.58MB', '2048x1365', '2024-05-05 00:00:00', '../assets/images/Street/10.jpg', 107000, 'accepted');
INSERT INTO `products` VALUES (363, 33, 26, 'Bốn bé nhỏ đội lá sen tươi cười vui vẻ', 'Nụ cười vui vẻ của bốn bé nhỏ ngây ngô dễ thương ngồi cùng nhau, đơn giản mộc mạc toác lên nét đẹp thơ ngây.', '121 KB', '1024 x 648', '2024-01-12 00:00:00', '../assets/images/Photos/children/1.jpg', 234000, 'accepted');
INSERT INTO `products` VALUES (364, 33, 26, 'Ba cậu bé tắm bùn', 'Sự ngây thơ của ba cậu bé cười tươi giữa cánh đồng lúa ngồi khom cạnh nhau vui vẻ', '14 KB', '183 x 275', '2024-01-13 00:00:00', '../assets/images/Photos/children/2.jfif', 266000, 'accepted');
INSERT INTO `products` VALUES (365, 33, 26, 'Hai chị em chơi đá bóng dưới mưa', 'Hai chị em giản dị ngay thơ vui vẻ chơi đá bóng dưới trời mưa ', '98 KB', '900 x 600', '2024-01-14 00:00:00', '../assets/images/Photos/children/2.jpg', 235000, 'accepted');
INSERT INTO `products` VALUES (366, 33, 26, 'Cậu bé nhỏ mặt ngây thơ ngồi chơi đu', 'Vẻ mặt ngây thơ nhưng toác lên nét dễ thương của cậu bé nhỏ vùng núi', '114 KB', '901 x 600', '2024-01-12 00:00:00', '../assets/images/Photos/children/3.jpg', 133000, 'accepted');
INSERT INTO `products` VALUES (367, 33, 26, 'Đám trẻ chơi đùa cùng nhau', 'Đám trẻ dễ thương vui đùa giữa cánh đồng cỏ đầy dễ thương', '112 KB', '786 x 512', '2024-01-15 00:00:00', '../assets/images/Photos/children/4.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (368, 33, 26, 'Cô giáo và đám trẻ mặc áo Việt Nam đi dạo', 'Cô giáo và đám trẻ con dễ thương được cô giáo dẫn đi chơi vẻ vui đầy tình thương yêu', '105 KB', '730 x 456', '2024-01-16 00:00:00', './assets/images/Photos/children/5.jpeg', 116000, 'accepted');
INSERT INTO `products` VALUES (369, 33, 26, 'Bốn bé nhỏ ngồi đọc sách cùng nhau', 'Bốn bé nhỏ tươi cười ngồi đọc sách cùng nhau', '10 KB', '299 x 169', '2024-01-12 00:00:00', '../assets/images/Photos/children/6.jfif', 202000, 'accepted');
INSERT INTO `products` VALUES (370, 33, 26, 'Bạn bè của nhau', 'Sáu bạn nhỏ cùng nhau đi trên đường vui vẻ nhau nhót, vui vẻ uống sữa và vậy tay chào', '344 KB', '1024 x 682', '2024-01-18 00:00:00', '../assets/images/Photos/children/7.jfif', 129000, 'accepted');
INSERT INTO `products` VALUES (371, 33, 26, 'Đám trẻ chơi nhảy dây', 'Những bạn nhỏ cùng chơi nhảy dây với nhau trên con đường mòn ở quê đầy nét dễ thương ngây ngô của tuổi trẻ thơ', '78 KB', '450 x 300', '2024-01-19 00:00:00', './assets/images/Photos/children/8.jpg', 153000, 'accepted');
INSERT INTO `products` VALUES (372, 33, 26, 'Đám trẻ cùng chơi bóng đá với nhau', 'Đám trẻ nhỏ cùng nhau chơi bóng đá với nhau vui vẻ trên bãi cỏ xanh tươi ở vùng quê ', '193 KB', '460 x 298', '2024-01-12 00:00:00', '../assets/images/Photos/children/9.jpg', 138000, 'accepted');
INSERT INTO `products` VALUES (373, 33, 26, 'Cô bé gái xinh đẹp với nụ cười xinh xắn', 'Cô bé gái xinh đẹp với tà áo dài cùng với chiếc búp sen toác lên nét đẹp của người những em thanh lịch Việt Nam', '1.03 MB', '1066 x 1600', '2024-01-13 00:00:00', '../assets/images/Photos/children/10.jpg', 220000, 'accepted');
INSERT INTO `products` VALUES (374, 33, 26, 'Cậu bé nhỏ cầm cờ đất nước Việt Nam tôi ', 'Cậu bé với chiếc khăn quàng đỏ trên vai cầm lá cờ đỏ sao vàng của Việt Nam đây dễ thương.', '138 KB', '700 x 438', '2024-01-22 00:00:00', '../assets/images/Photos/children/11.webp', 262000, 'accepted');
INSERT INTO `products` VALUES (375, 33, 27, 'Gia đình ba người', 'Một gia đình ba người với bố mẹ và một đứa con nhỏ. Bố đang bế con, mẹ nhìn con với vẻ hạnh phúc.', '100 KB', '1370x931', '2024-03-15 00:00:00', '../assets/images/Photos/family/1.jpg', 214000, 'accepted');
INSERT INTO `products` VALUES (376, 33, 27, 'Gia đình bốn người', 'Một gia đình bốn người với bố mẹ và hai đứa con nhỏ. Tất cả mọi người đều mặc trang phục giống nhau với áo phông trắng và quần short xanh lá.', '228 KB', '1024 x 686', '2024-11-25 00:00:00', '../assets/images/Photos/family/2.jpg', 154000, 'accepted');
INSERT INTO `products` VALUES (377, 33, 27, 'Gia đình năm người ', 'Gia đình nằm người, hai ba mẹ ngồi trên ghế và ba cô con người ngồi trên cửa sổ đối diện', '120 KB', '800 x 533', '2024-02-19 00:00:00', '../assets/images/Photos/family/3.jpg', 275000, 'accepted');
INSERT INTO `products` VALUES (378, 33, 27, 'Gia đình cổ điển', 'Gia đình năm người ngồi trên ghế cùng nghiên về một phía chụp hình cùng nhau', '43 KB', '900 x 671', '2024-10-28 00:00:00', '../assets/images/Photos/family/4.jpg', 143000, 'accepted');
INSERT INTO `products` VALUES (379, 33, 27, 'Gia đình năm người ', 'Gia đình năm người ngồi cùng nhau giữa cánh đồng cỏ vui vẻ chụp hình tết cùng nhau', '159 KB', '1024 x 818', '2024-08-16 00:00:00', '../assets/images/Photos/family/5.jpg', 234000, 'accepted');
INSERT INTO `products` VALUES (380, 33, 27, 'Gia đình chúc tết', 'Gia đình năm người vui vẻ chúc tết đầm ấm bên nhau trong ngày tết', '112 KB', '1024 x 624', '2024-05-18 00:00:00', '../assets/images/Photos/family/6.jpg', 135000, 'accepted');
INSERT INTO `products` VALUES (381, 33, 27, 'Gia đình hồng', 'Gia đình năm người cùng nhau chụp ảnh xung quanh đầy hoa màu hồng', '130 KB', '1024 x 588', '2024-04-22 00:00:00', '../assets/images/Photos/family/7.jpeg', 287000, 'accepted');
INSERT INTO `products` VALUES (382, 33, 27, 'Gia đình áo dài ', 'Gia đình bốn người mác áo dài cùng nhau ngồi chụp ảnh', '100 KB', '800 x 600', '2024-09-09 00:00:00', '../assets/images/Photos/family/8.jpg', 149000, 'accepted');
INSERT INTO `products` VALUES (383, 33, 27, 'Gia đình cổ điển', 'Gia đình trong căn nhà gỗ đơn giản mộc mạc giản dị', '150 KB', '1024 x 628', '2024-03-29 00:00:00', '../assets/images/Photos/family/9.jpg', 254000, 'accepted');
INSERT INTO `products` VALUES (384, 33, 27, 'Gia đình hiện đại xanh', 'Gia đình bốn người mặc đồ giống nhau cùng chụp ảnh', '91.7 KB', '800 x 800', '2024-05-20 00:00:00', '../assets/images/Photos/family/10.jpg', 112000, 'accepted');
INSERT INTO `products` VALUES (385, 33, 27, 'Gia đình hiện đại hồng', 'Gia đình bốn người mặc đồ giống nhau cùng chụp ảnh', '85.0 KB', '800 x 600', '2024-09-06 00:00:00', '../assets/images/Photos/family/11.jpg', 186000, 'accepted');
INSERT INTO `products` VALUES (386, 33, 27, 'Gia đình hiện đại trắng', 'Gia đình bốn người mặc đồ giống nhau cùng chụp ảnh', '188 KB', '1024 x 1024', '2024-05-18 00:00:00', '../assets/images/Photos/family/12.jpg', 135000, 'accepted');
INSERT INTO `products` VALUES (387, 33, 27, 'Hai mẹ con', 'Hai mẹ con mặc váy xinh xắn vui đùa cùng nhau đầy hình phúc và tràn ngập yêu thương', '75 KB', '960 x 640', '2024-05-24 00:00:00', '../assets/images/Photos/family/13.jpg', 282000, 'accepted');
INSERT INTO `products` VALUES (388, 33, 27, 'Gia đình vui vẻ', 'Gia đình bốn người hạnh phúc chụp ảnh vui vẻ giữa cánh đồng cỏ', '547 KB', '1132 x 753', '2024-01-05 00:00:00', '../assets/images/Photos/family/14.jpg', 227000, 'accepted');
INSERT INTO `products` VALUES (389, 33, 28, 'Số nhị phân', 'Nhiều dòng số nhị phân ngang dọc', '725 KB', '960 x 563', '2024-05-20 00:00:00', '../assets/images/technology/data/1.png', 250000, 'accepted');
INSERT INTO `products` VALUES (390, 33, 28, 'Sơ đồ code', 'Những thẻ tạo thành sở đồ và các dòng code', '235 KB', '1920 x 1280', '2024-09-06 00:00:00', '../assets/images/technology/data/2.jpeg', 244000, 'accepted');
INSERT INTO `products` VALUES (391, 33, 28, 'Biểu đồ', 'Bàn tay giớ ra hiển thị các thông tin biểu đồ', '1.11 MB', '3628 x 2041', '2024-05-18 00:00:00', '../assets/images/technology/data/3.jpg', 294000, 'accepted');
INSERT INTO `products` VALUES (392, 33, 28, 'Màn hình không trung', 'Ngón tay chạm vào nhiều mà hình hiển trị trên không trung', '102 KB', '1280 x 720', '2024-05-24 00:00:00', '../assets/images/technology/data/4.jpg', 218000, 'accepted');
INSERT INTO `products` VALUES (393, 33, 28, 'Dữ liệu vòng tròn', 'Dữ liệu hình vòng tròn xoay quanh nhau và hiển thị nhiều hình dạng', '127 KB', '1200 x 675', '2024-01-05 00:00:00', '../assets/images/technology/data/5.webp', 264000, 'accepted');
INSERT INTO `products` VALUES (394, 33, 28, 'Nhị phân trên đường ra', 'Nhiều dãy số nhị phân trôi theo đường ra tàu hỏa giữa những tòa nhà cao ', '171 KB', '1500 x 865', '2024-03-17 00:00:00', '../assets/images/technology/data/6.webp', 179000, 'accepted');
INSERT INTO `products` VALUES (395, 33, 28, 'Máy tính dữ liệu', 'Các thông số và máy tính, tài liệu được hiển thị dưới nền dữ liệu', '62 KB', '1000 x 563', '2024-09-12 00:00:00', '../assets/images/technology/data/7.webp', 262000, 'accepted');
INSERT INTO `products` VALUES (396, 33, 28, 'Nhị phân tan biến', 'Nhiều số nhị phân trong bảng đang dần biến mất và tách ra không còn mạch lạc liên kết với nhau', '250 KB ', '1322 x 793', '2024-05-23 00:00:00', '../assets/images/technology/data/8.jpg', 211000, 'accepted');
INSERT INTO `products` VALUES (397, 33, 28, 'Não dư liệu', 'Bộ não được tạo thành từ nhiều đường và những đóm ánh sáng', '472 KB', '1200 x 628', '2024-03-15 00:00:00', '../assets/images/technology/data/9.jpg', 264000, 'accepted');
INSERT INTO `products` VALUES (398, 33, 28, 'Liên kết hình ảnh', 'Các hình ảnh được liên kết với nhau theo một dạng mô hình nào đó và hiển thị lên nhau.', '11 KB', '175 x 183', '2024-11-25 00:00:00', '../assets/images/technology/data/10.jfif', 238000, 'accepted');
INSERT INTO `products` VALUES (399, 33, 29, 'Robot cười ', 'Chú robot cười', '108 KB', '2400 x 1600', '2024-05-28 00:00:00', '../assets/images/technology/robots/1.webp', 112000, 'accepted');
INSERT INTO `products` VALUES (400, 33, 29, 'Robot giơ tay chào', 'Robot giơ tay chào', '9 KB', '540 x 540', '2024-12-07 00:00:00', '../assets/images/technology/robots/2.webp', 291000, 'accepted');
INSERT INTO `products` VALUES (401, 33, 29, 'Robot đứng nghiêm chỉnh', 'Robot đứng nghiêm chỉnh', '32 KB', '818 x 985', '2024-06-18 00:00:00', '../assets/images/technology/robots/3.jpg', 296000, 'accepted');
INSERT INTO `products` VALUES (402, 33, 29, 'Robot ngắn', 'Robot ngắn', '21 KB', '643 x 360', '2024-03-05 00:00:00', '../assets/images/technology/robots/4.jpg', 206000, 'accepted');
INSERT INTO `products` VALUES (403, 33, 29, 'Robot bánh xe cuộn', 'Robot bánh xe cuộn', '54 KB', '1312 x 750', '2024-08-31 00:00:00', '../assets/images/technology/robots/5.jpg', 294000, 'accepted');
INSERT INTO `products` VALUES (404, 33, 29, 'Robot hình chó', 'Robot hình chó', '249 KB', '2560 x 1439', '2024-03-28 00:00:00', '../assets/images/technology/robots/6.jpg', 158000, 'accepted');
INSERT INTO `products` VALUES (405, 33, 30, 'Xe bán tải chở can', 'Xe bán tải chở rất nhiêu can trên đường', '555 KB', '2048 x 1360', '2024-08-21 00:00:00', '../assets/images/transportation/1.jpg', 194000, 'accepted');
INSERT INTO `products` VALUES (406, 33, 30, 'Xe ô tô đi núi', 'Xe ô tô đi trên đồi núi không bằng phẳng', '1.07 MB', '2048 x 1365', '2024-10-22 00:00:00', '../assets/images/transportation/2.jpg', 256000, 'accepted');
INSERT INTO `products` VALUES (407, 33, 30, 'Xe máy cày', 'Xe máy cày', '1.14 MB', '2048 x 1436', '2023-10-20 00:00:00', '../assets/images/transportation/3.jpg', 135000, 'accepted');
INSERT INTO `products` VALUES (408, 33, 30, 'Tàu đánh cá nghiên', 'Tàu đánh cá đâm vào đá bị nghiên', '287 KB', '2048 x 1363', '2024-01-16 00:00:00', '../assets/images/transportation/4.jpg', 164000, 'accepted');
INSERT INTO `products` VALUES (409, 33, 30, 'Máy bay cất cánh', 'Máy bay cất cánh', '741 KB', '2048 x 1365', '2023-11-23 00:00:00', '../assets/images/transportation/5.jpg', 180000, 'accepted');
INSERT INTO `products` VALUES (410, 33, 30, 'Máy bay trên sườn núi', 'Máy bay trên sườn núi', '793 KB', '2048 x 1365', '2024-02-22 00:00:00', '../assets/images/transportation/6.jpg', 211000, 'accepted');
INSERT INTO `products` VALUES (411, 33, 30, 'Những chú lạc đà vẫn chuyển', 'Những chú lạc đà vẫn chuyển', '914 KB', '2048 x 1367', '2024-04-30 00:00:00', '../assets/images/transportation/7.jpg', 221000, 'accepted');
INSERT INTO `products` VALUES (412, 33, 30, 'Tàu hỏa chạy qua cầu', 'Tàu hỏa chạy qua cầu', '1.03 MB', '2048 x 1360', '2024-11-13 00:00:00', '../assets/images/transportation/8.jpg', 245000, 'accepted');
INSERT INTO `products` VALUES (413, 33, 30, 'Máy bay trên bầu trời', 'Máy bay trên bầu trời', '477 KB', '2048 x 1360', '2023-12-15 00:00:00', '../assets/images/transportation/9.jpg', 298000, 'accepted');
INSERT INTO `products` VALUES (414, 33, 30, 'Tàu hỏa chạy qua đồng', 'Tàu hỏa chạy qua đồng', '1.15 MB', '2048 x 1357', '2024-02-27 00:00:00', '../assets/images/transportation/10.jpg', 160000, 'accepted');
INSERT INTO `products` VALUES (415, 33, 31, 'Rừng núi dưới ánh trăng', 'Rừng núi dưới ánh trăng', '627 KB', '2048 x 1536', '2024-07-03 00:00:00', '../assets/images/travel/1.jpg', 211000, 'accepted');
INSERT INTO `products` VALUES (416, 33, 31, 'Con đường và núi tuyết', 'Con đường và núi tuyết', '365 KB', '2048 x 1365', '2024-11-14 00:00:00', '../assets/images/travel/2.jpg', 184000, 'accepted');
INSERT INTO `products` VALUES (417, 33, 31, 'Chó đông', 'Chú chó đáng yêu đứng nhìn ra ngoài, giữa bầu trời mùa đông', '724 KB', '2048 x 1365', '2024-05-16 00:00:00', '../assets/images/travel/3.jpg', 284000, 'accepted');
INSERT INTO `products` VALUES (418, 33, 31, 'Thành phố trên biển', 'Thành phố trên biển', '644 KB', '2048 x 1365', '2024-11-07 00:00:00', '../assets/images/travel/4.jpg', 181000, 'accepted');
INSERT INTO `products` VALUES (419, 33, 31, 'Núi đỏ', 'Núi đỏ', '1.36 MB', '2048 x 1365', '2024-08-16 00:00:00', '../assets/images/travel/5.jpg', 183000, 'accepted');
INSERT INTO `products` VALUES (420, 33, 31, 'Thác nước trên đá', 'Thác nước trên đá', '619 KB', '2048 x 1365', '2024-02-14 00:00:00', '../assets/images/travel/6.jpg', 158000, 'accepted');
INSERT INTO `products` VALUES (421, 33, 31, 'Băng tan', 'Băng tan', '395 KB', '2048 x 1365', '2024-08-19 00:00:00', '../assets/images/travel/7.jpg', 158000, 'accepted');
INSERT INTO `products` VALUES (422, 33, 31, 'Núi hùng vĩ', 'Núi hùng vĩ', '1.14 MB', '2048 x 1365', '2024-09-29 00:00:00', '../assets/images/travel/8.jpg', 238000, 'accepted');
INSERT INTO `products` VALUES (423, 33, 31, 'Suối mùa xuân', 'Suối mùa xuân', '1.44 MB', '2048 x 1365', '2024-01-13 00:00:00', '../assets/images/travel/9.jpg', 245000, 'accepted');
INSERT INTO `products` VALUES (424, 33, 31, 'Cung điện ấn độ', 'Cung điện ấn độ', '979 KB', '2048 x 1365', '2024-03-02 00:00:00', '../assets/images/travel/10.jpg', 118000, 'accepted');
INSERT INTO `products` VALUES (425, 33, 32, 'Bãi biển', 'Bãi biển với cát và cây lá', '48 KB', '800 x 360', '2024-08-16 00:00:00', '../assets/images/vector/bg/1.jpg', 150000, 'accepted');
INSERT INTO `products` VALUES (426, 33, 33, 'Phi hành gia', 'Phi hành gia vẫy tay chào', '1.99 MB', '8333 x 8333', '2024-01-12 00:00:00', '../assets/images/vector/cartoon/1.jpg', 248000, 'accepted');
INSERT INTO `products` VALUES (427, 33, 33, 'Khủng long xinh', 'Chú khủng long đáng yêu thổi bong bóng', '677 KB', '3000 x 200', '2024-01-13 00:00:00', '../assets/images/vector/cartoon/2.jpg', 263000, 'accepted');
INSERT INTO `products` VALUES (428, 33, 33, 'Phi hành không gian', 'Phi hành gia bên ngoài vũ trũ sử dụng máy tính', '1.49 MB', '3600 x 2800', '2024-01-22 00:00:00', '../assets/images/vector/cartoon/3.jpg', 120000, 'accepted');
INSERT INTO `products` VALUES (429, 33, 34, 'Cậu bé trăn trâu', 'Cậu bé buổi tối cầm chiếc đèn ngồi ngoài đồng cùng với chiếc cần câu', '505 KB', '1920 x 1281', '2024-03-12 00:00:00', '../assets/images/vietnam/connguoi/1.jpg', 240000, 'accepted');
INSERT INTO `products` VALUES (430, 33, 34, 'Làm muối', 'Những người dẫn họ gánh những thúng nước đổ vào để làm muối khi mặt trời gần lặn', '525 KB', '1920 x 1281', '2024-04-18 00:00:00', '../assets/images/vietnam/connguoi/2.jpg', 213000, 'accepted');
INSERT INTO `products` VALUES (431, 33, 34, 'Hai cha con đi cày', 'Hai cha con cùng nhau đi cày, người con ngồi trên lưng trâu còn người bố thì điều khiên cho trâu cày', '709 KB', '1920 x 1207', '2024-01-04 00:00:00', '../assets/images/vietnam/connguoi/3.jpg', 211000, 'accepted');
INSERT INTO `products` VALUES (432, 33, 34, 'Đường phố', 'Mọi người chạy xe qua lại trên đường phố trước tòa nhà to lớn', '673 KB', '1920 x 1280', '2024-11-07 00:00:00', '../assets/images/vietnam/connguoi/4.jpg', 269000, 'accepted');
INSERT INTO `products` VALUES (433, 33, 34, 'Người câu cá', 'Một người dân đang câu cá trên chiếc thuyền trôi giữa sông dưới cảnh hoàng hôn đang dần trở thành màn đêm', '148 KB', '1280 x 854', '2024-07-20 00:00:00', '../assets/images/vietnam/connguoi/5.jpg', 128000, 'accepted');
INSERT INTO `products` VALUES (434, 33, 34, 'Nông dân đánh cá', 'Những người nông dân cùng nhau dân lưới đánh cá trên biến', '148 KB', '1920 x 1269', '2024-10-18 00:00:00', '../assets/images/vietnam/connguoi/6.jpg', 134000, 'accepted');
INSERT INTO `products` VALUES (435, 33, 34, 'Cậu bé thả diều', 'Cậu bé chơi thả diều khi trời chiều tà trên thảm cỏ điều nét nên thơ', '379 KB', '1920 x 1280', '2024-06-22 00:00:00', '../assets/images/vietnam/connguoi/7.jpg', 276000, 'accepted');
INSERT INTO `products` VALUES (436, 33, 34, 'Cậu bé và trâu', 'Cậu bé đang trăn trâu trên núi xung quanh là những đồi núi hùng vĩ mây mù che khuất', '610 KB', '1920 x 1275', '2024-05-28 00:00:00', '../assets/images/vietnam/connguoi/8.jpg', 132000, 'accepted');
INSERT INTO `products` VALUES (437, 33, 34, 'Khu phố nhộn nhịp', 'Khu phố với hai bên là nhưng tòa nhà cao dựng đứng bên dưới người dân tấp nập mua bán', '942 KB', '1920 x 1282', '2023-11-29 00:00:00', '../assets/images/vietnam/connguoi/9.jpg', 127000, 'accepted');
INSERT INTO `products` VALUES (438, 33, 34, 'Đan nứa', 'Những cụ già lớn tuổi cùng nhau đan những dụng cụ với nhau ', '784 KB', '1920 x 1278', '2024-06-06 00:00:00', '../assets/images/vietnam/connguoi/10.jpg', 171000, 'accepted');
INSERT INTO `products` VALUES (439, 33, 34, 'Hai bà cháu', 'Hai bà cháu ngồi cùng nhau bán những món đồ vui vẻ', '812 KB', '1920 x 1239', '2024-08-16 00:00:00', '../assets/images/vietnam/connguoi/11.jpg', 188000, 'accepted');
INSERT INTO `products` VALUES (440, 33, 34, 'Học sinh với hoa phượng', 'Cô gái với tà áo dài trắng ngồi trên tảng đá với những cánh hoa phượng vĩ', '338 KB', '1920 x 1278', '2023-12-02 00:00:00', '../assets/images/vietnam/connguoi/12.jpg', 245000, 'accepted');
INSERT INTO `products` VALUES (442, 33, 34, 'Người dân chài cá', 'Những người ngư dân cùng nhau chài cá trên biển vào ánh chiều tà', '573 KB', '1920 x 1280', '2024-01-20 00:00:00', '../assets/images/vietnam/connguoi/14.jpg', 194000, 'accepted');
INSERT INTO `products` VALUES (443, 33, 34, 'Chuyến đò sang sông', 'Những con đò đang neo đậu và những hàng khách được người chèo đò đưa sang sông với ánh hoàng hôn đầy thơ mộng', '680 KB', '1920 x 1280', '2024-12-07 00:00:00', '../assets/images/vietnam/connguoi/15.jpg', 289000, 'accepted');
INSERT INTO `products` VALUES (444, 33, 34, 'Ngư dân chài cá', 'Người ngư dân đứng trên con thuyền bé quăng chài đánh cá dưới ánh hoàng hôn ', '678 KB', '1920 x 1281', '2024-01-27 00:00:00', '../assets/images/vietnam/connguoi/16.jpg', 180000, 'accepted');
INSERT INTO `products` VALUES (445, 33, 34, 'Bữa tiệc thơ mộng', 'Cô gái với chiếc váy trắng xinh đẹp ngồi trên bàn tiệc giữa khu rừng đầy lãng mạn và thư giãn', '484 KB', '1920 x 1280', '2024-10-25 00:00:00', '../assets/images/vietnam/connguoi/17.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (446, 33, 34, 'Bác bán hoa hướng dương', 'Bác gánh hai thúng hoa hướng hương giữa khu phố cổ đầy yên tĩnh ', '6.99 MB', '8192 x 5461', '2024-06-25 00:00:00', '../assets/images/vietnam/connguoi/18.jpg', 127000, 'accepted');
INSERT INTO `products` VALUES (447, 33, 34, 'Phố cỗ', 'Khu phố cổ sau con mưa', '863 KB', '1920 x 1280', '2023-11-25 00:00:00', '../assets/images/vietnam/connguoi/19.jpg', 196000, 'accepted');
INSERT INTO `products` VALUES (448, 33, 34, 'Cô gái miền tây', 'Cô gái mặc chiếc áo dài đặc trưng cùng với chiếc nón là ngồi giữa hồ sen', '352 KB', '1920 x 1280', '2024-02-21 00:00:00', '../assets/images/vietnam/connguoi/20.jpg', 219000, 'accepted');
INSERT INTO `products` VALUES (449, 33, 34, 'Nông dân gánh lúa', 'Bác nông dân gánh lúa trở về với bộ đồ bà ba cùng với chiếc nón là đặc trưng', '695 KB', '1920 x 1281', '2024-03-11 00:00:00', '../assets/images/vietnam/connguoi/21.jpg', 121000, 'accepted');
INSERT INTO `products` VALUES (450, 33, 34, 'Những phụ nữ làm muối', 'Những người phụ nữ gánh nhưng gánh muối và làm muối dưới ánh hoàng hôn', '558 KB', '1920 x 1280', '2024-10-01 00:00:00', '../assets/images/vietnam/connguoi/22.jpg', 135000, 'accepted');
INSERT INTO `products` VALUES (451, 33, 34, 'Hai bà cháu miền núi', 'Hai bà cháu mặc đồ dân tộc đi làm ruộn về trên cánh đồng lúa xanh mướt', '859 KB', '1920 x 1232', '2024-08-30 00:00:00', '../assets/images/vietnam/connguoi/23.jpg', 201000, 'accepted');
INSERT INTO `products` VALUES (452, 33, 34, 'Bến đò', 'Bến đò nhộn nhịp tùa thuyến ghé đến', '780 KB', '1920 x 1280', '2023-11-11 00:00:00', '../assets/images/vietnam/connguoi/24.jpg', 264000, 'accepted');
INSERT INTO `products` VALUES (453, 33, 34, 'Cô bán trái cây', 'Cô bán trái cây ngồi chờ khách hàng với những mâm trái cây xanh tưới ', '1.14 MB', '1920 x 1280', '2023-12-21 00:00:00', '../assets/images/vietnam/connguoi/25.jpg', 288000, 'accepted');
INSERT INTO `products` VALUES (454, 33, 34, 'Cô gái dắt xe', 'Cô gái mặc áo dài dắt chiếc xe đạp đi giữa cánh đồng lúa xanh ươm', '442 KB', '1920 x 1281', '2024-09-01 00:00:00', '../assets/images/vietnam/connguoi/26.jpg', 147000, 'accepted');
INSERT INTO `products` VALUES (455, 33, 34, 'Hai cô gái áo dài', 'Hai cô gái mặc áo dài trắng và chiếc nón lá đi cùng nhau cùng với chiếc xe đạp trên con đường ', '363 KB', '1920 x 1168', '2024-01-21 00:00:00', '../assets/images/vietnam/connguoi/27.jpg', 102000, 'accepted');
INSERT INTO `products` VALUES (456, 33, 34, 'Phụ nữ làm lúa', 'Người phụ nữ mang theo hai người con chăm chỉ làm lá trên cánh đồng ', '1.35 MB', '1920 x 1280', '2024-07-18 00:00:00', '../assets/images/vietnam/connguoi/28.jpg', 221000, 'accepted');
INSERT INTO `products` VALUES (457, 33, 34, 'Cô gái và hoa sen', 'Cô gái mặc chiếc áo dài cùng với đóa hoa sen trên tay cùng và thuyền đầy hoa sen giữa dòng sông', '442 KB', '1920 x 1280', '2023-10-26 00:00:00', '../assets/images/vietnam/connguoi/29.jpg', 202000, 'accepted');
INSERT INTO `products` VALUES (458, 33, 34, 'Làm sen', 'Những cô gái làm sen trên dòng sông nông ', '94 KB', '1234 x 759', '2024-07-11 00:00:00', '../assets/images/vietnam/connguoi/30.webp', 277000, 'accepted');
INSERT INTO `products` VALUES (459, 33, 34, 'Khu chợ vải', 'Người dân tấp nập với những chiếc xe máy chờ đầy vải phái sau', '217 KB', '1178 x 817', '2024-03-12 00:00:00', '../assets/images/vietnam/connguoi/31.jpg', 112000, 'accepted');
INSERT INTO `products` VALUES (460, 33, 34, 'Hai cụ thư pháp', 'Hai cụ viết thư pháp trong nhà với những dòng ánh nắng chiếu lắp lấp qua khe cửa chiếu rọi những nét thư pháp rất đẹp', '100 KB', '700 x 467', '2024-04-18 00:00:00', '../assets/images/vietnam/connguoi/32.jpg', 137000, 'accepted');
INSERT INTO `products` VALUES (461, 33, 34, 'Vợ chồng làm muốn', 'Hai vợ chồng cùng làm muối ', '100 KB', '700 x 468', '2024-01-04 00:00:00', '../assets/images/vietnam/connguoi/33.jpg', 223000, 'accepted');
INSERT INTO `products` VALUES (462, 33, 34, 'Bác phơi khô', 'Bác phơi khô dưới ánh mặt trời chiếu rọi', '101 KB', '700 x 467', '2024-11-07 00:00:00', '../assets/images/vietnam/connguoi/34.jpg', 136000, 'accepted');
INSERT INTO `products` VALUES (463, 33, 34, 'Ông cụ rửa sen', 'Ông cụ đàn dưới sông rửa những bó sen chắt lên thuyền ', '102 KB', '700 x 466', '2024-07-20 00:00:00', '../assets/images/vietnam/connguoi/35.jpg', 228000, 'accepted');
INSERT INTO `products` VALUES (464, 33, 34, 'Trâu cày ', 'Hai bác nông dân điều khiên những con trâu cày ruộng', '108 KB', '700 x 467', '2024-10-18 00:00:00', '../assets/images/vietnam/connguoi/36.jpg', 215000, 'accepted');
INSERT INTO `products` VALUES (465, 33, 34, 'Bác nông dân', 'Bác nông dân đạp xe phun thuốc xâu cho lúa', '104 KB', '700 x 467', '2024-06-22 00:00:00', '../assets/images/vietnam/connguoi/37.jpg', 162000, 'accepted');
INSERT INTO `products` VALUES (466, 33, 34, 'Hai con thuyền', 'Hai con thuyền đậu trên bãi dưới ánh hoàng hôn', '100 KB ', '700 x 484', '2024-05-28 00:00:00', '../assets/images/vietnam/connguoi/38.jpg', 143000, 'accepted');
INSERT INTO `products` VALUES (467, 33, 34, 'Cậu bé chăn bò', 'Cậu bé đang trăn bò trên còn đường làng quen thuộc', '100 KB', '700 x 443', '2023-11-29 00:00:00', '../assets/images/vietnam/connguoi/39.jpg', 225000, 'accepted');
INSERT INTO `products` VALUES (468, 33, 34, 'Trẻ em tắm sông', 'Những đứa trẻ cùng nhau nhảy xuông sông từ con thuyền bên cạnh tắm cùng nhau dưới ánh chiều tà', '100 KB', '700 x 471', '2024-06-06 00:00:00', '../assets/images/vietnam/connguoi/40.jpg', 197000, 'accepted');
INSERT INTO `products` VALUES (469, 33, 34, 'Bác phơi cá', 'Bác nông dân đang phơi những vĩ cá dưới ánh nắng', '93 KB', '700 x 465', '2024-03-12 00:00:00', '../assets/images/vietnam/connguoi/41.jpg', 126000, 'accepted');
INSERT INTO `products` VALUES (470, 33, 34, 'Thả đèn', 'Một người chèo thuyền thả những ngọn đèn xuống sông ', '94 KB', '700 x 1054', '2024-04-18 00:00:00', '../assets/images/vietnam/connguoi/42.jpg', 231000, 'accepted');
INSERT INTO `products` VALUES (471, 33, 34, 'Người dân đi lại', 'Người dân điều khiên đi lại tấp nập trên đường', '100 KB ', '700 x 466', '2024-01-04 00:00:00', '../assets/images/vietnam/connguoi/43.jpg', 226000, 'accepted');
INSERT INTO `products` VALUES (472, 33, 34, 'Ghe trở về', 'Những chiếc ghe trở về sau một vụ đánh cá và mọi ngươi trên bờ đứng tấp nập chờ đợi mọi người', '126 KB', '700 x 467', '2024-11-07 00:00:00', '../assets/images/vietnam/connguoi/44.jpg', 234000, 'accepted');
INSERT INTO `products` VALUES (473, 33, 34, 'Hai ba con chăn trâu', 'Hai cha con ngồi trên hai con trâu với chiếc nón lá trên đầu giữa cánh đồng đầy nét dễ thương', '114 KB', '640 x 625', '2024-07-20 00:00:00', '../assets/images/vietnam/connguoi/45.jpg', 184000, 'accepted');
INSERT INTO `products` VALUES (474, 33, 34, 'Cánh đồng hoa', 'Cánh đồng hoa xinh đẹp trên miền núi và cô gái dân tộc đang hái hoa', '180 KB', '700 x 463', '2024-10-18 00:00:00', '../assets/images/vietnam/connguoi/46.jpg', 161000, 'accepted');
INSERT INTO `products` VALUES (475, 33, 34, 'Trở về', 'Hai người đạp xe cùng nhau trở về trên con đường quen thuộc dưới chiều tà phản chiếu hình ảnh xuống con hồ bên cạnh', '48 KB', '660 x 442', '2024-06-22 00:00:00', '../assets/images/vietnam/connguoi/47.jpg', 153000, 'accepted');
INSERT INTO `products` VALUES (476, 33, 35, 'Chùa bích động', 'Chùa bịch động Ninh Bình', '146 KB', '700 x 700', '2024-04-21 00:00:00', '../assets/images/vietnam/diadiem/1.jfif', 278000, 'accepted');
INSERT INTO `products` VALUES (477, 33, 35, 'Hồ hoàn kiếm', 'Hồ hoàn kiếm Hà Nội', '239 KB', '1000 x 662', '2024-09-01 00:00:00', '../assets/images/vietnam/diadiem/2.jpg', 204000, 'accepted');
INSERT INTO `products` VALUES (478, 33, 35, 'Phố cổ', 'Phố cổ Hội An', '88 KB', '512 x 314', '2024-07-24 00:00:00', '../assets/images/vietnam/diadiem/3.jpg', 183000, 'accepted');
INSERT INTO `products` VALUES (479, 33, 35, 'Chùa cầu phố cổ ', 'Chùa cầu phố cổ Hội An', '72 KB', '696 x 464', '2023-11-17 00:00:00', '../assets/images/vietnam/diadiem/4.jpg', 134000, 'accepted');
INSERT INTO `products` VALUES (480, 33, 35, 'Tràng An', 'Tràng An', '171 KB', '1024 x 699', '2023-10-27 00:00:00', '../assets/images/vietnam/diadiem/5.webp', 248000, 'accepted');
INSERT INTO `products` VALUES (481, 33, 35, 'Chùa một cột', 'Chùa một cột', '133 KB', '600 x 377', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/6.jpg', 247000, 'accepted');
INSERT INTO `products` VALUES (482, 33, 35, 'Kinh thành Huế', 'Kinh thành Huế', '200 KB', '1024 x 682', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/7.jpg', 202000, 'accepted');
INSERT INTO `products` VALUES (483, 33, 35, 'Bãi biển Phú Quốc', 'Bãi biển Phú Quốc', '163 KB', '800 x 534', '2024-10-02 00:00:00', '../assets/images/vietnam/diadiem/8.jpg', 132000, 'accepted');
INSERT INTO `products` VALUES (484, 33, 35, 'Cầu vàng ', 'Cầu vàng Đà Nẵng', '258 KB', '650 x 812', '2024-08-04 00:00:00', '../assets/images/vietnam/diadiem/9.jpg', 212000, 'accepted');
INSERT INTO `products` VALUES (485, 33, 35, 'Dinh độc lập', 'Dinh độc lập', '68 KB', '1000 x 500', '2024-03-20 00:00:00', '../assets/images/vietnam/diadiem/10.webp', 190000, 'accepted');
INSERT INTO `products` VALUES (486, 33, 35, 'Vịnh Hạ Long', 'Vịnh Hạ Long', '86 KB', '841 x 508', '2024-04-21 00:00:00', '../assets/images/vietnam/diadiem/11.jpg', 153000, 'accepted');
INSERT INTO `products` VALUES (487, 33, 35, 'Động Phong Nhà', 'Phong nha kẽ bàng', '122 KB ', '620 x 451', '2024-09-01 00:00:00', '../assets/images/vietnam/diadiem/12.jpg', 224000, 'accepted');
INSERT INTO `products` VALUES (488, 33, 35, 'Mây mù sapa', 'Mây mù sapa', '102 KB ', '650 x 650', '2024-07-24 00:00:00', '../assets/images/vietnam/diadiem/13.jpg', 209000, 'accepted');
INSERT INTO `products` VALUES (489, 33, 35, 'Grand World Hưng Yên', 'Grand World Hưng Yên', '273 KB', '926 x 695', '2023-11-17 00:00:00', '../assets/images/vietnam/diadiem/14.jpg', 142000, 'accepted');
INSERT INTO `products` VALUES (490, 33, 35, 'Hồ Bán Nguyệt', 'Hồ Bán Nguyệt', '178 KB', '600 x 402', '2023-10-27 00:00:00', '../assets/images/vietnam/diadiem/15.jpg', 192000, 'accepted');
INSERT INTO `products` VALUES (491, 33, 35, 'Suối tiên', 'Khu du lịch suối tiên', '73.3 KB', '817 x 539', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/16.jpg', 184000, 'accepted');
INSERT INTO `products` VALUES (492, 33, 35, 'Cánh đồng hoa Đà Lạt', 'Cánh đồng hoa Đà Lạt', '392 KB', '920 x 691', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/17.jpg', 188000, 'accepted');
INSERT INTO `products` VALUES (493, 33, 35, 'Vịnh Hạ Long', 'Vịnh Hạ Long', '2.61 MB', '7793 x 5895', '2024-10-02 00:00:00', '../assets/images/vietnam/diadiem/18.jpg', 197000, 'accepted');
INSERT INTO `products` VALUES (494, 33, 35, 'Thành phố Hồ Chí Minh', '“Hòn Ngọc Viễn Đông” của du lịch Việt Nam', '2.00 MB', '5896 x 3936', '2024-04-21 00:00:00', '../assets/images/vietnam/diadiem/19.jpg', 117000, 'accepted');
INSERT INTO `products` VALUES (495, 33, 35, 'Huế - Nơi ghi dấu lịch sử dân tộc', 'Huế - Nơi ghi dấu lịch sử dân tộc', '202 KB', '1024 x 576', '2024-09-01 00:00:00', '../assets/images/vietnam/diadiem/20.jpg', 292000, 'accepted');
INSERT INTO `products` VALUES (496, 33, 35, 'Phong nha kẽ bàng ', 'Vườn quốc gia phong nha kẽ bàng', '292 KB', '1280 x 853', '2024-07-24 00:00:00', '../assets/images/vietnam/diadiem/21.jpg', 112000, 'accepted');
INSERT INTO `products` VALUES (497, 33, 35, 'Thánh địa Mỹ Sơn', 'Vẻ đẹp của Thánh địa Mỹ Sơn nằm ở những công trình kiến trúc với thiết kế độc đáo mang đậm dấu ấn của người Champa cổ.', '135 KB', '797 x 561', '2023-11-17 00:00:00', '../assets/images/vietnam/diadiem/22.jpg', 219000, 'accepted');
INSERT INTO `products` VALUES (498, 33, 35, 'Sông Hoài Hội An', 'Con phố nằm e ấp bên dòng sông Hoài, cảnh sắc ở Hội An đẹp như một bức tranh trữ tình tô điểm bởi những chiếc đèn lồng rực rỡ sắc màu.', '653 KB', '2048 x 1536', '2023-10-27 00:00:00', '../assets/images/vietnam/diadiem/23.jpg', 237000, 'accepted');
INSERT INTO `products` VALUES (499, 33, 35, 'Quán cà phê Đà Lạt', 'Quán cà phê Đà Lạt', '1.53 MB', '4876 x 2742', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/24.jpg', 127000, 'accepted');
INSERT INTO `products` VALUES (500, 33, 35, 'Thành phố Sapa', 'Cảnh sắc tuyệt đẹp của thiên nhiên, núi non trời đất', '201 KB', '1120 x 749', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/25.jpg', 115000, 'accepted');
INSERT INTO `products` VALUES (501, 33, 35, 'Cầu rồng Đà Nẵng', 'Cầu rồng Đà Nẵng', '285 KB', '1600 x 995', '2024-10-02 00:00:00', '../assets/images/vietnam/diadiem/26.jpg', 256000, 'accepted');
INSERT INTO `products` VALUES (502, 33, 35, 'Cố đo Hoa Lư', 'Cố đo Hoa Lư', '305 KB', '957 x 910', '2024-08-04 00:00:00', '../assets/images/vietnam/diadiem/27.jpg', 231000, 'accepted');
INSERT INTO `products` VALUES (503, 33, 35, 'Thành phố biển Nha Trang', 'Ánh đèn chiếu sáng những thành phố dưới màn đêm cùng con đường chải dài và bãi biển tuyệt đẹp với làn nước trong xanh và cồn cát trắng', '109 KB', '700 x 465', '2024-03-20 00:00:00', '../assets/images/vietnam/diadiem/28.jpg', 242000, 'accepted');
INSERT INTO `products` VALUES (504, 33, 35, 'Đảo Cát Bà', 'Đảo Cát Bà', '137 KB', '640 x 479', '2024-04-21 00:00:00', '../assets/images/vietnam/diadiem/29.jpg', 130000, 'accepted');
INSERT INTO `products` VALUES (505, 33, 35, 'Đảo Phú Quốc', 'Đảo Phú Quốc', '1.28 MB', '3840 x 2160', '2024-09-01 00:00:00', '../assets/images/vietnam/diadiem/30.jpg', 200000, 'accepted');
INSERT INTO `products` VALUES (506, 33, 35, 'Côn Đảo', 'Mang vẻ đẹp hoang sơ của biển xanh cát trắng giữa ngàn khơi', '100 KB', '800 x 448', '2024-07-24 00:00:00', '../assets/images/vietnam/diadiem/31.jpg', 277000, 'accepted');
INSERT INTO `products` VALUES (507, 33, 35, 'Mũi né Phan Thiết', 'Mũi né Phan Thiết', '109 KB', '800 x 533', '2023-11-17 00:00:00', '../assets/images/vietnam/diadiem/32.jpg', 100000, 'accepted');
INSERT INTO `products` VALUES (508, 33, 35, 'Thành phố biển', 'Thành phố và bãi biển Vũng tàu', '927 KB', '1920 x 1280', '2023-10-27 00:00:00', '../assets/images/vietnam/diadiem/33.jpg', 243000, 'accepted');
INSERT INTO `products` VALUES (509, 33, 35, 'Thích Ca Phật Đài', 'Thích Ca Phật Đài Vũng Tàu', '0.97 MB', '1920 x 1082', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/34.jpg', 204000, 'accepted');
INSERT INTO `products` VALUES (510, 33, 35, 'Bờ biển Vũng Tàu', 'Những ánh đén chiều rọi từ những căn nhà thành phố bên kia bờ và những con tàu neo đậu trên biển', '290 KB', '1920 x 656', '2024-04-25 00:00:00', '../assets/images/vietnam/diadiem/35.jpg', 212000, 'accepted');
INSERT INTO `products` VALUES (511, 33, 35, 'Nhà thờ Đức Bà', 'Nhà thờ Đức Bà', '1.09 MB', '1920 x 1440', '2024-10-02 00:00:00', '../assets/images/vietnam/diadiem/36.jpg', 242000, 'accepted');
INSERT INTO `products` VALUES (512, 33, 35, 'Pháo hoa', 'Những tòa nhà cao lớn được chiếu rọi bởi những ánh sáng tuyệt đẹp từ pháo hao được bắn lên làm cho bầu trời trở thành khung cảnh nên thơ', '100 KB', '700 x 1049', '2024-04-21 00:00:00', '../assets/images/vietnam/diadiem/37.jpg', 130000, 'accepted');
INSERT INTO `products` VALUES (513, 33, 36, 'Bánh khọt truyền thống', 'Món bánh khọt quen thuộc truyền thống với chén nước mắn và đĩa rau đầy đẹp mắt và ngon', '667 KB', '1920 x 1275', '2023-10-27 00:00:00', '../assets/images/vietnam/quehuong/4.jpg', 195000, 'accepted');
INSERT INTO `products` VALUES (514, 33, 36, 'Cánh đồng hoa sen', 'Những cánh hoa sen màu hông nở rộ trên cánh đồng phủ kín cả mặt hồ', '442 KB', '1920 x 1200', '2023-10-28 00:00:00', '../assets/images/vietnam/quehuong/7.jpg', 245000, 'accepted');
INSERT INTO `products` VALUES (515, 33, 37, 'Dòng suối', 'Dòng suối chia cắt hai bên cánh đồng xanh mướt', '806 KB', '1920 x 1280', '2023-11-17 00:00:00', '../assets/images/vietnam/ruong/1.jpg', 187000, 'accepted');
INSERT INTO `products` VALUES (516, 33, 37, 'Mảng ruộng', 'Những mảng ruộng được phan chia rõ ràng với nhau', '1.45 MB', '1920 x 1280', '2023-10-27 00:00:00', '../assets/images/vietnam/ruong/2.jpg', 283000, 'accepted');
INSERT INTO `products` VALUES (1019, 107, 8, 'Mạng đồ thị neural ', 'Machine Learning', '34 KB', '794x709', '2025-06-05 16:00:26', '../assets/images/uploads/application_gnn.webp', 200000, 'waiting');

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS `promotions`;
CREATE TABLE `promotions`  (
  `promotionId` int NOT NULL AUTO_INCREMENT,
  `promotionName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `percentage` double(5, 2) NOT NULL,
  PRIMARY KEY (`promotionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of promotions
-- ----------------------------
INSERT INTO `promotions` VALUES (1, 'Giảm 0%', 'Dưới 5 ảnh', 0.00);
INSERT INTO `promotions` VALUES (2, 'Giảm 10%', 'Từ 5 ảnh trở lên', 0.10);
INSERT INTO `promotions` VALUES (3, 'Giảm 20%', 'Từ 10 ảnh trở lên', 0.20);
INSERT INTO `promotions` VALUES (4, 'Giảm 30%', 'Từ 25 ảnh trở lên', 0.30);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `idRole` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (2, 'user');
INSERT INTO `roles` VALUES (1, 'seller');
INSERT INTO `roles` VALUES (0, 'admin');

-- ----------------------------
-- Table structure for sellers
-- ----------------------------
DROP TABLE IF EXISTS `sellers`;
CREATE TABLE `sellers`  (
  `uid` int NOT NULL,
  `registryDate` datetime NULL DEFAULT NULL,
  `balance` double(20, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sellers
-- ----------------------------
INSERT INTO `sellers` VALUES (32, '2023-10-20 00:00:00', 5000000);
INSERT INTO `sellers` VALUES (33, '2023-12-15 00:00:00', 7000000);
INSERT INTO `sellers` VALUES (34, '2023-11-22 00:00:00', 8500000);
INSERT INTO `sellers` VALUES (97, '2025-02-21 00:00:00', 0);
INSERT INTO `sellers` VALUES (100, '2025-03-07 00:00:00', 0);
INSERT INTO `sellers` VALUES (104, '2025-05-02 00:00:00', 0);
INSERT INTO `sellers` VALUES (105, '2025-05-12 00:00:00', 0);
INSERT INTO `sellers` VALUES (106, '2025-06-01 00:00:00', 0);
INSERT INTO `sellers` VALUES (107, '2025-06-02 00:00:00', 0);
INSERT INTO `sellers` VALUES (113, '2025-06-04 00:00:00', 0);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `tid` int NOT NULL AUTO_INCREMENT,
  `pid` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for unlock_tokens
-- ----------------------------
DROP TABLE IF EXISTS `unlock_tokens`;
CREATE TABLE `unlock_tokens`  (
  `unlTkId` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expireTime` datetime NOT NULL,
  PRIMARY KEY (`unlTkId`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  CONSTRAINT `unlock_tokens_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unlock_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `role` int NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 2, 'Nguyễn Minh Hong', 'customer1', 'customer1', 'cust1@gmail.com', '2023-01-12 00:00:00');
INSERT INTO `users` VALUES (2, 2, 'Trần Thị Thanh new', 'customer2', 'customer2', 'cust2@gmail.com', '2023-02-25 00:00:00');
INSERT INTO `users` VALUES (4, 2, 'Phạm Mai Anh', 'customer4', 'customer4', 'cust4@gmail.com', '2023-04-15 00:00:00');
INSERT INTO `users` VALUES (5, 2, 'Nguyễn Gia Bảo', 'customer5', 'customer5', 'cust5@gmail.com', '2023-05-07 00:00:00');
INSERT INTO `users` VALUES (6, 2, 'Vũ Thảo Nhi ', 'customer6', 'customer6', 'cust6@gmail.com', '2023-06-20 00:00:00');
INSERT INTO `users` VALUES (7, 2, 'Đỗ Quang Khải ', 'customer7', 'customer7', 'cust7@gmail.com', '2023-07-11 00:00:00');
INSERT INTO `users` VALUES (8, 2, 'Bùi Ngọc Linh ', 'customer8', 'customer8', 'cust8@gmail.com', '2023-08-30 00:00:00');
INSERT INTO `users` VALUES (9, 2, 'Hoàng Văn Nam  aâs', 'customer9ádfá', 'customer9', 'cust9@gmail.com', '2023-09-12 00:00:00');
INSERT INTO `users` VALUES (10, 2, 'Ngô Kim Yến ', 'customer10', 'customer10', 'cust10@gmail.com', '2023-10-25 00:00:00');
INSERT INTO `users` VALUES (11, 2, 'Trần Đức Anh', 'customer11', 'customer11', 'cust11@gmail.com', '2023-11-05 00:00:00');
INSERT INTO `users` VALUES (12, 2, 'Lý Hương Giang ', 'customer12', 'customer12', 'cust12@gmail.com', '2023-12-18 00:00:00');
INSERT INTO `users` VALUES (13, 2, 'Đặng Bảo An', 'customer13', 'customer13', 'cust13@gmail.com', '2024-01-01 00:00:00');
INSERT INTO `users` VALUES (14, 2, 'Phan Thu Hà ', 'customer14', 'customer14', 'cust14@gmail.com', '2024-02-14 00:00:00');
INSERT INTO `users` VALUES (15, 2, 'Nguyễn Hoàng Nam', 'customer15', 'customer15', 'cust15@gmail.com', '2024-03-28 00:00:00');
INSERT INTO `users` VALUES (16, 2, 'Lê Minh Tú ', 'customer16', 'customer16', 'cust16@gmail.com', '2024-04-10 00:00:00');
INSERT INTO `users` VALUES (17, 2, 'Trịnh Thanh Hằng', 'customer17', 'customer17', 'cust17@gmail.com', '2024-05-25 00:00:00');
INSERT INTO `users` VALUES (18, 2, 'Phạm Quốc Anh ', 'customer18', 'customer18', 'cust18@gmail.com', '2024-06-06 00:00:00');
INSERT INTO `users` VALUES (19, 2, 'Dương Thùy Linh ', 'customer19', 'customer19', 'cust19@gmail.com', '2024-07-19 00:00:00');
INSERT INTO `users` VALUES (20, 2, 'Ngô Hữu Nghĩa', 'customer20', 'customer20', 'cust20@gmail.com', '2024-08-03 00:00:00');
INSERT INTO `users` VALUES (21, 2, 'Đinh Hồng Vân ', 'customer21', 'customer21', 'cust21@gmail.com', '2024-09-16 00:00:00');
INSERT INTO `users` VALUES (22, 2, 'Trần Thế Phong ', 'customer22', 'customer22', 'cust22@gmail.com', '2024-10-01 00:00:00');
INSERT INTO `users` VALUES (23, 2, 'Lý Nhật Minh ', 'customer23', 'customer23', 'cust23@gmail.com', '2024-11-12 00:00:00');
INSERT INTO `users` VALUES (24, 2, 'Phan Diệu Thảo ', 'customer24', 'customer24', 'cust24@gmail.com', '2024-12-22 00:00:00');
INSERT INTO `users` VALUES (25, 2, 'Hoàng Bảo Khánh', 'customer25', 'customer25', 'cust25@gmail.com', '2023-01-08 00:00:00');
INSERT INTO `users` VALUES (26, 2, 'Nguyễn Hà My', 'customer26', 'customer26', 'cust26@gmail.com', '2023-02-19 00:00:00');
INSERT INTO `users` VALUES (27, 2, 'Lê Thanh Bình ', 'customer27', 'customer27', 'cust27@gmail.com', '2023-03-29 00:00:00');
INSERT INTO `users` VALUES (28, 2, 'Đỗ Trường Sơn ', 'customer28', 'customer28', 'cust28@gmail.com', '2023-05-05 00:00:00');
INSERT INTO `users` VALUES (29, 2, 'Trần Thùy Chi ', 'customer29', 'customer29', 'cust29@gmail.com', '2023-06-17 00:00:00');
INSERT INTO `users` VALUES (30, 2, 'Phạm Minh Triết ', 'customer30', 'customer30', 'cust30@gmail.com', '2023-08-09 00:00:00');
INSERT INTO `users` VALUES (31, 1, 'Võ Hoàng Phúc', 'seller1', 'seller1', 'seller1@gmail.com', '2023-09-19 00:00:00');
INSERT INTO `users` VALUES (32, 1, 'Huỳnh Đăng Khanh', 'seller2', 'seller2', 'seller2@gmail.com', '2023-11-02 00:00:00');
INSERT INTO `users` VALUES (33, 1, 'Nguyễn Thanh Thương', 'seller3', 'seller3', 'seller3@gmail.com', '2023-10-15 00:00:00');
INSERT INTO `users` VALUES (34, 0, 'admin-1', 'admin-1', 'admin', 'admin@gmail.com', '2023-01-01 00:00:00');
INSERT INTO `users` VALUES (37, 1, 'AAA', 'aaa', '47bce5c74f589f4867dbd57e9ca9f808', 'aaa@gmail.com', '2025-01-13 00:00:00');
INSERT INTO `users` VALUES (38, 0, 'admin', 'admin', '202cb962ac59075b964b07152d234b70', 'admin@gmail.com', '2025-01-15 00:00:00');
INSERT INTO `users` VALUES (40, 1, 'Lê Văn A', 'seller40', 'seller40', 'seller40@gmail.com', '2024-01-15 00:00:00');
INSERT INTO `users` VALUES (41, 2, 'Trần Thị B', 'customer41', 'customer41', 'customer41@gmail.com', '2024-02-15 00:00:00');
INSERT INTO `users` VALUES (42, 1, 'Phạm Minh C', 'seller42', 'seller42', 'seller42@gmail.com', '2024-03-10 00:00:00');
INSERT INTO `users` VALUES (43, 2, 'Nguyễn Thị D', 'customer43', 'customer43', 'customer43@gmail.com', '2024-04-05 00:00:00');
INSERT INTO `users` VALUES (44, 1, 'Võ Tuấn E', 'seller44', 'seller44', 'seller44@gmail.com', '2024-05-01 00:00:00');
INSERT INTO `users` VALUES (45, 2, 'Đặng Thu F', 'customer45', 'customer45', 'customer45@gmail.com', '2024-06-10 00:00:00');
INSERT INTO `users` VALUES (46, 1, 'Bùi Thanh G', 'seller46', 'seller46', 'seller46@gmail.com', '2024-07-20 00:00:00');
INSERT INTO `users` VALUES (47, 2, 'Hoàng Lan H', 'customer47', 'customer47', 'customer47@gmail.com', '2024-08-15 00:00:00');
INSERT INTO `users` VALUES (48, 1, 'Ngô Minh I', 'seller48', 'seller48', 'seller48@gmail.com', '2024-09-10 00:00:00');
INSERT INTO `users` VALUES (49, 2, 'Lê Thảo J', 'customer49', 'customer49', 'customer49@gmail.com', '2024-10-05 00:00:00');
INSERT INTO `users` VALUES (50, 1, 'Phan Hoàng K', 'seller50', 'seller50', 'seller50@gmail.com', '2024-11-10 00:00:00');
INSERT INTO `users` VALUES (51, 2, 'Trần Phương L', 'customer51', 'customer51', 'customer51@gmail.com', '2024-12-01 00:00:00');
INSERT INTO `users` VALUES (52, 1, 'Vũ Minh M', 'seller52', 'seller52', 'seller52@gmail.com', '2024-01-10 00:00:00');
INSERT INTO `users` VALUES (53, 2, 'Lê Thanh N', 'customer53', 'customer53', 'customer53@gmail.com', '2024-02-20 00:00:00');
INSERT INTO `users` VALUES (54, 1, 'Nguyễn Thu O', 'seller54', 'seller54', 'seller54@gmail.com', '2024-03-15 00:00:00');
INSERT INTO `users` VALUES (55, 2, 'Bùi Thị P', 'customer55', 'customer55', 'customer55@gmail.com', '2024-04-30 00:00:00');
INSERT INTO `users` VALUES (56, 1, 'Võ Minh Q', 'seller56', 'seller56', 'seller56@gmail.com', '2024-05-25 00:00:00');
INSERT INTO `users` VALUES (57, 2, 'Phan Thảo R', 'customer57', 'customer57', 'customer57@gmail.com', '2024-06-05 00:00:00');
INSERT INTO `users` VALUES (58, 1, 'Hoàng Thanh S', 'seller58', 'seller58', 'seller58@gmail.com', '2024-07-25 00:00:00');
INSERT INTO `users` VALUES (59, 2, 'Nguyễn Tuấn T', 'customer59', 'customer59', 'customer59@gmail.com', '2024-08-10 00:00:00');
INSERT INTO `users` VALUES (60, 1, 'Lê Minh U', 'seller60', 'seller60', 'seller60@gmail.com', '2024-09-20 00:00:00');
INSERT INTO `users` VALUES (61, 2, 'Vũ Thị V', 'customer61', 'customer61', 'customer61@gmail.com', '2024-10-15 00:00:00');
INSERT INTO `users` VALUES (62, 1, 'Nguyễn Thảo W', 'seller62', 'seller62', 'seller62@gmail.com', '2024-11-05 00:00:00');
INSERT INTO `users` VALUES (63, 2, 'Bùi Thu X', 'customer63', 'customer63', 'customer63@gmail.com', '2024-12-15 00:00:00');
INSERT INTO `users` VALUES (64, 1, 'Phan Thanh Y', 'seller64', 'seller64', 'seller64@gmail.com', '2024-01-30 00:00:00');
INSERT INTO `users` VALUES (65, 2, 'Võ Minh Z', 'customer65', 'customer65', 'customer65@gmail.com', '2024-02-28 00:00:00');
INSERT INTO `users` VALUES (66, 1, 'Lê Thị AA', 'seller66', 'seller66', 'seller66@gmail.com', '2024-03-01 00:00:00');
INSERT INTO `users` VALUES (67, 2, 'Nguyễn Thảo BB', 'customer67', 'customer67', 'customer67@gmail.com', '2024-04-10 00:00:00');
INSERT INTO `users` VALUES (68, 1, 'Bùi Thanh CC', 'seller68', 'seller68', 'seller68@gmail.com', '2024-05-05 00:00:00');
INSERT INTO `users` VALUES (69, 2, 'Vũ Tuấn DD', 'customer69', 'customer69', 'customer69@gmail.com', '2024-06-15 00:00:00');
INSERT INTO `users` VALUES (70, 1, 'Hoàng Minh EE', 'seller70', 'seller70', 'seller70@gmail.com', '2024-07-05 00:00:00');
INSERT INTO `users` VALUES (71, 2, 'Lê Hoàng FF', 'customer71', 'customer71', 'customer71@gmail.com', '2024-08-25 00:00:00');
INSERT INTO `users` VALUES (72, 1, 'Nguyễn Thị GG', 'seller72', 'seller72', 'seller72@gmail.com', '2024-09-05 00:00:00');
INSERT INTO `users` VALUES (73, 2, 'Phan Thu HH', 'customer73', 'customer73', 'customer73@gmail.com', '2024-10-20 00:00:00');
INSERT INTO `users` VALUES (74, 1, 'Vũ Thảo II', 'seller74', 'seller74', 'seller74@gmail.com', '2024-11-25 00:00:00');
INSERT INTO `users` VALUES (75, 2, 'Nguyễn Minh JJ', 'customer75', 'customer75', 'customer75@gmail.com', '2024-12-25 00:00:00');
INSERT INTO `users` VALUES (76, 1, 'Lê Thanh KK', 'seller76', 'seller76', 'seller76@gmail.com', '2024-01-20 00:00:00');
INSERT INTO `users` VALUES (77, 2, 'Hoàng Thị LL', 'customer77', 'customer77', 'customer77@gmail.com', '2024-02-10 00:00:00');
INSERT INTO `users` VALUES (78, 1, 'Phan Minh MM', 'seller78', 'seller78', 'seller78@gmail.com', '2024-03-30 00:00:00');
INSERT INTO `users` VALUES (80, 1, 'Bùi Thảo OO', 'seller80', 'seller80', 'seller80@gmail.com', '2024-05-15 00:00:00');
INSERT INTO `users` VALUES (81, 2, 'Nguyễn Hoàng PP', 'customer81', 'customer81', 'customer81@gmail.com', '2024-06-25 00:00:00');
INSERT INTO `users` VALUES (82, 1, 'Phan Minh QQ', 'seller82', 'seller82', 'seller82@gmail.com', '2024-07-15 00:00:00');
INSERT INTO `users` VALUES (83, 2, 'Lê Minh RR', 'customer83', 'customer83', 'customer83@gmail.com', '2024-08-05 00:00:00');
INSERT INTO `users` VALUES (84, 1, 'Vũ Thị SS', 'seller84', 'seller84', 'seller84@gmail.com', '2024-09-15 00:00:00');
INSERT INTO `users` VALUES (85, 2, 'Bùi Thu TT', 'customer85', 'customer85', 'customer85@gmail.com', '2024-10-30 00:00:00');
INSERT INTO `users` VALUES (86, 1, 'Hoàng Minh UU', 'seller86', 'seller86', 'seller86@gmail.com', '2024-11-05 00:00:00');
INSERT INTO `users` VALUES (87, 2, 'Nguyễn Thu VV', 'customer87', 'customer87', 'customer87@gmail.com', '2024-12-10 00:00:00');
INSERT INTO `users` VALUES (88, 1, 'Phan Thanh WW', 'seller88', 'seller88', 'seller88@gmail.com', '2024-01-05 00:00:00');
INSERT INTO `users` VALUES (89, 2, 'Vũ Minh XX', 'customer89', 'customer89', 'customer89@gmail.com', '2024-02-18 00:00:00');
INSERT INTO `users` VALUES (90, 1, 'Lê Thị YY', 'seller90', 'seller90', 'seller90@gmail.com', '2024-03-25 00:00:00');
INSERT INTO `users` VALUES (97, 1, 'Nguyễn Văn A', 'vana', '202cb962ac59075b964b07152d234b70', 'nguyenvana123@gmail.com', '2025-01-24 00:00:00');
INSERT INTO `users` VALUES (98, 2, 'hoangphuc', 'phucabc', '50320299b19e0281aa11433d2a3465dd', 'phucabc@gmail.com', '2025-03-05 00:00:00');
INSERT INTO `users` VALUES (115, 2, 'Test', 'testaaa', 'e807f1fcf82d132f9bb018ca6738a19f', 'aaa@gmail.com', '2025-06-04 00:00:00');
INSERT INTO `users` VALUES (116, 2, 'Test', 'testaaa', 'e807f1fcf82d132f9bb018ca6738a19f', 'testaaa@gmail.com', '2025-06-04 00:00:00');
INSERT INTO `users` VALUES (117, 1, 'abc', 'abcxyz', 'e807f1fcf82d132f9bb018ca6738a19f', 'abcxyz@gmail.com', '2025-06-04 00:00:00');

-- ----------------------------
-- Table structure for views
-- ----------------------------
DROP TABLE IF EXISTS `views`;
CREATE TABLE `views`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `pid` int NULL DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `view_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 602 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of views
-- ----------------------------
INSERT INTO `views` VALUES (136, 57, 219, 'session_12345', '2023-01-15 10:30:00', '2023-02-20 14:45:00', 34);
INSERT INTO `views` VALUES (137, 12, 388, 'session_67890', '2024-05-03 15:12:00', '2024-06-10 16:28:00', 87);
INSERT INTO `views` VALUES (138, 78, 105, 'session_abcde', '2025-02-28 09:25:00', '2025-03-15 11:30:00', 12);
INSERT INTO `views` VALUES (139, 33, 56, 'session_fghij', '2023-11-10 14:00:00', '2023-12-05 15:30:00', 65);
INSERT INTO `views` VALUES (140, 61, 320, 'session_klmno', '2024-09-18 11:45:00', '2024-10-22 13:15:00', 98);
INSERT INTO `views` VALUES (141, 19, 150, 'session_pqrst', '2025-06-05 16:30:00', '2025-07-01 17:00:00', 42);
INSERT INTO `views` VALUES (142, 45, 88, 'session_uvwxy', '2023-07-22 13:20:00', '2023-08-18 15:55:00', 28);
INSERT INTO `views` VALUES (143, 72, 280, 'session_z0123', '2024-03-10 10:10:00', '2024-04-03 12:40:00', 79);
INSERT INTO `views` VALUES (144, 26, 200, 'session_45678', '2025-01-08 17:15:00', '2025-04-11 02:00:52', 52);
INSERT INTO `views` VALUES (145, 50, 125, 'session_90abc', '2023-05-12 12:50:00', '2025-06-02 17:42:30', 21);
INSERT INTO `views` VALUES (146, 68, 350, 'session_defgh', '2024-12-01 15:40:00', '2025-01-05 16:10:00', 88);
INSERT INTO `views` VALUES (147, 15, 75, 'session_ijklm', '2025-08-20 11:00:00', '2025-09-25 12:35:00', 60);
INSERT INTO `views` VALUES (148, 39, 250, 'session_nopqr', '2023-09-08 16:25:00', '2025-04-11 01:59:47', 38);
INSERT INTO `views` VALUES (149, 75, 180, 'session_rstuv', '2024-06-25 13:55:00', '2025-06-05 09:40:11', 73);
INSERT INTO `views` VALUES (150, 22, 95, 'session_wxyz0', '2025-04-12 10:40:00', '2025-05-18 12:10:00', 25);
INSERT INTO `views` VALUES (151, 53, 300, 'session_123ab', '2023-03-18 14:15:00', '2023-04-22 16:45:00', 91);
INSERT INTO `views` VALUES (152, 48, 110, 'session_456cd', '2024-10-05 11:20:00', '2024-11-10 13:00:00', 58);
INSERT INTO `views` VALUES (153, 65, 375, 'session_789ef', '2025-07-10 17:30:00', '2025-08-15 18:45:00', 46);
INSERT INTO `views` VALUES (154, 30, 165, 'session_0abcd', '2023-01-28 12:00:00', '2025-06-05 09:29:27', 87);
INSERT INTO `views` VALUES (155, 70, 225, 'session_123ef', '2024-04-20 16:50:00', '2024-05-25 17:20:00', 30);
INSERT INTO `views` VALUES (156, 17, 60, 'session_456gh', '2025-09-02 11:35:00', '2025-10-08 13:10:00', 68);
INSERT INTO `views` VALUES (157, 42, 260, 'session_789ij', '2023-12-15 13:40:00', '2024-01-20 15:10:00', 23);
INSERT INTO `views` VALUES (158, 58, 190, 'session_0jklm', '2024-08-10 10:20:00', '2025-06-05 09:29:44', 98);
INSERT INTO `views` VALUES (159, 28, 100, 'session_123no', '2025-05-22 17:05:00', '2025-06-28 18:25:00', 55);
INSERT INTO `views` VALUES (160, 63, 330, 'session_456pq', '2023-06-18 15:30:00', '2023-07-22 16:00:00', 15);
INSERT INTO `views` VALUES (161, 55, 130, 'session_789rs', '2024-02-12 12:35:00', '2025-06-05 15:49:31', 77);
INSERT INTO `views` VALUES (162, 25, 390, 'session_0stuv', '2025-01-25 11:15:00', '2025-06-01 20:11:18', 50);
INSERT INTO `views` VALUES (163, 36, 80, 'session_123wx', '2023-08-28 16:10:00', '2023-09-22 17:40:00', 33);
INSERT INTO `views` VALUES (164, 79, 290, 'session_456yz', '2024-05-15 13:25:00', '2025-06-02 17:44:33', 90);
INSERT INTO `views` VALUES (165, 20, 160, 'session_789za', '2025-10-10 10:55:00', '2025-04-11 01:59:27', 63);
INSERT INTO `views` VALUES (166, 40, 230, 'session_0abcd1', '2023-04-10 17:20:00', '2023-05-15 18:50:00', 26);
INSERT INTO `views` VALUES (167, 51, 120, 'session_123ef2', '2024-11-20 14:05:00', '2024-12-25 16:30:00', 92);
INSERT INTO `views` VALUES (168, 67, 360, 'session_456gh3', '2025-08-05 11:45:00', '2025-09-10 13:20:00', 52);
INSERT INTO `views` VALUES (169, 31, 155, 'session_789ij4', '2023-02-18 10:30:00', '2025-04-11 01:59:29', 19);
INSERT INTO `views` VALUES (170, 71, 220, 'session_0jklm5', '2024-09-25 16:15:00', '2024-10-30 17:45:00', 85);
INSERT INTO `views` VALUES (171, 18, 65, 'session_123no6', '2025-06-10 12:40:00', '2025-07-15 14:15:00', 39);
INSERT INTO `views` VALUES (172, 43, 270, 'session_456pq7', '2023-07-05 15:55:00', '2023-08-10 16:30:00', 70);
INSERT INTO `views` VALUES (173, 59, 195, 'session_789rs8', '2024-03-28 11:10:00', '2024-04-25 13:45:00', 66);
INSERT INTO `views` VALUES (174, 29, 105, 'session_0stuv9', '2025-01-15 18:30:00', '2025-02-20 19:55:00', 21);
INSERT INTO `views` VALUES (175, 64, 335, 'session_123wx0', '2023-11-20 14:20:00', '2023-12-25 15:50:00', 97);
INSERT INTO `views` VALUES (176, 56, 135, 'session_456yz1', '2024-08-15 10:15:00', '2025-06-05 08:09:52', 61);
INSERT INTO `views` VALUES (177, 24, 395, 'session_789za2', '2025-05-30 17:50:00', '2025-06-01 20:11:35', 45);
INSERT INTO `views` VALUES (178, 37, 85, 'session_0abcd3', '2023-06-25 13:10:00', '2023-07-30 14:35:00', 80);
INSERT INTO `views` VALUES (179, 77, 295, 'session_123ef4', '2024-02-20 16:45:00', '2024-03-25 18:10:00', 32);
INSERT INTO `views` VALUES (180, 21, 165, 'session_456gh5', '2025-09-18 11:20:00', '2025-06-05 09:29:27', 68);
INSERT INTO `views` VALUES (181, 41, 235, 'session_789ij6', '2023-03-22 17:45:00', '2023-04-25 19:15:00', 27);
INSERT INTO `views` VALUES (182, 52, 125, 'session_0jklm7', '2024-10-25 14:10:00', '2025-06-02 17:42:30', 95);
INSERT INTO `views` VALUES (183, 69, 365, 'session_123no8', '2025-07-15 10:25:00', '2025-08-20 12:50:00', 53);
INSERT INTO `views` VALUES (184, 32, 160, 'session_456pq9', '2023-12-20 15:30:00', '2025-04-11 01:59:27', 17);
INSERT INTO `views` VALUES (185, 73, 225, 'session_789rs0', '2024-08-20 11:55:00', '2024-09-25 13:30:00', 86);
INSERT INTO `views` VALUES (186, 16, 70, 'session_0stuv1', '2025-05-25 18:25:00', '2025-06-30 19:50:00', 38);
INSERT INTO `views` VALUES (187, 44, 275, 'session_123wx2', '2023-01-22 12:10:00', '2023-02-25 13:40:00', 71);
INSERT INTO `views` VALUES (188, 60, 200, 'session_456yz3', '2024-09-30 17:55:00', '2025-04-11 02:00:52', 68);
INSERT INTO `views` VALUES (189, 27, 110, 'session_789za4', '2025-06-15 11:35:00', '2025-07-20 13:00:00', 22);
INSERT INTO `views` VALUES (190, 62, 340, 'session_0abcd5', '2023-07-10 14:40:00', '2023-08-15 16:10:00', 96);
INSERT INTO `views` VALUES (191, 54, 140, 'session_123ef6', '2024-03-25 10:25:00', '2025-06-05 08:07:19', 61);
INSERT INTO `views` VALUES (192, 23, 395, 'session_456gh7', '2025-02-28 19:15:00', '2025-06-01 20:11:35', 48);
INSERT INTO `views` VALUES (193, 38, 90, 'session_789ij8', '2023-08-20 13:30:00', '2023-09-25 15:00:00', 81);
INSERT INTO `views` VALUES (194, 76, 300, 'session_0jklm9', '2024-05-20 18:10:00', '2024-06-25 19:40:00', 35);
INSERT INTO `views` VALUES (195, 13, 170, 'session_123no0', '2025-10-15 12:20:00', '2025-06-02 17:42:22', 65);
INSERT INTO `views` VALUES (196, 46, 240, 'session_456pq10', '2023-05-15 19:50:00', '2023-06-20 21:20:00', 29);
INSERT INTO `views` VALUES (197, 49, 130, 'session_789rs11', '2024-12-30 15:45:00', '2025-06-05 15:49:31', 92);
INSERT INTO `views` VALUES (198, 66, 370, 'session_0stuv12', '2025-09-10 11:30:00', '2025-10-15 13:00:00', 54);
INSERT INTO `views` VALUES (199, 34, 165, 'session_123wx13', '2023-01-28 15:10:00', '2025-06-05 09:29:27', 22);
INSERT INTO `views` VALUES (200, 74, 230, 'session_456yz14', '2024-06-15 10:25:00', '2024-08-01 12:55:00', 84);
INSERT INTO `views` VALUES (201, 14, 75, 'session_789za15', '2025-03-10 13:40:00', '2025-04-12 15:15:00', 40);
INSERT INTO `views` VALUES (202, 47, 280, 'session_0abcd16', '2023-11-12 11:55:00', '2023-12-15 14:25:00', 69);
INSERT INTO `views` VALUES (203, 59, 205, 'session_123ef17', '2024-07-28 16:30:00', '2024-08-29 17:00:00', 61);
INSERT INTO `views` VALUES (204, 27, 115, 'session_456gh18', '2025-01-18 19:50:00', '2025-02-20 20:20:00', 24);
INSERT INTO `views` VALUES (205, 63, 345, 'session_789ij19', '2023-02-12 15:35:00', '2023-03-15 18:05:00', 99);
INSERT INTO `views` VALUES (206, 55, 145, 'session_0jklm20', '2024-10-25 11:20:00', '2025-06-04 11:07:47', 57);
INSERT INTO `views` VALUES (207, 25, 395, 'session_123no21', '2025-05-02 17:45:00', '2025-06-01 20:11:35', 49);
INSERT INTO `views` VALUES (208, 35, 95, 'session_456pq22', '2023-09-15 14:10:00', '2023-10-18 16:40:00', 83);
INSERT INTO `views` VALUES (209, 75, 305, 'session_789rs23', '2024-03-25 12:25:00', '2024-05-01 14:55:00', 36);
INSERT INTO `views` VALUES (210, 15, 175, 'session_0stuv24', '2025-11-20 18:50:00', '2025-12-25 21:20:00', 65);
INSERT INTO `views` VALUES (211, 45, 245, 'session_123wx25', '2023-06-20 13:00:00', '2023-07-22 15:30:00', 31);
INSERT INTO `views` VALUES (212, 50, 135, 'session_456yz26', '2024-01-15 16:15:00', '2025-06-05 08:09:52', 98);
INSERT INTO `views` VALUES (213, 68, 375, 'session_789za27', '2025-07-10 19:30:00', '2025-08-15 22:00:00', 50);
INSERT INTO `views` VALUES (214, 33, 170, 'session_0abcd28', '2023-03-18 11:40:00', '2025-06-02 17:42:22', 14);
INSERT INTO `views` VALUES (215, 73, 235, 'session_123ef29', '2024-08-05 13:15:00', '2024-09-10 15:45:00', 87);
INSERT INTO `views` VALUES (216, 17, 80, 'session_456gh30', '2025-04-12 10:20:00', '2025-05-18 12:50:00', 43);
INSERT INTO `views` VALUES (217, 42, 285, 'session_789ij31', '2023-10-25 15:35:00', '2023-11-30 18:05:00', 74);
INSERT INTO `views` VALUES (218, 58, 205, 'session_0jklm32', '2024-02-12 12:40:00', '2024-03-18 15:10:00', 62);
INSERT INTO `views` VALUES (219, 29, 115, 'session_123no33', '2025-01-20 20:00:00', '2025-03-22 21:30:00', 25);
INSERT INTO `views` VALUES (220, 64, 350, 'session_456pq34', '2023-07-28 10:45:00', '2023-08-29 13:15:00', 98);
INSERT INTO `views` VALUES (221, 56, 150, 'session_789rs35', '2024-04-25 17:10:00', '2024-05-30 19:40:00', 57);
INSERT INTO `views` VALUES (222, 23, 399, 'session_0stuv36', '2025-06-08 11:20:00', '2025-06-01 23:17:22', 50);
INSERT INTO `views` VALUES (223, 38, 95, 'session_123wx37', '2023-09-22 18:30:00', '2023-10-25 21:00:00', 79);
INSERT INTO `views` VALUES (224, 76, 310, 'session_456yz38', '2024-01-02 12:55:00', '2024-03-05 15:25:00', 33);
INSERT INTO `views` VALUES (225, 13, 175, 'session_789za39', '2025-10-25 21:20:00', '2025-11-20 23:50:00', 66);
INSERT INTO `views` VALUES (226, 46, 245, 'session_0abcd40', '2023-04-20 14:10:00', '2023-05-22 16:40:00', 30);
INSERT INTO `views` VALUES (227, 49, 135, 'session_123ef41', '2024-11-30 19:45:00', '2025-06-05 08:09:52', 96);
INSERT INTO `views` VALUES (228, 66, 380, 'session_456gh42', '2025-08-15 13:00:00', '2025-10-15 15:30:00', 51);
INSERT INTO `views` VALUES (229, 34, 170, 'session_789ij43', '2023-02-18 16:40:00', '2025-06-02 17:42:22', 17);
INSERT INTO `views` VALUES (230, 74, 240, 'session_0jklm44', '2024-07-15 15:45:00', '2024-09-10 18:15:00', 88);
INSERT INTO `views` VALUES (231, 14, 80, 'session_123no45', '2025-05-18 12:50:00', '2025-06-30 15:20:00', 41);
INSERT INTO `views` VALUES (232, 47, 285, 'session_456pq46', '2023-12-15 18:05:00', '2024-01-25 20:35:00', 72);
INSERT INTO `views` VALUES (233, 59, 210, 'session_789rs47', '2024-03-18 15:10:00', '2024-04-25 17:40:00', 60);
INSERT INTO `views` VALUES (234, 27, 120, 'session_0stuv48', '2025-02-20 20:20:00', '2025-03-22 22:50:00', 23);
INSERT INTO `views` VALUES (235, 63, 355, 'session_123wx49', '2023-08-29 13:15:00', '2023-09-22 15:45:00', 97);
INSERT INTO `views` VALUES (236, 55, 155, 'session_456yz50', '2024-05-30 19:40:00', '2025-04-11 01:59:29', 59);
INSERT INTO `views` VALUES (237, 25, 399, 'session_789za51', '2025-08-01 13:50:00', '2025-06-01 23:17:22', 46);
INSERT INTO `views` VALUES (238, 35, 100, 'session_0abcd52', '2023-10-18 16:40:00', '2023-11-12 19:10:00', 80);
INSERT INTO `views` VALUES (239, 75, 315, 'session_123ef53', '2024-03-05 15:25:00', '2024-06-25 17:55:00', 37);
INSERT INTO `views` VALUES (240, 15, 180, 'session_456gh54', '2025-11-20 23:50:00', '2025-06-05 09:40:11', 64);
INSERT INTO `views` VALUES (241, 45, 250, 'session_789ij55', '2023-05-22 16:40:00', '2025-04-11 01:59:47', 29);
INSERT INTO `views` VALUES (242, 50, 140, 'session_0jklm56', '2024-03-20 17:45:00', '2025-06-05 08:07:19', 97);
INSERT INTO `views` VALUES (243, 68, 380, 'session_123no57', '2025-08-15 22:00:00', '2025-10-15 00:30:00', 52);
INSERT INTO `views` VALUES (244, 33, 175, 'session_456pq58', '2023-04-20 14:10:00', '2023-06-18 16:40:00', 14);
INSERT INTO `views` VALUES (245, 73, 240, 'session_789rs59', '2024-09-10 15:45:00', '2024-09-25 18:15:00', 89);
INSERT INTO `views` VALUES (246, 17, 85, 'session_0stuv60', '2025-05-18 12:50:00', '2025-08-20 15:20:00', 44);
INSERT INTO `views` VALUES (247, 42, 290, 'session_123wx61', '2023-11-30 18:05:00', '2025-06-02 17:44:33', 71);
INSERT INTO `views` VALUES (248, 58, 215, 'session_456yz62', '2024-04-25 17:40:00', '2024-09-30 20:10:00', 63);
INSERT INTO `views` VALUES (249, 29, 120, 'session_789za63', '2025-03-22 21:30:00', '2025-06-15 00:00:00', 26);
INSERT INTO `views` VALUES (250, 64, 355, 'session_0abcd64', '2023-09-22 15:45:00', '2023-11-20 18:15:00', 99);
INSERT INTO `views` VALUES (251, 56, 155, 'session_123ef65', '2024-06-25 22:10:00', '2025-04-11 01:59:29', 56);
INSERT INTO `views` VALUES (252, 23, 400, 'session_456gh66', '2025-11-20 16:20:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (253, 38, 100, 'session_789ij67', '2023-11-12 19:10:00', '2023-12-15 21:40:00', 81);
INSERT INTO `views` VALUES (254, 76, 320, 'session_0jklm68', '2024-03-05 15:25:00', '2024-06-25 17:55:00', 36);
INSERT INTO `views` VALUES (255, 13, 180, 'session_123no69', '2025-03-18 02:20:00', '2025-06-05 09:40:11', 66);
INSERT INTO `views` VALUES (256, 46, 250, 'session_456pq70', '2023-07-22 19:10:00', '2025-04-11 01:59:47', 32);
INSERT INTO `views` VALUES (257, 49, 140, 'session_789rs71', '2024-04-30 20:15:00', '2025-06-05 08:07:19', 95);
INSERT INTO `views` VALUES (258, 66, 385, 'session_0stuv72', '2025-10-15 00:30:00', '2025-08-15 02:00:00', 53);
INSERT INTO `views` VALUES (259, 34, 175, 'session_123wx', '2023-06-18 16:40:00', '2023-12-20 19:10:00', 15);
INSERT INTO `views` VALUES (260, 78, 230, 'session_789yz73', '2024-08-20 18:15:00', '2024-09-25 20:45:00', 91);
INSERT INTO `views` VALUES (261, 16, 85, 'session_0jklm74', '2025-05-25 15:20:00', '2025-06-30 17:50:00', 42);
INSERT INTO `views` VALUES (262, 44, 290, 'session_123no75', '2023-02-25 13:40:00', '2025-06-02 17:44:33', 74);
INSERT INTO `views` VALUES (263, 60, 215, 'session_456pq76', '2024-09-30 19:25:00', '2024-11-05 21:55:00', 68);
INSERT INTO `views` VALUES (264, 27, 125, 'session_789rs77', '2025-06-15 13:00:00', '2025-06-02 17:42:30', 29);
INSERT INTO `views` VALUES (265, 62, 345, 'session_0stuv78', '2023-08-15 16:10:00', '2023-09-22 18:40:00', 96);
INSERT INTO `views` VALUES (266, 54, 150, 'session_123wx79', '2024-04-30 11:50:00', '2024-05-30 14:20:00', 59);
INSERT INTO `views` VALUES (267, 23, 400, 'session_456yz80', '2025-04-05 20:45:00', '2025-06-05 09:38:47', 52);
INSERT INTO `views` VALUES (268, 38, 105, 'session_789za81', '2023-09-25 15:00:00', '2023-11-12 17:30:00', 82);
INSERT INTO `views` VALUES (269, 76, 305, 'session_0abcd82', '2024-06-25 19:40:00', '2024-09-10 22:10:00', 38);
INSERT INTO `views` VALUES (270, 13, 180, 'session_123ef83', '2025-11-20 13:50:00', '2025-06-05 09:40:11', 68);
INSERT INTO `views` VALUES (271, 46, 255, 'session_456gh84', '2023-06-20 21:20:00', '2023-09-22 23:50:00', 32);
INSERT INTO `views` VALUES (272, 49, 145, 'session_789ij85', '2025-02-05 16:15:00', '2025-06-04 11:07:47', 95);
INSERT INTO `views` VALUES (273, 66, 390, 'session_0jklm86', '2025-10-15 13:00:00', '2025-06-01 20:11:18', 55);
INSERT INTO `views` VALUES (274, 34, 175, 'session_123no87', '2023-03-05 16:40:00', '2023-12-20 19:10:00', 18);
INSERT INTO `views` VALUES (275, 74, 245, 'session_456pq88', '2024-08-01 12:55:00', '2024-09-25 15:25:00', 90);
INSERT INTO `views` VALUES (276, 14, 90, 'session_789rs89', '2025-04-12 15:15:00', '2025-06-30 17:45:00', 45);
INSERT INTO `views` VALUES (277, 47, 290, 'session_0stuv90', '2023-12-15 14:25:00', '2025-06-02 17:44:33', 76);
INSERT INTO `views` VALUES (278, 59, 215, 'session_123wx91', '2024-08-29 17:00:00', '2024-09-30 19:30:00', 61);
INSERT INTO `views` VALUES (279, 27, 125, 'session_456yz92', '2025-02-20 20:20:00', '2025-06-02 17:42:30', 23);
INSERT INTO `views` VALUES (280, 63, 355, 'session_789za93', '2023-03-15 18:05:00', '2023-11-20 20:35:00', 98);
INSERT INTO `views` VALUES (281, 55, 155, 'session_0abcd94', '2024-11-20 13:50:00', '2025-04-11 01:59:29', 59);
INSERT INTO `views` VALUES (282, 25, 399, 'session_123ef95', '2025-06-08 20:15:00', '2025-06-01 23:17:22', 50);
INSERT INTO `views` VALUES (283, 35, 100, 'session_456gh96', '2023-10-18 16:40:00', '2023-12-15 19:10:00', 83);
INSERT INTO `views` VALUES (284, 75, 320, 'session_789ij97', '2024-05-01 14:55:00', '2024-06-25 17:25:00', 36);
INSERT INTO `views` VALUES (285, 15, 185, 'session_0jklm98', '2026-03-18 02:20:00', '2025-11-20 04:50:00', 62);
INSERT INTO `views` VALUES (286, 45, 255, 'session_123no99', '2023-07-22 19:10:00', '2023-09-22 21:40:00', 32);
INSERT INTO `views` VALUES (287, 50, 145, 'session_456pq100', '2024-04-30 20:15:00', '2025-06-04 11:07:47', 96);
INSERT INTO `views` VALUES (288, 68, 385, 'session_789rs101', '2025-10-15 00:30:00', '2025-08-15 03:00:00', 55);
INSERT INTO `views` VALUES (289, 33, 180, 'session_0stuv102', '2023-06-18 16:40:00', '2025-06-05 09:40:11', 17);
INSERT INTO `views` VALUES (290, 73, 245, 'session_123wx103', '2024-09-25 18:15:00', '2025-03-18 20:45:00', 89);
INSERT INTO `views` VALUES (291, 17, 85, 'session_456yz104', '2025-08-20 15:20:00', '2025-05-18 17:50:00', 43);
INSERT INTO `views` VALUES (292, 42, 295, 'session_789za105', '2024-01-25 20:35:00', '2023-11-30 23:05:00', 71);
INSERT INTO `views` VALUES (293, 58, 220, 'session_0abcd106', '2024-09-30 20:10:00', '2024-04-25 22:40:00', 64);
INSERT INTO `views` VALUES (294, 29, 125, 'session_123ef107', '2025-06-15 00:00:00', '2025-06-02 17:42:30', 29);
INSERT INTO `views` VALUES (295, 64, 360, 'session_456gh108', '2023-11-20 18:15:00', '2023-09-22 20:45:00', 97);
INSERT INTO `views` VALUES (296, 56, 160, 'session_789ij109', '2024-08-15 23:40:00', '2025-04-11 01:59:27', 61);
INSERT INTO `views` VALUES (297, 23, 400, 'session_0jklm110', '2026-02-28 18:50:00', '2025-06-05 09:38:47', 51);
INSERT INTO `views` VALUES (298, 38, 105, 'session_123no111', '2023-12-15 21:40:00', '2023-11-12 20:10:00', 82);
INSERT INTO `views` VALUES (299, 76, 325, 'session_456pq112', '2024-06-25 17:55:00', '2024-03-05 20:25:00', 38);
INSERT INTO `views` VALUES (300, 13, 185, 'session_789rs113', '2025-11-20 04:50:00', '2026-03-18 07:20:00', 68);
INSERT INTO `views` VALUES (301, 46, 260, 'session_0stuv114', '2023-09-22 21:40:00', '2023-07-22 18:10:00', 33);
INSERT INTO `views` VALUES (302, 49, 145, 'session_123wx115', '2024-09-15 22:45:00', '2025-06-04 11:07:47', 97);
INSERT INTO `views` VALUES (303, 66, 390, 'session_456yz116', '2025-08-15 02:00:00', '2025-06-01 20:11:18', 57);
INSERT INTO `views` VALUES (304, 34, 180, 'session_789za117', '2023-12-20 19:10:00', '2025-06-05 09:40:11', 20);
INSERT INTO `views` VALUES (305, 74, 250, 'session_0abcd118', '2024-09-25 15:25:00', '2025-04-11 01:59:47', 92);
INSERT INTO `views` VALUES (306, 14, 90, 'session_123ef119', '2025-06-30 17:45:00', '2025-04-12 16:15:00', 46);
INSERT INTO `views` VALUES (307, 47, 295, 'session_456gh120', '2024-01-25 16:55:00', '2023-12-15 19:25:00', 76);
INSERT INTO `views` VALUES (308, 59, 220, 'session_789ij121', '2024-09-30 19:30:00', '2024-08-29 22:00:00', 65);
INSERT INTO `views` VALUES (309, 27, 130, 'session_0jklm122', '2025-03-22 22:50:00', '2025-06-05 15:49:31', 24);
INSERT INTO `views` VALUES (310, 63, 360, 'session_123no123', '2023-11-20 20:35:00', '2023-03-15 23:05:00', 100);
INSERT INTO `views` VALUES (311, 55, 160, 'session_456pq124', '2024-08-15 16:20:00', '2025-04-11 01:59:27', 58);
INSERT INTO `views` VALUES (312, 25, 400, 'session_789rs125', '2026-02-28 22:45:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (313, 35, 105, 'session_0stuv126', '2023-12-15 19:10:00', '2023-10-18 21:40:00', 84);
INSERT INTO `views` VALUES (314, 75, 325, 'session_123wx127', '2024-06-25 17:25:00', '2024-05-01 19:55:00', 37);
INSERT INTO `views` VALUES (315, 15, 190, 'session_456yz128', '2025-11-20 04:50:00', '2025-06-05 09:29:44', 67);
INSERT INTO `views` VALUES (316, 45, 260, 'session_789za129', '2023-09-22 21:40:00', '2023-07-22 20:10:00', 30);
INSERT INTO `views` VALUES (317, 50, 150, 'session_0abcd130', '2024-09-15 22:45:00', '2024-04-30 23:15:00', 97);
INSERT INTO `views` VALUES (318, 68, 390, 'session_123ef131', '2025-08-15 03:00:00', '2025-06-01 20:11:18', 54);
INSERT INTO `views` VALUES (319, 33, 185, 'session_456gh132', '2024-01-25 19:10:00', '2023-06-18 21:40:00', 17);
INSERT INTO `views` VALUES (320, 73, 250, 'session_789ij133', '2025-03-18 20:45:00', '2025-04-11 01:59:47', 91);
INSERT INTO `views` VALUES (321, 17, 90, 'session_0jklm134', '2025-05-18 17:50:00', '2025-08-20 20:20:00', 44);
INSERT INTO `views` VALUES (322, 42, 300, 'session_123no135', '2023-11-30 23:05:00', '2024-01-25 21:35:00', 74);
INSERT INTO `views` VALUES (323, 58, 225, 'session_456pq136', '2024-04-25 22:40:00', '2024-09-30 21:10:00', 62);
INSERT INTO `views` VALUES (324, 29, 130, 'session_789rs137', '2025-03-22 02:30:00', '2025-06-05 15:49:31', 27);
INSERT INTO `views` VALUES (325, 64, 365, 'session_0stuv138', '2023-09-22 20:45:00', '2023-11-20 23:15:00', 99);
INSERT INTO `views` VALUES (326, 56, 165, 'session_123wx139', '2024-06-25 22:10:00', '2025-06-05 09:29:27', 63);
INSERT INTO `views` VALUES (327, 23, 400, 'session_456yz140', '2025-11-20 21:20:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (328, 38, 110, 'session_789za141', '2023-11-12 20:10:00', '2023-12-15 22:40:00', 83);
INSERT INTO `views` VALUES (329, 76, 330, 'session_0abcd142', '2024-03-05 20:25:00', '2024-06-25 22:55:00', 37);
INSERT INTO `views` VALUES (330, 13, 190, 'session_123ef143', '2026-03-18 07:20:00', '2025-06-05 09:29:44', 69);
INSERT INTO `views` VALUES (331, 46, 265, 'session_456gh144', '2023-07-22 18:10:00', '2023-09-22 20:40:00', 31);
INSERT INTO `views` VALUES (332, 49, 150, 'session_789ij145', '2024-04-30 23:15:00', '2024-09-15 21:45:00', 95);
INSERT INTO `views` VALUES (333, 66, 395, 'session_0jklm146', '2025-10-15 04:30:00', '2025-06-01 20:11:35', 55);
INSERT INTO `views` VALUES (334, 34, 185, 'session_123no147', '2023-03-05 18:40:00', '2023-12-20 21:10:00', 18);
INSERT INTO `views` VALUES (335, 74, 255, 'session_456pq148', '2024-08-01 17:55:00', '2024-09-25 20:25:00', 90);
INSERT INTO `views` VALUES (336, 14, 95, 'session_789rs149', '2025-04-12 16:15:00', '2025-06-30 18:45:00', 45);
INSERT INTO `views` VALUES (337, 47, 300, 'session_0stuv150', '2023-12-15 19:25:00', '2024-01-25 21:55:00', 75);
INSERT INTO `views` VALUES (338, 59, 225, 'session_123wx151', '2024-08-29 22:00:00', '2024-09-30 20:30:00', 64);
INSERT INTO `views` VALUES (339, 27, 135, 'session_456yz152', '2025-02-20 21:20:00', '2025-06-05 08:09:52', 25);
INSERT INTO `views` VALUES (340, 63, 365, 'session_789za153', '2023-11-20 23:05:00', '2023-03-15 21:35:00', 98);
INSERT INTO `views` VALUES (341, 55, 165, 'session_0abcd154', '2024-11-20 18:50:00', '2025-06-05 09:29:27', 65);
INSERT INTO `views` VALUES (342, 25, 400, 'session_123ef155', '2026-02-28 23:50:00', '2025-06-05 09:38:47', 54);
INSERT INTO `views` VALUES (343, 35, 110, 'session_456gh156', '2023-12-15 22:40:00', '2023-10-18 20:10:00', 84);
INSERT INTO `views` VALUES (344, 75, 330, 'session_789ij157', '2024-06-25 22:55:00', '2024-05-01 21:25:00', 36);
INSERT INTO `views` VALUES (345, 15, 195, 'session_0jklm158', '2026-03-18 09:50:00', '2025-11-20 08:20:00', 65);
INSERT INTO `views` VALUES (346, 45, 265, 'session_123no159', '2023-09-22 20:40:00', '2023-07-22 22:10:00', 32);
INSERT INTO `views` VALUES (347, 50, 155, 'session_456pq160', '2024-09-15 21:45:00', '2025-04-11 01:59:29', 98);
INSERT INTO `views` VALUES (348, 68, 395, 'session_789rs161', '2025-08-15 07:00:00', '2025-06-01 20:11:35', 54);
INSERT INTO `views` VALUES (349, 33, 190, 'session_0stuv162', '2023-12-20 21:10:00', '2025-06-05 09:29:44', 19);
INSERT INTO `views` VALUES (350, 73, 255, 'session_123wx163', '2024-09-25 23:15:00', '2025-03-18 21:45:00', 91);
INSERT INTO `views` VALUES (351, 17, 95, 'session_456yz164', '2025-08-20 20:20:00', '2025-05-18 19:50:00', 44);
INSERT INTO `views` VALUES (352, 42, 305, 'session_789za165', '2024-01-25 21:35:00', '2023-11-30 22:05:00', 70);
INSERT INTO `views` VALUES (353, 58, 230, 'session_0abcd166', '2024-09-30 21:10:00', '2024-04-25 20:40:00', 63);
INSERT INTO `views` VALUES (354, 29, 135, 'session_123ef167', '2025-06-15 02:00:00', '2025-06-05 08:09:52', 30);
INSERT INTO `views` VALUES (355, 64, 370, 'session_456gh168', '2023-11-20 23:15:00', '2023-09-22 21:45:00', 99);
INSERT INTO `views` VALUES (356, 56, 170, 'session_789ij169', '2024-08-15 23:40:00', '2025-06-02 17:42:22', 59);
INSERT INTO `views` VALUES (357, 23, 400, 'session_0jklm170', '2026-02-28 23:50:00', '2025-06-05 09:38:47', 51);
INSERT INTO `views` VALUES (358, 38, 115, 'session_123no171', '2023-12-15 22:40:00', '2023-11-12 21:10:00', 83);
INSERT INTO `views` VALUES (359, 76, 335, 'session_456pq172', '2024-06-25 22:55:00', '2024-03-05 21:25:00', 37);
INSERT INTO `views` VALUES (360, 13, 195, 'session_789rs173', '2025-11-20 09:50:00', '2026-03-18 12:20:00', 66);
INSERT INTO `views` VALUES (361, 46, 270, 'session_0stuv174', '2023-09-22 20:40:00', '2023-07-22 23:10:00', 31);
INSERT INTO `views` VALUES (362, 49, 155, 'session_123wx175', '2024-09-15 21:45:00', '2025-04-11 01:59:29', 96);
INSERT INTO `views` VALUES (363, 66, 395, 'session_456yz176', '2025-08-15 07:00:00', '2025-06-01 20:11:35', 55);
INSERT INTO `views` VALUES (364, 34, 190, 'session_789za177', '2023-12-20 21:10:00', '2025-06-05 09:29:44', 21);
INSERT INTO `views` VALUES (365, 74, 260, 'session_0abcd178', '2024-09-25 20:25:00', '2024-08-01 22:55:00', 90);
INSERT INTO `views` VALUES (366, 14, 100, 'session_123ef179', '2025-06-30 18:45:00', '2025-04-12 17:15:00', 45);
INSERT INTO `views` VALUES (367, 47, 305, 'session_456gh180', '2024-01-25 21:55:00', '2023-12-15 22:25:00', 75);
INSERT INTO `views` VALUES (368, 59, 230, 'session_789ij181', '2024-09-30 20:30:00', '2024-08-29 23:00:00', 64);
INSERT INTO `views` VALUES (369, 27, 140, 'session_0jklm182', '2025-03-22 23:50:00', '2025-06-05 08:07:19', 23);
INSERT INTO `views` VALUES (370, 63, 370, 'session_123no183', '2023-03-15 21:35:00', '2023-11-21 00:05:00', 98);
INSERT INTO `views` VALUES (371, 55, 170, 'session_456pq184', '2024-08-15 21:20:00', '2025-06-02 17:42:22', 61);
INSERT INTO `views` VALUES (372, 25, 400, 'session_789rs185', '2025-06-08 22:15:00', '2025-06-05 09:38:47', 54);
INSERT INTO `views` VALUES (373, 35, 115, 'session_0stuv186', '2023-10-18 20:10:00', '2023-12-16 22:40:00', 84);
INSERT INTO `views` VALUES (374, 75, 335, 'session_123wx187', '2024-05-01 21:25:00', '2024-06-25 20:55:00', 36);
INSERT INTO `views` VALUES (375, 15, 200, 'session_456yz188', '2025-11-20 08:20:00', '2025-04-11 02:00:52', 66);
INSERT INTO `views` VALUES (376, 45, 270, 'session_789za189', '2023-07-22 22:10:00', '2023-09-22 21:40:00', 32);
INSERT INTO `views` VALUES (377, 50, 160, 'session_0abcd190', '2024-04-30 22:15:00', '2025-04-11 01:59:27', 98);
INSERT INTO `views` VALUES (378, 68, 400, 'session_123ef191', '2025-10-15 09:30:00', '2025-06-05 09:38:47', 58);
INSERT INTO `views` VALUES (379, 33, 195, 'session_456gh192', '2024-01-25 22:40:00', '2023-12-20 23:10:00', 16);
INSERT INTO `views` VALUES (380, 73, 260, 'session_789ij193', '2025-03-18 21:45:00', '2024-09-25 20:15:00', 91);
INSERT INTO `views` VALUES (381, 42, 310, 'session_789za195', '2023-11-30 22:05:00', '2024-01-26 00:35:00', 73);
INSERT INTO `views` VALUES (382, 58, 235, 'session_0abcd196', '2024-04-25 20:40:00', '2024-10-01 02:10:00', 62);
INSERT INTO `views` VALUES (383, 29, 140, 'session_123ef197', '2025-03-22 00:30:00', '2025-06-05 08:07:19', 27);
INSERT INTO `views` VALUES (384, 64, 375, 'session_456gh198', '2023-09-22 21:45:00', '2023-11-21 02:15:00', 98);
INSERT INTO `views` VALUES (385, 56, 175, 'session_789ij199', '2024-06-25 20:10:00', '2024-11-20 22:40:00', 57);
INSERT INTO `views` VALUES (386, 23, 400, 'session_0jklm200', '2025-11-20 22:20:00', '2025-06-05 09:38:47', 52);
INSERT INTO `views` VALUES (387, 38, 120, 'session_123no201', '2023-11-12 21:10:00', '2023-12-16 23:40:00', 82);
INSERT INTO `views` VALUES (388, 76, 340, 'session_456pq202', '2024-03-05 21:25:00', '2024-06-26 00:55:00', 38);
INSERT INTO `views` VALUES (389, 13, 200, 'session_789rs203', '2026-03-18 12:20:00', '2025-04-11 02:00:52', 68);
INSERT INTO `views` VALUES (390, 46, 275, 'session_0stuv204', '2023-07-22 23:10:00', '2023-09-23 01:40:00', 32);
INSERT INTO `views` VALUES (391, 49, 160, 'session_123wx205', '2024-04-30 23:45:00', '2025-04-11 01:59:27', 95);
INSERT INTO `views` VALUES (392, 66, 400, 'session_456yz206', '2025-08-15 10:30:00', '2025-06-05 09:38:47', 59);
INSERT INTO `views` VALUES (393, 34, 195, 'session_789za207', '2023-03-05 22:40:00', '2023-12-21 01:10:00', 18);
INSERT INTO `views` VALUES (394, 74, 265, 'session_0abcd208', '2024-08-01 22:55:00', '2024-09-26 01:25:00', 90);
INSERT INTO `views` VALUES (395, 14, 105, 'session_123ef209', '2025-04-12 17:15:00', '2025-07-01 19:45:00', 45);
INSERT INTO `views` VALUES (396, 47, 310, 'session_456gh210', '2023-12-15 22:25:00', '2024-01-26 00:55:00', 75);
INSERT INTO `views` VALUES (397, 59, 235, 'session_789ij211', '2024-08-29 23:00:00', '2024-10-01 01:30:00', 61);
INSERT INTO `views` VALUES (398, 27, 145, 'session_0jklm212', '2025-02-20 22:20:00', '2025-06-04 11:07:47', 23);
INSERT INTO `views` VALUES (399, 63, 375, 'session_123no213', '2023-11-21 00:05:00', '2023-03-16 02:35:00', 100);
INSERT INTO `views` VALUES (400, 55, 175, 'session_456pq214', '2024-11-20 23:50:00', '2024-08-16 02:20:00', 57);
INSERT INTO `views` VALUES (401, 25, 400, 'session_789rs215', '2026-03-01 00:45:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (402, 35, 120, 'session_0stuv216', '2023-12-16 22:40:00', '2023-10-19 01:10:00', 84);
INSERT INTO `views` VALUES (403, 75, 340, 'session_123wx217', '2024-06-25 20:55:00', '2024-05-02 02:25:00', 37);
INSERT INTO `views` VALUES (404, 15, 205, 'session_456yz218', '2026-03-18 10:50:00', '2025-11-20 13:20:00', 64);
INSERT INTO `views` VALUES (405, 45, 275, 'session_789za219', '2023-09-22 21:40:00', '2023-07-23 00:10:00', 30);
INSERT INTO `views` VALUES (406, 50, 165, 'session_0abcd220', '2024-09-15 23:45:00', '2025-06-05 09:29:27', 102);
INSERT INTO `views` VALUES (407, 68, 400, 'session_123ef221', '2025-08-15 12:00:00', '2025-06-05 09:38:47', 58);
INSERT INTO `views` VALUES (408, 33, 200, 'session_456gh222', '2023-12-20 23:10:00', '2025-04-11 02:00:52', 18);
INSERT INTO `views` VALUES (409, 73, 265, 'session_789ij223', '2024-09-25 20:15:00', '2025-03-18 22:45:00', 90);
INSERT INTO `views` VALUES (410, 17, 105, 'session_0jklm224', '2025-05-18 19:50:00', '2025-08-21 22:20:00', 44);
INSERT INTO `views` VALUES (411, 42, 315, 'session_123no225', '2023-11-30 22:05:00', '2024-01-26 00:35:00', 74);
INSERT INTO `views` VALUES (412, 58, 240, 'session_456pq226', '2024-04-25 20:40:00', '2024-10-01 02:10:00', 62);
INSERT INTO `views` VALUES (413, 29, 145, 'session_789rs227', '2025-03-22 00:30:00', '2025-06-04 11:07:47', 26);
INSERT INTO `views` VALUES (414, 64, 380, 'session_0stuv228', '2023-09-22 21:45:00', '2023-11-21 02:15:00', 99);
INSERT INTO `views` VALUES (415, 56, 180, 'session_123wx229', '2024-06-25 20:10:00', '2025-06-05 09:40:11', 59);
INSERT INTO `views` VALUES (416, 23, 400, 'session_456yz230', '2025-11-20 22:20:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (417, 38, 125, 'session_789za231', '2023-11-12 21:10:00', '2025-06-02 17:42:30', 85);
INSERT INTO `views` VALUES (418, 76, 345, 'session_0abcd232', '2024-03-05 21:25:00', '2024-06-26 00:55:00', 37);
INSERT INTO `views` VALUES (419, 13, 205, 'session_123ef233', '2026-03-18 12:20:00', '2025-11-20 14:50:00', 66);
INSERT INTO `views` VALUES (420, 46, 280, 'session_456gh234', '2023-07-22 23:10:00', '2023-09-23 01:40:00', 31);
INSERT INTO `views` VALUES (421, 49, 165, 'session_789ij235', '2024-04-30 23:45:00', '2025-06-05 09:29:27', 100);
INSERT INTO `views` VALUES (422, 66, 400, 'session_0jklm236', '2025-08-15 10:30:00', '2025-06-05 09:38:47', 59);
INSERT INTO `views` VALUES (423, 34, 200, 'session_123no237', '2023-03-05 22:40:00', '2025-04-11 02:00:52', 19);
INSERT INTO `views` VALUES (424, 74, 270, 'session_456pq238', '2024-08-01 22:55:00', '2024-09-26 01:25:00', 90);
INSERT INTO `views` VALUES (425, 14, 110, 'session_789rs239', '2025-04-12 17:15:00', '2025-07-01 19:45:00', 45);
INSERT INTO `views` VALUES (426, 47, 315, 'session_0stuv240', '2023-12-15 22:25:00', '2024-01-26 00:55:00', 75);
INSERT INTO `views` VALUES (427, 59, 240, 'session_123wx241', '2024-08-29 23:00:00', '2024-10-01 01:30:00', 63);
INSERT INTO `views` VALUES (428, 27, 150, 'session_456yz242', '2025-02-20 22:20:00', '2025-03-23 00:50:00', 21);
INSERT INTO `views` VALUES (429, 63, 380, 'session_789za243', '2023-11-21 00:05:00', '2023-03-16 02:35:00', 98);
INSERT INTO `views` VALUES (430, 55, 180, 'session_0abcd244', '2024-11-20 23:50:00', '2025-06-05 09:40:11', 61);
INSERT INTO `views` VALUES (431, 25, 400, 'session_123ef245', '2026-03-01 00:45:00', '2025-06-05 09:38:47', 54);
INSERT INTO `views` VALUES (432, 35, 125, 'session_456gh246', '2023-12-16 22:40:00', '2025-06-02 17:42:30', 86);
INSERT INTO `views` VALUES (433, 75, 345, 'session_789ij247', '2024-06-25 20:55:00', '2024-05-02 02:25:00', 36);
INSERT INTO `views` VALUES (434, 15, 210, 'session_0jklm248', '2026-03-18 10:50:00', '2025-11-20 13:20:00', 65);
INSERT INTO `views` VALUES (435, 45, 280, 'session_123no249', '2023-07-23 00:10:00', '2023-09-23 02:40:00', 32);
INSERT INTO `views` VALUES (436, 50, 170, 'session_456pq250', '2024-05-01 03:15:00', '2025-06-02 17:42:22', 98);
INSERT INTO `views` VALUES (437, 68, 400, 'session_789rs251', '2025-10-15 14:30:00', '2025-06-05 09:38:47', 58);
INSERT INTO `views` VALUES (438, 33, 205, 'session_0stuv252', '2024-01-26 01:40:00', '2023-12-21 02:10:00', 16);
INSERT INTO `views` VALUES (439, 73, 270, 'session_123wx253', '2025-03-18 22:45:00', '2024-09-26 00:15:00', 91);
INSERT INTO `views` VALUES (440, 17, 110, 'session_456yz254', '2025-08-21 22:20:00', '2025-05-19 21:50:00', 44);
INSERT INTO `views` VALUES (441, 42, 320, 'session_789za255', '2024-01-26 00:35:00', '2023-12-01 02:05:00', 74);
INSERT INTO `views` VALUES (442, 58, 245, 'session_0abcd256', '2024-10-01 02:10:00', '2024-04-26 01:40:00', 63);
INSERT INTO `views` VALUES (443, 29, 150, 'session_123ef257', '2025-06-16 03:00:00', '2025-03-23 01:30:00', 26);
INSERT INTO `views` VALUES (444, 64, 385, 'session_456gh258', '2023-11-21 02:15:00', '2023-09-23 03:45:00', 99);
INSERT INTO `views` VALUES (445, 56, 185, 'session_789ij259', '2024-11-20 22:40:00', '2024-08-16 01:10:00', 58);
INSERT INTO `views` VALUES (446, 23, 400, 'session_0jklm260', '2026-03-01 02:50:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (447, 38, 130, 'session_123no261', '2023-12-16 23:40:00', '2025-06-05 15:49:31', 85);
INSERT INTO `views` VALUES (448, 76, 350, 'session_456pq262', '2024-06-26 00:55:00', '2024-05-02 03:25:00', 37);
INSERT INTO `views` VALUES (449, 13, 210, 'session_789rs263', '2025-11-20 14:50:00', '2026-03-18 13:20:00', 66);
INSERT INTO `views` VALUES (450, 46, 285, 'session_0stuv264', '2023-09-23 01:40:00', '2023-07-23 02:10:00', 31);
INSERT INTO `views` VALUES (451, 49, 170, 'session_123wx265', '2024-09-16 02:15:00', '2025-06-02 17:42:22', 96);
INSERT INTO `views` VALUES (452, 66, 400, 'session_456yz266', '2025-10-15 13:00:00', '2025-06-05 09:38:47', 59);
INSERT INTO `views` VALUES (453, 34, 205, 'session_789za267', '2023-12-21 01:10:00', '2023-03-06 00:40:00', 19);
INSERT INTO `views` VALUES (454, 74, 275, 'session_0abcd268', '2024-09-26 01:25:00', '2024-08-02 02:55:00', 91);
INSERT INTO `views` VALUES (455, 14, 115, 'session_123ef269', '2025-07-01 19:45:00', '2025-04-13 18:15:00', 46);
INSERT INTO `views` VALUES (456, 47, 320, 'session_456gh270', '2024-01-26 00:55:00', '2023-12-16 03:25:00', 76);
INSERT INTO `views` VALUES (457, 59, 245, 'session_789ij271', '2024-10-01 01:30:00', '2024-08-30 00:00:00', 65);
INSERT INTO `views` VALUES (458, 27, 155, 'session_0jklm272', '2025-03-23 00:50:00', '2025-04-11 01:59:29', 23);
INSERT INTO `views` VALUES (459, 63, 385, 'session_123no273', '2023-03-16 02:35:00', '2023-11-21 02:05:00', 100);
INSERT INTO `views` VALUES (460, 55, 185, 'session_456pq274', '2024-08-16 02:20:00', '2024-11-21 01:50:00', 57);
INSERT INTO `views` VALUES (461, 25, 400, 'session_789rs275', '2025-06-09 03:15:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (462, 35, 130, 'session_0stuv276', '2023-10-19 01:10:00', '2025-06-05 15:49:31', 86);
INSERT INTO `views` VALUES (463, 75, 350, 'session_123wx277', '2024-05-02 02:25:00', '2024-06-26 03:55:00', 37);
INSERT INTO `views` VALUES (464, 15, 215, 'session_456yz278', '2025-11-20 13:20:00', '2026-03-18 15:50:00', 64);
INSERT INTO `views` VALUES (465, 45, 285, 'session_789za279', '2023-09-23 02:40:00', '2023-07-23 01:10:00', 30);
INSERT INTO `views` VALUES (466, 50, 175, 'session_0abcd280', '2024-09-16 03:45:00', '2024-05-02 04:45:00', 97);
INSERT INTO `views` VALUES (467, 68, 400, 'session_123ef281', '2025-08-16 16:00:00', '2025-06-05 09:38:47', 58);
INSERT INTO `views` VALUES (468, 33, 210, 'session_456gh282', '2023-12-21 02:10:00', '2024-01-27 03:40:00', 16);
INSERT INTO `views` VALUES (469, 73, 275, 'session_789ij283', '2024-09-26 00:15:00', '2025-03-19 04:45:00', 90);
INSERT INTO `views` VALUES (470, 17, 115, 'session_0jklm284', '2025-05-19 21:50:00', '2025-08-22 00:20:00', 44);
INSERT INTO `views` VALUES (471, 42, 325, 'session_123no285', '2023-12-01 02:05:00', '2024-01-27 02:35:00', 74);
INSERT INTO `views` VALUES (472, 58, 250, 'session_456pq286', '2024-04-26 01:40:00', '2025-04-11 01:59:47', 64);
INSERT INTO `views` VALUES (473, 29, 155, 'session_789rs287', '2025-03-23 01:30:00', '2025-04-11 01:59:29', 26);
INSERT INTO `views` VALUES (474, 64, 390, 'session_0stuv288', '2023-09-23 03:45:00', '2025-06-01 20:11:18', 100);
INSERT INTO `views` VALUES (475, 56, 190, 'session_123wx289', '2024-08-16 01:10:00', '2025-06-05 09:29:44', 62);
INSERT INTO `views` VALUES (476, 23, 400, 'session_456yz290', '2025-06-09 01:45:00', '2025-06-05 09:38:47', 53);
INSERT INTO `views` VALUES (477, 38, 135, 'session_789za291', '2023-10-19 02:10:00', '2025-06-05 08:09:52', 87);
INSERT INTO `views` VALUES (478, 76, 355, 'session_0abcd292', '2024-05-02 03:25:00', '2024-06-26 04:55:00', 37);
INSERT INTO `views` VALUES (479, 13, 215, 'session_123ef293', '2026-03-18 13:20:00', '2025-11-20 15:50:00', 66);
INSERT INTO `views` VALUES (480, 46, 290, 'session_456gh294', '2023-07-23 02:10:00', '2025-06-02 17:44:33', 32);
INSERT INTO `views` VALUES (481, 49, 175, 'session_789ij295', '2024-05-01 04:45:00', '2024-09-16 05:15:00', 95);
INSERT INTO `views` VALUES (482, 66, 400, 'session_0jklm296', '2025-08-16 11:30:00', '2025-06-05 09:38:47', 59);
INSERT INTO `views` VALUES (483, 34, 210, 'session_123no297', '2023-03-06 00:40:00', '2023-12-21 03:10:00', 18);
INSERT INTO `views` VALUES (484, 74, 280, 'session_456pq298', '2024-08-02 02:55:00', '2024-09-26 04:25:00', 90);
INSERT INTO `views` VALUES (485, 14, 120, 'session_789rs299', '2025-04-13 18:15:00', '2025-07-02 20:45:00', 45);
INSERT INTO `views` VALUES (486, 47, 325, 'session_0stuv300', '2023-12-16 03:25:00', '2024-01-27 04:55:00', 75);
INSERT INTO `views` VALUES (487, 60, 250, 'session_123ef301', '2024-10-01 03:30:00', '2025-04-11 01:59:47', 67);
INSERT INTO `views` VALUES (488, 27, 160, 'session_456gh302', '2025-03-23 02:00:00', '2025-04-11 01:59:27', 24);
INSERT INTO `views` VALUES (489, 64, 390, 'session_789ij303', '2023-11-21 04:35:00', '2025-06-01 20:11:18', 101);
INSERT INTO `views` VALUES (490, 56, 190, 'session_0jklm304', '2024-11-21 01:50:00', '2025-06-05 09:29:44', 63);
INSERT INTO `views` VALUES (491, 25, 400, 'session_123no305', '2026-03-01 04:45:00', '2025-06-05 09:38:47', 55);
INSERT INTO `views` VALUES (492, 35, 135, 'session_456pq306', '2023-12-17 04:40:00', '2025-06-05 08:09:52', 89);
INSERT INTO `views` VALUES (493, 75, 355, 'session_789rs307', '2024-06-26 04:55:00', '2024-05-02 05:25:00', 38);
INSERT INTO `views` VALUES (494, 15, 220, 'session_0stuv308', '2026-03-18 15:50:00', '2025-11-20 18:20:00', 65);
INSERT INTO `views` VALUES (495, 45, 290, 'session_123wx309', '2023-09-23 03:40:00', '2025-06-02 17:44:33', 34);
INSERT INTO `views` VALUES (496, 50, 180, 'session_456yz310', '2024-09-16 05:15:00', '2025-06-05 09:40:11', 99);
INSERT INTO `views` VALUES (497, 68, 400, 'session_789za311', '2025-10-16 17:30:00', '2025-06-05 09:38:47', 59);
INSERT INTO `views` VALUES (498, 33, 215, 'session_0abcd312', '2024-01-27 03:40:00', '2023-12-21 04:10:00', 17);
INSERT INTO `views` VALUES (499, 73, 280, 'session_123ef313', '2025-03-19 04:45:00', '2024-09-26 05:15:00', 92);
INSERT INTO `views` VALUES (500, 17, 120, 'session_456gh314', '2025-08-22 00:20:00', '2025-05-20 02:50:00', 45);
INSERT INTO `views` VALUES (501, 42, 330, 'session_789ij315', '2024-01-27 02:35:00', '2023-12-01 05:05:00', 76);
INSERT INTO `views` VALUES (502, 58, 255, 'session_0jklm316', '2024-10-01 03:10:00', '2024-08-30 04:30:00', 67);
INSERT INTO `views` VALUES (503, 29, 160, 'session_123no317', '2025-06-16 05:00:00', '2025-04-11 01:59:27', 27);
INSERT INTO `views` VALUES (504, 64, 395, 'session_456pq318', '2023-11-21 04:15:00', '2025-06-01 20:11:35', 101);
INSERT INTO `views` VALUES (505, 56, 195, 'session_789rs319', '2024-11-21 00:40:00', '2024-08-16 05:10:00', 61);
INSERT INTO `views` VALUES (506, 23, 400, 'session_0stuv320', '2026-03-01 03:15:00', '2025-06-05 09:38:47', 55);
INSERT INTO `views` VALUES (507, 38, 140, 'session_123wx321', '2023-12-17 04:40:00', '2025-06-05 08:07:19', 88);
INSERT INTO `views` VALUES (508, 76, 360, 'session_456yz322', '2024-06-26 04:55:00', '2024-05-02 06:25:00', 39);
INSERT INTO `views` VALUES (509, 13, 220, 'session_789za323', '2025-11-20 15:50:00', '2026-03-18 17:20:00', 67);
INSERT INTO `views` VALUES (510, 46, 295, 'session_0abcd324', '2023-09-23 03:40:00', '2023-07-23 04:10:00', 32);
INSERT INTO `views` VALUES (511, 49, 180, 'session_123ef325', '2024-09-16 05:15:00', '2025-06-05 09:40:11', 97);
INSERT INTO `views` VALUES (512, 66, 400, 'session_456gh326', '2025-10-16 16:00:00', '2025-06-05 09:38:47', 60);
INSERT INTO `views` VALUES (513, 34, 215, 'session_789ij327', '2023-12-21 03:10:00', '2023-03-06 05:40:00', 20);
INSERT INTO `views` VALUES (514, 74, 285, 'session_0jklm328', '2024-09-26 04:25:00', '2024-08-02 06:55:00', 92);
INSERT INTO `views` VALUES (515, 14, 125, 'session_123no329', '2025-07-02 20:45:00', '2025-06-02 17:42:30', 49);
INSERT INTO `views` VALUES (516, 47, 330, 'session_456pq330', '2024-01-27 04:55:00', '2023-12-17 07:25:00', 77);
INSERT INTO `views` VALUES (517, 60, 255, 'session_789rs331', '2024-08-30 02:00:00', '2024-10-01 05:30:00', 68);
INSERT INTO `views` VALUES (518, 27, 165, 'session_0stuv332', '2025-02-21 04:30:00', '2025-06-05 09:29:27', 32);
INSERT INTO `views` VALUES (519, 64, 395, 'session_123wx333', '2023-09-23 05:05:00', '2025-06-01 20:11:35', 101);
INSERT INTO `views` VALUES (520, 56, 195, 'session_456yz334', '2024-08-16 03:20:00', '2024-11-21 03:50:00', 61);
INSERT INTO `views` VALUES (521, 25, 400, 'session_789za335', '2025-06-09 03:15:00', '2025-06-05 09:38:47', 55);
INSERT INTO `views` VALUES (522, 35, 140, 'session_0abcd336', '2023-10-19 03:10:00', '2025-06-05 08:07:19', 88);
INSERT INTO `views` VALUES (523, 75, 360, 'session_123ef337', '2024-05-02 05:25:00', '2024-06-26 07:55:00', 39);
INSERT INTO `views` VALUES (524, 15, 225, 'session_456gh338', '2025-11-20 18:20:00', '2026-03-18 19:50:00', 67);
INSERT INTO `views` VALUES (525, 45, 295, 'session_789ij339', '2023-07-23 04:10:00', '2023-09-23 05:40:00', 32);
INSERT INTO `views` VALUES (526, 50, 185, 'session_0jklm340', '2024-05-02 06:45:00', '2024-09-16 07:15:00', 96);
INSERT INTO `views` VALUES (527, 68, 400, 'session_123no341', '2025-08-16 18:00:00', '2025-06-05 09:38:47', 60);
INSERT INTO `views` VALUES (528, 33, 215, 'session_456pq342', '2023-12-21 04:10:00', '2024-01-27 06:40:00', 20);
INSERT INTO `views` VALUES (529, 73, 285, 'session_789rs343', '2024-09-26 05:15:00', '2025-03-19 07:45:00', 92);
INSERT INTO `views` VALUES (530, 17, 125, 'session_0stuv344', '2025-05-20 02:50:00', '2025-06-02 17:42:30', 49);
INSERT INTO `views` VALUES (531, 42, 335, 'session_123wx345', '2023-12-01 05:05:00', '2024-01-27 07:35:00', 77);
INSERT INTO `views` VALUES (532, 58, 260, 'session_456yz346', '2024-08-30 04:30:00', '2024-10-01 07:00:00', 68);
INSERT INTO `views` VALUES (533, 29, 165, 'session_789za347', '2025-03-23 05:30:00', '2025-06-05 09:29:27', 32);
INSERT INTO `views` VALUES (534, 64, 400, 'session_0abcd348', '2023-09-23 06:45:00', '2025-06-05 09:38:47', 105);
INSERT INTO `views` VALUES (535, 56, 200, 'session_123ef349', '2024-11-21 03:50:00', '2025-04-11 02:00:52', 63);
INSERT INTO `views` VALUES (536, 23, 400, 'session_456gh350', '2026-03-01 07:15:00', '2025-06-05 09:38:47', 56);
INSERT INTO `views` VALUES (537, 38, 145, 'session_789ij351', '2023-12-17 06:40:00', '2025-06-04 11:07:47', 88);
INSERT INTO `views` VALUES (538, 76, 365, 'session_0jklm352', '2024-06-26 07:55:00', '2024-05-02 08:25:00', 40);
INSERT INTO `views` VALUES (539, 13, 225, 'session_123no353', '2026-03-18 19:50:00', '2025-11-20 22:20:00', 68);
INSERT INTO `views` VALUES (540, 46, 300, 'session_456pq354', '2023-09-23 05:40:00', '2023-07-23 06:10:00', 33);
INSERT INTO `views` VALUES (541, 49, 185, 'session_789rs355', '2024-09-16 07:15:00', '2024-05-02 07:45:00', 97);
INSERT INTO `views` VALUES (542, 66, 400, 'session_0stuv356', '2025-10-16 20:30:00', '2025-06-05 09:38:47', 61);
INSERT INTO `views` VALUES (543, 34, 220, 'session_123wx357', '2024-01-27 06:40:00', '2023-12-21 06:10:00', 21);
INSERT INTO `views` VALUES (544, 74, 290, 'session_456yz358', '2024-09-26 07:25:00', '2025-06-02 17:44:33', 94);
INSERT INTO `views` VALUES (545, 14, 130, 'session_789za359', '2025-07-02 20:45:00', '2025-06-05 15:49:31', 50);
INSERT INTO `views` VALUES (546, 47, 335, 'session_0abcd360', '2024-01-27 07:35:00', '2023-12-17 08:25:00', 78);
INSERT INTO `views` VALUES (547, 60, 260, 'session_123ef361', '2024-10-01 07:00:00', '2024-08-30 06:30:00', 69);
INSERT INTO `views` VALUES (548, 27, 170, 'session_456gh362', '2025-03-23 07:00:00', '2025-06-02 17:42:22', 29);
INSERT INTO `views` VALUES (549, 64, 400, 'session_789ij363', '2023-11-21 08:15:00', '2025-06-05 09:38:47', 105);
INSERT INTO `views` VALUES (550, 56, 200, 'session_0jklm364', '2024-08-16 07:10:00', '2025-04-11 02:00:52', 63);
INSERT INTO `views` VALUES (551, 23, 400, 'session_123no365', '2025-06-09 09:45:00', '2025-06-05 09:38:47', 56);
INSERT INTO `views` VALUES (552, 38, 145, 'session_456pq366', '2023-10-19 05:10:00', '2025-06-04 11:07:47', 88);
INSERT INTO `views` VALUES (553, 76, 365, 'session_789rs367', '2024-05-02 08:25:00', '2024-06-26 09:55:00', 40);
INSERT INTO `views` VALUES (554, 15, 230, 'session_0stuv368', '2025-11-20 22:20:00', '2026-03-18 21:50:00', 69);
INSERT INTO `views` VALUES (555, 45, 300, 'session_123wx369', '2023-07-23 06:10:00', '2023-09-23 07:40:00', 33);
INSERT INTO `views` VALUES (556, 50, 190, 'session_456yz370', '2024-05-02 07:45:00', '2025-06-05 09:29:44', 101);
INSERT INTO `views` VALUES (557, 68, 400, 'session_789za371', '2025-08-16 21:00:00', '2025-06-05 09:38:47', 61);
INSERT INTO `views` VALUES (558, 33, 220, 'session_0abcd372', '2023-12-21 06:10:00', '2024-01-27 08:40:00', 22);
INSERT INTO `views` VALUES (559, 73, 290, 'session_123ef373', '2025-03-19 07:45:00', '2025-06-02 17:44:33', 95);
INSERT INTO `views` VALUES (560, 17, 130, 'session_456gh374', '2025-08-22 03:20:00', '2025-06-05 15:49:31', 51);
INSERT INTO `views` VALUES (561, 42, 340, 'session_789ij375', '2024-01-27 08:35:00', '2023-12-17 09:05:00', 79);
INSERT INTO `views` VALUES (562, 58, 265, 'session_0jklm376', '2024-10-01 07:00:00', '2024-08-30 08:30:00', 70);
INSERT INTO `views` VALUES (563, 29, 170, 'session_123no377', '2025-06-16 09:30:00', '2025-06-02 17:42:22', 30);
INSERT INTO `views` VALUES (564, 64, 400, 'session_456pq378', '2023-11-21 08:15:00', '2025-06-05 09:38:47', 105);
INSERT INTO `views` VALUES (565, 56, 205, 'session_789rs379', '2024-08-16 07:10:00', '2024-11-21 07:50:00', 63);
INSERT INTO `views` VALUES (566, 23, 400, 'session_0stuv380', '2026-03-01 08:15:00', '2025-06-05 09:38:47', 57);
INSERT INTO `views` VALUES (567, 38, 150, 'session_123wx381', '2023-12-17 09:40:00', '2023-10-19 07:10:00', 88);
INSERT INTO `views` VALUES (568, 76, 370, 'session_456yz382', '2024-06-26 09:55:00', '2024-05-02 10:25:00', 41);
INSERT INTO `views` VALUES (569, 13, 230, 'session_789za383', '2026-03-18 21:50:00', '2025-11-21 00:20:00', 69);
INSERT INTO `views` VALUES (570, 46, 305, 'session_0abcd384', '2023-09-23 07:40:00', '2023-07-23 07:10:00', 34);
INSERT INTO `views` VALUES (571, 49, 190, 'session_123ef385', '2024-09-16 09:15:00', '2025-06-05 09:29:44', 101);
INSERT INTO `views` VALUES (572, 66, 400, 'session_456gh386', '2025-10-16 23:30:00', '2025-06-05 09:38:47', 62);
INSERT INTO `views` VALUES (573, 34, 225, 'session_789ij387', '2024-01-27 08:40:00', '2023-12-21 07:10:00', 23);
INSERT INTO `views` VALUES (574, 74, 295, 'session_0jklm388', '2024-09-26 08:15:00', '2024-08-02 09:55:00', 94);
INSERT INTO `views` VALUES (575, 14, 135, 'session_123no389', '2025-07-03 20:45:00', '2025-06-05 08:09:52', 54);
INSERT INTO `views` VALUES (576, 47, 340, 'session_456pq390', '2024-01-27 09:35:00', '2023-12-17 10:25:00', 80);
INSERT INTO `views` VALUES (577, 60, 265, 'session_789rs391', '2024-10-01 08:30:00', '2024-08-30 08:00:00', 71);
INSERT INTO `views` VALUES (578, 27, 175, 'session_0stuv392', '2025-03-23 08:00:00', '2025-06-16 10:30:00', 30);
INSERT INTO `views` VALUES (579, 64, 400, 'session_123wx393', '2023-09-23 08:45:00', '2025-06-05 09:38:47', 105);
INSERT INTO `views` VALUES (580, 56, 205, 'session_456yz394', '2024-11-21 07:50:00', '2024-08-16 08:10:00', 63);
INSERT INTO `views` VALUES (581, 23, 400, 'session_789za395', '2025-06-09 10:45:00', '2025-06-05 09:38:47', 57);
INSERT INTO `views` VALUES (582, 38, 150, 'session_0abcd396', '2023-10-19 07:10:00', '2023-12-17 11:40:00', 88);
INSERT INTO `views` VALUES (583, 76, 370, 'session_123ef397', '2024-05-02 10:25:00', '2024-06-26 11:55:00', 41);
INSERT INTO `views` VALUES (584, 15, 235, 'session_456gh398', '2026-03-18 21:50:00', '2025-11-21 00:20:00', 70);
INSERT INTO `views` VALUES (585, -1, 188, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 01:59:09', '2025-04-11 01:59:09', 1);
INSERT INTO `views` VALUES (586, 102, 156, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 01:59:31', '2025-04-11 01:59:31', 1);
INSERT INTO `views` VALUES (587, 102, 252, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:00:35', '2025-04-11 02:00:35', 1);
INSERT INTO `views` VALUES (588, 102, 251, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:00:37', '2025-04-11 02:00:37', 1);
INSERT INTO `views` VALUES (589, 102, 243, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:00:39', '2025-04-11 02:00:39', 1);
INSERT INTO `views` VALUES (590, 102, 249, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:00:40', '2025-04-11 02:00:40', 1);
INSERT INTO `views` VALUES (591, 102, 193, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:00:56', '2025-04-11 02:00:56', 1);
INSERT INTO `views` VALUES (592, 102, 196, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:00:57', '2025-04-11 02:00:57', 1);
INSERT INTO `views` VALUES (593, 102, 237, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:01:07', '2025-04-11 02:01:07', 1);
INSERT INTO `views` VALUES (594, 102, 239, 'A11F06432E8A308C2707CD6E3388F06B', '2025-04-11 02:01:09', '2025-04-11 02:01:09', 1);
INSERT INTO `views` VALUES (595, -1, 403, 'FC748C92966C36560A512D7A825DFCD6', '2025-05-02 21:12:18', '2025-05-02 21:12:18', 1);
INSERT INTO `views` VALUES (596, 108, 999, '43CB90A810FE38D09D5A1404B464271A', '2025-06-02 11:23:08', '2025-06-02 11:23:08', 1);
INSERT INTO `views` VALUES (597, 107, 114, 'D817C0BAAD6A4EC6312EBBCDC33AC32C', '2025-06-02 20:27:16', '2025-06-02 20:27:16', 1);
INSERT INTO `views` VALUES (598, 107, 257, 'D817C0BAAD6A4EC6312EBBCDC33AC32C', '2025-06-02 20:31:05', '2025-06-02 20:31:05', 1);
INSERT INTO `views` VALUES (599, 38, 11, '03C3AD964120D2887E0DF6BABA01B577', '2025-06-02 20:45:29', '2025-06-05 15:52:55', 2);
INSERT INTO `views` VALUES (600, 38, 124, 'A32D0FC763EA8BDEA23A885D782D5DE9', '2025-06-04 10:50:43', '2025-06-04 10:50:43', 1);
INSERT INTO `views` VALUES (601, 38, 1017, 'F3D30D35C804BDB0406341A4C5B325E4', '2025-06-05 03:58:41', '2025-06-05 09:37:15', 2);

SET FOREIGN_KEY_CHECKS = 1;
