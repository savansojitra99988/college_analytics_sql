-- 1. Find active users

SELECT
    name,
    email,
    role
FROM users
WHERE is_active = TRUE;


-- 2. Find professors

SELECT
    name,
    email
FROM users
WHERE role = 'professor';


-- 3. Find premium courses

SELECT
    title,
    fee
FROM courses
WHERE fee >= 4000;


-- 4. Find users from selected departments

SELECT
    name,
    department_id
FROM users
WHERE department_id IN (1, 2, 3);


-- 5. Find courses between 2500 and 4000

SELECT
    title,
    fee
FROM courses
WHERE fee BETWEEN 2500 AND 4000;


-- 6. Search users by last name

SELECT
    name,
    email
FROM users
WHERE name ILIKE '%sharma%';


-- 7. Find inactive students

SELECT
    name,
    email
FROM users
WHERE role = 'student'
AND is_active = FALSE;


-- 8. Find users without departments

SELECT
    name,
    role
FROM users
WHERE department_id IS NULL;


-- 9. Find users created in February

SELECT
    name,
    created_at
FROM users
WHERE created_at >= '2026-02-01'
AND created_at < '2026-03-01';
