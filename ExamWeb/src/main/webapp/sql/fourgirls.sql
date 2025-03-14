SELECT 'DROP TABLE ' || object_name || ' CASCADE CONSTRAINTS;'
FROM   user_objects
WHERE  object_type = 'TABLE';


CREATE TABLE qnareply (
	qna_revno	varchar2(20) NOT NULL,
	qna_content	varchar2(100) NULL,
	user_id	varchar2(20) NULL,
	qna_revDate	DATE NULL,
	qna_no	number NULL
);



CREATE TABLE products (
	prod_no	number NOT NULL,
	prod_name	varchar2(20) NULL,
	price	number NULL,
	content	varchar2(100) NULL,
	create_date	DATE NULL,
	image	varchar2(60) NULL,
	pdf	VARCHAR2(20) NULL,
	count	NUMBER NULL,
	user_id	VARCHAR2(20) NULL,
	category_no	varchar2(10)	NULL
);



CREATE TABLE prodReply (
	rev_no	number	NOT NULL,
	star_point	number	NULL,
	rev_title	VARCHAR2(20)	NULL,
	rev_create	DATE	NULL,
	rev_content	VARCHAR2(100)	NULL,
	user_id	VARCHAR2(20)	NOT NULL,
	pay_no	number	NOT NULL
);


CREATE TABLE members (
	user_id	VARCHAR2(20) NOT NULL,
	user_name	VARCHAR2(20) NULL,
	phone	VARCHAR2(20) NULL,
	email	VARCHAR2(20) NULL,
	birth	DATE NULL,
	password	VARCHAR2(20) NULL,
	user_type	VARCHAR2(10) NULL,
	out_type	VARCHAR2(10)	DEFAULT 'no'	NULL
);

CREATE TABLE payments (
	pay_no	number	NOT NULL,
	price	number	NULL,
	prod_no	number	NULL,
	pay_date	DATE	DEFAULT sysdate,
	user_id	varchar2(20)	NULL,
	pay_type	varchar2(10)	NULL,
	down_cnt	NUMBER	DEFAULT 0 
);




CREATE TABLE carts (
	cart_no	number NOT NULL,
	user_id	VARCHAR2(20) NULL,
	prod_no	number NULL
);



CREATE TABLE qna (
	qna_no	number NOT NULL,
	qna_title	varchar2(20) NULL,
	qna_content	varchar2(100) NULL,
	qna_create	DATE NULL,
	qna_cnt	number NULL,
	user_id	varchar2(20) NULL,
	category_no	varchar2(10)	NULL
);



CREATE TABLE category (
	category_no	varchar2(10) NOT NULL,
	category_name	VARCHAR2(10) NULL
);



ALTER TABLE qnareply ADD CONSTRAINT PK_QNAREPLY PRIMARY KEY (
	qna_revno
);

ALTER TABLE products ADD CONSTRAINT PK_PRODUCTS PRIMARY KEY (
	prod_no
);

ALTER TABLE prodReply ADD CONSTRAINT PK_PRODREPLY PRIMARY KEY (
	rev_no
);


ALTER TABLE members ADD CONSTRAINT PK_MEMBERS PRIMARY KEY (
	user_id
);

ALTER TABLE payments ADD CONSTRAINT PK_PAYMENTS PRIMARY KEY (
	pay_no
);

ALTER TABLE carts ADD CONSTRAINT PK_CARTS PRIMARY KEY (
	cart_no
);

ALTER TABLE qna ADD CONSTRAINT PK_QNA PRIMARY KEY (
	qna_no
);

ALTER TABLE category ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (
	category_no
);

insert into qnareply 
values('001','질문1','user1',sysdate,1);
insert into qnareply 
values('002','정처기질문','user2',sysdate,2);
insert into qnareply 
values('003','질문질문3','user3',sysdate,3);
insert into qnareply 
values('004','질문포걸즈','user4',sysdate,4);
insert into qnareply 
values('005','질문5','user5',sysdate,5);


insert into carts 
values(1,'user01',3);
insert into carts 
values(2,'user03',4);
insert into carts 
values(3,'user01',5);
insert into carts 
values(4,'user02',1);
insert into carts 
values(5,'user05',2);

insert into products 
values(1,'상품1',10000,'내용1','2025-3-14','사진1.jpg','정처기.pdf',1,'user1','1');
insert into products 
values(2,'상품2',15000,'sql시험','2025-3-07','sqld.jpg','sql.pdf',2,'user2','2');
insert into products 
values(3,'상품3',20000,'정처기산업','2025-3-03','사진3.jpg','정처기산업.pdf',3,'user3','3');
insert into products 
values(4,'상품4',25000,'내용4','2025-2-14','사진4.jpg','내용4.pdf',4,'user4','4');
insert into products 
values(5,'상품5',30000,'내용5',sysdate,'사진5.jpg','내용5.pdf',5,'user5','5');

insert into members
values('user01','정은애','010-1111-1111','pubao47@gmail.com','2000-08-08','1111','user','no');
insert into members
values('user02','이민영','010-2222-2222','gmail@gmail.com','1999-08-08','2222','admin','no');
insert into members
values('user03','고영서','010-3333-3333','naver@naver.com','1998-08-08','3333','user','no');
insert into members
values('user04','신현욱','010-5555-5555','daum@daum.com','1997-08-08','5555','admin','no');
insert into members
values('user05','포걸즈','010-6666-6666','qwer@gmail.com','1996-03-24','6666','user','no');

insert into qna
values(1,'질문1','내용1','2025-03-14',5,'user01','2');
insert into qna
values(2,'질문2','내용내용','2025-03-13',6,'user02','3');
insert into qna
values(3,'질문제목','질문입니다~','2025-03-12',10,'user03','9');
insert into qna
values(4,'정처기질문','정처기질문입니다','2025-02-13',11,'user04','1');
insert into qna
values(5,'sqld','sqld질문입니다','2025-01-11',100,'user05','2');

insert into category
values(1,'정처기');
insert into category
values(2,'sqld');
insert into category
values(3,'정');
insert into category
values(4,'빅분기');
insert into category
values(5,'컴활');

INSERT INTO prodreply
VALUES (1,3,'안녕',sysdate,'안녕하세요','user01',1);
INSERT INTO prodreply
VALUES (2,3,'안녕',sysdate,'안녕하세요','user02',1);
INSERT INTO prodreply
VALUES (3,3,'안녕',sysdate,'안녕하세요','user03',1);
INSERT INTO prodreply
VALUES (4,3,'안녕',sysdate,'안녕하세요','user04',1);
INSERT INTO prodreply
VALUES (5,3,'안녕',sysdate,'안녕하세요','user05',1);


INSERT INTO payments
VALUES (1,2000,1,sysdate,'user01','ready',0);
INSERT INTO payments
VALUES (2,3000,1,sysdate,'user01','ready',0);
INSERT INTO payments
VALUES (3,4000,1,sysdate,'user01','ready',0);
INSERT INTO payments
VALUES (4,5000,1,sysdate,'user01','ready',0);
INSERT INTO payments
VALUES (5,6000,1,sysdate,'user01','ready',0);

commit;