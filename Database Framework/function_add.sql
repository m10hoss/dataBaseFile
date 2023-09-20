use db7;

-- function name add_func3
-- add two ints
-- however: if sum > 99 return 3 if sum < 0 return 3
DELIMITER //
CREATE OR REPLACE FUNCTION add_func3(a INT, b INT)
    RETURNS INT DETERMINISTIC 
    BEGIN

    DECLARE res INT DEFAULT 0;
    set res = a + b;

        if (res > 99) THEN
            return 3;
        elseif (res < 0) THEN
            return 3;
        else 
            return res;
        end if;
    end; //

DELIMITER ;

select add_func3(10,20);
select add_func3(-10,0);