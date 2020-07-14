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
--1. ��å(Job Title)�� Sales Manager�� ������� �Ի�⵵�� 
�Ի�⵵(hire_date)�� ��� �޿��� ����Ͻÿ�.
-- ��� �� �⵵�� �������� �������� �����Ͻÿ�.
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
�� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�.
-- ��ձ޿��� ���� ���� ���ú��� ���ø�(city)��
��տ���, �ش� ������ �������� ����Ͻÿ�.
-- ��, ���ÿ� �� ���ϴ� ������ 10�� �̻��� ���� �����ϰ� ��ȸ�Ͻÿ�.
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
��Public Accountant���� ��å(job_title)���� 
���ſ� �ٹ��� ���� �ִ� ��� ����� ����� �̸��� ����Ͻÿ�.
-- (���� ��Public Accountant���� ��å(job_title)���� �ٹ��ϴ� ����� ��� ���� �ʴ´�.)
-- �̸��� first_name, last_name�� �Ʒ��� �������� ���� ����Ѵ�.
*/

select e.employee_id, first_name||' '||last_name NAME
from employees e, jobs j, job_history jh
where e.employee_id=jh.employee_id and jh.job_id=j.job_id
and j.job_title='Public Accountant';

/*4 
�ڽ��� �Ŵ������� ����(salary)�� ���� �޴�
�������� ��(last_name)�� ����(salary)�� �� ���Ͻÿ�.
*/

select e.last_name,e.salary
from employees e , employees m
where e.manager_id=m.employee_id 
and e.salary>m.salary;

/*5
 2007�⿡ �Ի�(hire_date)�� �������� ���(employee_id), 
 �̸�(first_name), ��(last_name), 
--   �μ���(department_name)�� ��ȸ�մϴ�.  
--   �̶�, �μ��� ��ġ���� ���� ������ ���, ��<Not Assigned>���� ����Ͻÿ�.
*/

select employee_id, first_name,last_name, nvl(department_name,'<Not Assigned>')
from employees left outer join departments using(department_id)
where hire_date like '07%';

/*6
 ������(job_title)�� ��Sales Representative���� ���� �߿��� 
 ����(salary)�� 9,000�̻�, 10,000 ������ 
--   �������� �̸�(first_name), ��(last_name)�� ����(salary)�� ����Ͻÿ�*/

select first_name, last_name, salary
from employees e  , jobs  j
where e.job_id=j.job_id and
e.salary between 9000 and 10000
and j.job_title='Sales Representative';


/*7
�μ����� ���� ���� �޿��� �ް� �ִ� ������ �̸�, �μ��̸�, �޿��� ����Ͻÿ�. 
--   �̸��� last_name�� ����ϸ�, �μ��̸����� �������� �����ϰ�, 
--   �μ��� ���� ��� �̸��� ���� ���� �������� �����Ͽ� ����մϴ�.

12������ ���;� �Ѵ�.*/

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
EMPLOYEES ���̺��� �޿��� ���� �޴� ������� ��ȸ���� �� ���ó�� 
6��°���� 10 ��°���� 
--   5���� last_name, first_name, salary�� ��ȸ�ϴ� sql������ �ۼ��Ͻÿ�.*/

select last_name,first_name, salary
from(
select rank() over (order by salary desc) ranking,last_name,first_name, salary
from employees
order by salary desc)
where ranking between 6 and 10;

/*9  Ʋ��!!!!
����� �μ��� ���� ����(city)�� ��Seattle���� ����� �̸�,
�ش� ����� �Ŵ��� �̸�, ��� �� �μ��̸��� ����Ͻÿ�. 
--   �̶� ����� �Ŵ����� ���� ��� ��<����>���̶�� ����Ͻÿ�.
�̸��� last_name�� ����ϸ�, 
--   ����� �̸��� ������������ �����Ͻÿ�
*/
select e.last_name,nvl(m.last_name,'����'),e.department_name
from(select e.employee_id, e.last_name, d.department_name,e.manager_id
from employees e, departments d ,locations l
where e.department_id=d.department_id and 
d.location_id=l.location_id and l.city='Seattle')  e, employees  m
where e.manager_id=m.employee_id
;

SELECT 
       E.E_NAME, NVL(E.M_NAME, '<����>'), D.DEPARTMENT_NAME
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
�� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�.
���� ������ ���� ���� �������� 
--    ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�.
�� ���������� 30,000���� ū ������ ����Ͻÿ�. 
*/

select job_title, sum(salary)
from employees natural join jobs
group by job_title having sum(salary)>30000
order by sum(salary) desc;

/*11
�� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name),
������(job_title), 
--    �μ� ��(department_name)�� ��ȸ�Ͻÿ�. 
--    �� ���ø�(city)�� ��Seattle���� ����(location)��
�μ� (department)�� �ٹ��ϴ� ������ �����ȣ �������������� ����Ͻÿ�.
*/
/*
select e.employee_id, e.first_name, j.job_title ,d.department_name
from
*/