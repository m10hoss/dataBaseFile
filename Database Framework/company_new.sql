 USE db7;
ALTER TABLE IF EXISTS EMPLOYEE
    DROP FOREIGN KEY IF EXISTS EMPSUPERFK;

ALTER TABLE IF EXISTS DEPARTMENT
    DROP FOREIGN KEY IF EXISTS DEPTMGRFK;

ALTER TABLE IF EXISTS DEPT_LOCATIONS
    DROP FOREIGN KEY IF EXISTS DEPTLOCDNUMFK;

ALTER TABLE IF EXISTS PROJECT
    DROP FOREIGN KEY IF EXISTS PROJDNUMFK;

ALTER TABLE IF EXISTS DEPENDENT
    DROP FOREIGN KEY IF EXISTS DEPNESSNFK;

ALTER TABLE IF EXISTS WORKS_ON
    DROP FOREIGN KEY IF EXISTS WKSONESSNFK;

ALTER TABLE IF EXISTS WORKS_ON
    DROP FOREIGN KEY IF EXISTS WKSONPNOFK;


-- drop primary keys
ALTER TABLE IF EXISTS EMPLOYEE
   DROP PRIMARY KEY;

ALTER TABLE IF EXISTS DEPARTMENT
   DROP PRIMARY KEY;

ALTER TABLE IF EXISTS DEPT_LOCATIONS
   DROP PRIMARY KEY;

ALTER TABLE IF EXISTS PROJECT
   DROP PRIMARY KEY;

ALTER TABLE IF EXISTS DEPENDENT
   DROP PRIMARY KEY;

ALTER TABLE IF EXISTS WORKS_ON
   DROP PRIMARY KEY;


-- drop unique indexes
ALTER TABLE IF EXISTS DEPARTMENT
   DROP INDEX IF EXISTS DEPTSK;

ALTER TABLE IF EXISTS PROJECT
    DROP INDEX PROJSK;


--drop all tables
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS DEPT_LOCATIONS;
DROP TABLE IF EXISTS PROJECT;
DROP TABLE IF EXISTS DEPENDENT;
DROP TABLE IF EXISTS WORKS_ON;


--rebuild entire databas schema
CREATE OR REPLACE TABLE EMPLOYEE(
    Fname           VARCHAR(15)         NOT NULL,
    Minit           CHAR(1)             NULL,
    Lname           VARCHAR(15)         NOT NULL,
    Ssn             CHAR(9)             NOT NULL,
    Bdate           DATE                NULL,
    Address         VARCHAR(30)         NULL,
    Sex             CHAR(1)             NULL,
    Salary          DECIMAL(10, 2)      NULL,
    Super_ssn       CHAR(9)             NULL,
    Dno             INT UNSIGNED        NOT NULL       DEFAULT 1,
    CONSTRAINT EMPPK 
        PRIMARY KEY (Ssn),
    CONSTRAINT EMPSUPERFK
        FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE (Ssn)
            ON DELETE SET DEFAULT
            ON UPDATE CASCADE
);



CREATE OR REPLACE TABLE DEPARTMENT(
    Dname           VARCHAR(15)         NOT NULL,
    Dnumber         INT UNSIGNED        NOT NULL,
    Mgr_ssn         CHAR(9)             NOT NULL        DEFAULT '888665555',
    Mgr_start_date  DATE                NULL,
    CONSTRAINT DEPTPK
        PRIMARY KEY (Dnumber),
    CONSTRAINT DEPTSK 
        UNIQUE (Dname),
    CONSTRAINT DEPTMGRFK
        FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE (Ssn)
            ON DELETE SET DEFAULT
            ON UPDATE CASCADE
);


CREATE OR REPLACE TABLE DEPT_LOCATIONS(
    Dnumber INT UNSIGNED NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    CONSTRAINT DEPTLOCPK
        PRIMARY KEY (Dnumber, Dlocation),
    CONSTRAINT DEPTLOCDNUMFK
        FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);



CREATE OR REPLACE TABLE PROJECT(
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT UNSIGNED NOT NULL,
    Plocation VARCHAR(15) NULL,
    Dnum INT UNSIGNED NOT NULL,
    CONSTRAINT PROJPK
        PRIMARY KEY (Pnumber),
    CONSTRAINT PROJSK
        UNIQUE (Pname),
    CONSTRAINT PROJDNUMFK 
        FOREIGN KEY (Dnum) REFERENCES DEPARTMENT (Dnumber)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE OR REPLACE TABLE WORKS_ON (
    Essn CHAR(9) NOT NULL,
    Pno INT UNSIGNED NOT NULL,
    Hours DECIMAL(3, 1) NULL,
    CONSTRAINT WKSONPK
        PRIMARY KEY (Essn, Pno),
    CONSTRAINT WKSONESSNFK  
        FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn),
    CONSTRAINT WKSONPNOFK  
        FOREIGN KEY (Pno) REFERENCES PROJECT (Pnumber)
);



CREATE OR REPLACE TABLE DEPENDENT(
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR(1) NULL,
    Bdate DATE NULL,
    Relationship VARCHAR(8) NULL,
    CONSTRAINT DEPNPK
        PRIMARY KEY (Essn, Dependent_name),
    CONSTRAINT DEPNESSNFK
        FOREIGN KEY (Essn) REFERENCES EMPLOYEE (Ssn)
            ON DELETE SET DEFAULT
            ON UPDATE CASCADE
);

--show all foreign key constaints
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = 'db39' AND REFERENCED_TABLE_NAME = 'EMPLOYEE';
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = 'db39' AND REFERENCED_TABLE_NAME = 'DEPARTMENT';
SELECT TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = 'db39' AND REFERENCED_TABLE_NAME = 'PROJECT';