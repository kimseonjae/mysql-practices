-- 현재 근무하고 있는 직원의 이름과 직책을 직원 이름 순으로 출력하세요.
select a.first_name, b.title
from employees a, titles b
where a.emp_no = b.emp_no -- join condition
and b.to_date='9999-01-01' 
and a.gender ='F' -- select condition
order by a.first_name;

-- 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하세요.
select d2.dept_name, d1.dept_no, avg(s.salary)
from dept_emp d1, salaries s, titles t, departments d2
where  d1.dept_no = d2.dept_no and d1.emp_no = s.emp_no 
and s.emp_no = t.emp_no -- join condition
and d1.to_date = '9999-01-01'	
and s.to_date = '9999-01-01'
and t.to_date = '9999-01-01' 
and t.title = 'Engineer' -- select condition
group by d1.dept_no
order by avg(s.salary) desc;

-- 현재, 직책별로 급여의 총합을 구하되 Engineer 직책은 제외 하세요.alter
-- 단, 총합이 2,000,000,000 이상인 직책만 나타내며 급여의 통합에 대해서는 내림차순(DESC)으로 정렬 하세요.
select d1.dept_name, d2.dept_no, sum(s.salary)
from departments d1, dept_emp d2, titles t, salaries s
where d1.dept_no = d2.dept_no and d2.emp_no = s.emp_no
and s.emp_no = t.emp_no
and d2.to_date = '9999-01-01'
and t.title <> 'Engineer'
group by d2.dept_no
having sum(s.salary) >= 2000000000
order by sum(s.salary) desc;