/* P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20). */

declare @x int = 20
while @x>0
begin
print replicate('* ',@x)
set @x=@x-1
end;
