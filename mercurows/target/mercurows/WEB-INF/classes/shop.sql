/*
 Navicat Premium Data Transfer

 Source Server         : decken
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : decken.ink:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 17/11/2021 14:48:06
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '品牌编码',
  `chin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '品牌中文名',
  `en_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '品牌英文名',
  `intro` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '品牌介绍',
  `logo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '品牌LOGO',
  `category_id` int(11) NOT NULL COMMENT '品牌所属分类',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IN_code`(`code`) USING BTREE,
  UNIQUE INDEX `IN_ch_name`(`chin_name`) USING BTREE,
  UNIQUE INDEX `IN_en_name`(`en_name`) USING BTREE,
  INDEX `FK_brand_category`(`category_id`) USING BTREE,
  CONSTRAINT `FK_brand_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 99010 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '品牌表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES (99001, 'pp0001', '华为', NULL, NULL, NULL, 20013);
INSERT INTO `brand` VALUES (99002, 'pp0002', '宝洁', NULL, NULL, NULL, 20000);
INSERT INTO `brand` VALUES (99003, 'pp0003', '李宁', NULL, NULL, NULL, 20014);
INSERT INTO `brand` VALUES (99004, 'pp0004', '三只米老鼠', '', NULL, NULL, 20001);
INSERT INTO `brand` VALUES (99005, 'pp0005', '良品铺子', NULL, NULL, NULL, 20001);
INSERT INTO `brand` VALUES (99006, 'pp0006', '钱小爹', NULL, NULL, NULL, 20012);
INSERT INTO `brand` VALUES (99007, 'pp0007', '盒码鲜生', NULL, NULL, NULL, 20012);
INSERT INTO `brand` VALUES (99008, 'pp0008', '花仙子', NULL, NULL, NULL, 20008);
INSERT INTO `brand` VALUES (99009, 'pp0009', '特仑苏', NULL, NULL, NULL, 20009);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分类编码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '分类父ID',
  `isShow` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IN_code`(`code`) USING BTREE,
  UNIQUE INDEX `IN_name`(`name`) USING BTREE,
  INDEX `FK_cate_cate`(`pid`) USING BTREE,
  CONSTRAINT `FK_cate_cate` FOREIGN KEY (`pid`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20018 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '产品分类表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (20000, 'FL0001', '日用品', NULL, '0');
INSERT INTO `category` VALUES (20001, 'FL0002', '零食', NULL, '0');
INSERT INTO `category` VALUES (20002, 'FL0003', '美妆', NULL, '0');
INSERT INTO `category` VALUES (20003, 'FL0004', '家用电器', NULL, '0');
INSERT INTO `category` VALUES (20004, 'FL0005', '电子设备', NULL, '0');
INSERT INTO `category` VALUES (20005, 'FL0006', '即食', 20001, '0');
INSERT INTO `category` VALUES (20006, 'FL0007', '麻辣', 20001, '0');
INSERT INTO `category` VALUES (20007, 'FL0008', '香甜', 20001, '0');
INSERT INTO `category` VALUES (20008, 'FL0009', '花卉', NULL, '1');
INSERT INTO `category` VALUES (20009, 'FL0010', '水果', NULL, '1');
INSERT INTO `category` VALUES (20012, 'FL0011', '生鲜', NULL, '0');
INSERT INTO `category` VALUES (20013, 'FL0012', '手机', NULL, '0');
INSERT INTO `category` VALUES (20014, 'FL0013', '服装', NULL, '0');
INSERT INTO `category` VALUES (20015, 'FL0014', '家居', NULL, '0');
INSERT INTO `category` VALUES (20016, 'FL0015', '家俱', NULL, '0');
INSERT INTO `category` VALUES (20017, 'FL0016', '鞋子', NULL, '0');

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `prov_id` int(11) NOT NULL COMMENT '所属省份ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IN_name`(`name`) USING BTREE,
  INDEX `FK_city_province`(`prov_id`) USING BTREE,
  CONSTRAINT `FK_city_province` FOREIGN KEY (`prov_id`) REFERENCES `province` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 80006 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '地级市表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (80000, '广州市', 10000);
INSERT INTO `city` VALUES (80001, '深圳市', 10000);
INSERT INTO `city` VALUES (80002, '佛山市', 10000);
INSERT INTO `city` VALUES (80003, '珠海市', 10000);
INSERT INTO `city` VALUES (80005, '阳江市', 10001);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司名称',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司联系电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '公司邮箱',
  `chief` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '公司负责人',
  `detail_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '公司地址',
  `region_id` int(11) NOT NULL COMMENT '公司所在区ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IN_name`(`name`) USING BTREE,
  INDEX `FK_company_region`(`region_id`) USING BTREE,
  CONSTRAINT `FK_company_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 50002 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '供应商表（公司表）' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (50000, '广州花仙子电子商务公司', '020999999', '120991752@qq.com', '陈生', '天河南二路', 90002);
INSERT INTO `company` VALUES (50001, '华为品牌专卖店', '13999999999', NULL, '李篮', '深圳南山区38号', 90003);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户真实名',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '客户账号',
  `pass` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '客户密码',
  `imgUrl` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'anno.jpg' COMMENT '客户头像URL',
  `intro` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户简介',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '客户联系电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户邮箱',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '客户性别：1男2女',
  `cardID` char(18) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户身份证',
  `detail_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户地址',
  `regTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '客户注册时间',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '客户账号状态：1激活  2锁定 ',
  `level` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '会员等级：1普通会员2钻石会员',
  `region_id` int(11) NOT NULL DEFAULT 90002 COMMENT '客户所在区ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `unique_tel`(`tel`) USING BTREE,
  UNIQUE INDEX `unique_email`(`email`) USING BTREE,
  INDEX `FK_customer_region`(`region_id`) USING BTREE,
  CONSTRAINT `FK_customer_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 40025 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '消费者表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (40000, '管理员', 'admin', 'admin', 'anno.jpg', NULL, '13580999999', 'admin@qq.com', '1', NULL, '学院专家楼2-304', '2021-10-21 09:03:40', '1', '1', 90000);
INSERT INTO `customer` VALUES (40003, '陈生', 'chen', 'chen', 'anno.jpg', NULL, '15900000008', 'chen@edu.cn', '1', NULL, '教师宿舍307-1', '2021-10-21 09:02:27', '0', '2', 90000);
INSERT INTO `customer` VALUES (40005, '曹女士', 'yuhang', 'mama', 'anno.jpg', NULL, '13488888888', 'mama@163.com', '0', NULL, '新塘小区', '2021-10-21 09:03:14', '1', '3', 90003);
INSERT INTO `customer` VALUES (40024, NULL, 'cdj2', 'cdj2', 'anno.jpg', NULL, '15920558882', NULL, '1', NULL, NULL, '2021-11-17 14:40:57', '1', '1', 90002);

-- ----------------------------
-- Table structure for customer_copy1
-- ----------------------------
DROP TABLE IF EXISTS `customer_copy1`;
CREATE TABLE `customer_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户真实名',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '客户账号',
  `pass` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '客户密码',
  `imgUrl` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'anno.jpg' COMMENT '客户头像URL',
  `intro` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户简介',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '客户联系电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户邮箱',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '客户性别：1男2女',
  `cardID` char(18) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户身份证',
  `detail_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户地址',
  `regTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '客户注册时间',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '客户账号状态：1激活  2锁定 ',
  `level` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '会员等级：1普通会员2钻石会员',
  `region_id` int(11) NOT NULL DEFAULT 90000 COMMENT '客户所在区ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `unique_tel`(`tel`) USING BTREE,
  UNIQUE INDEX `unique_email`(`email`) USING BTREE,
  INDEX `FK_customer_region`(`region_id`) USING BTREE,
  CONSTRAINT `customer_copy1_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 40006 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '消费者表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of customer_copy1
-- ----------------------------
INSERT INTO `customer_copy1` VALUES (40000, '管理员', 'admin', 'admin', 'anno.jpg', NULL, '13580999999', 'admin@qq.com', '1', NULL, '学院专家楼2-304', '2021-10-21 09:03:40', '1', '1', 90000);
INSERT INTO `customer_copy1` VALUES (40003, '陈生', 'chen', 'chen', 'anno.jpg', NULL, '15900000008', 'chen@edu.cn', '1', NULL, '教师宿舍307-1', '2021-10-21 09:02:27', '0', '2', 90000);
INSERT INTO `customer_copy1` VALUES (40005, '曹女士', 'yuhang', 'mama', 'anno.jpg', NULL, '13488888888', 'mama@163.com', '0', NULL, '新塘小区', '2021-10-21 09:03:14', '1', '3', 90003);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品关键词',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内部商品编码',
  `spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格参数',
  `ch_spec` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格参数解释',
  `in_price` double(7, 2) NOT NULL COMMENT '进货价格',
  `out_price` double(7, 2) NOT NULL COMMENT '销售价格',
  `stock` int(11) NOT NULL COMMENT '库存量',
  `imgUrl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'anno.jpg' COMMENT '商品图片',
  `product_id` int(11) NOT NULL COMMENT '所属产品ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IN_code`(`code`) USING BTREE,
  INDEX `FK_goods_product`(`product_id`) USING BTREE,
  CONSTRAINT `FK_goods_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 90010 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表SKU' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (90000, '红色玫瑰好看花期久10支装包邮店家直接发货', 'sp0001', '{20006:1018,20000:1001,20010:1055}', '{品种:玫瑰,颜色:红色,单位:束(10支装)}', 6.00, 36.00, 12, 'xh_img1.jpg', 50001);
INSERT INTO `goods` VALUES (90002, '春暖花开多种组合自由搭配好看各种主题可定制', 'sp0002', '{20006:1057,20008:1038}', '{品种:组合,主题:生日祝福}', 22.00, 38.00, 7, 'xh_img2.jpg', 50001);
INSERT INTO `goods` VALUES (90005, '柳绿花红红色玫瑰好看花期久10支装包邮店家直接发货', 'sp0003', '{20006:1018,20000:1001,20010:1056}', '{品种:玫瑰,颜色:红色,单位:支}', 0.50, 5.50, 30, 'xh_img3.jpg', 50001);
INSERT INTO `goods` VALUES (90006, '昙花一现多种组合自由搭配好看各种主题可定制', 'sp0004', '{20006:1057,20008:1037}', '{品种:组合,主题:浪漫人生}', 5.00, 28.00, 23, 'xh_img4.jpg', 50001);
INSERT INTO `goods` VALUES (90007, '五花大绑多种组合自由搭配好看各种主题可定制', 'sp0005', '{20006:1057,20008:1040}', '{品种:组合,主题:财源广进}', 4.00, 26.00, 44, 'xh_img5.jpg', 50001);
INSERT INTO `goods` VALUES (90008, '锦上添花红色玫瑰好看花期久10支装包邮店家直接发货', 'sp0006', '{20006:1018,20000:1002,20010:1055}', '{品种:玫瑰,颜色:金色,单位:束(10支装)}', 11.00, 58.00, 23, 'xh_img6.jpg', 50001);
INSERT INTO `goods` VALUES (90009, '百花齐放多种组合自由搭配好看各种主题可定制', 'sp0007', '{20006:1057,20008:1059}', '{品种:组合,主题:花开富贵}', 21.00, 188.00, 3, 'xh_img2.jpg', 50001);

-- ----------------------------
-- Table structure for goods_propitem
-- ----------------------------
DROP TABLE IF EXISTS `goods_propitem`;
CREATE TABLE `goods_propitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `pi_id` int(11) NOT NULL COMMENT '属性详情ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_gdpi_goods`(`goods_id`) USING BTREE,
  INDEX `FK_gdpi_pi`(`pi_id`) USING BTREE,
  CONSTRAINT `FK_gdpi_pi` FOREIGN KEY (`pi_id`) REFERENCES `propertyitem` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_gdpi_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 100008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品--属性详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods_propitem
-- ----------------------------
INSERT INTO `goods_propitem` VALUES (100000, 90000, 1018);
INSERT INTO `goods_propitem` VALUES (100001, 90000, 1001);
INSERT INTO `goods_propitem` VALUES (100002, 90000, 1055);
INSERT INTO `goods_propitem` VALUES (100003, 90002, 1038);
INSERT INTO `goods_propitem` VALUES (100004, 90002, 1057);
INSERT INTO `goods_propitem` VALUES (100005, 90005, 1001);
INSERT INTO `goods_propitem` VALUES (100006, 90005, 1018);
INSERT INTO `goods_propitem` VALUES (100007, 90005, 1056);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '所属订单ID',
  `goods_id` int(11) NOT NULL COMMENT '所属商品ID',
  `buyPrice` double(7, 2) NOT NULL COMMENT '会员价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_orderItem_orders`(`orders_id`) USING BTREE,
  INDEX `FK_orderItem_product`(`goods_id`) USING BTREE,
  CONSTRAINT `FK_orderItem_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_orderItem_orders` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 70009 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '订单详情表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (70003, 60000, 90000, 10.00, 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(17) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '流水号',
  `totalSum` double(7, 2) NOT NULL COMMENT '总金额',
  `carriage` double(7, 2) NOT NULL COMMENT '邮费(运费)',
  `realSum` double(7, 2) NOT NULL COMMENT '实付金额',
  `totalNum` int(11) NOT NULL COMMENT '总数量',
  `receiverAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收件 人地址全名',
  `receiverName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人姓名',
  `receiverTel` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人电话',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0未支付1已支付未发货 2已支付已发货3已支付已收货',
  `orderTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `payTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `payType` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '1' COMMENT '1支付宝2微信3信用卡4银行卡5到付6现金',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_order_customer`(`customer_id`) USING BTREE,
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 60002 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '订单表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (60000, '2021102808585', 100.00, 0.00, 97.00, 4, '广州市从化区街口环市东路', '陈生', '13599888888', '1', '2021-10-28 11:30:09', '2021-10-12 21:34:17', 40000, '1');
INSERT INTO `orders` VALUES (60001, '2021102509212', 200.00, 0.00, 198.00, 8, '广东省深圳市南山区马二路', '曹女士', '13588888888', '1', '2021-10-28 16:37:33', '2021-10-06 21:34:30', 40003, '2');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '产品名(或关键词)',
  `code` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '产品内部编码，如xh0000',
  `intro` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '产品简介',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT 'anno.jpg' COMMENT '产品详情',
  `category_id` int(11) NOT NULL COMMENT '所属分类',
  `brand_id` int(11) NOT NULL COMMENT '所属品牌',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_product_category`(`category_id`) USING BTREE,
  INDEX `FK_product_brand`(`brand_id`) USING BTREE,
  CONSTRAINT `FK_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 50007 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '产品表SPU' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (50001, '鲜花', 'xh0001', '花开富贵', '', 20008, 99008);

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `chin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称中文',
  `en_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称中文',
  `category_id` int(11) NOT NULL COMMENT '所属分类ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_property_category`(`category_id`) USING BTREE,
  CONSTRAINT `FK_property_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 20011 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES (20000, '颜色', 'color', 20013);
INSERT INTO `property` VALUES (20001, '版本', 'version', 20013);
INSERT INTO `property` VALUES (20003, '容量', 'capcity', 20013);
INSERT INTO `property` VALUES (20004, '尺寸', 'size', 20014);
INSERT INTO `property` VALUES (20005, '计量单位', 'unit', 20001);
INSERT INTO `property` VALUES (20006, '品种', 'kind', 20008);
INSERT INTO `property` VALUES (20007, '品种', 'kind', 20009);
INSERT INTO `property` VALUES (20008, '主题', 'theme', 20008);
INSERT INTO `property` VALUES (20009, '尺寸', 'size', 20017);
INSERT INTO `property` VALUES (20010, '计量单位', 'unit', 20008);

-- ----------------------------
-- Table structure for propertyitem
-- ----------------------------
DROP TABLE IF EXISTS `propertyitem`;
CREATE TABLE `propertyitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '中文属性项名称',
  `en_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '英文属性项名称',
  `property_id` int(11) NOT NULL COMMENT '所属属性ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_pi_prop`(`property_id`) USING BTREE,
  CONSTRAINT `FK_pi_prop` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1060 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '属性详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of propertyitem
-- ----------------------------
INSERT INTO `propertyitem` VALUES (1001, '红色', 'red', 20000);
INSERT INTO `propertyitem` VALUES (1002, '黄色', 'yellow', 20000);
INSERT INTO `propertyitem` VALUES (1003, '金色', 'golden', 20000);
INSERT INTO `propertyitem` VALUES (1004, '蓝色', 'blue', 20000);
INSERT INTO `propertyitem` VALUES (1005, '淡蓝色', NULL, 20000);
INSERT INTO `propertyitem` VALUES (1006, '白色', 'white', 20000);
INSERT INTO `propertyitem` VALUES (1007, '黑色', 'black', 20000);
INSERT INTO `propertyitem` VALUES (1008, '绿色', 'green', 20000);
INSERT INTO `propertyitem` VALUES (1009, '橙色', 'orange', 20000);
INSERT INTO `propertyitem` VALUES (1010, '灰色', 'grey', 20000);
INSERT INTO `propertyitem` VALUES (1011, '移动4G版', NULL, 20001);
INSERT INTO `propertyitem` VALUES (1013, '16G', NULL, 20003);
INSERT INTO `propertyitem` VALUES (1014, '64G', NULL, 20003);
INSERT INTO `propertyitem` VALUES (1015, '移动5G版', NULL, 20001);
INSERT INTO `propertyitem` VALUES (1017, '联通5G版', NULL, 20001);
INSERT INTO `propertyitem` VALUES (1018, '玫瑰', 'rose', 20006);
INSERT INTO `propertyitem` VALUES (1019, '百合', 'lily', 20006);
INSERT INTO `propertyitem` VALUES (1020, '菊花', 'chrysanthemum', 20006);
INSERT INTO `propertyitem` VALUES (1021, '月季', 'china rose', 20006);
INSERT INTO `propertyitem` VALUES (1022, '满天星', 'babysbreath', 20006);
INSERT INTO `propertyitem` VALUES (1023, '茉莉花', 'jasmine', 20006);
INSERT INTO `propertyitem` VALUES (1024, '康乃馨', 'carnation', 20006);
INSERT INTO `propertyitem` VALUES (1025, '丁香花', 'lilac', 20006);
INSERT INTO `propertyitem` VALUES (1026, '牡丹', 'peony', 20006);
INSERT INTO `propertyitem` VALUES (1027, '郁金香', 'tulip', 20006);
INSERT INTO `propertyitem` VALUES (1029, '紫罗兰', 'violet', 20006);
INSERT INTO `propertyitem` VALUES (1030, '勿忘我', 'forget me not', 20006);
INSERT INTO `propertyitem` VALUES (1031, '水仙花', 'narcissus', 20006);
INSERT INTO `propertyitem` VALUES (1032, '凤梨', 'pineapple', 20007);
INSERT INTO `propertyitem` VALUES (1033, '桃子', 'peach', 20007);
INSERT INTO `propertyitem` VALUES (1034, '杨桃', 'carambola', 20007);
INSERT INTO `propertyitem` VALUES (1035, '樱桃', 'cherry', 20007);
INSERT INTO `propertyitem` VALUES (1036, '柿子', 'persimmon', 20007);
INSERT INTO `propertyitem` VALUES (1037, '浪漫人生', NULL, 20008);
INSERT INTO `propertyitem` VALUES (1038, '生日祝福', NULL, 20008);
INSERT INTO `propertyitem` VALUES (1040, '财源广进', NULL, 20008);
INSERT INTO `propertyitem` VALUES (1041, 'L', 'large', 20004);
INSERT INTO `propertyitem` VALUES (1042, 'M', 'middle', 20004);
INSERT INTO `propertyitem` VALUES (1043, 'S', 'small', 20004);
INSERT INTO `propertyitem` VALUES (1044, 'XL', NULL, 20004);
INSERT INTO `propertyitem` VALUES (1045, 'XXL', NULL, 20004);
INSERT INTO `propertyitem` VALUES (1046, '25', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1047, '26', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1048, '27', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1049, '28', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1050, '29', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1051, '30', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1052, '31', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1053, '32', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1054, '33', NULL, 20009);
INSERT INTO `propertyitem` VALUES (1055, '束(10支装)', NULL, 20010);
INSERT INTO `propertyitem` VALUES (1056, '支', NULL, 20010);
INSERT INTO `propertyitem` VALUES (1057, '组合', NULL, 20006);
INSERT INTO `propertyitem` VALUES (1058, '一往情深', NULL, 20008);
INSERT INTO `propertyitem` VALUES (1059, '花开富贵', NULL, 20008);

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10012 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '省（直辖市）表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1009, '江西');
INSERT INTO `province` VALUES (10000, '广东省');
INSERT INTO `province` VALUES (10001, '湖北省');
INSERT INTO `province` VALUES (10002, '湖南省');
INSERT INTO `province` VALUES (10003, '广西壮族自治区');
INSERT INTO `province` VALUES (10011, '辽宁省');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `postCode` char(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `city_id` int(11) NOT NULL COMMENT '所属市级ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_region_city`(`city_id`) USING BTREE,
  CONSTRAINT `FK_region_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 90006 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '辖区表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES (90000, '天河区', NULL, 80000);
INSERT INTO `region` VALUES (90001, '荔湾区', NULL, 80000);
INSERT INTO `region` VALUES (90002, '从化区', NULL, 80000);
INSERT INTO `region` VALUES (90003, '黄埔区', NULL, 80000);
INSERT INTO `region` VALUES (90004, '增城区', NULL, 80000);
INSERT INTO `region` VALUES (90005, '花都区', NULL, 80000);

SET FOREIGN_KEY_CHECKS = 1;
