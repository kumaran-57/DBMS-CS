## Ex 3
# SQL DDL and DML Commands – MySQL

## 📌 Overview

This exercise demonstrates the implementation of **Data Definition Language (DDL)** and **Data Manipulation Language (DML)** commands in MySQL. It covers creating a database and table, modifying table structures, inserting records, updating data, deleting records, and truncating tables.

---

## 🎯 Objective

* Create and manage a database using SQL.
* Learn the usage of DDL commands (`CREATE`, `ALTER`, `DROP`, `TRUNCATE`).
* Learn the usage of DML commands (`INSERT`, `UPDATE`, `DELETE`).
* Understand the output generated after executing each command.

---

## 🛠 Prerequisites

* MySQL Server
* MySQL Command Line Client or MySQL Workbench

---

# Commands and Output

## 1. Create Database

### Command

```sql
CREATE DATABASE COMPANY;
```

### Description

Creates a new database named **COMPANY**.

### Output

```
Query OK, 1 row affected
```

---

## 2. Select the Database

### Command

```sql
USE COMPANY;
```

### Description

Switches to the COMPANY database.

### Output

```
Database changed
```

---

## 3. Create Employee Table

### Command

```sql
CREATE TABLE EMPLOYEE (
    Emp_no INT PRIMARY KEY,
    E_name VARCHAR(50),
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id CHAR(10),
    Salary DECIMAL(10,2)
);
```

### Description

Creates an EMPLOYEE table with employee details.

### Output

```
Query OK, 0 rows affected
```

---

## 4. Describe Table

### Command

```sql
DESCRIBE EMPLOYEE;
```

### Description

Displays the table structure.

### Output

Shows:

* Column names
* Data types
* Constraints
* NULL status
* Keys

---

## 5. Add a New Column

### Command

```sql
ALTER TABLE EMPLOYEE
ADD HIREDATE DATE;
```

### Description

Adds a new column named **HIREDATE**.

### Output

```
Query OK
```

---

## 6. Modify Column Data Type

### Command

```sql
ALTER TABLE EMPLOYEE
MODIFY Job_id VARCHAR(10);
```

### Description

Changes the Job_id data type from CHAR to VARCHAR.

### Output

```
Query OK
```

---

## 7. Rename a Column

### Command

```sql
ALTER TABLE EMPLOYEE
RENAME COLUMN Emp_no TO E_no;
```

### Description

Renames **Emp_no** to **E_no**.

### Output

```
Query OK
```

---

## 8. Modify Column Size

### Command

```sql
ALTER TABLE EMPLOYEE
MODIFY Job_id VARCHAR(20);
```

### Description

Increases the maximum length of Job_id.

### Output

```
Query OK
```

---

## 9. Add Unique Constraint

### Command

```sql
ALTER TABLE EMPLOYEE
ADD CONSTRAINT UQ_E_ph_no
UNIQUE(E_ph_no);
```

### Description

Ensures that phone numbers are unique.

### Output

```
Query OK
```

---

## 10. Add NOT NULL Constraint

### Command

```sql
ALTER TABLE EMPLOYEE
MODIFY E_name VARCHAR(50) NOT NULL;
```

### Description

Prevents NULL values in the employee name column.

### Output

```
Query OK
```

---

## 11. Add CHECK Constraint

### Command

```sql
ALTER TABLE EMPLOYEE
ADD CONSTRAINT CHK_Salary
CHECK (Salary > 0);
```

### Description

Ensures salary is always greater than zero.

### Output

```
Query OK
```

---

## 12. Insert Records

### Command

```sql
INSERT INTO EMPLOYEE (...)
VALUES (...);
```

### Description

Adds employee records into the table.

### Output

```
Query OK, 1 row affected
```

### Verify

```sql
SELECT * FROM EMPLOYEE;
```

### Output

Displays all inserted employee records.

---

## 13. Update Records

### Command

```sql
UPDATE EMPLOYEE
SET Salary = 55000
WHERE E_no = 1;
```

### Description

Updates the salary of a specific employee.

### Output

```
Query OK
Rows matched: 1
Changed: 1
```

### Update Multiple Records

```sql
UPDATE EMPLOYEE
SET Dept_name='Digital Marketing'
WHERE Dept_no=102;
```

### Output

Updates all matching rows.

---

## 14. Delete Records

### Delete a Single Record

```sql
DELETE FROM EMPLOYEE
WHERE E_no = 3;
```

### Output

```
Query OK
1 row affected
```

### Delete Multiple Records

```sql
DELETE FROM EMPLOYEE
WHERE Dept_no = 101;
```

### Output

```
Query OK
```

---

## 15. Truncate Table

### Command

```sql
TRUNCATE TABLE EMPLOYEE;
```

### Description

Removes all rows while keeping the table structure intact.

### Output

```
Query OK
```

### Verify

```sql
SELECT * FROM EMPLOYEE;
```

### Output

```
Empty set
```

---

# SQL Commands Summary

| Command  | Purpose                          |
| -------- | -------------------------------- |
| CREATE   | Creates databases and tables     |
| ALTER    | Modifies table structure         |
| INSERT   | Adds new records                 |
| UPDATE   | Updates existing records         |
| DELETE   | Deletes selected records         |
| TRUNCATE | Removes all records from a table |
| DESCRIBE | Displays table schema            |
| SELECT   | Retrieves table data             |
