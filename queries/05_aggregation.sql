-- 1. Total users

SELECT COUNT(*) AS total_users
FROM users;


-- 2. Active students

SELECT COUNT(*) AS active_students
FROM users
WHERE role = 'student'
AND is_active = TRUE;


-- 3. Total completed revenue

SELECT
    SUM(amount) AS total_revenue
FROM payments
WHERE status = 'completed';


-- 4. Average course fee

SELECT
    ROUND(AVG(fee), 2) AS average_course_fee
FROM courses;


-- 5. Cheapest and most expensive course

SELECT
    MIN(fee) AS minimum_fee,
    MAX(fee) AS maximum_fee
FROM courses;


-- 6. Users by role

SELECT
    role,
    COUNT(*) AS total_users
FROM users
GROUP BY role;


-- 7. Users by department

SELECT
    department_id,
    COUNT(*) AS total_users
FROM users
GROUP BY department_id
ORDER BY total_users DESC;


-- 8. Revenue by payment status

SELECT
    status,
    SUM(amount) AS total_amount
FROM payments
GROUP BY status
ORDER BY total_amount DESC;


-- 9. Courses with at least two students

SELECT
    c.title,
    COUNT(e.student_id) AS enrolled_students
FROM courses c
LEFT JOIN enrollments e
    ON c.id = e.course_id
GROUP BY c.id, c.title
HAVING COUNT(e.student_id) >= 2;


-- 10. Departments having more than 2 users

SELECT
    department_id,
    COUNT(*) AS total_users
FROM users
GROUP BY department_id
HAVING COUNT(*) > 2;
