use db7;

CREATE OR REPLACE TABLE ds23(
work_year char(4),
experience_level char(2),
employment_type char(2),
job_title varchar(50),
salary int,
salary_currency char(3),
salary_in_usd int,
employee_residence char(2),
remote_ratio int,
company_location char(2),
company_size char(1)
);

LOAD DATA LOCAL INFILE 'ds23.csv'
INTO TABLE ds23 
FIELDS
    TERMINATED BY ','
    LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from ds23 limit 10;