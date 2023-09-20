use db7;


DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS t3;

CREATE TABLE t1(a int );
CREATE TABLE t2(b int );
CREATE TABLE t3(c int, d int, e int );


-- t1 insert 1, 2, 3
-- t2 insert 2, 4
-- t3 insert (2,12,22) and (4,14,24)

-- INSERT INTO t1 VALUES(1),(2),(3);

-- INSERT INTO t2 VALUES(2),(4);

-- INSERT INTO t3 VALUES(1,12,22),(4,14,24);

-- -- inner join t1 and t2
-- select * from t1 inner join t2 ON t1.a = t2.b; 

-- OLD SCHOOL
--  SELECT * FROM t1,t2 where t1.a = t2.b;

-- -- cross join t1 and t1;
-- select * from t1 cross join t2;

-- -- cross join all;
-- select * from t1 cross join t2 cross join t3;


-- -- left join on t1 with t2
-- select * from t1 left join t2 ON t1.a = t2.b;

-- select * from t1 right join t2 ON t2.b = t1.a;

-- select * from t1 right join t2 ON t1.a = t2.b;

-- select * from t2 left join t3 ON t2.b = t3.c;



-- drop table if exists people;
-- create table people ( id int primary key, name varchar(100) not null, gender char(1) not null);
-- insert people (id,name,gender) values (1,'Kathy','f'),(2,'John','m'),(3,'Paul','m'),(4,'Kim','f');
-- drop table if exists pets;
-- create table pets ( id int auto_increment primary key, ownerId int not null, name varchar(100) not null, color varchar(100) not null);
-- insert pets(ownerId,name,color) values (1,'Rover','beige'),(2,'Bubbles','purple'),(3,'Spot','black and white'), (1,'Rover2','white');


-- inner join on pets and people 
-- listed all people that have pets-- gives matching data
-- select * from people inner join pets on pets.ownerId = people.id;
-- select * from pets inner join people on people.id = pets.ownerId;


-- report all people that have pets, owner name, pet name and pet color

-- select * from pets inner join people on people.id = pets.ownerId;

-- SELECT 
--     people.name as "OWNERS NAME", 
--     pets.name AS "PETS NAME" , 
--     pets.color AS "PET COLOR"
-- from people inner join pets ON people.id = pets.ownerId; 


-- show all the names of Kathys pets using IN and a sub-query()

SELECT name  
    from pets where ownerId IN (select id from people where name = "Kathy");

-- show all the names of Kathys or pauls pets using IN and a sub-query()

SELECT name  
    from pets where ownerId IN (select id from people where name = "Kathy" or name = "Paul");


-- show the name of pauls and kathys pets using join and in
-- SELECT people inner join pets
-- where people.name = "Kathy" or poeple.name = "Paul";

select pets.name from pets inner join people ON pets.ownerId = people.id
where people.name IN ('Paul', 'Kathy');

