/* Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the EUCLIDEAN Distance between points P1 and P2 and round it to a scale of 4 decimal places. */

SELECT ROUND(SQRT(POWER((MIN(LAT_N)-MAX(LAT_N)),2)+(POWER((MIN(LONG_W)-MAX(LONG_W)),2))),4)
FROM STATION
