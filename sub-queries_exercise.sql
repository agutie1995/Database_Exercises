-- Find all the employees with the same hire date as employee 101010 using a sub-query.
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date IN (
	SELECT hire_date
	FROM employees
	WHERE emp_no = '101010')
ORDER BY last_name;

-- Find all the titles held by all employees with the first name Aamod;
	-- can add DISTINCT or GROUP BY to avoid multiples, output 6 rows
-- historically
SELECT title
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod')
GROUP BY title
ORDER BY title;

-- curently
SELECT title
FROM titles
WHERE to_date >= now() AND emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod')
ORDER BY title;


-- Find all the department managers that are female.
-- historically
SELECT last_name, first_name
FROM employees
WHERE gender = 'F' AND emp_no IN (
	SELECT emp_no
	FROM titles
	WHERE title = 'Manager')
ORDER BY last_name;

-- currently
SELECT last_name, first_name
FROM employees
WHERE gender = 'F' AND emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date >= now())
ORDER BY last_name;


-- BONUS Find all the department names that have female managers.
-- historically
SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_manager
	WHERE emp_no IN
		(SELECT emp_no
		FROM employees
		WHERE gender = 'F')
	);

-- currently
SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_manager
	WHERE to_date >= now() AND emp_no IN
		(SELECT emp_no
		FROM employees
		WHERE gender = 'F')
	);
