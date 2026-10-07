-- 1. Professors with departments

SELECT
    u.name AS professor,
    d.name AS department
FROM users u
INNER JOIN departments d
    ON u.department_id = d.id
WHERE u.role = 'professor';


-- 2. Professors and their courses

SELECT
    u.name AS professor,
    c.title AS course,
    c.fee
FROM users u
INNER JOIN courses c
    ON u.id = c.instructor_id;


-- 3. Students and their courses

SELECT
    u.name AS student,
    c.title AS course,
    e.enrolled_on
FROM users u
INNER JOIN enrollments e
    ON u.id = e.student_id
INNER JOIN courses c
    ON e.course_id = c.id;


-- 4. All students including students with no enrollment

SELECT
    u.name AS student,
    c.title AS course
FROM users u
LEFT JOIN enrollments e
    ON u.id = e.student_id
LEFT JOIN courses c
    ON e.course_id = c.id
WHERE u.role = 'student';


-- 5. Students with no enrollment

SELECT
    u.name,
    u.email
FROM users u
LEFT JOIN enrollments e
    ON u.id = e.student_id
WHERE u.role = 'student'
AND e.id IS NULL;


-- 6. All courses including courses with no students

SELECT
    c.title AS course,
    u.name AS student
FROM courses c
LEFT JOIN enrollments e
    ON c.id = e.course_id
LEFT JOIN users u
    ON e.student_id = u.id;


-- 7. Complete department-user audit

SELECT
    u.name AS user_name,
    d.name AS department
FROM users u
FULL OUTER JOIN departments d
    ON u.department_id = d.id;


-- 8. Cross join example

SELECT
    d.name AS department,
    c.title AS course
FROM departments d
CROSS JOIN courses c;
