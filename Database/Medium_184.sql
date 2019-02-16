
/*
create table DB_184_Employee (id int, name varchar(20),salary int,departmentId int )
insert into DB_184_Employee values (1,'Joe',70000,1)
insert into DB_184_Employee values (2,'Henry',80000,2)
insert into DB_184_Employee values (3,'Sam',60000,2)
insert into DB_184_Employee values (4,'Max',90000,1)
insert into DB_184_Employee values (5,'Joe',10000,null)
insert into DB_184_Employee values (6,'Joe2',60000,2)
insert into DB_184_Employee values (7,'Joe3',90000,2)
insert into DB_184_Employee values (8,'Joe4',90000,2)

create table DB_184_Department (id int, name varchar(20))
insert into DB_184_Department values (1,'IT')
insert into DB_184_Department values (2,'Sales')
*/

select d.name as Department,he.name as Employee,he.salary 
from (
	select name,salary, departmentid
	,rank() over (partition by departmentid order by salary desc) as salRank
	from DB_184_Employee e 
) as he 
inner join DB_184_Department d on he.departmentid = d.id
where he.salRank = 1