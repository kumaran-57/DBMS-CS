# Ex1. Output

## 1. Create Database
```sql
mysql> CREATE DATABASE COMPANY;
Query OK, 1 row affected (0.01 sec)
```

## 2. Use Database
```sql
mysql> USE COMPANY;
Database changed
```

## 3. Create EMPLOYEE Table
```sql
mysql> CREATE TABLE EMPLOYEE (
    Emp_no INT PRIMARY KEY,
    E_name VARCHAR(50),
    E_address VARCHAR(100),
    E_ph_no VARCHAR(15),
    Dept_no INT,
    Dept_name VARCHAR(50),
    Job_id CHAR(10),
    Salary DECIMAL(10,2)
);
Query OK, 0 rows affected (0.03 sec)

mysql> DESC EMPLOYEE;
+-----------+---------------+------+-----+---------+-------+
| Field     | Type          | Null | Key | Default | Extra |
+-----------+---------------+------+-----+---------+-------+
| Emp_no    | int           | NO   | PRI | NULL    |       |
| E_name    | varchar(50)   | YES  |     | NULL    |       |
| E_address | varchar(100)  | YES  |     | NULL    |       |
| E_ph_no   | varchar(15)   | YES  |     | NULL    |       |
| Dept_no   | int           | YES  |     | NULL    |       |
| Dept_name | varchar(50)   | YES  |     | NULL    |       |
| Job_id    | char(10)      | YES  |     | NULL    |       |
| Salary    | decimal(10,2) | YES  |     | NULL    |       |
+-----------+---------------+------+-----+---------+-------+
```

## 4. Add HIREDATE Column
```sql
mysql> ALTER TABLE EMPLOYEE ADD HIREDATE DATE;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 5. Modify JOB_ID Datatype
```sql
mysql> ALTER TABLE EMPLOYEE MODIFY Job_id VARCHAR(10);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 6. Rename Column
```sql
mysql> ALTER TABLE EMPLOYEE RENAME COLUMN Emp_no TO E_no;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 7. Modify Job_id Width
```sql
mysql> ALTER TABLE EMPLOYEE MODIFY Job_id VARCHAR(20);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 8. Add UNIQUE Constraint
```sql
mysql> ALTER TABLE EMPLOYEE ADD CONSTRAINT UQ_E_ph_no UNIQUE (E_ph_no);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 9. Add NOT NULL Constraint
```sql
mysql> ALTER TABLE EMPLOYEE MODIFY E_name VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 10. Add CHECK Constraint
```sql
mysql> ALTER TABLE EMPLOYEE ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

## 11. Insert Records
```sql
mysql> SELECT * FROM EMPLOYEE;
+------+---------------+--------------+----------+---------+------------+--------+----------+------------+
| E_no | E_name        | E_address    | E_ph_no  | Dept_no | Dept_name  | Job_id | Salary   | HIREDATE   |
+------+---------------+--------------+----------+---------+------------+--------+----------+------------+
| 1    | John Doe      | 123 Main St  | 555-1234 | 101     | Sales      | J1001  | 50000.00 | 2024-08-20 |
| 2    | Jane Smith    | 456 Oak St   | 555-5678 | 102     | Marketing  | J1002  | 60000.00 | 2018-06-04 |
| 3    | Alice Johnson | 789 Pine St  | 555-9012 | 103     | HR         | J1003  | 55000.00 | 2015-07-04 |
| 4    | Alice Bob     | 112 Apple St | 555-1112 | 104     | ADMIN      | J1004  | 45000.00 | 2015-03-04 |
+------+---------------+--------------+----------+---------+------------+--------+----------+------------+
```

## 12. Update Records
```sql
mysql> SELECT * FROM EMPLOYEE;
+------+---------------+--------------+----------+---------+---------------------+--------+----------+------------+
| E_no | E_name        | E_address    | E_ph_no  | Dept_no | Dept_name           | Job_id | Salary   | HIREDATE   |
+------+---------------+--------------+----------+---------+---------------------+--------+----------+------------+
| 1    | John Doe      | 123 Main St  | 555-1234 | 101     | Sales               | J1001  | 55000.00 | 2024-08-20 |
| 2    | Jane Smith    | 456 Oak St   | 555-5678 | 102     | Digital Marketing   | J1002  | 60000.00 | 2018-06-04 |
| 3    | Alice Johnson | 789 Pine St  | 555-9012 | 103     | HR                  | J1003  | 55000.00 | 2015-07-04 |
| 4    | Alice Bob     | 112 Apple St | 555-1112 | 104     | ADMIN               | J1004  | 45000.00 | 2015-03-04 |
+------+---------------+--------------+----------+---------+---------------------+--------+----------+------------+
```

## 13. Delete Records
```sql
mysql> SELECT * FROM EMPLOYEE;
+------+------------+--------------+----------+---------+-------------------+--------+----------+------------+
| E_no | E_name     | E_address    | E_ph_no  | Dept_no | Dept_name         | Job_id | Salary   | HIREDATE   |
+------+------------+--------------+----------+---------+-------------------+--------+----------+------------+
| 2    | Jane Smith | 456 Oak St   | 555-5678 | 102     | Digital Marketing | J1002  | 60000.00 | 2018-06-04 |
| 4    | Alice Bob  | 112 Apple St | 555-1112 | 104     | ADMIN             | J1004  | 45000.00 | 2015-03-04 |
+------+------------+--------------+----------+---------+-------------------+--------+----------+------------+
```

## 14. Truncate Table
```sql
mysql> SELECT * FROM EMPLOYEE;
Empty set (0.00 sec)
```
