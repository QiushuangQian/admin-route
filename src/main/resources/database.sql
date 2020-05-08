DROP DATABASE IF EXISTS travel;

CREATE DATABASE travel DEFAULT CHARACTER SET = utf8;

USE travel;

-- 用户表
DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    userId       BIGINT PRIMARY KEY AUTO_INCREMENT,
    userEmail    VARCHAR(100) UNIQUE NOT NULL COMMENT '用户邮箱',
    username     VARCHAR(100) COMMENT '用户名',
    password     VARCHAR(100) COMMENT '密码',
    userPhone    VARCHAR(100) COMMENT '电话',
    userFilename VARCHAR(100) COMMENT '文件名字',
    userFileURL  VARCHAR(100) COMMENT '文件路径',
    userStatus   INT COMMENT '用户状态,0:关闭,1:开启'
);


INSERT INTO user
VALUES (1, '958860184@qq.com', 'mousse', 'abc123', '123', NULL, NULL, 1);
INSERT INTO user
VALUES (2, '958860185@qq.com', 'cookie', '$2a$10$mqvP.UG89JqhO3hRlPkB4.IoDNgd9y8aEvjBc8FKvxEhH3cZQAoOG', '123', NULL,
        NULL, 1);
INSERT INTO user
VALUES (3, '958860186@qq.com', 'showy', 'abc123', '123', NULL, NULL, 1);
INSERT INTO user
VALUES (4, '958860187@qq.com', 'admin', 'abc123', '123', NULL, NULL, 1);


-- 角色表
DROP TABLE IF EXISTS role;
CREATE TABLE role
(
    roleId   BIGINT PRIMARY KEY AUTO_INCREMENT,
    roleName VARCHAR(50) COMMENT '角色名字',
    roleDesc VARCHAR(50) COMMENT '角色描述'
);

INSERT INTO role(roleId, roleName, roleDesc)
VALUES (1, 'USER', '用户');
INSERT INTO role(roleId, roleName, roleDesc)
VALUES (2, 'ADMIN', '管理员');


-- 用户角色关系表
DROP TABLE IF EXISTS users_role;
CREATE TABLE users_role
(
    userId BIGINT(32) COMMENT '用户主键',
    roleId BIGINT(32) COMMENT '角色主键',
    PRIMARY KEY (userId, roleId)
);

INSERT INTO users_role
VALUES (1, 1);
INSERT INTO users_role
VALUES (1, 2);
/*INSERT INTO users_role
VALUES (1, 4);*/
INSERT INTO users_role
VALUES (2, 1);
INSERT INTO users_role
VALUES (2, 2);
/*INSERT INTO users_role
VALUES (2, 4);
INSERT INTO users_role
VALUES (2, 3);*/


-- *资源权限表
DROP TABLE IF EXISTS permission;
CREATE TABLE permission
(
    permissionId   BIGINT PRIMARY KEY AUTO_INCREMENT,
    permissionName VARCHAR(50) COMMENT '权限名字',
    permissionUrl  VARCHAR(50) COMMENT '权限路径'
);

INSERT INTO permission (permissionId, permissionName, permissionUrl)
VALUES (1, '查询所有用户', '/user/findAll.do');
INSERT INTO permission (permissionId, permissionName, permissionUrl)
VALUES (2, '查询所有角色', '/role/findAll.do');
INSERT INTO permission (permissionId, permissionName, permissionUrl)
VALUES (3, '查询所有权限', '/permission/findAll.do');


-- *角色权限关联表
DROP TABLE IF EXISTS role_permission;
CREATE TABLE role_permission
(
    roleId       BIGINT(32),
    permissionId BIGINT(32),
    PRIMARY KEY (permissionId, roleId)
);
INSERT INTO role_permission
VALUES (1, 1);
INSERT INTO role_permission
VALUES (1, 2);
INSERT INTO role_permission
VALUES (1, 3);

-- 公告表
DROP TABLE IF EXISTS announce;
CREATE TABLE announce
(
    announceId        BIGINT PRIMARY KEY AUTO_INCREMENT,
    announceStartDate DATETIME COMMENT '发布公告的时间',
    announceTitle     VARCHAR(100) COMMENT '公告标题',
    announceContent   VARCHAR(100) COMMENT '公告内容'
);


CREATE TABLE users_announces
(
    userId     BIGINT(32) COMMENT '用户表主键',
    announceId BIGINT(32) COMMENT '公告表主键',
    PRIMARY KEY (userId, announceId)
);


-- 消息表
CREATE TABLE message
(
    messageId        BIGINT PRIMARY KEY AUTO_INCREMENT,
    messageUserId    BIGINT COMMENT '发消息的用户',
    -- messageFromUserId    BIGINT COMMENT '发消息的用户',
    -- messageByUserId    BIGINT COMMENT '接受消息的用户',
    messageStartDate DATETIME COMMENT '发消息的时间',
    messageTitle     VARCHAR(100) COMMENT '发消息的时间',
    messageContent   VARCHAR(500) COMMENT '发消息的理由',
    messageResult    VARCHAR(100) COMMENT '发消息的结果',
    messageStatus    INT COMMENT '发消息的状态,0:发送,1:已读'
);

-- 回复表
CREATE TABLE reply
(
    replyId             BIGINT PRIMARY KEY AUTO_INCREMENT,
    replyAnnounceId     BIGINT COMMENT '公告表主键',
    replyAnnounceUserId BIGINT COMMENT '公告表的用户主键',
    replyFromUserId     BIGINT COMMENT '回帖的用户',
    replyByUserId       BIGINT COMMENT '被回复的用户',
    replyLike           INT COMMENT '点赞数',
    replyContent        VARCHAR(500) COMMENT '回复表内容',
    replyStatus         INT COMMENT '回复状态',
    replyCreateDate     DATETIME COMMENT '创建时间'
);


-- 游记表
CREATE TABLE travel
(
    travelId   BIGINT PRIMARY KEY AUTO_INCREMENT,
    travelName VARCHAR(500) COMMENT '标题',
    travelDate TIMESTAMP COMMENT '创建时间',
    travelCity VARCHAR(500) COMMENT '所在城市',
    travelDesc VARCHAR(500) COMMENT '景点介绍'
);

CREATE TABLE user_travel
(
    userId   BIGINT(32) COMMENT '用户表主键',
    travelId BIGINT(32) COMMENT '公告表主键',
    PRIMARY KEY (userId, travelId)
)
