--Average score per region
SELECT region,
AVG(avg_score) AS avg_score,
AVG(pass_rate) AS avg_pass_rate
FROM exam_results
GROUP BY region
ORDER BY avg_score DESC;


--Schools with pass rate > 85%
SELECT school_name, region,
AVG(pass_rate) AS avg_pass_rate
FROM exam_results
GROUP BY school_name, region
HAVING AVG(pass_rate) > 0.85;

--Exam records per subject
SELECT subject,
grade_level,
COUNT(*) AS exam_count,
SUM(num_students) AS total_students
FROM exam_results
GROUP BY subject, grade_level;

--Handle NULL scores
SELECT *
FROM exam_results
WHERE avg_score IS NULL;


--Join tables
SELECT t.teacher_name,
s.school_name,
f.avg_score
FROM fact_exam_results f
JOIN dim_teacher t
ON f.teacher_id = t.teacher_id
JOIN dim_school s
ON f.school_id = s.school_id;


--Rank each school within its region by average pass rate

WITH school_pass_rate AS (
  SELECT 
      school_name,
      region,
      AVG(pass_rate) AS avg_pass_rate
  FROM exam_results
  GROUP BY school_name, region
)

SELECT 
    school_name,
    region,
    ROUND(avg_pass_rate, 2) AS avg_pass_rate,
    RANK() OVER (
        PARTITION BY region 
        ORDER BY avg_pass_rate DESC
    ) AS rank
FROM school_pass_rate;