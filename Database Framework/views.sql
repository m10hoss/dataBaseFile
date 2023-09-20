use db7;

DROP VIEW IF EXISTS v, v2, v3;
DROP TABLE IF EXISTS t;

-- t, qty int, price decimal(5,2)
-- values: 3, 50; 30, 500; 300, 5000;

CREATE OR REPLACE TABLE t(
    qty     INT, 
    price   dECIMAL(10,2)
);

INSERT INTO t VALUES (3,50),(30,500),(300,5000);

SELECT * FROM t;

CREATE VIEW v AS 
    SELECT qty, price, qty*price AS product
    FROM t;

select * from v;

--update t, set qty = 5 where qty = 3
update t set qty= 5 where qty = 3;

-- select * from t;

-- select * from v;

INSERT INTO t VALUES (300,5000);

-- update v, set qty = 6 where qty = 5

update v set qty = 6 where qty =5;

update v set qty = 9 where qty =6;

delete from v where qty=300;


-- create a vview named v2 with all the data in v

CREATE VIEW v2 AS 
    SELECT* FROM v;

    select * from v2;

-- update v2 set product = 25000 where product was 15000
/*
-- THIS FAILS BECAUSE YOU CANNOT UPDATE A COMPUTED FIELDS
update v2 set product= 25000 where product = 15000;
update v set product= 25000 where product = 15000;
*/

/*
DROP VIEW IF EXISTS v; 
select * from v2; -- FAILS bc v2 is built from v 
drop view v2; -- keep database clean
*/