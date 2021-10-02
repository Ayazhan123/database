--a
select dept_name, avg(salary)
from instructor
group by dept_name
order by avg(salary);
--e
select * from instructor
where dept_name = 'Biology' or dept_name = 'Philosophy' or dept_name = 'Music';
--f
select * from instructor, teaches
where instructor.id = teaches.id and year='2018';