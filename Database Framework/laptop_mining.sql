DELIMITER //

CREATE or replace procedure most_popular(
    out laptop_count int,
    out brand_name varchar(50)
)
BEGIN
    select count(*), brand into laptop_count, brand_name
        from laptops
        group by brand
        order by count(*) desc
            LIMIT 1;

END; //
DELIMITER ;

-- call the stored procedure
call most_popular(@laptop_count, @brand_name);

-- check results
select @laptop_count, @brand_name

--update brand acer, and make it 'ACER'

update laptops SET brand = upper(brand) where brand = 'acer';


--update laptops set brand = '

-- show count by rating
select rating, count(*) from laptops group by rating order by count(*) rating desc;

-- find the highest number of ratings for a 4 star laptop, and what is the laptop details

select * , rating, max(num_rating) from laptop where rating = '4 stars' 

