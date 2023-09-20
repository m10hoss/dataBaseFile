use db7;

-- string functions --
select substring("foobar" , 3); --obar
select substring("foobar" from 3); --obar


select substring("foobar" , -3);  -- bar
select substring("foobar" , -5);  --oobar
select substring("foobar" , -10);  -- empty

select substring("foobarboy" ,4, 3); -- bar

select substring("foobarboy" , -6,3);  -- bar


select UPPER('fooBar'); --FOOBAR
select UCASE('fooBar'); -- FOOBAR

select LOWER('FOOBAR'); -- foobar
select LCASE('FOOBAR'); --foobar