create trigger trgUpdateEmployee on dbo.vEmployees
instead of update
as
begin
declare @pid int = (select PersonId from inserted)
declare @pname varchar(40) =(select Name from inserted)
declare @designation varchar(40) = (select Designation from inserted)

update vEmployees set Name=@pname where PersonId=@pid
update vEmployees set Designation=@designation where PersonId=@pid
end

update dbo.vEmployees set Name='Akash',Designation='Trainee' where PersonId=151

select * from Persons
select * from employees
select * from dbo.vEmployees
