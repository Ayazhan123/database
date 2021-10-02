--a
select name from takes,student
where takes.id = student.id and  dept_name = 'Comp.Sci' and (grade = 'A' or grade = 'A-')
order by name;
--b
select id, grade from takes
where grade <> 'B' and grade <> 'A' and grade <> 'A-' and grade <> 'B+';
--c
select id, grade from takes
where grade <> 'F' and grade <> 'C';