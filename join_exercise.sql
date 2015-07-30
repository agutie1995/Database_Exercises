-- run the SQL provided in the "Join Example DB" to create the same setup used for this lesson
CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null),
('jim', 'jim@example.com', 2),
('pam', 'pam@example.com', 2),
('dwight', 'dwight@example.com', 2),
('andy', 'andy@example.com', NULL);

-- use join
	-- get the seven users who have roles
SELECT users.name AS user_name, roles.name AS role_name
FROM users
JOIN roles ON users.role_id  = roles.id;

-- use join left
	-- get all users
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- use join right
	-- get all users/same as join left
SELECT users.name AS user_name, roles.name AS role_name
FROM roles
RIGHT JOIN users ON users.role_id = roles.id;

-- use count() and the appropriate JOIN type to get a list of roles along with the number of users that has the role
SELECT count(*), roles.name AS role_name
FROM roles
RIGHT JOIN users ON users.role_id = roles.id
GROUP BY roles.id;

-- write a query that shows each department along with the name of the current manager for that department
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
	ON de.emp_no = e.emp_no
JOIN titles as t
	ON t.emp_no = de.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE t.title  = 'Manager' AND t.to_date > now();