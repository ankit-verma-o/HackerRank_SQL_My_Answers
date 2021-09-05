/* You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, 
and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, 
then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result. */

SELECT W.HACKER_ID, H.NAME, W.TOTAL FROM
(SELECT T.HACKER_ID, SUM(T.MAXIMUM_SCORE) AS TOTAL FROM
(SELECT S.HACKER_ID, S.CHALLENGE_ID, MAX(S.SCORE) AS MAXIMUM_SCORE
FROM SUBMISSIONS S
GROUP BY S.HACKER_ID, S.CHALLENGE_ID) T
LEFT JOIN HACKERS H
ON T.HACKER_ID = H.HACKER_ID
GROUP BY T.HACKER_ID) W
LEFT JOIN HACKERS H
ON W.HACKER_ID = H.HACKER_ID
WHERE W.TOTAL > 0
ORDER BY W.TOTAL DESC, W.HACKER_ID ASC
