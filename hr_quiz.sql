/*hr Quiz 1*/
/*https://carami.tistory.com/116?category=552237*/
select * from tab;
select * from employees;
desc employees
select * from dept;
select * from dept;
select * from jobs;
desc emp
/*1.
--1. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 
입사년도(hire_date)별 평균 급여를 출력하시오.
-- 출력 시 년도를 기준으로 오름차순 정렬하시오.
*/

select to_char(hire_date,'YY') as "HIRE_YEAR", avg(salary)
from employees
where job_id='SA_MAN'
group by to_char(hire_date,'YY') 
order by  to_char(hire_date,'YY');

SELECT TO_CHAR(e.HIRE_DATE, 'YYYY') AS HIRE_DATE, AVG(e.salary) AS AVG
FROM EMPLOYEES e, JOBS j
 WHERE e.JOB_ID = j.JOB_ID AND j.JOB_TITLE = 'Sales Manager' 
 GROUP BY TO_CHAR(e.HIRE_DATE,'YYYY')
 ORDER BY TO_CHAR(e.HIRE_DATE,'YYYY') ASC;

/*2
각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다.
-- 평균급여가 가장 낮은 도시부터 도시명(city)과
평균연봉, 해당 도시의 직원수를 출력하시오.
-- 단, 도시에 근 무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.
*/

select city, avg(salary) as sal ,count(city)
from ( select * from  employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id)
group by city having count(city)<10
order by sal;

SELECT l.CITY , AVG(e.SALARY) , COUNT(*)
FROM EMPLOYEES e, LOCATIONS l, DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.LOCATION_ID = l.LOCATION_ID
GROUP BY l.CITY
HAVING COUNT(*) < 10
ORDER BY AVG(e.SALARY) ASC;

/*3
‘Public Accountant’의 직책(job_title)으로 
과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오.
-- (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.)
-- 이름은 first_name, last_name을 아래의 실행결과와 같이 출력한다.
*/

select e.employee_id, first_name||' '||last_name NAME
from employees e, jobs j, job_history jh
where e.employee_id=jh.employee_id and jh.job_id=j.job_id
and j.job_title='Public Accountant';

/*4 
자신의 매니저보다 연봉(salary)를 많이 받는
직원들의 성(last_name)과 연봉(salary)를 출 력하시오.
*/

select e.last_name,e.salary
from employees e , employees m
where e.manager_id=m.employee_id 
and e.salary>m.salary;

/*5
 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 
 이름(first_name), 성(last_name), 
--   부서명(department_name)을 조회합니다.  
--   이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시오.
*/

select employee_id, first_name,last_name, nvl(department_name,'<Not Assigned>')
from employees left outer join departments using(department_id)
where hire_date like '07%';

/*6
 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 
 연봉(salary)이 9,000이상, 10,000 이하인 
--   직원들의 이름(first_name), 성(last_name)과 연봉(salary)를 출력하시오*/

select first_name, last_name, salary
from employees e  , jobs  j
where e.job_id=j.job_id and
e.salary between 9000 and 10000
and j.job_title='Sales Representative';


/*7
부서별로 가장 적은 급여를 받고 있는 직원의 이름, 부서이름, 급여를 출력하시오. 
--   이름은 last_name만 출력하며, 부서이름으로 오름차순 정렬하고, 
--   부서가 같은 경우 이름을 기준 으로 오름차순 정렬하여 출력합니다.

12건으로 나와야 한다.*/

select e.last_name, a.*
from employees e,(select department_id ,department_name , min(salary) mi
from employees natural join departments
group by department_id,department_name) a
where e.salary=a.mi
order by a.department_name;

select last_name, department_name, e.salary
from (select department_id, min(salary)
FROM employees GROUP BY department_id ) e natural join departments
order by department_name;

select last_name, 
select  department_id, min(salary)
FROM employees GROUP BY department_id;

/*8
EMPLOYEES 테이블에서 급여를 많이 받는 순서대로 조회했을 때 결과처럼 
6번째부터 10 번째까지 
--   5명의 last_name, first_name, salary를 조회하는 sql문장을 작성하시오.*/

select last_name,first_name, salary
from(
select rank() over (order by salary desc) ranking,last_name,first_name, salary
from employees
order by salary desc)
where ranking between 6 and 10;

/*9  틀림!!!!
사원의 부서가 속한 도시(city)가 ‘Seattle’인 사원의 이름,
해당 사원의 매니저 이름, 사원 의 부서이름을 출력하시오. 
--   이때 사원의 매니저가 없을 경우 ‘<없음>’이라고 출력하시오.
이름은 last_name만 출력하며, 
--   사원의 이름을 오름차순으로 정렬하시오
*/
select e.last_name,nvl(m.last_name,'없음'),e.department_name
from(select e.employee_id, e.last_name, d.department_name,e.manager_id
from employees e, departments d ,locations l
where e.department_id=d.department_id and 
d.location_id=l.location_id and l.city='Seattle')  e, employees  m
where e.manager_id=m.employee_id
;

SELECT 
       E.E_NAME, NVL(E.M_NAME, '<없음>'), D.DEPARTMENT_NAME
  FROM 
      (
       SELECT 
              A.LAST_NAME AS E_NAME, B.LAST_NAME AS M_NAME, A.DEPARTMENT_ID 
         FROM EMPLOYEES A 
         LEFT JOIN EMPLOYEES B 
           ON A.MANAGER_ID = B.EMPLOYEE_ID
      ) E, DEPARTMENTS D, LOCATIONS L
 WHERE L.CITY = 'Seattle' AND E.DEPARTMENT_ID = D.DEPARTMENT_ID AND D.LOCATION_ID = L.LOCATION_ID
 ORDER BY E.E_NAME ASC
; 

/*10
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다.
연봉 총합이 가장 높은 업무부터 
--    업무명(job_title)과 연봉 총합을 조회하시오.
단 연봉총합이 30,000보다 큰 업무만 출력하시오. 
*/

select job_title, sum(salary)
from employees natural join jobs
group by job_title having sum(salary)>30000
order by sum(salary) desc;

/*11
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name),
업무명(job_title), 
--    부서 명(department_name)을 조회하시오. 
--    단 도시명(city)이 ‘Seattle’인 지역(location)의
부서 (department)에 근무하는 직원을 사원번호 오름차순순으로 출력하시오.
*/
/*
select e.employee_id, e.first_name, j.job_title ,d.department_name
from
*/