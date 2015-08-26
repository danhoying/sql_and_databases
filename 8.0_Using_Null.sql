# Question 1
SELECT teacher.name
FROM teacher
LEFT JOIN dept ON (dept = dept.id)
WHERE dept IS NULL;

# Question 2
SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept ON (teacher.dept = dept.id)

# Question 3
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept ON (teacher.dept = dept.id);

# Question 4
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept ON (teacher.dept = dept.id);

# Question 5
SELECT teacher.name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

# Question 6
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON (teacher.dept = dept.id);

# Question 7
SELECT COUNT(teacher.name), COUNT(teacher.mobile)
FROM teacher;

# Question 8
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept ON (dept.id = teacher.dept)
GROUP BY dept.name;

# Question 9
SELECT teacher.name, CASE
  WHEN teacher.dept = 1 THEN 'Sci'
  WHEN teacher.dept = 2 THEN 'Sci'
  ELSE 'Art' END
FROM teacher
LEFT JOIN dept ON (dept.id = teacher.dept);

# Question 10
SELECT teacher.name, CASE
  WHEN teacher.dept = 1 THEN 'Sci'
  WHEN teacher.dept = 2 THEN 'Sci'
  WHEN teacher.dept = 3 THEN 'Art'
  ELSE 'None' END
FROM teacher
LEFT JOIN dept ON (dept.id = teacher.dept);
