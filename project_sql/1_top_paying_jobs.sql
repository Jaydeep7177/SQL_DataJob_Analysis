/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering 
insights into employment options and location flexibility.
*/
SELECT
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
LIMIT 10;
