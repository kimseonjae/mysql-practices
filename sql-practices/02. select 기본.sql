-- Like 검색
select *
from employees
where first_name like 'p%';

select *
from employees
where first_name like 'p___';



-- salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
select emp_no, salary
from salaries
where from_date like '2001-%'
order by salary desc;

select emp_no, salary
from salaries
where from_date between '2000-12-31' and '2002-01-01';

-- employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
select concat(first_name, ' ', last_name) as '이름',
		gender as '성별', hire_date as 입시일
from employees
where hire_date < '1991-01-01';

-- employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
select concat(first_name, ' ', last_name) as '이름', date_format(hire_date, '%Y년 %m월 %d일') as '입사일'
from employees
where gender ='F' and hire_date < '1989-01-01';




