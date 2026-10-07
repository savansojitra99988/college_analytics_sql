INSERT INTO departments (name)
VALUES
    ('Computer Science'),
    ('Mechanical Engineering'),
    ('Electronics & Communication'),
    ('Business Administration'),
    ('Basic Sciences');

INSERT INTO users
    (name, email, role, department_id, metadata, is_active, created_at)
VALUES
    ('Rahul Sharma', 'rahul.s@student.com', 'student', 1,
     '{"year": 2, "skills": ["C++", "SQL"]}', TRUE, '2026-01-10'),

    ('Priya Singh', 'priya.s@student.com', 'student', 1,
     '{"year": 3, "skills": ["Java", "SQL"]}', TRUE, '2026-01-15'),

    ('Amit Patel', 'amit.p@student.com', 'student', 2,
     '{"year": 2, "skills": ["C", "CAD"]}', TRUE, '2026-01-20'),

    ('Sneha Joshi', 'sneha.j@student.com', 'student', 1,
     '{"year": 3, "skills": ["Python", "ML"]}', TRUE, '2026-01-25'),

    ('Vikram Shah', 'vikram.s@student.com', 'student', 2,
     '{"year": 1, "skills": ["C", "MATLAB"]}', TRUE, '2026-02-01'),

    ('Pooja Mehta', 'pooja.s@student.com', 'student', 3,
     '{"year": 2, "skills": ["JavaScript"]}', FALSE, '2026-02-05'),

    ('Neha Thapa', 'neha.s@student.com', 'student', 4,
     '{"year": 3, "skills": ["Marketing"]}', TRUE, '2026-02-10'),

    ('Rohan Sharma', 'rohan.s@student.com', 'student', 1,
     '{"year": 2, "skills": ["Python", "SQL"]}', TRUE, '2026-02-15'),

    ('Ananya Patel', 'ananya.s@student.com', 'student', 5,
     '{"year": 1, "skills": ["Mathematics"]}', TRUE, '2026-02-20'),

    ('Birat Thapa', 'birat.s@student.com', 'student', 1,
     '{"year": 3, "skills": ["PostgreSQL"]}', FALSE, '2026-02-25'),

    ('Prof. Sunita Sharma', 'sunita@college.com', 'professor', 1,
     '{"experience": 12}', TRUE, '2026-01-05'),

    ('Prof. Raj Patel', 'raj@college.com', 'professor', 2,
     '{"experience": 8}', TRUE, '2026-01-06'),

    ('Prof. Meera Shah', 'meera@college.com', 'professor', 3,
     '{"experience": 10}', TRUE, '2026-01-07'),

    ('Prof. Amit Joshi', 'amit.j@college.com', 'professor', 4,
     '{"experience": 6}', FALSE, '2026-01-08'),

    ('Admin Neel Desai', 'neel@college.com', 'admin', NULL,
     '{"access": "full"}', TRUE, '2026-01-01');

INSERT INTO courses
    (title, fee, instructor_id)
VALUES
    ('Advanced PostgreSQL', 4999.00, 11),
    ('Data Structures', 2999.00, 11),
    ('Machine Learning', 5999.00, 11),
    ('MERN Stack Development', 4500.00, 13),
    ('Engineering Thermodynamics', 3500.00, 12),
    ('Fluid Mechanics', 2800.00, 12),
    ('Digital Logic', 3200.00, 13),
    ('Business Analytics', 4000.00, 14);

INSERT INTO enrollments (student_id, course_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 4),
    (3, 5),
    (3, 2),
    (4, 3),
    (5, 5),
    (6, 6),
    (7, 8),
    (8, 1),
    (8, 2),
    (9, 8),
    (10, 1),
    (10, 3);

INSERT INTO payments
    (student_id, amount, status, paid_at)
VALUES
    (1, 4999.00, 'completed', '2026-02-10'),
    (1, 5999.00, 'completed', '2026-02-15'),
    (2, 4500.00, 'completed', '2026-02-20'),
    (3, 2999.00, 'pending', '2026-02-21'),
    (3, 3500.00, 'completed', '2026-02-22'),
    (4, 5999.00, 'completed', '2026-03-01'),
    (5, 3500.00, 'completed', '2026-03-03'),
    (6, 2800.00, 'failed', '2026-03-05'),
    (7, 4000.00, 'completed', '2026-03-07'),
    (8, 4999.00, 'completed', '2026-03-10'),
    (8, 2999.00, 'completed', '2026-03-11'),
    (9, 4000.00, 'pending', '2026-03-15'),
    (10, 4999.00, 'completed', '2026-03-18');

INSERT INTO certificates (student_id, course_id)
VALUES
    (1, 1),
    (4, 3),
    (8, 2),
    (10, 1);
