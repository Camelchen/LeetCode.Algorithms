/*

Create table DB_626_seat(id int, student varchar(255))

insert into DB_626_seat (id, student) values ('1', 'Abbot')
insert into DB_626_seat (id, student) values ('2', 'Doris')
insert into DB_626_seat (id, student) values ('3', 'Emerson')
insert into DB_626_seat (id, student) values ('4', 'Green')
insert into DB_626_seat (id, student) values ('5', 'Jeames')
insert into DB_626_seat (id, student) values ('6', 'Julia')

*/

select * from DB_626_seat

select case when id%2 = 0 
	then id-1 
	else case when id < (select max(id) from DB_626_seat) 
			then id+1
			else id 
			end 
	end as id
,student
from DB_626_seat
order by id