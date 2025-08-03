/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        jp.job_id,
        jp.company_id,
        cd.name,
        job_title_short,
        job_location,
        salary_year_avg
    FROM
        job_postings_fact AS jp
    INNER JOIN company_dim AS cd
    ON jp.company_id = cd.company_id    
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL 
    ORDER BY salary_year_avg DESC
)

SELECT
    sj.skill_id,
    sd.skills,
    tpj.*
FROM
    skills_job_dim AS sj
INNER JOIN top_paying_jobs AS tpj
ON sj.job_id = tpj.job_id
INNER JOIN skills_dim AS sd
ON sd.skill_id = sj.skill_id
ORDER BY salary_year_avg DESC

