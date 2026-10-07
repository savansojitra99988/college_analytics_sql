-- 1. Categorize courses by price

SELECT
    title,
    fee,
    CASE
        WHEN fee >= 5000 THEN 'Premium'
        WHEN fee >= 3000 THEN 'Standard'
        ELSE 'Budget'
    END AS price_category
FROM courses;


-- 2. Handle missing department

SELECT
    name,
    COALESCE(department_id, 0) AS department_id
FROM users;


-- 3. Revenue by month

SELECT
    DATE_TRUNC('month', paid_at) AS month,
    SUM(amount) AS revenue
FROM payments
WHERE status = 'completed'
GROUP BY month
ORDER BY month;


-- 4. Rank courses by fee

SELECT
    title,
    fee,
    RANK() OVER (
        ORDER BY fee DESC
    ) AS fee_rank
FROM courses;


-- 5. Rank courses within instructor

SELECT
    instructor_id,
    title,
    fee,
    RANK() OVER (
        PARTITION BY instructor_id
        ORDER BY fee DESC
    ) AS instructor_course_rank
FROM courses;


-- 6. Running revenue

SELECT
    paid_at,
    amount,
    SUM(amount) OVER (
        ORDER BY paid_at
    ) AS running_revenue
FROM payments
WHERE status = 'completed';


-- 7. Previous payment

SELECT
    student_id,
    paid_at,
    amount,
    LAG(amount) OVER (
        PARTITION BY student_id
        ORDER BY paid_at
    ) AS previous_payment
FROM payments;


-- 8. Number students by department

SELECT
    d.name AS department,
    COUNT(u.id) AS total_students,
    RANK() OVER (
        ORDER BY COUNT(u.id) DESC
    ) AS department_rank
FROM departments d
LEFT JOIN users u
    ON d.id = u.department_id
    AND u.role = 'student'
GROUP BY d.id, d.name;
