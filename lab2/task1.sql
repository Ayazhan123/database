--data definition or data description language (DDL) is a syntax for creating and modifying database objects such as tables, indices, and users
--A data manipulation language (DML) is a computer programming language used for adding (inserting), deleting, and modifying (updating) data in a database.
--DDL commands: CREATE, ALTER, DROP
--DML commands: SELECT, INSERT, UPDATE, DELETE
-- DDL:

CREATE TABLE students(
    id integer,
    name varchar(20),
    ph_number integer
);

ALTER TABLE students
    ADD COLUMN address varchar(40);

DROP TABLE students;

-- DML:

INSERT INTO students VALUES
            (030301, 'Ayazhan', 8702654321, 'taraz 49'),
            (030665, 'Dinara', 8702123456, 'blablabla 12' );

SELECT id FROM students;

UPDATE students SET address = 'zhandosova 219' where address = 'taraz 49';

DELETE FROM students where ph_number = 8702654321;

