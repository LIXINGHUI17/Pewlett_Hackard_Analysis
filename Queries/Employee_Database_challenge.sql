SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
From employees AS e
JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Order by e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
					first_name,
					last_name,
					title
INTO unique_title
FROM retirement_titles
ORDER BY emp_no, to_date DESC;


SELECT COUNT(title), title
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY COUNT(title) DESC;


SELECT DISTINCT ON (e.emp_no) e.emp_no,
	   				e.first_name,
	  				e.last_name,
	   				e.birth_date,
	   				de.from_date,
	   				de.to_date,
	   				t.title
INTO mentorship_eligibilty
FROM employees AS e
	JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
	JOIN titles AS t
	ON e.emp_no = t.emp_no
	WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT COUNT(emp_no)
FROM unique_title;

SELECT COUNT(emp_no)
FROM mentorship_eligibilty;
