--Imported tables
--select * from dept_emp
--select * from departments
--select * from dept_manager
--select * from titles
--select * from employees
--select * from salaries

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no employee_number, 
		e.last_name, 
		e.first_name, 
		e.gender, salary
from employees as e
left join salaries as s
	on s.emp_no = e.emp_no;*/

	
--2. List employees who were hired in 1986.
select first_name,
		last_name 
from employees
WHERE hire_date >= '1986-01-01'
limit 10;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
select e.emp_no employee_number, 
		e.last_name, 
		e.first_name, 
		dept.dept_name department_name,
		dept.dept_no department_number,
		d.from_date start_date,
		d.to_date end_date
from
   employees as e
INNER JOIN dept_manager as d ON d.emp_no = e.emp_no
INNER JOIN departments as dept ON d.dept_no = dept.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no employee_number, 
		e.last_name, 
		e.first_name, 
		dept.dept_name department_name
from
   employees as e
INNER JOIN dept_manager as d ON d.emp_no = e.emp_no
INNER JOIN departments as dept ON d.dept_no = dept.dept_no;
	
--5. List all employees whose first name is "Hercules" and last names begin with "B."
select * 
from employees 
where first_name = 'Hercules'and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employee_number, 
		last_name, 
		first_name, 
		department_name
from (select e.emp_no employee_number, 
		e.last_name, 
		e.first_name, 
		dept.dept_name department_name
	  from
		   employees as e
	 INNER JOIN dept_manager as d ON d.emp_no = e.emp_no
	 INNER JOIN departments as dept ON d.dept_no = dept.dept_no) as sales
where department_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employee_number, last_name, first_name, department_name
from (select e.emp_no employee_number, 
		e.last_name, 
		e.first_name, 
		dept.dept_name department_name
		from
   			employees as e
		INNER JOIN dept_manager as d ON d.emp_no = e.emp_no
		INNER JOIN departments as dept ON d.dept_no = dept.dept_no) as sales
where department_name = 'Sales' OR department_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select 
	last_name,
	count(last_name)
from 
	employees
group by 
	last_name
order by last_name desc;


