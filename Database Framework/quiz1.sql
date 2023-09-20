connet db7;

drop table shoes if exist;
drop table color if exist;

CREATE TABLE shoes{
    id              int             not null,
    brand           Varchar(20)     not null,
    color_id        UNSINGED        NOT NULL,
    date_added      DATE            NOT NULL,
    amount          decimal         not null
}

CREATE TABLE colors{
    id              UNSINGED        not null,
    color           Varchar(20)     not null,
    red             int             null,
    green           int             null,
    blue            int             null

}

alter table add shoes primary key shoes(id);
alter table add colors primary key color(id);

forigen key shoes(color_id) connect color(id);

insert into shoes(1, "nike", "red", "01/01/2023", 99.99 );
insert into shoes(2, "adiddas", "green", "01/01/2023", 109.99 );
insert into shoes(3, "New Balance", "blue", "01/01/2023", 129.99 )


select * from table colors;

select min(amount) from shoes; 




-- quries part IV

select max(Rent) from RENT;

SELECT * FROM RENT where Email is not null;

SELECT SUM(Rent) FROM RENT;

SELECT * FROM RENT WHERE Date_joined is not null;

SELECT * FROM RENT WHERE Email IS NOT NULL AND Date_joined IS "JAUNARY 1, 2000";

SELECT * FROM RENT WHERE Rent is 800  

inner join
from shoes (color, braind)
where ;
