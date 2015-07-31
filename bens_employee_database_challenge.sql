-- The name and title of all employees whose titles starts with "Senior" - 167,963 rows
SELECT e.first_name, e.last_name, t.title
FROM employees AS e
JOIN titles AS t
    ON t.emp_no = e.emp_no
WHERE t.to_date >= now() AND t.title LIKE 'Senior %';

-- Department and manager name where the manager is female
-- 4; development, finance, HR, research
SELECT e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
    ON de.emp_no = e.emp_no
JOIN titles AS t
    ON t.emp_no = e.emp_no
JOIN departments AS d
    ON d.dept_no = de.dept_no
WHERE t.to_date >= now() AND e.gender  = 'F' AND t.title = 'Manager';

-- current salaries for all managers
SELECT e.last_name, e.first_name, s.salary, t.title
FROM employees AS e
JOIN titles AS t
    ON t.emp_no = e.emp_no
JOIN salaries AS s
    ON s.emp_no = t.emp_no
WHERE t.title  = 'Manager' AND s.to_date >= now() AND t.to_date >= now()
ORDER BY last_name;

-- current average salary of each title
-- min: assistant engineer - 57317, max: senior staff - 80706
SELECT t.title,
AVG (s.salary) AS average_salary
FROM salaries AS s
JOIN titles AS t
    ON t.emp_no = s.emp_no
WHERE s.to_date >= now() AND t.to_date >= now()
GROUP BY t.title
ORDER BY average_salary;

-- select every employee's first name, last name, department name, and the
    -- first and last name of their manager. Sort by department name,
-- employee last name, employee first name. - 240,124 rows
SELECT e.first_name, e.last_name, d.dept_name, m.first_name AS manager_firstname, m.last_name AS manager_lastname
FROM employees AS e
JOIN dept_emp AS de
    ON de.emp_no = e.emp_no
JOIN departments AS d
    ON d.dept_no = de.dept_no
JOIN dept_manager AS dm
    ON dm.dept_no = d.dept_no
JOIN employees AS m
    ON m.emp_no = dm.emp_no
WHERE dm.to_date >= now() AND de.to_date >= now()
ORDER BY d.dept_name, e.last_name, e.first_name;