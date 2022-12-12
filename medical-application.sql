DROP DATABASE IF EXISTS Surgery_Day22;
CREATE DATABASE Surgery_Day22;
USE Surgery_Day22;

CREATE TABLE Surgery(
	ID INT,
	FName VARCHAR(15),
	LName VARCHAR(15),
	HouseNo INT,
	Street VARCHAR(30),
	City VARCHAR(15),
	Budget INT,
	SurgeryID INT
);

INSERT INTO Surgery (ID, FName, LName, HouseNo, Street, City, Budget, SurgeryID) VALUES (1,'Ben','Miflin',12,'Greek Street','Tamworth',10000,231);
INSERT INTO Surgery (ID, FName, LName, Street, City, Budget, SurgeryID) VALUES (2,'Hans','Krebbs','Rothamsted Manor','Lichfield',24200,231);
INSERT INTO Surgery (ID, FName, LName, HouseNo, Street, City, Budget, SurgeryID) VALUES (3,'Mary','Jones',12,'Rotten Row','Tamworth',1100,243);
INSERT INTO Surgery (ID, FName, LName, Street, City, Budget, SurgeryID) VALUES (4,'Jane','Hughes','Rothamsted Manor','Lichfield',12100,231);
INSERT INTO Surgery (ID, FName, LName, HouseNo, Street, City, Budget, SurgeryID) VALUES (5,'Bill','Pirie',23,'Final Way','Lichfield',16500,243);

SELECT * FROM Surgery;

-- place your answers below here
SELECT FName, LName FROM Surgery 
WHERE City != 'Lichfield';

SELECT COUNT(DISTINCT surgeryID) AS NoOfSurgeries
FROM Surgery;
 
SELECT SUM(budget) AS LichfieldBudget
FROM Surgery
WHERE City = 'Lichfield';

SELECT AVG(Budget) AS Average231Budget
FROM Surgery
WHERE SurgeryID = 231;

SELECT FName, LName, Budget - (SELECT AVG(Budget) FROM Surgery) 
AS Budgetdiff 
FROM Surgery 
WHERE Budget > (SELECT AVG(Budget) FROM Surgery);

SELECT SUM(Budget) AS TotalBudgetCost
FROM surgery
WHERE SurgeryID = 243 OR SurgeryID = 231;

SELECT FName, LName
FROM surgery
WHERE Budget > (
SELECT AVG(budget) from surgery
WHERE SurgeryID= 243);

SELECT FName, LName
FROM surgery
WHERE Budget > (
SELECT MAX(budget) from surgery
WHERE SurgeryID= 231);

SELECT FName, LName
FROM surgery
WHERE Budget > (SELECT AVG(Budget) AS avgBudget 
FROM Surgery) 
ORDER BY LName ASC, FName ASC;

