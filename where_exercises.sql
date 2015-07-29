-- Employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
	-- Now add a condition to find everybody with those names who is also male — 441 rows.
SELECT concat(first_name, ' ', last_name), gender
FROM employees
WHERE gender = 'M'
	AND (
	first_name ='Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya');

-- Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT concat(last_name, ', ', first_name)
FROM employees
WHERE (last_name LIKE 'E%'
	OR last_name LIKE '%e');

-- Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT concat(last_name, ', ', first_name)
FROM employees
WHERE (last_name LIKE 'E%'
	AND last_name LIKE '%e');

-- Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT concat(first_name, ' ', last_name), hire_date, birth_date
FROM employees
WHERE (hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25');

-- Employees hired in the 90s — 135,214 rows.
SELECT concat(first_name, ' ', last_name), hire_date
FROM employees
WHERE hire_date LIKE '199%';

-- Employees born on Christmas — 842 rows.
SELECT concat(first_name, ' ', last_name), birth_date
FROM employees
WHERE birth_date LIKE '%-12-25';

-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows
SELECT concat(first_name, ' ', last_name)
FROM employees
WHERE (last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%');

-- Employees with a 'q' in their last name — 1,873 rows.
SELECT concat(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE '%q%';