-- Practice Problem 1
-- Question:
-- I want to categorize the salaries from each job posting. To see if it fits in my desired salary range.
-- Put salary into different buckets
-- Define what's a high, standard, or low salary with our own conditions
-- Why? It is easy to determine which job postings are worth looking at based on salary.
-- Bucketing is a common practice in data analysis when viewing categories.
-- I only want to look at data analyst roles
-- Order from highest to lowest

SELECT 
    COUNT(job_id) AS job_count,
    CASE
        WHEN salary_year_avg > 300000 THEN 'high'
        WHEN salary_year_avg BETWEEN 150000 AND 300000 THEN 'standard'
        WHEN salary_year_avg < 150000 THEN 'low'
        ELSE 'unknown'
    END AS salary_bucket
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'    
GROUP BY
    salary_bucket


SELECT 
    COUNT(job_id) as job_count,
    CASE
        WHEN salary_year_avg IS NULL THEN 'Its NULL'
        ELSE 'NOT NULL'
    END AS valid_salaries        
FROM 
    job_postings_fact
GROUP BY
    valid_salaries    
