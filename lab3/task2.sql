--a
select dept_name, avg(salary)
from instructor
group by dept_name
order by avg(salary);
--b
select building, count(building)
from section
group by building
order by count(building) desc
fetch first 1 rows only;
--c
select dept_name, count(dept_name)
from course
group by dept_name
order by count(dept_name)
fetch first 1 rows only;
--d

--e
select * from instructor
where dept_name = 'Biology' or dept_name = 'Philosophy' or dept_name = 'Music';
--f
select * from instructor, teaches
where instructor.id = teaches.id and year='2018';