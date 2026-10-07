-- 1. Display all users

SELECT *
FROM users;


-- 2. Display selected columns

SELECT
    id,
    name,
    email,
    role
FROM users;


-- 3. Rename columns

SELECT
    name AS "Full Name",
    email AS "Contact Email",
    role AS "User Role"
FROM users;


-- 4. Find unique roles

SELECT DISTINCT role
FROM users;


-- 5. Create user badges

SELECT
    'Profile: ' || role || ' - ' || name AS "User Badge"
FROM users;


-- 6. Display courses

SELECT
    id,
    title,
    fee
FROM courses;


-- 7. Calculate course fee with 13% tax

SELECT
    title,
    fee AS base_fee,
    fee * 1.13 AS total_fee
FROM courses;
