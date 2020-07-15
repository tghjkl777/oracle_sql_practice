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

CREATE TABLE job(
    id    NUMBER(3) CONSTRAINT job_id_pk PRIMARY KEY,
    name    VARCHAR(5) NOT NULL
     );

CREATE TABLE author (
    id    NUMBER(5) CONSTRAINT author_id_pk PRIMARY KEY, 
    name    VARCHAR2(20) CONSTRAINT author_name_not_null NOT NULL,
    gender    CHAR(1) DEFAULT 'M',
    age    NUMBER(2),
    job_id    NUMBER(3),
    CONSTRAINT author_gender_check CHECK (gender in ('M', 'F')),
    CONSTRAINT author_job_id_fk FOREIGN KEY (job_id) REFERENCES job(id) 
     );

CREATE TABLE author_book (
    author_id    NUMBER(5),
    book_id        NUMBER(5),
    author_order    NUMBER(2) DEFAULT 1,
    CONSTRAINT authorbook_author_id_fk FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
    CONSTRAINT authorbook_book_id_fk FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
    CONSTRAINT authorbook_pk PRIMARY KEY (book_id, author_id, author_order)
     );

SELECT constraint_name, constraint_type,
    search_condition
    FROM user_constraints
    WHERE table_name = 'BOOK';
    
    SELECT uc.constraint_name, uc.constraint_type, ucc.column_name, uc.search_condition
    FROM user_constraints uc, user_cons_columns ucc
    WHERE uc.constraint_name = ucc.constraint_name and uc.table_name = 'BOOK';



INSERT INTO book VALUES (1, 'C++ INTRO', 20000, '15-222-22222', '07/01/02');
 INSERT INTO book VALUES (2, 'JAVA PRIMER', 50000, '11-111-1111', DEFAULT);
 SELECT * FROM book;

