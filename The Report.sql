/* You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Grades contains the following data:
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those 
students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one 
student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve. */

(SELECT W.NAME, W.GRADE, W.MARKS FROM
(SELECT T.NAME, T.GRADE, T.MARKS FROM (
SELECT STUDENTS.NAME, STUDENTS.MARKS, CASE WHEN (STUDENTS.MARKS >= GRADES.MIN_MARK AND MARKS <= GRADES.MAX_MARK) THEN GRADES.GRADE END AS GRADE
FROM STUDENTS, GRADES) T
WHERE T.MARKS IS NOT NULL) W
WHERE W.GRADE IS NOT NULL
AND W.GRADE > 7)
UNION
(SELECT P.NAME, P.GRADE, P.MARKS FROM
(SELECT WW.GRADE, WW.MARKS, CASE WHEN WW.GRADE < 8 THEN 'NULL' END AS NAME
FROM (SELECT W.NAME, W.GRADE, W.MARKS FROM
(SELECT T.NAME, T.GRADE, T.MARKS FROM (
SELECT STUDENTS.NAME, STUDENTS.MARKS, CASE WHEN (STUDENTS.MARKS >= GRADES.MIN_MARK AND MARKS <= GRADES.MAX_MARK) THEN GRADES.GRADE END AS GRADE
FROM STUDENTS, GRADES) T
WHERE T.MARKS IS NOT NULL) W) WW
WHERE WW.GRADE IS NOT NULL
AND WW.GRADE < 8) P)
ORDER BY GRADE DESC, NAME ASC, MARKS ASC
