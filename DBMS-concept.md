## 1. DBMS vs RDBMS

#### DBMS

DBMS = Database Management System

It is software used to:

Store data
Retrieve data
Update data
Delete data
Manage databases

Examples:

MongoDB
Some older/non-relational database systems
SQLite is technically relational, so it is an RDBMS
RDBMS

#### RDBMS = Relational Database Management System

It is a DBMS that stores data in tables and establishes relationships between those tables.

Examples:

MySQL
Oracle
PostgreSQL
SQL Server

## 2. Primary Key

A Primary Key is a column or combination of columns that uniquely identifies each row in a table.

primary key:
    Must be unique.
    Cannot contain NULL.
    There can be only one primary key constraint per table.
    It can consist of multiple columns → composite primary key.

## 3. Foreign Key

A Foreign Key is a column that refers to a primary key or unique key in another table.

## 4. Candidate Key 

A Candidate Key is a column or set of columns that can uniquely identify a row and is minimal.

## 5. Composite Key 

A Composite Key is a key consisting of two or more columns.

## 6. Normalization

Normalization is the process of organizing data to:
    Reduce redundancy
    Avoid data duplication
    Prevent anomalies
    Improve data consistency

Problems caused by redundancy
    1. Update anomaly
    2. Insert anomaly
    3. Delete anomaly

## 7. First Normal Form — 1NF 

    A table is in 1NF when:
    Each column contains atomic/single values and there are no repeating groups.

## 8. Second Normal Form — 2NF

    A table is in 2NF if:
    It is already in 1NF.
    There is no partial dependency on a composite key.

## 9. Third Normal Form — 3NF 

    A table is in 3NF if:
    It is in 2NF.
    There is no transitive dependency.

## 10. BCNF = Boyce-Codd Normal Form

    The basic rule is:
    For every functional dependency X → Y, X must be a super key.


## 11. ACID 

ACID describes important properties of database transactions.
A → Atomicity
C → Consistency
I → Isolation
D → Durability

## 12. Transactions 

A transaction is a sequence of database operations treated as a single logical unit.

Example:

START TRANSACTION;

UPDATE Account
SET balance = balance - 1000
WHERE id = 1;

UPDATE Account
SET balance = balance + 1000
WHERE id = 2;

COMMIT;

If something goes wrong:

ROLLBACK;

The changes are undone.

## 13. Indexing

An index is a data structure used to make data retrieval faster.

## 14. Joins 

Joins combine data from multiple tables.

Suppose:

Employee
id	name	dept_id
1	Stuti	10
2	Rahul	20
3	Ananya	30
Department
dept_id	dept_name
10	CSE
20	ECE
INNER JOIN

Returns only matching rows.

SELECT e.name, d.dept_name
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;

Result:

name	dept_name
Stuti	CSE
Rahul	ECE

Ananya doesn't appear because department 30 doesn't exist in Department.

LEFT JOIN

Returns all rows from the left table and matching rows from the right.

SELECT e.name, d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id;

Result:

name	dept_name
Stuti	CSE
Rahul	ECE
Ananya	NULL
RIGHT JOIN

Returns all rows from the right table and matching rows from the left.

FULL OUTER JOIN

Returns all rows from both sides, matching where possible.

Note: MySQL does not provide a native FULL OUTER JOIN syntax like PostgreSQL/SQL Server, so it is commonly simulated using UNION of left/right joins.

CROSS JOIN

Produces the Cartesian product.

If:

Table A = 3 rows
Table B = 4 rows

then:

CROSS JOIN = 12 rows
SELF JOIN

A table joined with itself.

This is exactly related to the SQL question you asked earlier.

SELECT p.email
FROM Person p
JOIN Person q
ON p.email = q.email
AND p.id <> q.id;

Here:

Person p
   ↕
Person q

Same table, two aliases.

## 15. Views

A view is a virtual table based on a SQL query.

Suppose:

CREATE VIEW HighSalaryEmployees AS
SELECT name, salary
FROM Employee
WHERE salary > 50000;

Now you can do:

SELECT *
FROM HighSalaryEmployees;

The view represents the result of the underlying query.

##### Why use views?
1. Simplicity
2. Security

## 16. Stored Procedures 

A stored procedure is a pre-defined group of SQL statements stored in the database and executed when called.

Example in MySQL:

DELIMITER //

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT *
    FROM Employee;
END //

DELIMITER ;

Call it:

CALL GetEmployees();
With parameters
DELIMITER //


CREATE PROCEDURE GetEmployee(IN emp_id INT)
BEGIN
    SELECT *
    FROM Employee
    WHERE id = emp_id;
END //


DELIMITER ;

Then:

CALL GetEmployee(101);
Advantages
Reusable
Can encapsulate business logic
Can reduce repeated SQL
Can improve organization
Permissions can sometimes be managed around procedure execution
Disadvantages
Database-specific syntax
Can become difficult to maintain if overused
Business logic may become tightly coupled to the database
Procedure vs Function

A function generally returns a value and can often be used inside expressions, whereas a stored procedure is invoked as a separate operation and can perform a sequence of operations.

## 17. SQL vs NoSQL

##### SQL database:
Relational	
Tables	
Structured schema	
Strong relationships	
SQL language	
Excellent for relational data	

Examples:

MySQL
Oracle
PostgreSQL
SQL Server

##### NoSQL databases
Non-relational
Documents/collections/etc. 
flexible schema
Often favors embedding/denormalization depending on use case
Database-specific APIs/query languages
Useful for flexible/high-scale data models

"NoSQL" broadly refers to non-relational database systems designed around models other than the traditional relational table model.

Types include:

Document
Key-Value
Column-family
Graph

##### MongoDB is a document database.

## 18. MongoDB Basics

MongoDB is a document-oriented NoSQL database.

Instead of:

Database
   ↓
Tables
   ↓
Rows

MongoDB uses:

Database
   ↓
Collections
   ↓
Documents


MongoDB document:

{
    "_id": 1,
    "name": "Stuti",
    "age": 21
}

## 19. MongoDB CRUD

CRUD means:
C → Create
R → Read
U → Update
D → Delete
