-- Subqueries
-- SELECT *
-- FROM (-- SubQuery starts here
--     SELECT * 
--     FROM job_postings_fact
--     WHERE EXTRACT(MONTH FROM job_posted_date) = 1
-- ) AS january_jobs;
-- --SubQuery ends here


--Common Table Expressions(CTEs)
WITH january_jobs AS ( --CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)   -- CTE definition ends here

-- SELECT *
-- FROM january_jobs;

-- Subquery example
--step 1:
-- SELECT 
--     company_id,
--     job_no_degree_mention
-- FROM
--     job_postings_fact
-- WHERE
--     job_no_degree_mention = TRUE        


--step 2

SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
        SELECT
            company_id
        FROM
            job_postings_fact
        WHERE
            job_no_degree_mention = TRUE
        ORDER BY
            company_id
)    


-- CTE Example
--Find the companies that have the most job openings.
--Get the total number of job postings per company id (job_postings_fact)
--Return the total number of jobs with the company name (company_dim)

WITH company_job_count AS (
    SELECT  
        company_id,
        COUNT(*) AS total_jobs
    FROM
        job_postings_fact
    -- WHERE 
    --     job_title_short = 'Data Analyst'        
    GROUP BY
        company_id
)

SELECT
    company_dim.name,
    company_job_count.total_jobs
FROM
    company_dim
LEFT JOIN company_job_count 
ON company_dim.company_id = company_job_count.company_id
ORDER BY
    total_jobs DESC
