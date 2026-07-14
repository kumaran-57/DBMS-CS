# Ex 2

## Objective

To demonstrates how to create and manage a simple **University Database** using MySQL. It covers:

- Creating a database
- Creating tables with constraints
- Defining Primary Keys and Foreign Keys
- Using `ON DELETE CASCADE`
- Inserting sample data
- Viewing records
- Deleting records
- Dropping tables and database

---

# Step 1: Create Database

## Command

```sql
CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;
```

### Output

```
Query OK, 1 row affected

Database changed
```

---

# Step 2: Create Students Table

## Command

```sql
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
```

### Output

```
Query OK, 0 rows affected
```

---

# Step 3: Create Courses Table

## Command

```sql
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    CHECK (credits > 0 AND credits <= 6)
);
```

### Output

```
Query OK, 0 rows affected
```

---

# Step 4: Create Enrollments Table

## Command

```sql
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE),

    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    UNIQUE (student_id, course_id)
);
```

### Output

```
Query OK, 0 rows affected
```

---

# Step 5: Insert Data into Students

## Command

```sql
INSERT INTO students (name, email)
VALUES
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com');
```

### Output

```
Query OK, 2 rows affected
Records: 2
Duplicates: 0
Warnings: 0
```

### Verify

```sql
SELECT * FROM students;
```

### Output

| student_id | name | email |
|------------|------|-------|
| 1 | Alice Johnson | alice@example.com |
| 2 | Bob Smith | bob@example.com |

---

# Step 6: Insert Data into Courses

## Command

```sql
INSERT INTO courses (course_name, credits)
VALUES
('Database Systems',3),
('Computer Networks',4);
```

### Output

```
Query OK, 2 rows affected
Records: 2
Duplicates: 0
Warnings: 0
```

### Verify

```sql
SELECT * FROM courses;
```

### Output

| course_id | course_name | credits |
|-----------|-------------|---------|
| 1 | Database Systems | 3 |
| 2 | Computer Networks | 4 |

---

# Step 7: Insert Data into Enrollments

## Command

```sql
INSERT INTO enrollments (student_id, course_id)
VALUES
(1,1),
(2,1),
(1,2);
```

### Output

```
Query OK, 3 rows affected
Records: 3
Duplicates: 0
Warnings: 0
```

### Verify

```sql
SELECT * FROM enrollments;
```

### Output

| enrollment_id | student_id | course_id | enrollment_date |
|---------------|------------|-----------|-----------------|
| 1 | 1 | 1 | 2025-08-07 |
| 2 | 2 | 1 | 2025-08-07 |
| 3 | 1 | 2 | 2025-08-07 |

---

# Step 8: Delete Student (Cascade Delete)

## Command

```sql
DELETE FROM students
WHERE student_id = 2;
```

### Output

```
Query OK, 1 row affected
```

Because of **ON DELETE CASCADE**, Bob's enrollment is automatically deleted.

---

# Step 9: Delete Course (Cascade Delete)

## Command

```sql
DELETE FROM courses
WHERE course_id = 2;
```

### Output

```
Query OK, 1 row affected
```

Because of **ON DELETE CASCADE**, enrollments for this course are automatically removed.

### Verify Students

```sql
SELECT * FROM students;
```

### Output

| student_id | name | email |
|------------|------|-------|
| 1 | Alice Johnson | alice@example.com |

### Verify Courses

```sql
SELECT * FROM courses;
```

### Output

| course_id | course_name | credits |
|-----------|-------------|---------|
| 1 | Database Systems | 3 |

---

# Step 10: Drop Tables

## Command

```sql
DROP TABLE IF EXISTS enrollments;

DROP TABLE IF EXISTS students;

DROP TABLE IF EXISTS courses;
```

### Output

```
Query OK, 0 rows affected
```

---

# Step 11: Drop Database

## Command

```sql
DROP DATABASE university_db;
```

### Output

```
Query OK, 0 rows affected
```

---

# Concepts Covered

- Database Creation
- Table Creation
- Primary Key
- Foreign Key
- UNIQUE Constraint
- CHECK Constraint
- AUTO_INCREMENT
- DEFAULT Value
- ON DELETE CASCADE
- ON UPDATE CASCADE
- Data Insertion
- Data Retrieval
- Data Deletion
- Dropping Tables
- Dropping Database

---

# Final Database Structure

```
students
│
├── student_id (PK)
├── name
└── email

courses
│
├── course_id (PK)
├── course_name
└── credits

enrollments
│
├── enrollment_id (PK)
├── student_id (FK)
├── course_id (FK)
└── enrollment_date
```

---
