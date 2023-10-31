USE sampel_university;

-- Soal 1
SELECT student.name, department.dept_name
FROM student JOIN department ON student.dept_name = department.dept_name
ORDER BY department.dept_name ASC;

-- Soal 2
SELECT student.name, student.tot_cred, department.dept_name
FROM student JOIN department ON student.dept_name = department.dept_name
WHERE student.tot_cred > 100
ORDER BY student.tot_cred ASC;

-- Soal 3
SELECT student.name, instructor.name, instructor.dept_name
FROM student JOIN instructor ON student.dept_name = instructor.dept_name;