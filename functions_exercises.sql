-- Update your query for 'Irena', 'Vidya', or 'Maya'.
	-- Use count(*) and GROUP BY to find the number of employees for each gender with those names
SELECT count(*), gender
FROM employees
WHERE(first_name ='Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya')
GROUP BY gender;

-- Update your queries for employees whose names start and/or end with 'E'.
	-- Use concat() to combine their first and last name together as a single column in your results
SELECT concat(last_name, ', ', first_name)
FROM employees
WHERE (last_name LIKE 'E%'
	OR last_name LIKE '%e')
ORDER BY emp_no DESC;

SELECT concat(last_name, ', ', first_name)
FROM employees
WHERE (last_name LIKE 'E%'
	AND last_name LIKE '%e');

-- For your query of employees born on Christmas and hired in the 90s
	-- Use datediff() to find how many days they have been working at the company
SELECT concat(first_name, ' ', last_name), datediff(now(), hire_date) AS 'Days Working at Company'
FROM employees
WHERE (hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25')
ORDER BY birth_date, hire_date DESC

-- Add a GROUP BY clause to find the distinct combination of first and last names
	-- Add a count() to your results and use ORDER BY to make it easier to find
			-- employees whose unusual name is shared with others
SELECT concat(first_name, ' ', last_name) AS full_name, count(*)
FROM employees
WHERE (last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%')
GROUP BY first_name, last_name
ORDER BY count(*) DESC;