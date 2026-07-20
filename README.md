## Ex 3
# CyberDB - MySQL Aggregate Functions & Queries

## 📌 Exercise Overview

This exercise demonstrates the use of **MySQL Aggregate Functions**, **String Functions**, **Date Functions**, **Subqueries**, and **Grouping** by creating a simple Cyber Security Training Management database.

The database consists of two tables:

* **Users** – Stores user information.
* **Enrollments** – Stores course enrollment details.

The exercise covers commonly used SQL concepts for beginners and database management coursework.

---

# Database Schema

## Users Table

| Column      | Data Type    | Description       |
| ----------- | ------------ | ----------------- |
| UserID      | INT          | Primary Key       |
| FirstName   | VARCHAR(50)  | User's first name |
| LastName    | VARCHAR(50)  | User's last name  |
| Email       | VARCHAR(100) | Email address     |
| DateOfBirth | DATE         | Date of birth     |

---

## Enrollments Table

| Column       | Data Type    | Description                   |
| ------------ | ------------ | ----------------------------- |
| EnrollmentID | INT          | Primary Key (AUTO_INCREMENT)  |
| CourseTitle  | VARCHAR(100) | Name of the course            |
| Trainer      | VARCHAR(50)  | Trainer's name                |
| UserID       | INT          | Foreign Key referencing Users |

---

# SQL Concepts Covered

## Aggregate Functions

* COUNT()
* SUM()
* AVG()
* MAX()
* MIN()

## String Functions

* CONCAT()
* UPPER()
* LIKE

## Date Functions

* NOW()
* DATEDIFF()

## Other SQL Concepts

* GROUP BY
* Subqueries
* FOREIGN KEY
* AUTO_INCREMENT
* Pattern Matching
* Aliases using AS

---

# Queries Included

### Database Creation

* Create Database
* Select Database

### Table Creation

* Users Table
* Enrollments Table

### Data Insertion

* Insert User Records
* Insert Enrollment Records

### Aggregate Queries

* Count users born after a specific date
* Calculate average Enrollment ID
* Sum Enrollment IDs
* Count enrolled courses per user
* Find earliest date of birth
* Count courses using subqueries
* Average User ID for a course
* Count trainer-wise courses
* Find maximum User ID
* Sum Enrollment IDs for users with names starting with 'J'
* Display users in uppercase with calculated age

---

# Functions Used
| ---------- | ----------------------------------- |
| Function   | Purpose                             |
| ---------- | ----------------------------------- |
| COUNT()    | Counts records                      |
| SUM()      | Adds values                         |
| AVG()      | Calculates average                  |
| MAX()      | Finds maximum value                 |
| MIN()      | Finds minimum value                 |
| CONCAT()   | Joins strings                       |
| UPPER()    | Converts text to uppercase          |
| NOW()      | Returns current date and time       |
| DATEDIFF() | Calculates difference between dates |
| LIKE       | Pattern matching                    |
| IN         | Subquery filtering                  |
| ---------- | ----------------------------------- |
