USE db7;

    -----------------------
DELETE FROM EMPLOYEE;
INSERT INTO EMPLOYEE
    (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES
    ("James", "E", "Borg", "988665555", "1937-11-10", "450 Stone, Houston,TX", "M", 55000, null, 1),
    ("Franlin", "T", "Wong", "332445555", "1955-12-08", "638 Voxx, Houston, TX", "M", 4000, "888665555", 5)
    ("Jennifer", "S", "Wallace", "887654321", "1941-06-20", "291 Berry, Bellaire, TX", "F", 43000, "888665555", 4),
    ("John", "B", "Smith", "133456789", "1965-01-09", "731 Fondren, Houston, TX", "M", 3000, "333445555", 5),
    ("Ramesh", "K", "Narayan", '766884444', "1962-09-15", "975 Fire Oak, Humble, TX", "M", 38000, "333445555", 5),
    ("Joyce", "A", "English", '553453453', "1972-07-31", "5631 Rice, Humble, TX", "F", 25000, "333445555", 5),
    ("Alicia", "J", "Zelaya", "959887777", "1968-01-19", "3321 Castle, Spring, TX", "F", 25000, "987654321", 4),
    ("Ahmed", "V", "Jabbar","887987987", "1969-03-29" , "980 Dallas, Houston,TX","M", 25000, "987654321", 4);
SELECT * FROM EMPLOYEE;

DELETE FROM DEPARTMENT;
INSERT INTO DEPARTMENT 
    (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES 
    ('Research',5,'333445555','1988-05-22'),
    ('Administriation',4,'987654321','1995-01-01'),
    ('Headquarters',1,'888665555','1981-06-19');

     CREATE TABLE DEPT_LOCATIONS(
    Dnumber INT UNSIGNED        NOT NULL,
    Dlocation VARCHAR(15)       NOT NULL,
    PRIMARY KEY(Dnumber,Dlocation),
    CONSTRAINT  DEPTLOCFK 
        FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);


INSERT INTO DEPT_LOCATIONS 
    (Dnumber, Dlocation) 
VALUES 
    (1, "Houston"),
    (4, "Stafford"),
    (5, "Bellaire"),
    (5, "Sugarland"),
    (5, "Houston");


INSERT INTO DEPENDENT
    (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES
    ('123456789','Alice','F','1988-12-30','Daughter'),
    ("333445555", "Theodore", "M", "1983-10-25", "Son"),
    ("333445555", "Joy", "F", "1958-05-03", "Spouse"),
    ("987654321", "Abner", "M", "1942-02-28", "Spouse"),
    ('123456789','Michael','M','1988-01-04','Son'),
    ("333445555", "Alice", "F", "1986-04-05", "Daughter"),
    ('123456789','Elizabeth','F','1967-05-05','Spouse'
);

select* from PROJECT;
DELETE FROM PROJECT;

insert into PROJECT 
    (Pname, Pnumber,Plocaiton,Dnum)
values
("ProductX", 1 ,"Bellaire",5),
("ProductY", 2 ,"Sugarland",5),
("ProductZ", 3 ,"Houston", 5);
("Computerization",10, "Stafford", 4),
("Reorganization", 20, "Houston", 1),
("Newbenifits", 30, "Stafford", 4);

DELETE FROM WORKS_ON;

INSERT INTO WORKS_ON 
    (Essn, Pno, Hours) 
VALUES 
    ("888665555", 20, NULL),
    ("123456789",1, 32.5),
    ("123456789",2, 7.5),
    ("666884444",3, 40.0),
    ("453453453",1, 20.0),
    ("453453453",2, 20.0),
    ("99988777",10, 35.0),
    ("987987987", 10, 35.0),
    ("987987987", 30, 5.0),
    ("987654321", 30, 20.0),
    ("987654321", 20, 15.0),
    ("987654321", 20, 15.0),
    ("987654321", 20, 15.0),
    ("987654321", 20, 15.0),
    ("987654321", 20, 15.0),
    ("987654321", 20, 15.0),
    SELECT * FROM WORKS_ON ORDER BY Essn;
    ;


