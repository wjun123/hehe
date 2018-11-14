SET NAMES UTF8;
DROP DATABASE IF EXISTS eptp;
CREATE DATABASE eptp CHARSET=UTF8;
USE eptp;

#1.商品种类表，记载商品种类
CREATE TABLE epet_products_family(
    fid INT PRIMARY KEY,
    name VARCHAR(32)
);
#2.商品表，记载所有的商品信息
CREATE TABLE epet_products(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    family_id INT,#所属品种家族编号
    title VARCHAR(128),
    subtitle VARCHAR(128),
    bazaar_price DECIMAL(12,2),#市场价
    epet_price DECIMAL(12,2),#本平台价
    details VARCHAR(1024), #商品详情
    sold_count INT, #已售数量
    evaluate INT,#评价
    consult INT,#咨询
   /* is_onsale BOOLEAN ,#是否促销*/
    FOREIGN KEY (family_id)  REFERENCES  epet_products_family(fid)
);
#3.商品详情图表，记载商品的缩放图
CREATE TABLE epet_products_pic(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,#物品编号
    sm VARCHAR(128),
    md VARCHAR(128),
    lg VARCHAR(128),
    FOREIGN KEY (product_id)  REFERENCES epet_products(lid)
);
#4.用户表，记录注册后的用户信息
CREATE TABLE epet_user(
    uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    uname VARCHAR(32),
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(16) NOT NULL UNIQUE,
    user_name VARCHAR(32)
);
#5.用户收件地址
CREATE TABLE epet_receiver_address(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    receiver VARCHAR(16), 
    province VARCHAR(16),
    city VARCHAR(16),
    county VARCHAR(16),
    address VARCHAR(128),
    cellphone VARCHAR(16),
    postcode CHAR(6),#邮编
    is_default BOOLEAN,#是否默认收货地址
    FOREIGN KEY(user_id) REFERENCES epet_user(uid)
);
#6.购物车表
CREATE TABLE epet_shopping_cart(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    count INT,
    FOREIGN   KEY    (user_id)    REFERENCES  epet_user(uid),
    FOREIGN   KEY   (product_id)  REFERENCES  epet_products(lid)
);
#7.订单表，记载所有用户的订单
CREATE TABLE epet_order(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    address_id INT,
    status INT,#订单状态
    order_time BIGINT,#下单时间
    pay_time BIGINT,#付款时间
    deliver_time BIGINT,#发货时间
    receiver_time BIGINT,#签收时间
    FOREIGN KEY (address_id) REFERENCES epet_receiver_address(aid),
    FOREIGN KEY (user_id)  REFERENCES epet_user(uid)
);
#8.订单详细表，记载订单的详细信息
CREATE TABLE epet_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    count INT,
    FOREIGN KEY (order_id) REFERENCES epet_order(aid),
    FOREIGN KEY (product_id)  REFERENCES epet_products(lid) 
);

#9.首页图表
CREATE TABLE epet_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),#图片路径
    title VARCHAR(64)#图片描述
   /* href VARCHAR(128)#图片链接*/
);
#10.首页展示商品表
CREATE TABLE epet_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),
    pic VARCHAR(128),
    price DECIMAL(12,2),
    href VARCHAR(128)

);
/******************/
/******************/
/******************/

INSERT INTO epet_products_family VALUES
(1,'主粮'),
(2,'零食'),
(3,'玩具'),
(4,'清洁'),
(5,'洗澡');

INSERT INTO epet_products VALUES
(NULL,1,'冠能小型犬成犬全价犬粮 7kg','雀巢旗下狗粮 经典配方 好营养 助消化 促成长','￥450','￥349','<div class="img-detials">
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_1.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_2.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_3.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_4.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_5.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_6.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_7.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_8.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_9.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_10.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_11.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_12.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_13.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_14.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_16.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_17.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_18.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_19.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_20.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_21.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_22.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_23.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_24.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_25.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_26.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_27.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_28.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_29.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_30.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_31.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_32.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_33.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_34.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_35.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_36.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_37.jpg"></div>
    <div><img src="../img/details/goods_intro_bottom.jpg" alt=""></div></div>',
    '2244袋','305条','9'),
    (NULL,2,'[多件优惠] 路斯 奶酪牛肉棒狗零食180g','雀巢旗下狗粮 经典配方 好营养 助消化 促成长','￥25','￥18.9','<div class="img-detials">
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_1.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_2.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_3.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_4.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_5.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_6.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_7.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_8.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_9.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_10.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_11.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_12.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_13.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_14.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_16.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_17.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_18.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_19.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_20.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_21.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_22.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_23.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_24.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_25.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_26.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_27.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_28.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_29.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_30.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_31.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_32.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_33.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_34.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_35.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_36.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_37.jpg"></div>
    <div><img src="../img/details/goods_intro_bottom.jpg" alt=""></div></div>',
    '2266袋','1305条','91'),
    (NULL,3,'Amycarol 狗狗玩具 风味洁牙棉绳系列','雀巢旗下狗粮 经典配方 好营养 助消化 促成长','￥7','￥5','<div class="img-detials">
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_1.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_2.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_3.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_4.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_5.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_6.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_7.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_8.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_9.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_10.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_11.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_12.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_13.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_14.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_16.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_17.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_18.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_19.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_20.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_21.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_22.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_23.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_24.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_25.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_26.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_27.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_28.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_29.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_30.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_31.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_32.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_33.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_34.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_35.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_36.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_37.jpg"></div>
    <div><img src="../img/details/goods_intro_bottom.jpg" alt=""></div></div>',
    '2266袋','1305条','91'),
    (NULL,4,'[多件优惠] 魔金Magic 宠物训导尿片 狗狗训厕垫 10片','雀巢旗下狗粮 经典配方 好营养 助消化 促成长','￥7','￥5','<div class="img-detials">
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_1.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_2.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_3.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_4.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_5.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_6.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_7.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_8.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_9.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_10.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_11.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_12.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_13.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_14.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_16.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_17.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_18.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_19.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_20.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_21.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_22.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_23.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_24.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_25.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_26.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_27.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_28.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_29.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_30.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_31.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_32.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_33.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_34.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_35.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_36.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_37.jpg"></div>
    <div><img src="../img/details/goods_intro_bottom.jpg" alt=""></div></div>',
    '2288袋','1005条','99'),
    (NULL,5,'雪貂留香 抗菌止痒香波 500ml','雀巢旗下狗粮 经典配方 好营养 助消化 促成长','￥7','￥5','<div class="img-detials">
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_1.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_2.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_3.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_4.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_5.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_6.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_7.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_8.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_9.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_10.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_11.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_12.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_13.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_14.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_16.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_17.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_18.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_19.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_20.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_21.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_22.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_23.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_24.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_25.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_26.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_27.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_28.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_29.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_30.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_31.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_32.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_33.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_34.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_35.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_36.jpg"></div>
    <div><img src="../img/details/28245b47e08ed4ff0f434ef67ae72946_37.jpg"></div>
    <div><img src="../img/details/goods_intro_bottom.jpg" alt=""></div></div>',
    '2288袋','1005条','99');

INSERT INTO epet_products_pic VALUES
(NULL,1,'../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9 (1).jpg','../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9.jpg',''),
(NULL,2,'../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9 (1).jpg','../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9.jpg',''),
(NULL,3,'../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9 (1).jpg','../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9.jpg',''),
(NULL,4,'../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9 (1).jpg','../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9.jpg',''),
(NULL,5,'../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9 (1).jpg','../img/static/1e39bb8bc2bd8b4fbf545df759d6cfa9.jpg','');
 
INSERT INTO epet_user VALUES
(NULL,'小红','15445','1@qq.com','13258887128','花啊'),
(NULL,'小吕','15445','1@qq.com','13258887126','花啊'),
(NULL,'小欢','15445','1@qq.com','13258887125','花啊');

INSERT INTO epet_receiver_address VALUES
(NULL,1,'小红','河南','郑州','金水区','硅谷广场','13258887128','415000',true),
(NULL,2,'小吕','湖南','长沙','长沙区','硅谷广场','13258887126','415000',true),
(NULL,3,'小欢','湖北','武汉','武汉区','硅谷广场','13258887125','415000',true);

INSERT INTO epet_shopping_cart VALUES
(NULL,1,2,1),
(NULL,2,1,2),
(NULL,1,3,3),
(NULL,3,4,5),
(NULL,3,5,6);

INSERT INTO epet_order VALUES
(NULL,1,1,4,20170809,20170809,20170811,20170812);
/**/
INSERT INTO epet_index_carousel VALUES
(NULL,'../img/lunbo/1.jpg','轮播图片1'),
(NULL,'../img/lunbo/2.jpg','轮播图片1'),
(NULL,'../img/lunbo/3.jpg','轮播图片1'),
(NULL,'../img/lunbo/4.jpg','轮播图片1'),
(NULL,'../img/lunbo/5.jpg','轮播图片1'),
(NULL,'../img/lunbo/6.jpg','轮播图片1'),
(NULL,'../img/lunbo/7.jpg','轮播图片1'),
(NULL,'../img/lunbo/8.jpg','轮播图片1');


INSERT INTO epet_index_product VALUES
(NULL,'澳大利亚丝倍亮Supercoat 成犬全价犬粮 1.5kg','../img/xiangqing_products/zhuliang/005_1_md.jpg','￥300',''),
(NULL,'路斯 奶酪牛肉棒狗零食180g','../img/xiangqing_products/lingshi/001_3_md.jpg','￥300',''),
(NULL,'Amycarol 狗狗玩具 风味洁牙棉绳系列 巧克力味 25cm*6cm','../img/xiangqing_products/wanju/002_2_md.jpg','￥300',''),
(NULL,'ANCOL安蔻儿 尼龙经典尼龙狗项圈 1码红色 宽1.3cm*长31cm（21-27cm）','../img/xiangqing_products/qianyin/004_2_md.jpg','￥300',''),
(NULL,' 恩倍多 恩诺沙星宜喷宁 皮肤病通用喷剂 100ml','../img/xiangqing_products/huli/003_1_md.jpg','￥300',''),
(NULL,'发育宝 天然活力繁育配方 幼母犬粮16kg','../img/xiangqing_products/qita/s_02.jpg','￥300',''),
(NULL,'美国原装进口 Annamaet 深海冰水精华无谷配方全犬粮 30磅(13.6kg)','../img/xiangqing_products/qita/s_03.jpg','￥300',''),
(NULL,'皇家royal canin PR27小型犬成犬专用狗粮2kg','../img/xiangqing_products/qita/s_04.jpg','￥300',''),
(NULL,'皇家royal canin PR27小型犬成犬专用狗粮2kg','../img/xiangqing_products/qita/s_05.jpg','￥300',''),
(NULL,'美国Wellness 宠物健康系列 鸡肉配方小型成犬粮 2.7kg','../img/xiangqing_products/qita/s_06.jpg','￥300','');
