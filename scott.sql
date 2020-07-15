/* practice oracle scott*/
select * from tab;

desc dept
desc emp
desc salgrade
select * from emp;

select * from emp, dept where emp.deptno=dept.deptno ;

select * from emp natural join dept;

select * from dept join emp using(deptno);

select * from dept d join emp e on(d.deptno=e.deptno);

select * from salgrade;

select ename,sal, grade from emp, salgrade where emp.sal between losal and hisal; 

SELECT * FROM emp e, dept d WHERE e.deptno (+)= d.deptno;

SELECT ename, dname FROM dept  LEFT OUTER JOIN emp  USING (deptno);

select * from emp left outer join dept using(deptno);
select * from emp, dept where emp.deptno=dept.deptno(+);

select level, ename from emp
start with mgr is null
connect by prior empno=mgr
order by level;


select empno, ename, job, level from emp 
start with ename='SMITH'
connect by prior mgr=empno;

SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;


SELECT deptno, sal
FROM emp
ORDER BY deptno ASC;

select count(*) from emp;
select count(distinct job) from emp;

select sum(sal) from emp;

select sum(distinct sal) from emp;

select sum(sal)
from emp
group by deptno;


select avg(comm)/count(comm) from emp;

select job, avg(sal) from emp group by job;

select * from dept;

select count(job) from emp where job='CLERK';

SELECT deptno, COUNT(*) "Number"   FROM emp
           WHERE job = 'CLERK'  GROUP BY deptno;
           
           
select job , max(sal) 
from emp
group by job
order by max(sal);


select job, max(sal) 
from emp
group by job having count(job)>=2 
order by max(sal) desc ;

SELECT d.deptno, d.dname, count(e.ename) cnt
     from emp e, dept d 
     where e.deptno = d.deptno 
     group by d.deptno, d.dname;

SELECT d.deptno, d.dname, count(e.ename) cnt
     from emp e, dept d 
     where e.deptno = d.deptno 
          group by d.deptno, d.dname;

SELECT deptno, job, sum(sal) FROM emp
     GROUP BY ROLLUP (deptno, job);
 
SELECT ename
FROM emp
WHERE sal >( SELECT sal FROM emp WHERE ename ='SCOTT');

select ename, sal, deptno
from emp
where ename=(select min(ename) from emp);
/*
select ename, sal, deptno
from emp
where ename=(
*/
select min(ename) from emp group by deptno;

 SELECT   ename,  sal,  deptno 
           FROM   emp 
           WHERE ename IN  (SELECT  MIN(ename) FROM  emp GROUP BY deptno);
/*1  https://carami.tistory.com/115?category=552237*/
select deptno, avg(sal) 
from emp
where sal>1000
group by deptno 
having avg(sal) >2000;


select deptno,job, count(job)
from emp
group by job, deptno
order by deptno;

select empno, deptno, job 
from dept left outer join emp using(deptno);

select * from dept;

/*조인까지는 갈 필요는 없다 loc출력 하면 조인해야함. 달라스만 말하니까 조인은 안해도 된다*/
select ename, deptno 
from emp natural join dept
where loc='DALLAS';

select ename, deptno 
from emp
where deptno in( select deptno from dept where loc='DALLAS');


select ename, sal, deptno
from emp
where deptno in (select deptno
from emp
where sal>=3000);

select empno,sal,deptno
from emp
where sal in ( select max(sal) from emp group by deptno);

select ename, sal
from emp
where sal> (select max(sal) from emp where deptno=30);

select ename, sal 
from emp
where sal > (select min(sal) from emp where deptno=30);


SELECT * FROM emp WHERE sal IN(950, 3000, 1250);

select ename, sal, deptno
from emp outer
where sal > (select avg(sal) from emp where deptno= outer.deptno);

select deptno, empno, ename, sal
from emp
where(deptno, sal) In( select deptno,max(sal)
from emp group by deptno);

SELECT e.deptno , e.empno , e.ename , e.sal
FROM emp e,(SELECT s.deptno , max(s.sal) msal
FROM emp s GROUP BY deptno ) m
WHERE e.deptno = m.deptno AND e.sal = m.msal;

select * from emp;

/*rowbnum 이 먼저 출련된다. 이렇게 하면안됨*/
select rownum, ename, sal
from emp
where hiredate like '81%'
order by sal desc;

select rownum, ename, sal
from (select * from emp where hiredate like '81%' order by sal desc)
where rownum <4;

select ename from emp
union 
select dname from dept;

select sal, ename, rank() over (order by sal desc) as rank,
DENSE_RANK() over (order by sal desc) as dense_rank, 
ROW_NUMBER() over(order by sal desc) as row_numver,
rownum as "rownum"
from emp;

select sal, ename, rank() over (order by sal desc) as rank,
DENSE_RANK() over (order by sal desc) as dense_rank, 
ROW_NUMBER() over(order by sal desc) as row_numver,
rownum as "rownum"
from emp
order by ename;

select deptno, job, sum(sal)
from emp
group by rollup (deptno, job);

select * from emp;
select sal/12+1 from emp;

select * 
from emp, dept
where emp.deptno(+) =dept.deptno;

select *
from emp right outer join dept using(deptno);

select * 
from emp, dept
where emp.deptno =dept.deptno(+);

select *
from emp left outer join dept on(emp.deptno=dept.deptno);

select empno,job,comm from emp;

select sal 
from emp
where comm is null;

SELECT sal*12 annual_salary FROM emp;

select sysdate, user from dual;

select distinct job from emp;

SELECT deptno, job FROM emp;

select DISTINCT deptno, job FROM emp
order by deptno;

SELECT DISTINCT job,deptno FROM emp
order by deptno; 

SELECT value FROM nls_session_parameters
            WHERE parameter = 'NLS_DATE_FORMAT';
            
            
select deptno, ename
from emp
where deptno <> all(30,40);


select * from dept;
SELECT dname, loc FROM dept WHERE dname LIKE '%AL%';

select * from emp;

select sal, round(sal,-1)
from emp;

SELECT ROUND(45.925), ROUND(45.925, 0), TRUNC(45.925), TRUNC(45.925, 0)
            FROM dual;
SELECT FLOOR(45.925), CEIL(45.925) FROM dual;

SELECT SIN(3.141592/2) FROM dual;
SELECT EXP(4) FROM dual;   


SELECT LPAD('Oracle DBMS', 13, 'x'), RPAD('Oracle DBMS', 13, 'x') FROM dual;


SELECT rPAD(ename, 15)||'   '||lPAD(job,20) FROM emp;


select ename, ltrim(ename,'A')
from emp;

SELECT ename , LTRIM(ename, 'AB'), RTRIM(ename, 'SR') FROM emp;


select rTRIM('##Database###','#') from dual;


select * from emp;

insert into dept(deptno, dname) values (80,'Brancj');
insert into dept values (90,'hQs',null);
select * 
from dept
where deptno in (80,90);

delete from dept where deptno in(80,90);

rollback;

INSERT INTO emp (empno, ename, job, hiredate)	
           VALUES (8000, 'PARK', 'ENGINEER', SYSDATE);
           
INSERT INTO emp (empno, ename, job, hiredate)
           VALUES (8001, USER, 'TECH', TO_DATE('07/03/20', 'YY/MM/DD'));

SELECT * FROM emp WHERE empno >= 8000;


create table def_tab(
    a number default 10,
    b varchar2(10) default 'x',
    c varchar2(10)
    );

drop table defs_tab;

INSERT INTO def_tab VALUES (DEFAULT, DEFAULT,DEFAULT);

select * from def_tab;

INSERT INTO def_tab VALUES (DEFAULT, DEFAULT,'aaaaaa');

INSERT INTO def_tab (c) VALUES ('bbbbbb');
INSERT INTO def_tab (a, c) VALUES (20, 'cccccc');


select count(*) from emp 
where comm=300;

select * from emp;

update emp
set comm =300;

rollback;


SELECT * FROM def_tab;
UPDATE def_tab SET b ='y';

SELECT TO_CHAR(HIREDATE, 'BC yyYY Q MM DD') FROM emp;

SELECT TO_CHAR(sysdate, 'J') FROM dual;

SELECT TO_CHAR(hiredate, 'QSPTH') FROM emp;
SELECT TO_CHAR(TO_DATE('30/01/01','YY/MM/DD'),'YYYY') FROM dual ;

SELECT * FROM emp JOIN dept ON emp.deptno = dept.deptno;

select sysdate from dual;

SELECT * FROM emp RIGHT OUTER JOIN dept ON emp.deptno = dept.deptno;

SELECT TRANSLATE('Oracle DBMS','ABCD','1234') FROM dual;

SELECT INSTR('Oracle DBMS', 'a') FROM dual;

select sal||22+1 from emp;