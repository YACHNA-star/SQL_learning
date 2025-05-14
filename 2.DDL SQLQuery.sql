/*========================================
DDL (Data Definition Language):
is a subset of SQL used to define and manage database structures such as tables, schemas, indexes, and more.
------------------------------------------------------------------------------------------------------------
| Command    | Purpose                                                                     |
| ---------- | --------------------------------------------------------------------------- |
| `CREATE`   | Creates a new database object                                               |
| `ALTER`    | Modifies an existing object                                                 |
| `DROP`     | Deletes an existing object                                                  |
| `TRUNCATE` | Deletes all data from a table                                               |
| `RENAME`   | Renames a database object (not directly supported in SQL Server for tables) |
========================================*/
/* ============================================================================== 
   CREATE
=============================================================================== */

--Create a new table called persons with columns: id, person_name, birth_date, and phone
CREATE TABLE persons (
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    phone VARCHAR(15) NOT NULL,
    CONSTRAINT pk_persons PRIMARY KEY (id)
)

/* ============================================================================== 
   ALTER
=============================================================================== */

-- Add a new column called email to the persons table
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

-- Remove the specific column phone from the persons table
ALTER TABLE persons
DROP COLUMN phone

--Remove the specific row phone from the persons table(USE DELETE)

/* ============================================================================== 
   RENAME(use sp_rename to rename tables or columns — not a RENAME keyword.)
=============================================================================== */
--Rename table
--EXEC sp_rename 'persons', 'person';
/* ============================================================================== 
   DROP
=============================================================================== */
Drop TABLE persons;




