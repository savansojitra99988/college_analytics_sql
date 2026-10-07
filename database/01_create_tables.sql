DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS enrollments CASCADE;
DROP TABLE IF EXISTS certificates CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL
        CHECK (role IN ('student', 'professor', 'admin')),
    department_id INT
        REFERENCES departments(id)
        ON DELETE SET NULL,
    metadata JSONB,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    fee NUMERIC(8, 2) NOT NULL
        CHECK (fee >= 0),
    instructor_id INT
        REFERENCES users(id)
        ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE enrollments (
    id BIGSERIAL PRIMARY KEY,
    student_id INT NOT NULL
        REFERENCES users(id)
        ON DELETE CASCADE,
    course_id INT NOT NULL
        REFERENCES courses(id)
        ON DELETE CASCADE,
    enrolled_on TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL
        REFERENCES users(id)
        ON DELETE CASCADE,
    amount NUMERIC(8, 2) NOT NULL
        CHECK (amount > 0),
    status VARCHAR(50) NOT NULL
        CHECK (status IN ('pending', 'completed', 'failed')),
    paid_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE certificates (
    id UUID PRIMARY KEY DEFAULT UUIDV7(),
    student_id INT
        REFERENCES users(id)
        ON DELETE CASCADE,
    course_id INT
        REFERENCES courses(id)
        ON DELETE CASCADE,
    issued_on TIMESTAMP DEFAULT NOW()
);
