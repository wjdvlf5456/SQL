/*
문제 1.
전체직원의 다음 정보를 조회하세요. 정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선
임부터 출력이 되도록 하세요. 이름(first_name last_name), 월급(salary), 전화번호
(phone_number), 입사일(hire_date) 순서이고 “이름”, “월급”, “전화번호”, “입사일” 로 컬럼이
름을 대체해 보세요.
*/
SELECT first_name, last_name "이음",
        salary "월급",
        phone_number "전화번호",
        hire_date "입사일"
FROM
employees;

/*
문제2.
업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 월급의 내림차순(DESC)로 정렬
하세요.
 */
SELECT job_title "업무이름",
        max_salary "최고월급"
from jobs
order by max_salary desc;

/*
문제3.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저 아이디, 커미션 비율, 월급 을 출력하세요.
*/

SELECT first_name ,last_name ,manager_id ,commission_pct ,salary 
FROM 
employees
WHERE commission_pct  ISNULL
AND salary  >=3000;

/*
문제4.
최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)을 최 고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.
 */
SELECT job_title ,max_salary 
FROM
jobs
ORDER BY max_salary DESC ;



