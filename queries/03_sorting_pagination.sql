-- 1. Alphabetical user directory

SELECT
    id,
    name,
    email
FROM users
ORDER BY name ASC;


-- 2. Most expensive courses

SELECT
    title,
    fee
FROM courses
ORDER BY fee DESC;


-- 3. Top 3 expensive courses

SELECT
    title,
    fee
FROM courses
ORDER BY fee DESC
LIMIT 3;


-- 4. Sort users by role and name

SELECT
    role,
    name
FROM users
ORDER BY role ASC, name ASC;


-- 5. Page 1

SELECT
    id,
    name,
    email
FROM users
ORDER BY id
LIMIT 5;


-- 6. Page 2

SELECT
    id,
    name,
    email
FROM users
ORDER BY id
LIMIT 5 OFFSET 5;


-- 7. Page 3

SELECT
    id,
    name,
    email
FROM users
ORDER BY id
LIMIT 5 OFFSET 10;
