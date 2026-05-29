SELECT * FROM student_mentalhealth.student_mentalhealth_final;
use student_mentalhealth;
select count(*) from student_mentalhealth_final;

-- PHASE 1 BASIC PRACTICE
-- Total Students
select count(*) as total_students 
from student_mentalhealth_final;

-- group by gender
select gender, count(*) as total_students 
from student_mentalhealth_final
group by gender;

-- gender wise stress
select gender, avg(stress_value) as avg_stress
	from student_mentalhealth_final
    group by gender;

-- Average CGPA
select avg(cgpa) as average_cgpa 
from student_mentalhealth_final;

-- Highest Stress Students
select * from student_mentalhealth_final
order by stress_value desc
limit 10;

-- Top stress department
select department, avg(stress_value) as avg_stress
	from student_mentalhealth_final
    group by department
    order by avg_stress
    limit 5;

-- Scholarship Impact
select scholarship, avg(anxiety_value) as avg_anxiety
	from student_mentalhealth_final
    group by scholarship;

-- Highest Anxitey
select * from student_mentalhealth_final
order by anxiety_value desc
limit 10;

-- Highest Anxiety Departments
select department, avg(anxiety_value) as avg_anxiety
	   from student_mentalhealth_final
       group by department
       order by avg_anxiety desc;
       
-- PHASE 2 - Intermediate Interview Queries      
-- Department-wise Student Count
select department, count(*) as total_students
	from student_mentalhealth_final
    group by department
    order by total_students desc;

-- Students with Above Average Stress
select * from student_mentalhealth_final
	where stress_value > (select avg(stress_value)
	from student_mentalhealth_final);
    
-- Scholarship vs Stress
select scholarship, avg(stress_value) as avg_stress
	from student_mentalhealth_final
    group by scholarship;

-- Top 5 Departments by Stress
select department, avg(stress_value) as avg_stress
	from student_mentalhealth_final
    group by department
    order by avg_stress desc 
    limit 5;

-- PHASE 3 — Advanced SQL (Interview Favorite)
-- Department Ranking by Anxiety
select department, avg(anxiety_value) as avg_anxiety,
	dense_rank() over ( 
						order by avg(anxiety_value) desc
                       ) as department_rank
                 from student_mentalhealth_final
                 group by department;
                 
-- Running Average Stress
select academic_year, 
	   stress_value, 
       avg(stress_value) over (
								order by academic_year
                                ) as running_avg_stress
        from student_mentalhealth_final;                          
                       
-- Stress Category Using CASE WHEN
SELECT stress_value,
       CASE
           WHEN stress_value >= 25 THEN 'High Stress'
           WHEN stress_value >= 15 THEN 'Medium Stress'
           ELSE 'Low Stress'
       END AS stress_category
FROM student_mentalhealth_final;                       
