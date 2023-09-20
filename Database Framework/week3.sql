/* UNSIGNED AND ZEROFILL */
use db7;

-- CREATE OR REPLACE TABLE ints (
--     a INT,
--     b INT UNSIGNED NOT NULL,
--     c INT ZEROFILL

   
-- );

-- INSERT INTO ints (a, b, c) VALUES(7,3, 13);
-- --INSERT ONTO ints VALUES(7,3, 13);
-- --INSERT ONTO ints VALUES(7,343334.434, 13);


/* create or replace tabel t1 with a and b fiields as ints */

-- CREATE OR REPLACE TABLE t1 (
--     a int DEFAULT (1+1),
--     b int DEFAULT (a+1)
    
--     );

-- INSERT INTO t1 () value ();
-- INSERT INTO t1 () value ();
-- INSERT INTO t1 () value ();

-- INSERT INTO t1 (a) VALUES (8);

-- INSERT INTO t1 () value ();
-- INSERT INTO t1 () value ();

-- INSERT INTO t1 (a,b) value (100,10000);

-- /* aggregate functions */
-- max, min and count are aggregate functions

-- SELECT max(a) as MAX_A, max(b) as "MAX_B" from t1;

-- SELECT min(a) as "MIN A", min(b) as "MIN B" From t1;

-- SELECT count(A) as "count" from t1;

-- ordering selected data

-- select * from t1 order by b desc;

-- select * from t1 order by b asc;

-- -- where criteria ----
-- select a ,b 
-- from t1 
-- where a>=2 and b>3
-- order by b desc;



-- SELECT 
--     max(a) as "maximum for a",
--     max(b) as "maximum for b"
-- From t1;

-- count aggregate, gives a count of all rows that have values
-- SELECT count(a) AS "count a", count(b) as "count b" from t1;

-- select a,b, (a+b) from t1;

-- SELECTING NULL DATA

SELECT *
From t1
WHERE a IS NULL;

INSERT INTO t1 (b) VALUES (NULL);




SELECT *
From t1
WHERE b IS NOT NULL; 