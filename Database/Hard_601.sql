/*
Create table DB_601_stadium (id int, date DATE NULL, people int)

insert into DB_601_stadium (id, date, people) values ('1', '2017-01-01', '10')
insert into DB_601_stadium (id, date, people) values ('2', '2017-01-02', '109')
insert into DB_601_stadium (id, date, people) values ('3', '2017-01-03', '150')
insert into DB_601_stadium (id, date, people) values ('4', '2017-01-04', '99')
insert into DB_601_stadium (id, date, people) values ('5', '2017-01-05', '145')
insert into DB_601_stadium (id, date, people) values ('6', '2017-01-06', '1455')
insert into DB_601_stadium (id, date, people) values ('7', '2017-01-07', '199')
insert into DB_601_stadium (id, date, people) values ('8', '2017-01-08', '188')

*/
--select *,case when people >=100 then 1 else 0 end , row_number() over (partition by case when people >=100 then 1 else 0 end  order by date)
--from DB_601_stadium 
--order by id

select id,date,people from (
	select *, row_number() over (partition by case when people >=100 then 1 else 0 end  order by date) rw
	from DB_601_stadium 
) as srw
where rw>=3
