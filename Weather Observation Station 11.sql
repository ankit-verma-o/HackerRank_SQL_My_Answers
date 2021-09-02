/*Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.*/

select distinct city from station where city not in 
(select city from station where LEFT(CITY,1) IN ('a','e','i','o','u'))
 union
 select distinct city from station where city not in 
(select city from station where RIGHT(CITY,1) IN ('a','e','i','o','u'))
