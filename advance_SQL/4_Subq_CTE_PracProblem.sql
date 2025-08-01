-- Practice Problem 1
-- Question:
-- Identify the top 5 skills that are most frequently mentioned in job postings.
-- Use a subquery to find the skill IDs with the highest counts in the skills_job_dim
-- table and then join this result with the skills_dim table to get the skill names.

-- SELECT
--     skills_dim.skill_id,
--     skills_dim.skills,
--     skillid_count.skill_count
-- FROM 
--     skills_dim
-- JOIN (
--     SELECT
--         skill_id,
--         COUNT(*) AS skill_count
--     FROM
--         skills_job_dim
--     GROUP BY
--         skill_id
-- ) AS skillid_count
-- ON skills_dim.skill_id = skillid_count.skill_id

-- ORDER BY skill_count DESC
-- LIMIT 5


-- Practice Problem 2
-- Question:
-- Determine the size category ('Small', 'Medium', or 'Large') for each company by first
-- identifying the number of job postings they have. Use a subquery to calculate the total
-- job postings per company. A company is considered 'Small' if it has less than 10 job
-- postings, 'Medium' if the number of job postings is between 10 and 50, and 'Large'
-- if it has more than 50 job postings. Implement a subquery to aggregate job
-- counts per company before classifying them based on size.
SELECT
    cd.company_id,
    cd.name,
    jc.job_count,
    CASE 
        WHEN jc.job_count <= 10 THEN 'Small'
        WHEN jc.job_count BETWEEN 11 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS size_category
FROM
    company_dim AS cd
JOIN (
    SELECT 
        company_id,
        COUNT(job_id) AS job_count
    FROM job_postings_fact
    GROUP BY company_id
    -- ORDER BY job_count DESC
) AS jc
ON cd.company_id = jc.company_id
ORDER BY job_count DESC
