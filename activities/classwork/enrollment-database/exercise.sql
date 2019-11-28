-- A) Get all the unique department names.
select distinct department from course;

-- B) Get the top 10 female students (first_name, last_name, age, gpa) with the best GPA scores and order by age (asc).
select
       first_name,
       last_name,
       age,
       gpa
from
     student
where
        gender='female'
order by
         gpa desc,
         age asc,
         first_name asc,
         last_name asc
limit 10;

-- C) Count the number of male/female students that are at least 25 years old.
select
       gender as "Gender",
       count(gender) as "Count"
from
     student
where
      age>=25
group by gender;

-- D) Get the number of male/female students that were accepted
select
       s.gender as "Student Gender",
       count(s.gender)
from
    student s inner join  enrollment e on s.id = e.student_id
where
    e.approved= 1
group by
    s.gender
;
-- E) Get the min, average, and max GPA of the accepted male students that are less than 20 years old.
select
    min(s.gpa),
    avg(s.gpa),
    max(s.gpa)
from
    student s inner join enrollment e on s.id = e.student_id
where
    s.gender = 'male' and s.age <= 20 and e.approved = 1
;

-- F) Get the number of enrollments to courses that take longer than 2 years to finalize.
select
    count(*)
from
    course c inner join enrollment e on c.id = e.course_id
where
    c.years>2 and e.approved=1
;

-- G) Get the number of male/female student that will take a course from the 'Statistics' department.
select
    gender,
    count(*)
from
     student s
         inner join enrollment e on s.id = e.student_id
         inner join course c on e.course_id = c.id
where
      lower(c.department) = 'statistics'
group by
    gender
;
/*
 SECTION: Individual exercises
 DESCRIPTION: Write a valid SQL query to solve each problem.
 */

-- A) Count the number of courses per department
select department, count(*) from course group by department;
-- B) How many male/female students were accepted?
select gender, count(*) from student s inner join enrollment e on s.id = e.student_id where e.approved=1 group by gender;
-- C) How many students were accepted per course?
select c.name, count(*) from student s inner join enrollment e on s.id = e.student_id inner join course c on e.course_id = c.id where e.approved = 1 group by name;
-- D) What's the average age and gpa per course?
select c.name, avg(age), avg(gpa) from student s inner join enrollment e on s.id = e.student_id inner join course c on e.course_id = c.id group by name;
-- E) Get the average number of years the enrolled (approved) female student will study.
select avg(years) from student s inner join enrollment e on s.id = e.student_id inner join course c on e.course_id = c.id WHERE e.approved=1 and s.gender = 'female' group by gender;

