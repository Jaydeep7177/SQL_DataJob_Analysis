SELECT 
    company_id,
    job_title_short, 
    job_location
FROM
    january_jobs

-- UNION 
UNION ALL

SELECT
    company_id,
    job_title_short,
    job_location
FROM
    february_jobs    
-- ORDER BY company_id    