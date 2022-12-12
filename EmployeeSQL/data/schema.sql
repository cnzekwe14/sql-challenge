-- List the employee number, last name, first name, sex
-- and salary of each employee

select e.emp_no, e.first_name,e.last_name,e.sex
from employees as e;

--List the first name, last name and hire date for 
-- the employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees as e
where e.hire_date between '1/1/1986' and '12/31/1986';

-- List the manager of each department along with their department number,
--department name, employee number, last name and first name
select e.emp_no,e.first_name,e.last_name,dm.dept_no,dd.dept_name
from employees as e
join dept_manager as dm
on dm.emp_no = e.emp_no
join departments as dd
on dm.dept_no = dd.dept_no;

--List the department number for each employee along with that employee
--employee's number, last name, first name and department name
select e.emp_no, e.first_name, e.last_name, de.dept_no,dd.dept_name
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as dd
on de.dept_no = dd.dept_no;

--List first name, last name, and sex of each employee whose first name is 
--Hercules and whose last name begins with letter B
select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%';


--List each employee in the Sales department, including their employee number,
--last name, and first name.
select e.emp_no,e.first_name,e.last_name,
(select dd.dept_name from
departments as dd
where dd.dept_name = 'Sales')
from employees as e 
where e.emp_no in 
(select de.emp_no
 from dept_emp as de
 where de.dept_no in
 (select dd.dept_no
  from departments as dd
  where dd.dept_name = 'Sales')
 );
 
--List each employee in the Sales and Development departments,
--including their employee number,last name, first name and department name.

select e.emp_no,e.last_name, e.first_name, dd.dept_name
from employees as e
join dept_emp as de
on de.emp_no = e.emp_no
join departments as dd
on dd.dept_no = de.dept_no
where dd.dept_name = 'Sales' or dd.dept_name = 'Development';


-- List the frequency counts, in descending order, of all the employee 
--last names (that is, how many employees share each last name).
select e.last_name,count(e.first_name)
from employees as e
group by e.last_name
having count(e.first_name)>1
order by e.last_name desc;