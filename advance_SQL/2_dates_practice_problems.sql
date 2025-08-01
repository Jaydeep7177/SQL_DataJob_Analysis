-- Practice Problem 1
-- Write a query to find the average salary both yearly (salary_year_avg)and hourly (salary_hour_avg ) 
-- for job postings that were posted after June 1, 2023. Group the results by job schedule type.

-- SELECT
--     AVG(salary_year_avg) AS avg_yearly_salary,
--     AVG(salary_hour_avg) AS avg_hourly_salary,
--     job_schedule_type AS schedule_type
-- FROM
--     job_postings_fact    
-- WHERE
--     job_posted_date > '2023-06-01'    
-- GROUP BY
--     schedule_type    


-- Practice Problem 2
-- Write a query to count the number of job postings for each month in 2023, adjusting the job_posted_date
--  to be in 'America/New_York' time zone before extracting (hint) the month.
-- Assume the job_posted_date is stored in UTC. Group by and order by the month.
SELECT
    COUNT(job_id),
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS date_month
--    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY 
    date_month
ORDER BY 
    date_month;    
-- Practice Problem 3

-- Write a query to find companies (include company name) that have posted jobs offering health insurance,
--  where these postings were made in the second quarter of 2023. Use date extraction to filter by quarter.

SELECT 
    companies.name AS company_name   
FROM 
    company_dim as companies 
LEFT JOIN job_postings_fact as jp     
    ON companies.company_id = jp.company_id
WHERE 
    job_health_insurance = TRUE AND 
    EXTRACT(QUARTER FROM job_posted_date) = 2
GROUP BY name    
      

SELECT * FROM job_postings_fact ORDER BY job_posted_date LIMIT 5000 ;




