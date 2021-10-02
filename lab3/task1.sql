--a
select * from course
where credits > 3 ;
--b
select * from classroom
where building='Watson' or building='Packard';
--c
select * from course
where dept_name='Comp. Sci.';
--d
select * from course, section
where course.course_id = section.course_id and semester='Fall';
--e
select * from student
where tot_cred > 45 and tot_cred < 90;
--f
select * from student
where name like '%a' or name like '%e' or name like '%i' or name like '%o' or name like '%u' or name like '%y';
--g
select * from course,prereq
where course.course_id = prereq.course_id and prereq_id='CS-101';
