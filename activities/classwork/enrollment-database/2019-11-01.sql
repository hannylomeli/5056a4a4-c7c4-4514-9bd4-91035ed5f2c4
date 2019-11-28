-- A) Get the average course length (years) of the department of statistics

select avg(years)
from course
where department='Statistics'
;

-- B) Get the all the course with more than 15 students

select count(*) as "n_student", c.name
from enrollment e inner join course c on e.course_id = c.id
where e.approved = 1
group by c.name
having count(*) > 15
;

-- C)   Get all course with more than 15 female students

select count(*) as "n_student", c.name
from enrollment e inner join course c on e.course_id = c.id  inner join student s on e.student_id = s.id
where e.approved = 1 and s.gender = 'female'
group by c.name
having count(*) > 15
;

-- D) Get the average age per gender and course

select avg(s.age), s.gender, c.name
from enrollment e inner join course c on e.course_id = c.id  inner join student s on e.student_id = s.id
where e.approved=1
group by c.name, s.gender
;

