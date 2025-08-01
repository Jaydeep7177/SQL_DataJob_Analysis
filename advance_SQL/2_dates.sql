-- SELECT 
--     job_title_short AS title,
--     job_location AS location,
--     job_posted_date AS date_time 
-- FROM 
--     job_postings_fact    
-- LIMIT 5;    


-- SELECT
--     job_title_short AS title,
--     job_location AS location, 
--     job_posted_date AS date_time,
--     job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
-- FROM
--     job_postings_fact
-- LIMIT 5;    


-- SELECT
--     job_posted_date AS date_time,
--     EXTRACT(MONTH FROM job_posted_date) AS month
-- FROM 
--     job_postings_fact
-- LIMIT 10;    


SELECT
    COUNT(job_id) AS total_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    date_month  
ORDER BY
    total_jobs DESC