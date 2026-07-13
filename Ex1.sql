CREATE DATABASE COMPANY;

USE COMPANY;

CREATE TABLE EMPLOYEE ( Emp_no INT PRIMARY KEY, E_name VARCHAR(50), E_address VARCHAR(100), E_ph_no VARCHAR(15), Dept_no INT,    Dept_name VARCHAR(50), Job_id CHAR(10), Salary DECIMAL(10, 2)); 

Describe EMPLOYEE; 

ALTER TABLE EMPLOYEE ADD HIREDATE DATE; 

ALTER TABLE EMPLOYEE MODIFY Job_id VARCHAR(10); 

ALTER TABLE EMPLOYEE RENAME COLUMN Emp_no TO E_no; 

ALTER TABLE EMPLOYEE MODIFY Job_id VARCHAR(20); 

ALTER TABLE EMPLOYEE ADD CONSTRAINT UQ_E_ph_no UNIQUE (E_ph_no); 

ALTER TABLE EMPLOYEE MODIFY E_name VARCHAR(50) NOT NULL; 

ALTER TABLE EMPLOYEE ADD CONSTRAINT CHK_Salary 
CHECK(Salary > 0); 

INSERT INTO EMPLOYEE (E_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Salary, HIREDATE)VALUES (1, 'John Doe', '123 Main St', '555-1234', 101, 'Sales', 'J1001', 50000.00, '20-08-24'); 

INSERT INTO EMPLOYEE (E_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Salary, HIREDATE)VALUES (2, 'Jane Smith', '456 Oak St', '555-5678', 102, 'Marketing', 'J1002', 60000.00, '4-06-18'); 

> INSERT INTO EMPLOYEE (E_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Salary, HIREDATE)VALUES (3, 'Alice Johnson', '789 Pine St', '555-9012', 103, 'HR', 'J1003', 55000.00, '4-07-15'); 

INSERT INTO EMPLOYEE (E_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Salary, HIREDATE)VALUES (4, 'Alice Bob', '112 Apple St', '555-1112', 104, 'ADMIN', 'J1004', 45000.00, '4-03-15'); 

SELECT * FROM EMPLOYEE; 

UPDATE EMPLOYEE SET Salary = 55000.00 WHERE E_no = 1; 

UPDATE EMPLOYEE SET Dept_name = 'Digital Marketing' WHERE Dept_no = 102; 

SELECT * FROM EMPLOYEE; 

DELETE FROM EMPLOYEE WHERE E_no = 3; 

DELETE FROM EMPLOYEE WHERE Dept_no = 101; 

SELECT * FROM EMPLOYEE; 

TRUNCATE TABLE EMPLOYEE; 

SELECT * FROM EMPLOYEE; 