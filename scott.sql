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

/*���α����� �� �ʿ�� ���� loc��� �ϸ� �����ؾ���. �޶󽺸� ���ϴϱ� ������ ���ص� �ȴ�*/
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

/*rowbnum �� ���� ��õȴ�. �̷��� �ϸ�ȵ�*/
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


