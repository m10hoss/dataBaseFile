USE db7;

CREATE OR REPLACE TABLE super_bowl
(
	super_bowl					varchar(10),
	super_bowl_number			int,
	tv_date						DATE,
	network						char(3),
	average_viewers				int,
	total_viewers				decimal,
	household_rating			decimal,
	household_share				int,
	cost_of_30_second_ad_usd    int
);


LOAD DATA LOCAL INFILE './super-bowl-ratings1.csv'
INTO TABLE super_bowl
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- SELECT * FROM super_bowl;

-- how many records in super_bowls
-- select count(*) from super_bowl;

-- how many different networks in super_bowl
--select count(distinct network) from super_bowl;

--select * from super_bowl where tv_date < '1970-01-01';


--SELECT * from super_bowl where super_bowl = "LVI"; 

--SELECT * FROM super_bowl where tv_date = "2023-0-217";

--delect from super_bowl where super_bowl = 'LVI';

--SELECT * from super_bowl where super_bowl = "LVI"; 


/*
SYNTAX FOR UPDATE:

UPDATE table_name
SET column1 = value1, column2 = value2,.....
where conditon;
*/

UPDATE super_bowl
SET network = "FOX"
where super_bowl_number = 1; 


-- FAILS
UPDATE super_bowl
SET network = "ESPN"
where super_bowl_number = 2; 


-- will destory data, changes all network to "AAA"
UPDATE super_bowl SET network = "AAA";


UPDATE super_bowl 
SET total_viewers = 100000000
where super_bowl = "LII";