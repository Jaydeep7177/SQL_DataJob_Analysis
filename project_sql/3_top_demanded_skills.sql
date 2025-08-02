/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

WITH job_skill_id AS (
    SELECT
        jp.job_id,
        sjd.skill_id,
        job_title_short,
        job_location,
        salary_year_avg
    FROM
        job_postings_fact AS jp
    INNER JOIN skills_job_dim AS sjd
    ON jp.job_id = sjd.job_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere'
    ORDER BY 
        salary_year_avg DESC NULLS LAST
)    

SELECT
    sd.skill_id,
    sd.skills,
    COUNT(sd.skills) AS skill_count
FROM
    skills_dim AS sd
INNER JOIN job_skill_id
ON sd.skill_id = job_skill_id.skill_id  
GROUP BY sd.skill_id, sd.skills
ORDER BY skill_count DESC
LIMIT 5;