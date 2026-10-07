<div align="center">

# 🎓 COLLEGE ANALYTICS SQL

### PostgreSQL • Data Analysis • Relational Thinking • Analytical SQL

<img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white">
<img src="https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=databricks&logoColor=white">
<img src="https://img.shields.io/badge/Data%20Analysis-FF6F00?style=for-the-badge&logo=googleanalytics&logoColor=white">
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white">

<br><br>

**Turning relational data into meaningful analytical insights using PostgreSQL.**

</div>

---

# 📌 About The Project

**College Analytics SQL** is a PostgreSQL-based database and analytics project that simulates a college management system.

Instead of learning SQL only through isolated syntax examples, this project applies SQL to realistic questions involving:

* 👨‍🎓 Students
* 👨‍🏫 Professors
* 🏢 Departments
* 📚 Courses
* 📝 Enrollments
* 💳 Payments
* 🏆 Certificates

The project demonstrates how SQL can be used to **store, connect, filter, transform, aggregate and analyze relational data**.

The main goal is to build a strong SQL foundation for the next stages of my journey:

```text
SQL
 ↓
Data Analysis
 ↓
Python + Pandas
 ↓
Statistics
 ↓
Machine Learning
 ↓
AI / ML Engineering
```

---

# 🎯 Project Goals

This project was created to practice SQL in a way that is closer to real-world data work.

### Main objectives

```text
┌───────────────────────────────────────────────┐
│                PROJECT GOALS                  │
├───────────────────────────────────────────────┤
│                                               │
│  🗄️  Design a relational database             │
│                                               │
│  🔗  Understand table relationships            │
│                                               │
│  🔍  Retrieve and filter useful data           │
│                                               │
│  📊  Perform analytical calculations           │
│                                               │
│  🔀  Combine data using JOINs                  │
│                                               │
│  🧠  Solve problems using subqueries & CTEs    │
│                                               │
│  📈  Practice analytical SQL                   │
│                                               │
│  🤖  Prepare data for future ML workflows      │
│                                               │
└───────────────────────────────────────────────┘
```

---

# 🏗️ Database Architecture

The database is designed around several related entities.

```text
                         ┌─────────────────┐
                         │   DEPARTMENTS   │
                         └────────┬────────┘
                                  │
                                  │ 1 : N
                                  ▼
                         ┌─────────────────┐
                         │      USERS      │
                         │                 │
                         │ Student         │
                         │ Professor       │
                         │ Admin           │
                         └───────┬─────────┘
                                 │
                   ┌─────────────┼──────────────┐
                   │             │              │
                   ▼             ▼              ▼
             ┌──────────┐  ┌───────────┐  ┌──────────────┐
             │ COURSES  │  │ PAYMENTS  │  │ CERTIFICATES │
             └────┬─────┘  └───────────┘  └──────────────┘
                  │
                  │
                  ▼
          ┌────────────────┐
          │  ENROLLMENTS   │
          └────────────────┘
```

### Core relationships

| Table          | Purpose                                |
| -------------- | -------------------------------------- |
| `departments`  | Stores academic departments            |
| `users`        | Stores students, professors and admins |
| `courses`      | Stores available courses               |
| `enrollments`  | Connects students with courses         |
| `payments`     | Stores student payment information     |
| `certificates` | Stores course certificate records      |

---

# 🧩 Database Features

The database demonstrates several important PostgreSQL concepts.

### Constraints

```text
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
CHECK
```

### Relationships

```text
One-to-Many
Many-to-Many
```

### PostgreSQL Features

```text
SERIAL
BIGSERIAL
UUID
JSONB
TIMESTAMP
NUMERIC
```

### Referential Integrity

```text
ON DELETE CASCADE
ON DELETE SET NULL
```

---

# 📂 Project Structure

```text
college_analytics_sql/
│
├── README.md
│
├── database/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   └── 03_constraints.sql
│
├── queries/
│   ├── 01_basic_queries.sql
│   ├── 02_filtering.sql
│   ├── 03_sorting_pagination.sql
│   ├── 04_joins.sql
│   ├── 05_aggregation.sql
│   ├── 06_subqueries.sql
│   ├── 07_ctes.sql
│   └── 08_advanced_analytics.sql
│
└── screenshots/
```

---

# 🧠 SQL Concepts Covered

## 01 — Database Design

```text
CREATE TABLE
DROP TABLE
ALTER TABLE
```

Data types:

```text
INTEGER
VARCHAR
NUMERIC
BOOLEAN
TIMESTAMP
JSONB
UUID
```

Constraints:

```text
PRIMARY KEY
FOREIGN KEY
UNIQUE
NOT NULL
CHECK
```

---

## 02 — Basic Queries

```sql
SELECT
DISTINCT
AS
```

Example:

```sql
SELECT
    name AS "Full Name",
    email AS "Contact Email",
    role AS "User Role"
FROM users;
```

---

## 03 — Filtering

```text
WHERE
AND
OR
IN
BETWEEN
LIKE
ILIKE
IS NULL
IS NOT NULL
```

Example:

```sql
SELECT
    name,
    email
FROM users
WHERE role = 'student'
AND is_active = TRUE;
```

---

# 🔀 JOINs

One of the most important parts of the project.

Implemented:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
CROSS JOIN
```

Example:

```sql
SELECT
    u.name AS student,
    c.title AS course
FROM users u
INNER JOIN enrollments e
    ON u.id = e.student_id
INNER JOIN courses c
    ON e.course_id = c.id;
```

This allows the database to answer questions across multiple related tables.

---

# 📊 Aggregation & Analytics

The project uses:

```text
COUNT()
SUM()
AVG()
MIN()
MAX()
GROUP BY
HAVING
```

Example:

```sql
SELECT
    status,
    SUM(amount) AS total_amount
FROM payments
GROUP BY status;
```

This can answer questions such as:

> How much revenue is completed, pending or failed?

---

# 🧮 Subqueries

Subqueries are used when one query depends on the result of another query.

Example:

```sql
SELECT
    title,
    fee
FROM courses
WHERE fee > (
    SELECT AVG(fee)
    FROM courses
);
```

### Analytical question

> Which courses are more expensive than the average course fee?

---

# 🧱 Common Table Expressions

CTEs are used to make complex analytical queries easier to understand.

Example:

```sql
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
```

---

# 📈 Advanced Analytical SQL

The project is being expanded toward analytical SQL techniques used in Data Science.

Current / planned concepts include:

```text
CASE WHEN
COALESCE
DATE_TRUNC
Window Functions
ROW_NUMBER()
RANK()
DENSE_RANK()
LAG()
LEAD()
PARTITION BY
Running Totals
```

Example:

```sql
SELECT
    title,
    fee,
    RANK() OVER (
        ORDER BY fee DESC
    ) AS fee_rank
FROM courses;
```

---

# 🔎 Business Questions

Instead of writing SQL only to practice syntax, this project uses SQL to answer realistic questions.

## 👨‍🎓 Student Analysis

```text
• How many active students are there?
• Which students are enrolled in multiple courses?
• Which students have never enrolled?
• Which students spend the most?
• Which students are inactive?
```

## 📚 Course Analysis

```text
• Which courses are the most expensive?
• Which courses have the highest enrollment?
• Which courses are above average price?
• Which courses have no students?
• Which instructors teach premium courses?
```

## 💰 Revenue Analysis

```text
• What is the total completed revenue?
• Which student has spent the most?
• What is the average payment?
• Which payment status has the highest amount?
• How does revenue change over time?
```

## 🏢 Department Analysis

```text
• Which department has the most students?
• Which department has the highest user count?
• Which departments have more than a given number of users?
• How are users distributed across departments?
```

---

# 🧪 Data Analysis Examples

### Highest-Spending Students

```sql
SELECT
    u.name AS student,
    SUM(p.amount) AS total_spent
FROM users u
INNER JOIN payments p
    ON u.id = p.student_id
WHERE u.is_active = TRUE
AND p.status = 'completed'
GROUP BY u.id, u.name
HAVING SUM(p.amount) > 5000
ORDER BY total_spent DESC;
```

### Above-Average Courses

```sql
SELECT
    title,
    fee
FROM courses
WHERE fee > (
    SELECT AVG(fee)
    FROM courses
)
ORDER BY fee DESC;
```

### Students Without Enrollment

```sql
SELECT
    u.name,
    u.email
FROM users u
LEFT JOIN enrollments e
    ON u.id = e.student_id
WHERE u.role = 'student'
AND e.id IS NULL;
```

---

# 🤖 Connection to Data Science & Machine Learning

SQL is not only a database language.

For Data Science and ML workflows, SQL can be used to prepare the dataset before it reaches Python.

For example:

```text
             PostgreSQL
                  │
                  ▼
          Data Extraction
                  │
                  ▼
           Data Cleaning
                  │
                  ▼
        Feature Engineering
                  │
                  ▼
              Pandas
                  │
                  ▼
             EDA / Stats
                  │
                  ▼
         Machine Learning
```

A future feature-engineering query could generate:

```text
student_id
total_courses
total_spending
average_payment
last_payment_date
number_of_payments
active_status
```

These features could then be exported into Python for further analysis or machine learning.

---

# 🛠️ Technology Stack

<div align="center">

<img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white">
<img src="https://img.shields.io/badge/SQL-336791?style=flat-square&logo=databricks&logoColor=white">
<img src="https://img.shields.io/badge/Git-181717?style=flat-square&logo=git&logoColor=white">
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white">

</div>

---

# 🚀 How To Run

## 1. Install PostgreSQL

Install PostgreSQL and open:

```text
pgAdmin
```

or use the PostgreSQL command-line client.

## 2. Create a database

```sql
CREATE DATABASE college_analytics;
```

## 3. Connect to the database

```text
college_analytics
```

## 4. Run the SQL files in order

```text
01_create_tables.sql
        ↓
02_insert_data.sql
        ↓
03_constraints.sql
        ↓
01_basic_queries.sql
        ↓
02_filtering.sql
        ↓
03_sorting_pagination.sql
        ↓
04_joins.sql
        ↓
05_aggregation.sql
        ↓
06_subqueries.sql
        ↓
07_ctes.sql
        ↓
08_advanced_analytics.sql
```

---

# 📚 Learning Progress

This project represents my progression through SQL.

```text
                    SQL
                     │
                     ▼
              Database Design
                     │
                     ▼
               SELECT & CRUD
                     │
                     ▼
                 Filtering
                     │
                     ▼
             Sorting & Pagination
                     │
                     ▼
                   JOINs
                     │
                     ▼
              Aggregation
                     │
                     ▼
               Subqueries
                     │
                     ▼
                   CTEs
                     │
                     ▼
          Advanced Analytical SQL
                     │
                     ▼
           Feature Engineering
                     │
                     ▼
                Data Science
                     │
                     ▼
             Machine Learning
```

---

# 🗺️ Future Roadmap

This project will continue evolving as my Data Science and ML skills improve.

### SQL

```text
✅ Database Design
✅ CRUD
✅ Filtering
✅ Sorting
✅ JOINs
✅ Aggregation
✅ Subqueries
✅ CTEs
🔄 Window Functions
🔄 Advanced Date Analysis
🔄 Feature Engineering
```

### Data Science

```text
✅ NumPy
🔄 Pandas
🔄 Matplotlib
🔄 Seaborn
🔄 Statistics
```

### Machine Learning

```text
🔜 Data Cleaning
🔜 Feature Engineering
🔜 Regression
🔜 Classification
🔜 Model Evaluation
🔜 ML Projects
```

### AI / ML Engineering

```text
🔜 Machine Learning
🔜 Deep Learning
🔜 APIs
🔜 Model Deployment
🔜 Docker
🔜 Cloud
🔜 AI Systems
```

---

# 📸 Project Screenshots

Screenshots of important queries and analytical results will be added here.

```text
screenshots/
│
├── database_schema.png
├── student_analysis.png
├── course_analysis.png
├── revenue_analysis.png
└── advanced_queries.png
```

---

# 💡 Key Takeaways

Through this project, I practiced how to:

```text
✓ Design relational databases
✓ Create meaningful table relationships
✓ Maintain data integrity
✓ Query relational data
✓ Filter and transform information
✓ Combine multiple tables
✓ Perform aggregations
✓ Solve analytical problems
✓ Use subqueries and CTEs
✓ Prepare data for future Data Science workflows
```

The main focus is not simply writing SQL syntax.

It is learning to think:

> **"What question does the data need to answer, and how can SQL produce that answer?"**

---

# 🔥 What's Next?

The next stage is to connect this SQL project with Python.

```text
PostgreSQL
     │
     ▼
SQL Analytics
     │
     ▼
Python
     │
     ▼
Pandas + NumPy
     │
     ▼
Matplotlib + Seaborn
     │
     ▼
Statistical Analysis
     │
     ▼
Machine Learning
```

The long-term goal is to transform this project from a database exercise into a complete **Data Analytics → Machine Learning pipeline**.

---

<div align="center">

### 🧠 Learn → Query → Analyze → Build → Improve

**Built as part of my journey toward Data Science, Machine Learning & AI Engineering.**

<br>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F2027,50:2C5364,100:00C9A7&height=120&section=footer">

</div>
