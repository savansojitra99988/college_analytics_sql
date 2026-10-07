-- 1. Average course fee using CTE

WITH AverageCourseFee AS (
    SELECT AVG(fee) AS avg_fee
    FROM courses
)
SELECT
    title,
    fee
FROM courses
WHERE fee > (
    SELECT avg_fee
    FROM AverageCourseFee
);


-- 2. Student spending

WITH StudentSpending AS (
    SELECT
        student_id,
        SUM(amount) AS total_spent
    FROM payments
    WHERE status = 'completed'
    GROUP BY student_id
)
SELECT
    u.name,
    s.total_spent
FROM users u
INNER JOIN StudentSpending s
    ON u.id = s.student_id
ORDER BY s.total_spent DESC;


-- 3. Active students

WITH ActiveStudents AS (
    SELECT
        id,
        name
    FROM users
    WHERE role = 'student'
    AND is_active = TRUE
),
PremiumCourses AS (
    SELECT
        id,
        title
    FROM courses
    WHERE fee >= 4000
)
SELECT
    a.name AS student,
    p.title AS course
FROM enrollments e
INNER JOIN ActiveStudents a
    ON e.student_id = a.id
INNER JOIN PremiumCourses p
    ON e.course_id = p.id;


-- 4. Department user counts

WITH DepartmentUsers AS (
    SELECT
        department_id,
        COUNT(*) AS total_users
    FROM users
    GROUP BY department_id
)
SELECT
    d.name AS department,
    du.total_users
FROM departments d
INNER JOIN DepartmentUsers du
    ON d.id = du.department_id
ORDER BY du.total_users DESC;
