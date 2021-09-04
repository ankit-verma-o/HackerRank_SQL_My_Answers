/* A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4  decimal places. */


SELECT ROUND(LAT_N,4) FROM STATION
ORDER BY LAT_N ASC
LIMIT 249, 1

/* ALTERNATE SOLUTION & A BETTER WAY*/

SELECT ROUND(((
 (SELECT ROUND(MAX(LAT_N),4) FROM
   (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N) BottomHalf)
 +
 (SELECT ROUND(MIN(LAT_N),4) FROM
   (SELECT TOP 50 PERCENT LAT_N FROM STATION ORDER BY LAT_N DESC) TopHalf)
) / 2), 4)
