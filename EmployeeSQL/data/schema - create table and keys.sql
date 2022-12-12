-- create deparments table
CREATE TABLE "departments" (
    dept_no varchar NOT NULL,
    dept_name varchar NOT NULL
     );

-- create dept_emp table
CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar NOT NULL
);

-- create dept_manager table
CREATE TABLE dept_manager (
    dept_no varchar NOT NULL,
    emp_no int NOT NULL
);

-- create employees table
CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date date NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    sex varchar NOT NULL,
    hire_date date NOT NULL
);

-- create salaries table
CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL
);

-- create titles table
CREATE TABLE titles (
    title_id varchar NOT NULL,
    title varchar NOT NULL
);


-- alter departments by adding primary key
alter table departments
add primary key (dept_no);

-- alter dept_manager by adding primary key and foreign key
alter table dept_manager
add primary key (emp_no),
add foreign key (dept_no) references departments(dept_no);

-- alter titles by adding primary key and foreign key
alter table titles
add primary key (title_id);

-- alter employee by adding primary key and foreign key
alter table employees
add primary key (emp_no),
add foreign key (emp_title_id) references titles(title_id);

-- alter salaries by adding primary key and foreign key
alter table salaries
add primary key (emp_no),
add foreign key (emp_no) references employees(emp_no);

-- alter dept_emp by creating a composite key
alter table dept_emp
add primary key(emp_no,dept_no),
add foreign key (emp_no) references employees(emp_no),
add foreign key (dept_no) references departments(dept_no);