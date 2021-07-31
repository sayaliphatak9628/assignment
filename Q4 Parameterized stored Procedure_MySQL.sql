#Q4 Create a parameterized stored procedure to take two integers and return the addition value in the third parameter

create procedure addNum(@a int,@b int)
as
begin
declare @c int
set @c=@a+@b
print @c
end

#execute procedure
exec addNum 2,6