 -- Use DISTINCT to find the unique titles in the titles table
 	-- Update the previous query to sort the results alphabetically.
SELECT DISTINCT title
FROM titles
ORDER BY title ASC

-- Find query for employees whose last names start and end with 'E'
	-- Update query find just the unique last names that start and end with 'E' using GROUP BY
	-- Update previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'
SELECT concat(first_name, ' ', last_name) AS full_name
FROM employees
WHERE (last_name LIKE 'E%'
	AND last_name LIKE '%e')
GROUP BY full_name;

-- Find the unique last names with a 'q' but not 'qu'. You may use either DISTINCT or GROUP BY
SELECT last_name
FROM employees
WHERE (last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%')
GROUP BY last_name;