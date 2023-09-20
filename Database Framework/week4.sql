/*
PRIMARY KEY 

The primary key constraint allows you to define the 
"primary key " for a table.

Typically, you define a PK for a table during the table creation.

PK's can be a single collumn/field or multiple columns/fields


syntax for a PK with a single column/field: 

CREATE TABLE table_name(
    pk_column_name data_type PRIMARY KEY,
    col_name1       data_type,
    .....
);

Syntax for PK's that have more than one column

CREATE TABLE table_name(

    pk_column_name1 data_type,
    pk_column_name2 data_type,
    col_name1       data_type,
    .....  ,
    PRIMARY KEY(pk_column_name1, pk_column_name2)

);

*/


-- groceries with a single pk for each product

CREATE or replace TABLE groceries(
    id              INT             PRIMARY KEY,
    department      VARCHAR(30)     NOT NULL,
    product_name    VARCHAR(30)     NOT NULL,
    unit_price      Decimal(5,2)

);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(1, "produce", "pineapple", 1.99);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(2, "produce", "apple", .99);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(3, "produce", "orange", 2.99);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(4, "produce", "banana", .50);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(5, "produce", "Kiwi", .50);



INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(6, "toy", "power ranger", 12.99);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(7, "toy", "Buzz Lightyear", 88.44);


INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(8, "toy", "legos", 99.99);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(9, "toy", "barbie", 9.99);

INSERT INTO groceries(ID, department, product_name, unit_price)
VALUES(10, "toy", "hot wheels", 5.99);

--SELECT * FROM groceries;

-- operations in the WHERE clause

/*

        Operator        Description
        ========        ===========
        >               greater than
        <               less than
        =               is equal to
        >=              greater or equal
        =<              less or equal 
        <>, !=          not equal. not all SQL'S suppourt !=
        BETWEEN         between a certian range
        LIKE            search for a pattern
        IN              A set of possiable values for a column

*/

-- SELECT *
-- FROM groceries
-- WHERE unit_price 0.00 AND 5.00
-- ORDER BY unit_price desc;


SELECT *
FROM groceries
WHERE department IN ("toy");

select distinct department from groceries;

select distinct product_name from groceries order BY product_name asc;


select distinct unit_price from groceries;









