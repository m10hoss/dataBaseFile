USE db7;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;

-- create a table named author
-- id PK, small int unsigned auto increment
-- name, character 100 length no null


CREATE TABLE author(
    id      SMALLINT unsigned AUTO_INCREMENT PRIMARY KEY,
    name    VARCHAR(100)    NOT NULL

);


-- CREATE A TABLE NAMED BOOK HAVING COLUMS/ CONSTRAINTS:
-- ID medium int, unsigned auto inc pk
-- title, variable character 200 length no null
-- author_id, small int, unsighned, NOT NULL

CREATE TABLE book(
    id          MEDIUMINT           unsigned AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(200)        NOT NULL,
    author_id   SMALLINT            unsigned NOT NULL,

    CONSTRAINT  `fk_book_author`

        FOREIGN KEY (author_id) REFERENCES author(id)

        ON DELETE CASCADE
);



INSERT into author (name) values("mr. zzzz");
INSERT into author (name) values("Mr. xxxx");

INSERT INTO book(title, author_id) values("Sql",1);
INSERT INTO book(title, author_id) values("pytho",1);
INSERT INTO book(title, author_id) values("java",1);

INSERT INTO book(title, author_id) values("the hobbit",2);
INSERT INTO book(title, author_id) values("lord of the rings",2);
INSERT INTO book(title, author_id) values("return of the king",2);


-- delete from author where id = 1;

--show book title, and author's name 

select
    book.title as "book : book title",
    author.name as "author: author name"
from book, author
where book.author_id = author.id
    and author.id = 2;

-- create person talbe
-- person id, lname, fname, age 

-- create an orders table
-- order id, order number, person id
-- fk on person id to person table

CREATE TABLE person(
    id          SMALLINT unsigned AUTO_INCREMENT PRIMARY KEY,
    lname       VARCHAR(200)        NOT NULL,
    fname       VARCHAR(50)         NOT NULL,
    age         int
);

CREATE TABLE order(
    order_id        MEDIUMINT           unsigned AUTO_INCREMENT PRIMARY KEY,
    order_num       int                 NOT NULL,
    person_id       SMALLINT            unsigned NOT NULL,

    CONSTRAINT  `fk_book_author`

        FOREIGN KEY (person_id) REFERENCES person(id)

        ON DELETE CASCADE
);