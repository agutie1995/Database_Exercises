 -- Use DISTINCT to find the unique titles in the titles table
 	-- Update the previous query to sort the results alphabetically.
SELECT DISTINCT title
FROM titles
ORDER BY title ASC

-- Find query for employees whose last names start and end with 'E'
	-- Update query find just the unique last names that start and end with 'E' using GROUP BY
	-- Update previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'
SELECT last_name, first_name
FROM employees
WHERE (last_name LIKE 'E%'
	AND last_name LIKE '%e')
GROUP BY first_name, last_name;