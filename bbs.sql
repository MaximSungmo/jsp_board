CREATE DATABASE bbs default character SET UTF8;
use bbs;
CREATE TABLE member (
	id varchar(30) primary key,
    password varchar(200),
    username varchar(30),
    email varchar(30),
    emailcheck boolean,
    salt varchar(200)
);

DROP TABLE board;
CREATE TABLE board (
	num int AUTO_INCREMENT primary key,
    title varchar(50),
    content text,
    writedate datetime,
    id varchar(30),
    readcount int,
    category_num int
);
insert into board values(default, 'test', 'test content', now(), 'admin', 1, 0);
insert into board values(default, 'test', 'test content', now(), 'admin', 1, 1);


DROP TABLE reboard;
CREATE TABLE reboard (
	renum int AUTO_INCREMENT primary key,
    id varchar(50),
    recontent text,
    writedate datetime,
    num int
);