-- ex 1)
-- 현재 Fai Bale이 근무하는 부서의 전체 직원의 사번과 이름을 출력하세요.

-- 개별 쿼리로 해결 
-- 1. Fai Bale이 근무하는 부서를 알아야 한다.
select dept_no
from dept_emp d, employees e
where d.emp_no = e.emp_no
and d.to_date = '9999-01-01'
and concat(e.first_name, ' ', e.last_name) = 'Fai Bale';		

-- 2. 1번에서 얻은 부서를 이용해 부서 전체 지구언의 사번과 이름 출력
select d.emp_no, e.first_name
from dept_emp d, employees e 
where d.emp_no = e.emp_no
and d.to_date = '9999-01-01' 
and d.dept_no = 'd004';

-- 서브쿼리로 해결
select d.emp_no, e.first_name
from dept_emp d, employees e 
where d.emp_no = e.emp_no
and d.to_date = '9999-01-01' 
and d.dept_no = (select dept_no
					from dept_emp d, employees e
					where d.emp_no = e.emp_no
					and d.to_date = '9999-01-01'
					and concat(e.first_name, ' ', e.last_name) = 'Fai Bale');

-- where의 조건식에 서브쿼리를 사용할 경우
	-- 서브쿼리의 결과가 단일행인 경우: =, !=, >, <, >=, <=

-- ex 2)
-- 현재 전체 사원의 평균 연봉보다 적은 급여를 받는 사원들의 이름, 급여를 출력하세요.
select concat(e.first_name, ' ', e.last_name), s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and s.salary < (select avg(salary)
				from salaries
				where to_date='9999-01-01')
order by s.salary desc;

-- where의 조건식에 서브쿼리를 사용하고 결과가 다중행인 경우:
-- in(not in)
-- and: = any(in 동일), > any, < any, <> any(!=any), <= any, >= any
-- all: = all, > all, < all, <> all(!=all, not in), <= all, >= all

-- ex 3)
-- 현재 급여가 50000 이상인 직원의 이름과 급여를 출력
	-- join
select concat(e.first_name, ' ', e.last_name), s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and s.salary > 50000
order by s.salary;
	-- subquery
select e.first_name, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
and s.to_date = '9999-01-01'
and (e.emp_no, s.salary) = any (select emp_no, salary
									from salaries
									where to_date = '9999-01-01'
                                    and salary >= 50000)
order by s.salary;

-- ex 4)
-- 현재 가장 적은 평균급여의 직책과 그 평균급여를 출력해보세요.
select min(avg_salary)
from(select t.title, avg(salary) as avg_salary
		from salaries s, titles t
		where s.emp_no = t.emp_no
		and a.to_date = '9999-01-01'
		group by t.title) a