/**********************
* Join
***********************/
--equi join
select *
from employees, departments;

select  employee_id ,
        first_name,
        salary,
        department_name,
        em.department_id "e_did",
        de.department_id "d_did"
from employees em, departments de
where em.department_id = de.department_id;

--모든 직원이름, 부서이름, 업무명 을 출력하세요
select  e.first_name,
        d.department_name,
        j.job_title,
        e.salary,
        e.department_id,
        d.department_id,
        e.job_id,
        j.job_id
from employees e, departments d, jobs j
where e.department_id = d.department_id
and e.job_id = j.job_id
and e.salary >= 7000
order by salary desc
;

SELECT first_name, em.department_id,
              department_name, de.department_id
FROM employees em, departments de
WHERE em.department_id = de.department_id;

--equal join 오라클 문법
SELECT	e.first_name,
			e.department_id,
			d.department_name,
			d.department_id
FROM employees e , departments d 
WHERE e.department_id = d.department_id(+) ;

--equal join postgresql 문법
SELECT	e.first_name,
			e.department_id,
			d.department_name,
			d.department_id
FROM employees e 
LEFT OUTER JOIN departments d ON e.employee_id = d.department_id ;

--left join 예제
SELECT	e.first_name,
			e.department_id,
			d.department_name,
			d.department_id
FROM employees e LEFT OUTER join departments d
ON e.department_id = d.department_id ;

/********************************************************
--subquarry
********************************************************/

select 
		first_name,
		salary 
from employees
where first_name = 'Den';

select 	first_name,
			salary
from employees
where salary >= 11000
order by salary desc;


select 	first_name ,
			salary
from employees
where salary >= (select	salary
					from employees
					where first_name  = 'Den')
order by salary desc;

--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select 	first_name ,
			salary,
			employee_id 
from employees
where salary  <= 11000;

select min(salary)
from employees;

--최종

select first_name,
		salary,
		employee_id
from employees
where salary = (select min(salary)
					  from employees);
					 
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
--평균
select avg(salary) 
from employees;

--출력용 쿼리
select		first_name,
			salary
from employees
where salary <= (select avg(salary) 
						from employees)
order by salary desc;

/**************************************
*SubQuery
***************************************/
------------------------------------------------------------------
--*단일행 SubQuery

--‘Den’ 보다 급여를 많은 사람의 이름과 급여는?
select  first_name,
        salary
from employees
where salary >= (select  salary
                 from employees
                 where first_name = 'Den');

--Den의 급여를 구한다
select  salary   
from employees
where first_name = 'Den';    --11000



--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary = (select  min(salary)
                from employees);
--가장 작은 급여를 구한다
select  min(salary)  
from employees;


--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
select  first_name,
        salary
from employees
where salary <= (select avg(salary)
                 from employees); --평균급여

--평균급여
select avg(salary)
from employees;

------------------------------------------------------------------
--*다중행 SubQuery

--??  부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--12008, 8300
select salary
from employees
where department_id = 110;

--비교용
select  employee_id,
        first_name,
        salary
from employees
where salary = 12008
or salary = 8300 ;

--사용
select employee_id,
       first_name,
       salary
from employees
where salary in (select salary
                 from employees
                 where department_id = 110);  --12008, 8300







