CREATE TABLE book (
bookno NUMBER(5),
title VARCHAR2(50),
author VARCHAR2(10),
pubdate DATE
);

select table_name
from user_tables;

SELECT * FROM user_catalog ;

create table cre_tab1(
    db_user varchar2(30) default user,
    issue_date date default sysdate,
    type_operation number(3)
    );
select * from tab;

insert into cre_tab1(type_operation) values(100);
select * from cre_tab1;

create table "cre_tab2" ( 
a number,b char
);

select * from "cre_tab2" ;
select * from tab;

create table test_char(
id number, 
a char(2),
b varchar2(2)
);

insert into test_char values(1,'x','x');
insert into test_char values(2,'x','x');

select * from test_char where a='x';
select * from test_char where a='x';

cREATE table test_num (a NUMBER (3), b NUMBER (3, 1));

insert into test_num values(122,5);
insert into test_num values (100, 10);
 insert into test_num values (100, 0.1);
 insert into test_num values (100, 0.5);
insert into test_num values (100, 0.51);
insert into test_num values (100, 0.55);

select * from test_num;

select table_name
from user_tables;

drop table book;
create table book(
id    NUMBER(5) CONSTRAINT book_id_pk PRIMARY KEY,
    name    VARCHAR2(20) CONSTRAINT book_name_not_null NOT NULL, 
    price    NUMBER(12,2) CONSTRAINT book_price_check CHECK (price > 0), 
    isbn    VARCHAR2(14) CONSTRAINT book_isbn_unique UNIQUE,
    pub_date DATE DEFAULT SYSDATE
);
