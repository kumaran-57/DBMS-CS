# DBMS Lab

## 1. DDL and DML Commands

**Concept:** DDL changes the database structure, while DML works with the data inside tables.

- **DDL:** `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
- **DML:** `INSERT`, `UPDATE`, `DELETE`

**Exercise:** Create an `EMPLOYEE` table, modify it, insert records, update records, delete records, and finally truncate the table.

**In simple words:** DDL builds the table; DML manages the data.  

---

## 2. Foreign Key and Referential Integrity

**Concept:** A foreign key connects two tables and keeps their relationship correct.

- A **primary key** uniquely identifies a row.
- A **foreign key** refers to a key in another table.
- `ON DELETE CASCADE` can automatically remove related records.

**Exercise:** Create `students`, `courses`, and `enrollments` tables and connect them using foreign keys.

**In simple words:** Foreign keys make sure related data stays connected and valid.  

---

## 3. Aggregate Functions

**Concept:** Aggregate functions calculate useful results from many rows.

Main functions:

- `COUNT()` → counts rows
- `SUM()` → adds values
- `AVG()` → finds the average
- `MAX()` → finds the highest value
- `MIN()` → finds the lowest value

The exercise also uses functions such as `NOW()`, `DATEDIFF()`, `CONCAT()`, `UPPER()`, and `LOWER()`.

**In simple words:** Aggregate functions summarize lots of data into one useful result.  

---

## 4. Subqueries and Simple Joins

**Concept:** A subquery is a query inside another query. A join combines related data from different tables.

Common joins used here:

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL JOIN`

**Exercise:** Use subqueries and joins to retrieve related information from database tables.

**In simple words:** A subquery asks a question inside another question; a join brings related tables together.  

---

## 5. Natural, Equi and Outer Joins

**Concept:** Different joins are used to combine tables in different ways.

- **Natural Join:** joins columns having the same name and data type.
- **Equi Join:** joins tables using an equality condition.
- **Outer Join:** keeps unmatched rows too.
- **Left Join:** keeps all left-table rows.
- **Right Join:** keeps all right-table rows.
- **Full Outer Join:** keeps rows from both sides.

**In simple words:** Joins help us see related information stored in separate tables.  

---

## 6. User-Defined Functions and Stored Procedures

**Concept:** Functions and procedures store reusable SQL/PL/SQL logic.

- **Function:** performs a task and returns a value.
- **Procedure:** performs a sequence of operations.
- **View:** acts like a virtual table for simplifying queries.

**Exercise:** Create functions, views, and procedures and execute them using database data.

**In simple words:** Write the logic once and reuse it whenever needed.  

---

## 7. DCL and TCL Commands

**Concept:** DCL controls user permissions, while TCL controls transactions.

### DCL
- `GRANT` → gives permission
- `REVOKE` → removes permission

### TCL
- `COMMIT` → permanently saves changes
- `ROLLBACK` → cancels changes
- `SAVEPOINT` → creates a point to roll back to

**In simple words:** DCL manages **who can access data**, while TCL manages **how changes are saved or undone**.  

---

## 8. Triggers

**Concept:** A trigger is automatically executed when a specific database event happens.

Triggers can be used with:

- `INSERT`
- `UPDATE`
- `DELETE`

**Exercise:** Create triggers for a `Products` table, such as checking product price before insertion and recording changes in logs.

**In simple words:** A trigger is an automatic action that runs when something happens in a table.  

---

## 9. Authentication Bypass Using SQL Injection

**Concept:** SQL Injection (SQLi) happens when unsafe user input is treated as part of an SQL query.

**Exercise:** The manual demonstrates SQLi concepts and database discovery using `sqlmap`.

**In simple words:** Poorly protected SQL queries can allow unwanted database actions.

**Safety:** Practice SQL injection only on systems you own or are explicitly authorized to test.  

---

## 10. Defending Against SQL Injection

**Concept:** SQL injection can be prevented by separating user input from SQL code.

The exercise uses **prepared statements**:

1. `prepare()` → creates the SQL template.
2. `bind_param()` → safely supplies user input.
3. `execute()` → runs the prepared query.

**In simple words:** Never directly mix user input into an SQL query; use prepared statements.  

---

## 11. Encryption and Decryption

**Concept:** Encryption converts readable data into protected data. Decryption converts it back when the correct key is available.

**Exercise:** Store encrypted data using AES and retrieve it through decryption. The manual also demonstrates hashing with encrypted messages.

**In simple words:** Encryption protects data so unauthorized people cannot easily read it.  

---

## 12. Role-Based Access Control (RBAC)

**Concept:** RBAC gives database permissions based on a user's role.

Basic steps:

1. Create a **role**.
2. Give privileges to the role.
3. Create a user.
4. Assign the role to the user.

**Exercise:** Create roles and users and control access to database objects such as tables and reports.

**In simple words:** Users get access according to their job or role.  

---
