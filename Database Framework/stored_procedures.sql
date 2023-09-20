use db7;

CREATE OR REPLACE TABLE animal_count(
    animals int not null

);

insert into animal_count values (1);

-- store procedure to update the animal count

DELIMITER //
CREATE OR REPLACE PROCEDURE set_animal_count()
    MODIFIES SQL DATA 

    update animal_count set animals = 4000;

//
DELIMITER ;

-- see all stored procs in the database

-- SELECT ROUTINE_NAME I 
--     FROM INFORMATION_SCHEMA.ROUTINES
--     WHERE ROUTINE_TYPE = 'PROCEDURES';

    -- MODIFIES SQL DATA
    -- CONTIANS SQL
    -- NO SQL
    -- READS SQL DATA

    -- DELETE
    -- DROP PROCEDURE IF EXISTS proc_name;
    
    -- parameters... arguments 
    -- in, out, in/out

    -- stored proc to return the count of super bowls

    -- DELIMITER //
    
    -- CREATE OR REPLACE PROCEDURE count_super_bowls( OUT param1 int )
    --     BEGIN 
    --         SELECT COUNT(*) INTO param1 FROM super_bowl;
            
    --     END;
    -- //
    -- DELIMITER; 

    -- stoere proc to get a count of employess who work for 
    -- a particular department

    -- DELIMITER //
    
    -- CREATE OR REPLACE PROCEDURE emp_dep_count(IN id int, OUT param1 INT)
    --     BEGIN 
    --         SELECT COUNT(*) INTO param1 FROM EMPLOYEE WHERE Dno = id;
            
    --     END;
    -- //
    -- DELIMITER;

-- set @id = 5;
-- call emp_dep_count(@id,@dcount);
-- select @id, @dcount;

