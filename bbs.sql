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

insert into member values ('admin', '822bc3bf317ba5479977d5cafce68922319bb7e63805ff98e4438ace5e286390', '관리자', 'admin@admin.com', 1, '22b77a439ba2eba8');

DROP TABLE board;
CREATE TABLE board (
	num int AUTO_INCREMENT primary key,
    title varchar(50),
    content text,
    sub_category varchar(30),
    writedate datetime,
    id varchar(30),
    readcount int,
    category_num int
);
insert into board values(default, 'test', 'test content', '수정구', now(), 'admin', 1, 0);
insert into board values(default, 'test', 'test content', '수정구', now(), 'admin', 1, 1);


DROP TABLE reboard;
CREATE TABLE reboard (
	renum int AUTO_INCREMENT primary key,
    id varchar(50),
    recontent text,
    writedate datetime,
    num int
);