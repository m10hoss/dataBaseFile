use db7;


set @r 




select @test is null; -- will show a 1 because it is true, @est does not exist

-- create a variable name var_date and put todays date in it

set @var_date = '2023-04-26';  -- 'yyy-mm-dd'


-- user defined variables types cannot be declared
-- to force a 'type' we have to use CAST() or CONVERT()

-- syntax for cast:CAST(expr AA type)

set @str = CAST(123 AS CHAR(5));
select @str;

-- syntax for convert: CONVERT(expr, type)
set @var_num = CONVERT(2, INTIGER);
select @var_num;


-- you can set a variable from the result of a select using :=
select @var = '123';

select @count_emp := (select count(*) from EMPLOYEE);
select @count_emp;


-- use INTO to create variables and store data
-- also used for multiple varialbes 

select Fname, Ssn, Bdate
    from EMPLOYEE 
    where fname = 'Franlin'
    INTO @Fname, @ssn, @bday; 

select @fname, @Ssn, @bday;