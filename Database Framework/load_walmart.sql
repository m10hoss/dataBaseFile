-- change below line appropriately
use db7;

/*
About This Dataset (sourced from Kaggle)

A retail store that has multiple outlets across the country is 
facing issues managing the inventory. Sepcifically, issues matching 
the demand with respect to supply. 


You are a data scientist, who has to come up with 
useful insights using the data.


Field Notes:

    store is just a store number

    week of sales is the week of the year

    weekly sales for a given store, in usd, for that given week

    holiday_flag -- 1 is the week is a holiday week, 0 if not

    temperature on the day of the sale

    fuel price is average price for the region the store is located

    cpi, consumer price index, is a measure of the average change in 
    prices over time in a fixed market basket of goods and services.

    unemployment rate of the region where the store is 


Other: 
Is it better if CPI is high or low? 
Low CPI implies low inflation, which you can see as a sign of a healthy 
economy with stable prices and economic growth. Most will prefer a lower CPI, 
which means lower inflation and keeps buying power strong, as the cost of 
goods and services remains relatively cheaper.

*/

create or replace table walmart (
    store           int,
    week_of_sales   date,
    weekly_sales    decimal(10,2),
    holiday_flag    char(1),
    temperature     decimal(10,2),
    fuel_price      decimal(10,6),
    cpi             decimal(10,7),
    unemployment    decimal(10,3)
);

LOAD DATA LOCAL INFILE 'WalmartDataAnalysis_and_Forcasting.csv'
INTO TABLE walmart
FIELDS
    TERMINATED BY ','
    LINES TERMINATED BY '\n'
IGNORE 1 LINES 
(store, @week_of_sales, weekly_sales, holiday_flag, temperature, fuel_price, cpi, unemployment)
SET week_of_sales = STR_TO_DATE(@week_of_sales, '%d-%m-%y');

-- select * from walmart limit 10;

-- select weekly_sales, fuel_price, unemployment
-- from walmart
-- where cpi < 126.07;

-- select holiday_flag, count(*) from walmart where holiday_flag = 1;


-- group by rating order by count(*) rating desc;

-- select AVG(weekly_sales)
--  from walmart;

--  DELIMITER //
    
--     CREATE OR REPLACE PROCEDURE walmart( 
--         IN week_date date, 
--         OUT week_avg decimal(10,2) 
--         )
--         BEGIN 

--             Select * from walmart 
--             where week_date = '2020-12-24';
            
--             select * from walmart 
--             where week_date ='2020-12-31';

            
--         END;
--     //
--     DELIMITER; 

--     select @week_avg as "DAY BEFORE CHRISTMAS WEEK";

--     Select @week_avg as "Day before New Year Week";


--   Select * from walmart 
--             where week_date = '2020-12-24';

select AVG(weekly_sales)
from walmart
where cpi > 226.9;