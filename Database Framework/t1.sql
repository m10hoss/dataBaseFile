use db7;

CREATE or REPLACE TABLE t1(
    a INT,
    b INT,
    c INT,
    d INT,
    PRIMARY key (a)
);

LOAD DATA LOCAL INFILE './num.dat'
into table t1 
FIELDS TERMINATED BY ','
ENCLOSED BY '\"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(a,b)   SET c=a+b, d=b*a;



select * from t1;

create or replace table t2 as 
select 
    c as C, 
    d as d 
from t1;

select * from t2;

