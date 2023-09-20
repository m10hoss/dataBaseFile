use db7;

-- show a count of distinct job titles
--select count(distinct job_title) from ds23;

-- show a count of distinct compnay county locations
--elect count(distinct company_location) from ds23;

-- show all the distinct company location, ordered asc
--select distinct company_location from ds23 order by company_location asc;

-- what is the highest paid position
-- show all data about the highest paid position
select max(salary_in_usd) from ds23;

select * 
from ds23
where salary_in_usd = 450000;

-- now in one 
select * 
    from ds23 
    where salary_in_usd in (select max(salary_in_usd) from ds23);

-- use a "group by" to count groups of data
-- show the count of rows by job title

select job_title, count(*)
    from ds23
    group by job_title
    order by count(*);

-- max a data analyst makes 
select max(salary_in_usd) from ds23
 where job_title ="Data Analyst";

 
 -- show ttop 5 higest salaries by company size, (s, m, l)

--  select ds23.salary_in_usd
--  from ds23
--  where compnay_size = "S"
--  LIMIT 5;



 select salary_in_usd,  
 from ds23 
 where company_size ="S"
 ORDER BY salary_in_usd desc
 LIMIT 5; 

  select salary_in_usd 
 from ds23 
 where company_size ="M"
 ORDER BY salary_in_usd desc
 LIMIT 5; 

  select salary_in_usd 
 from ds23 
 where company_size ="L"
 ORDER BY salary_in_usd desc
 LIMIT 5; 

--  select max(salary_in_usd) from ds23 where comapny_size ="M";

--  select max(salary_in_usd) from ds23 where comapny_size ="L";


-- give a message if a small cpmpnay has a salary over 500,000
-- message will be "salary exists over 500000" or "no salaries over 500000"

DELIMITER $$
CREATE PROCEDURE MakesTooMuch(OUT MESSAGE VARCHAR(100))
BEGIN 
    DECLARE count_salary INT DEFAULT 0;
    select COUNT(*) INTO count_salary
        FROM ds23
    WHERE comapny_size = "S" AND salary_in_usd > 500000;

    IF count_salary > 0 THEN 
        SET MESSAGE = "salary exists over 500000";
    ESSE 
        SET MESSAGE = "no salary exists over 500000";
    END IF;
END; $$
DELIMITER ; 