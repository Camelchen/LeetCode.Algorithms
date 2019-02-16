/*
Create table DB_262_Trips (Id int, Client_Id int, Driver_Id int, City_Id int, Status varchar(100), Request_at varchar(50))
Create table DB_262_Users (Users_Id int, Banned varchar(50), Role varchar(50))
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03')
insert into DB_262_Trips (Id, Client_Id, Driver_Id, City_Id, Status, Request_at) values ('11', '2', '13', '6', 'cancelled_by_client', '2013-10-01')
insert into DB_262_Users (Users_Id, Banned, Role) values ('1', 'No', 'client')
insert into DB_262_Users (Users_Id, Banned, Role) values ('2', 'Yes', 'client')
insert into DB_262_Users (Users_Id, Banned, Role) values ('3', 'No', 'client')
insert into DB_262_Users (Users_Id, Banned, Role) values ('4', 'No', 'client')
insert into DB_262_Users (Users_Id, Banned, Role) values ('10', 'No', 'driver')
insert into DB_262_Users (Users_Id, Banned, Role) values ('11', 'No', 'driver')
insert into DB_262_Users (Users_Id, Banned, Role) values ('12', 'No', 'driver')
insert into DB_262_Users (Users_Id, Banned, Role) values ('13', 'No', 'driver')
*/

select * from DB_262_Users
select * from DB_262_Trips

select t.request_at as Day
, case when t.total=0 or isnull(c.cancel,0)=0 then 0.00 else convert(decimal(12,2),c.cancel*1.00/t.total) end as 'Cancellation Rate'
from (
	select request_at, count(1) as total from DB_262_Trips t
	inner join DB_262_Users u on u.users_id = t.client_id and u.banned = 'NO'
	group by request_at 
) as t
left join (
	select request_at, count(u.users_id) as cancel from DB_262_Trips t
	inner join DB_262_Users u on u.users_id = t.client_id and u.banned = 'NO' and t.status <> 'Completed'
	group by request_at
) as c on t.request_at = c.request_at
where t.request_at between '2013-10-01' and '2013-10-03'