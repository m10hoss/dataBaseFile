-- connect to my database

USE db07;

DROP TABLE IF EXISTS potatoes;

CREATE TABLE potatoes (

potatoe_id      INT               PRIMARY KEY,
color           VARCHAR(30)       NOT NULL,
size            INT,
weight          INT,
type            VARCHAR(30)

);

-- add data values into potatoes
-- without fields states, all fields need a value 
INSERT INTO potatoes VALUES(1,"RED",3,5,"Russett");
INSERT INTO potatoes VALUES(1,"YELLOW",3,5,"French Fries");

-- add data only to specific fields
INSET INTO potatoes (potatoe_id,color,type) VALUES(3,"brown", "Idaho");
INSET INTO potatoes (potatoe_id,color,type) VALUES(5,"red", "salt");

SELECT potatoes_id, color, size, weight, type From potatoes;
SELECT * FROM potatoes;
SELECT color, size, type FROM potatoes;