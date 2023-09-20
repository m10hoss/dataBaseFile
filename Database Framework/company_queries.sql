-- retrieve the birth date and address of the employee whos name is jhon b smith

/*
    Query 0

*/
-- SELECT 
--      Bdate, Address 
-- FROM  
--      EMPLOYEE
-- WHERE 
--      Fname = "JHON" AND Minit = "B" AND Lname = "Smith";

/*
    Query 1

*/

-- Retrieve the name and address of all employee who work for the research department
-- projection attribute, a selection condition

-- SELECT
--      Fname, Minit, Lname,Address
-- FROM
--      EMPLOYEE, DEPARTMENT
-- WHERE
--      Dname = "Research" AND 
--      Dnumber = Dno;


/*
    Query 1
    use table aliases 
 
*/

-- SELECT
--      E.Fname, E.Minit, E.Lname, E.Address
-- FROM
--      EMPLOYEE as E , DEPARTMENT as D 
-- WHERE
--      D.Dname = "Research" AND 
--      D.Dnumber = Dno;

/*
    Query 1
    use fully qualified attribute names
*/

-- SELECT
--      EMPLOYEE.Fname, 
--      EMPLOYEE.Minit, 
--      EMPLOYEE.Lname, 
--      EMPLOYEE.Address
-- FROM
--      EMPLOYEE, DEPARTMENT
-- WHERE
--      DEPARTMENT.Dname = "Research" AND 
--      DEPARTMENT.Dnumber = Dno;


/*
* Query 2
* for every project located in "stafford"
*   list the project number,
*   the controlling departmnet number,
*   and the department managers last name, address, and birth-date/
*
*A 
*
*
*/

-- SELECT 
--     PROJECT.pnumber, 
--     PROJECT.Dnum, 
--     EMPLOYEE.Lname, 
--     EMPLOYEE.Address,
--     EMPLOYEE.Bdate
-- FROM 
--     PROJECT, DEPARTMENT, EMPLOYEE 
-- WHERE
--     PROJECT.Plocation = 'stafford' AND 
--     EMPLOYEE.Ssn = DEPARTMENT.Mgr_ssn AND 
--     PROJECT.Dnum = DEPARTMENT.Dnumber;


/*
* rebuild aboce query using aliases and altered table title
*/

-- SELECT 
--     P.pnumber as "Project Number", 
--     P.Dnum    as "Department Number", 
--     E.Lname   as "Last Name", 
--     E.Address as "Address",
--     E.Bdate   as "BirthDate"
-- FROM 
--     PROJECT as P , DEPARTMENT as D, EMPLOYEE as E 
-- WHERE
--     P.Plocation = 'stafford' AND 
--     E.Ssn = D.Mgr_ssn AND 
--     P.Dnum = D.Dnumber;

/*
* Query 3 
* list the department number, manager ID, department name and department location
*/

-- SELECT 
--     DEPARTMENT.Dname,
--     DEPARTMENT.Dnumber,
--     DEPARTMENT.Mgr_ssn
    
-- FROM
--     DEPARTMENT, DEPT_LOCATIONS
-- WHERE
--     DEPARTMENT.Dnumber = DEPT_LOCATIONS.Dnumber;


-- SELECT 
--     DEPARTMENT.Dname,
--     DEPARTMENT.Dnumber,
--     DEPARTMENT.Mgr_ssn
    
-- FROM
--     DEPARTMENT, DEPT_LOCATIONS
-- WHERE
--     DEPARTMENT.Dnumber, DEPT_LOCATIONS.Dnumber;



/*
*   Query 4 missing a selection conditoin

*/

--SELECT ssn FROM EMPLOYEE, WORKS_ON; 


/*
*  Query 5, 5a, 5b
    using asterisk(*) , which stands for ALL ATTRIBUTES
*/
-- SELECT * 
-- FROM EMPLOYEE
-- WHERE Dno = 5;

/*
    5A
    all attributes from EMPLOYEE and from DEPARTMENT
    where employee works in the 'research' department
*/

-- SELECT * 
-- FROM 
--     EMPLOYEE, DEPARTMENT
-- WHERE 
--     DEPARTMENT.Dname ="research" AND 
--     DEPARTMENT.Dnumber = EMPLOYEE.Dno;

/*
* 5B
    SAME AS 5A with no join, THIS IS BAD!!
*/

-- SELECT * 
-- FROM 
--     EMPLOYEE, DEPARTMENT
-- WHERE 
--     DEPARTMENT.Dname ="research";

/*
*  QUERY 6 
*  show dubplicate data; show no dubplicate data
*/
-- ALL includes all rows to be shown in ALL tables
-- ALL is a multiset operator (dublicate are not eleminated)

-- SELECT ALL Salary 
-- FROM EMPLOYEE
-- ORDER BY Salary DESC; 
-- SELECT COUNT(ALL Salary) FROM EMPLOYEE;

-- -- DISTINCT does not include duplicates

-- SELECT DISTINCT Salary 
-- FROM EMPLOYEE
-- ORDER BY Salary DESC; 

-- SELECT COUNT(DISTINCT Salary) FROM EMPLOYEE;

-- how many unique (aka: distinct) manager ssn's are in employee
-- SELECT DISTINCT Super_Ssn
-- from EMPLOYEE
-- ORDER by Super_ssn DESC;

-- -- SAME AS ABOVE
-- SELECT COUNT(DISTINCT Super_Ssn)
-- from EMPLOYEE
-- ORDER by Super_ssn DESC;


-- UNION, EXCEPT(or MINUS), INTERSECT
-- create or replace a table named R with a char 2 attribute name A

-- CREATE OR replace table R(
--     A char(2)
-- );
-- insert into R 'a1', 'a2', 'a3','a4'
--insert into R values('a1'),('a2'), ('a3'),('a4');
--SELECT * from R;


-- CREATE OR replace table S(
--     A char(2)
-- );
-- insert into R 'a1', 'a2', 'a3','a4'
--insert into S (A) values('a1'),('a2'), ('a4'),('a5');
--SELECT * from S;


-- (SELECT A FROM R) UNION (SELECT A FROM S) ORDER BY A;
--(SELECT A FROM R) UNION ALL (SELECT A FROM S) ORDER BY A;

-- SET DIFFERENCE
-- EXCEPT limits the result from the first quesry block to 
-- those rows which are (also) not found in the second

-- (SELECT A FROM R) EXCEPT (SELECT A FROM S) ORDER BY A;
-- (SELECT A FROM R) EXCEPT ALL (SELECT A FROM S) ORDER BY A;

-- SET INTERSCTION 
-- INTERSECT limits the result for multiple query blocks
-- to those rows which are common to all

--(SELECT a FROM R ) INTERSECT (SELECT A FROM S) ORDER BY A; 


/*
* Query 7
*
* list all distinct project numbers that involve an employee
* whos last name is 'Smith', either as a worker or as a manager
* of the department that contorls a project
*/
(SELECT DISTINCT(Pnumber)
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE EMPLOYEE.Lname = 'Smith' AND
PROJECT.Dnum = DEPARTMENT.Dnumber AND 
DEPARTMENT.Mgr_ssn = EMPLOYEE.Ssn
)
UNION
(
    SELECT DISTINCT (Pnumber)
    FROM PROJECT, WORKS_ON, EMPLOYEE
    WHERE EMPLOYEE.Lname = 'Smith' AND
    PROJECT.Pnumber = WORKS_ON.Pno AND
    WORKS_ON.Essn = EMPLOYEE.Ssn
);

-- first query retieves projects that involve a "smith" as a manager 
-- of the department that controls the project

-- second query retrieves projects that involve a 'smith' as a worker
-- on the project