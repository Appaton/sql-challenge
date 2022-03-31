-- Salary by emps
SELECT  emps.emp_no,
        emps.last_name,
        emps.first_name,
        emps.sex,
        sals.salary
FROM employees as emps
    LEFT JOIN salaries as sals
    ON (emps.emp_no = sals.emp_no)
ORDER BY emps.emp_no;

-- Employee.....yr 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Mngr
SELECT  mngr.dept_no,
        dept.dept_name,
        mngr.emp_no,
        emp.last_name,
        emp.first_name
FROM dept_manager AS mngr
    INNER JOIN departments AS dept
        ON (mngr.dept_no = dept.dept_no)
    INNER JOIN employees AS emp
        ON (mngr.emp_no = emp.emp_no);


-- Dept
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        dept.dept_name
FROM employees AS emp
    INNER JOIN dept_emp AS depte
        ON (emp.emp_no = depte.emp_no)
    INNER JOIN departments AS dept
        ON (depte.dept_no = dept.dept_no)
ORDER BY emp.emp_no;

-- Hercules B.
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Sales Emps
SELECT  emps.emp_no,
        emps.last_name,
        emps.first_name,
        dept.dept_name
FROM employees AS emps
    INNER JOIN dept_emp AS depte
        ON (emps.emp_no = depte.emp_no)
    INNER JOIN departments AS dept
        ON (depte.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales'
ORDER BY emps.emp_no;

-- Sales and Dev Emps
SELECT  emps.emp_no,
        emps.last_name,
        emps.first_name,
        dept.dept_name
FROM employees AS emps
    INNER JOIN dept_emp AS depte
        ON (emps.emp_no = depte.emp_no)
    INNER JOIN departments AS dept
        ON (depte.dept_no = dept.dept_no)
WHERE dept.dept_name IN ('Sales', 'Development')
ORDER BY emps.emp_no;

-- Last Name Counts
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
