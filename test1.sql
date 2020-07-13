/*practice hr*/

select * from tab;

select employee_id,first_name from employees where upper(first_name) like '_A%';

desc employees

select  lpad(first_name,10,'a') from employees;

select substr('DataBase',2,4) from dual;

select length('database') from dual;

select trim('#' from '############3hi') from dual;

select round(2.312393,4) as hi, floor(3234.3) as oh, ceil(2346654.3333) from dual;

desc employees

select hire_date from employees;

SELECT value FROM nls_session_parameters WHERE parameter = 'NLS_DATE_FORMAT';

select sysdate from dual;

select add_months(hire_date,3) from employees;

SELECT ROUND(45.925), ROUND(45.925, 0), TRUNC(45.925), TRUNC(45.925, 0)FROM dual;

SELECT FLOOR(45.925), CEIL(45.925) FROM dual;

select mod(10,3), mod(10,-3),mod(-10,3),mod(-10,-3) from dual;
SELECT SIGN(-15),SIGN(15) FROM dual;
SELECT SIN(3.141592/2) FROM dual;
SELECT EXP(4) FROM dual;

SELECT CONCAT('Oracle','DBMS'), INITCAP('Oracle DBMS'), 
            LOWER('Oracle DBMS'), UPPER('Oracle DBMS')
           FROM dual;
           
           
select lpad(first_name,15)||' '||rpad(job_id,20) from employees;

select * from departments;

select department_id, department_name from departments where department_name='Sales';

SELECT CHR(79)||CHR(114)||CHR(97)||CHR(99)||CHR(108)||CHR(101) FROM dual;
SELECT ASCII('O'),ASCII('r'),ASCII('a') FROM dual;

desc employees

select salary, to_char(salary,'99,9999'), TO_CHAR(SALARY, '099.999') from employees;

SELECT salary, TO_CHAR(salary, '99,999'),TO_CHAR(salary, '099,999') , TO_CHAR(salary, 'FM99,999'),TO_CHAR(salary, '99,999.0') FROM employees;

SELECT rownum, TO_CHAR(rownum, 'RN'), TO_CHAR(rownum, 'rn') FROM employees;

SELECT TO_CHAR(-12345, 'S99,999'), TO_CHAR(12345, 'S99,999') FROM dual;

SELECT salary, TO_CHAR(salary, 'XXXX'), TO_CHAR(salary, 'xxxx') FROM employees;

SELECT value FROM nls_session_parameters WHERE parameter = 'NLS_CURRENCY';
SELECT TO_CHAR(salary, '$99,999'), TO_CHAR(salary, 'L99,999') FROM employees;

SELECT TO_NUMBER('-1234') FROM dual;
SELECT TO_NUMBER('$123,456','$999,999') FROM dual;

select sysdate from dual;

/*select to_char(sysdate,'HH24''시''*/

SELECT TO_CHAR(sysdate, 'HH24"시" MI"분" SS"초"') FROM dual;

select first_name,department_id, case department_id when 90 then salary*1.1
when 20 then salary*1.2
else salary end new_salary
from employees;

select department_id, decode(department_id, 50, salary*1.1,100,salary*1.2, salary) revise_salary from employees;

select nvl2(to_char(MANAGER_ID),'i have manager','i am a boss') from employees;

select * from employees;

select first_name, job_id, nullif(first_name, job_id) from employees;

select first_name,COMMISSION_PCT,department_id,coalesce(COMMISSION_PCT,department_id,-1000) from employees;
SELECT first_name, job_id FROM employees WHERE INSTR(first_name, 'at') > 0;

SELECT INSTR('Oracle DBMS', 'ac') FROM dual;

select * from departments;
select distinct * from employees,DEPARTMENTS where employees.department_id=departments.department_id;

select * from employees natural join departments;

select department_name, first_name from employees, departments where employees.department_id=departments.department_id;