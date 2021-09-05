/* P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20). */

declare @x int = 1
while @x<21
begin
print replicate('* ',@x)
set @x=@x+1
end;
