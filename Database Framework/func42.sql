use db7

DELIMITER //

CREATE OR REPLACE FUNCTION FortyTwo()
RETURNS TINYINT DETERMINISTIC 
BEGIN
    DECLARE x TINYINT;
    set x = 42;
    RETURN x;
END; //

DELIMITER ;

-- call it
select FortyTwo();