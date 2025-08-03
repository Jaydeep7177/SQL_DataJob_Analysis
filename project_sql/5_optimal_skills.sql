/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

--#QUERY1
-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3
WITH high_demand_skills AS (
    SELECT
        sd.skill_id,
        sd.skills,
        COUNT(jp.job_id) AS skill_count
    FROM
        job_postings_fact AS jp
    INNER JOIN skills_job_dim AS sjd ON jp.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    GROUP BY sd.skill_id
),
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
high_salary_skills AS (
    SELECT
        sjd.skill_id,
        ROUND(AVG(jp.salary_year_avg),0) AS avg_salary
    FROM
        job_postings_fact AS jp
    INNER JOIN skills_job_dim AS sjd ON jp.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    GROUP BY sjd.skill_id
)
-- Return high demand and high salaries for 10 skills 

SELECT
    hds.skill_id,
    hds.skills,
    skill_count,
    avg_salary
FROM high_demand_skills AS hds
INNER JOIN high_salary_skills AS hss ON hds.skill_id = hss.skill_id
WHERE
    skill_count > 10
ORDER BY avg_salary DESC, skill_count DESC
LIMIT 25;

--#QUERY2
-- Return all the above whole query in more concisely
SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sjd.job_id) AS skill_count,
    ROUND(AVG(jp.salary_year_avg),0) AS salary_avg
FROM
    job_postings_fact AS jp
INNER JOIN skills_job_dim AS sjd ON jp.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY    
    sd.skill_id   
HAVING
    COUNT(sjd.job_id) > 10
ORDER BY
    salary_avg DESC,
    skill_count DESC
LIMIT 25;

   
