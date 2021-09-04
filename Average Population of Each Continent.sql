/* Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations 
(CITY.Population) rounded down to the nearest integer. */

SELECT CO.CONTINENT, FLOOR(AVG(C.POPULATION))
FROM COUNTRY CO
INNER JOIN CITY C
ON CO.CODE = C.COUNTRYCODE
GROUP BY CO.CONTINENT
