USE db7;

DROP TABLE IF EXISTS school;


CREATE OR REPLACE TABLE school(
    schoolid      int             PRIMARY KEY,
    schoolcolor   VARCHAR(25)     NOT NULL,
    schoolname    VARCHAR(30)     NOT NULL,
    schooldob     DATE            NULL
);


drop table if EXISTS food;
CREATE OR REPLACE TABLE food(
    foodid      int             PRIMARY KEY,
    foodtype    VARCHAR(25)     NOT NULL,
    foodname    VARCHAR(30)     NOT NULL,
    foodexp     DATE            NULL
);

INSERT INTO school 
    values 
    (1, "p1", "shoe",'2023-02-20'),
    (2, "p2", "car",'2023-02-20'),
    (3, "p3", "sky",'2023-02-20');


INSERT INTO food 
    VALUES
    (1, "fruits", "apple",'2023-01-30' ),
    (2, "fruits", "orange",'2023-01-30' ),
    (3, "fruits", "banana",'2023-01-30' );

select * from school 
where schoolid= 3;

select * 
 from school
    where schoolname = "shoe";

select * from food
where foodname="apple";

select * from food 
where foodid = 2; 

/*
+----------+-------------+------------+------------+
| schoolid | schoolcolor | schoolname | schooldob  |
+----------+-------------+------------+------------+
|        3 | p3          | sky        | 2023-02-20 |
+----------+-------------+------------+------------+
1 row in set (0.001 sec)

+----------+-------------+------------+------------+
| schoolid | schoolcolor | schoolname | schooldob  |
+----------+-------------+------------+------------+
|        1 | p1          | shoe       | 2023-02-20 |
+----------+-------------+------------+------------+
1 row in set (0.000 sec)

+--------+----------+----------+------------+
| foodid | foodtype | foodname | foodexp    |
+--------+----------+----------+------------+
|      1 | fruits   | apple    | 2023-01-30 |
+--------+----------+----------+------------+
1 row in set (0.000 sec)

+--------+----------+----------+------------+
| foodid | foodtype | foodname | foodexp    |
+--------+----------+----------+------------+
|      2 | fruits   | orange   | 2023-01-30 |
+--------+----------+----------+------------+

*/