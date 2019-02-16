/*
Create table DB_185_Employee (Id int, Name varchar(255), Salary int, DepartmentId int)
Create table DB_185_Department (Id int, Name varchar(255))

insert into DB_185_Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '70000', '1')
insert into DB_185_Employee (Id, Name, Salary, DepartmentId) values ('2', 'Henry', '80000', '2')
insert into DB_185_Employee (Id, Name, Salary, DepartmentId) values ('3', 'Sam', '60000', '2')
insert into DB_185_Employee (Id, Name, Salary, DepartmentId) values ('4', 'Max', '90000', '1')
insert into DB_185_Employee (Id, Name, Salary, DepartmentId) values ('5', 'Janet', '69000', '1')
insert into DB_185_Employee (Id, Name, Salary, DepartmentId) values ('6', 'Randy', '85000', '1')
insert into DB_185_Employee (Id, Name, Salary, DepartmentId) values ('7', 'Camel', '85000', '1')

insert into DB_185_Department (Id, Name) values ('1', 'IT')
insert into DB_185_Department (Id, Name) values ('2', 'Sales')

*/
select d.name as department, e.name as employee,e.salary--,emR
from (
	select departmentid,salary, rank() OVER (partition by departmentid order by salary desc) as emR
	from DB_185_Employee
	group by departmentid,salary
) as ts
inner join DB_185_Employee e on ts.salary =e.salary and ts.departmentid = e.departmentid
inner join DB_185_Department d on ts.departmentId = d.id
where ts.emR <= 3 
order by d.id, e.salary desc