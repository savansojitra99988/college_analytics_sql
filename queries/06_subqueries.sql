-- 1. Courses above average fee

SELECT
    title,
    fee
FROM courses
WHERE fee > (
    SELECT AVG(fee)
    FROM courses
);


-- 2. Users from engineering departments

SELECT
    name,
    email
FROM users
WHERE department_id IN (
    SELECT id
    FROM departments
    WHERE name ILIKE '%engineering%'
);


-- 3. Students who have made a payment

SELECT
    name,
    email
FROM users
WHERE id IN (
    SELECT student_id
    FROM payments
);


-- 4. Students whose spending is above average spending

SELECT
    name,
    email
FROM users
WHERE id IN (
    SELECT student_id
    FROM payments
    GROUP BY student_id
    HAVING SUM(amount) > (
        SELECT AVG(total_spending)
        FROM (
            SELECT
                student_id,
                SUM(amount) AS total_spending
            FROM payments
            WHERE status = 'completed'
            GROUP BY student_id
        ) spending
    )
);


-- 5. Courses more expensive than the average

SELECT
    title,
    fee
FROM courses
WHERE fee > (
    SELECT AVG(fee)
    FROM courses
);
