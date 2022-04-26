SELECT e.emp_no,
    e.first_name,
	e.last_name,
	s.title,
	s.from_date,
	s.to_date
INTO retirement_titles
FROM employees as e
	JOIN titles as s
		ON (e.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)rt.emp_no,
    rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title

SELECT e.emp_no,
    e.first_name,
e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
    s.title
INTO emp_mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as s
ON (e.emp_no = s.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
