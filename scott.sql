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

