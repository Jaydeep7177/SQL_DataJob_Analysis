/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
-Include skill ID, name, and count of postings requiring the skill
*/
--ANS VERSION 1
WITH remote_job AS (
    SELECT 
        job_id,
        job_work_from_home,
        job_title_short
    FROM
        job_postings_fact
)

SELECT
    sj.skill_id,
    theskills.skills,
    COUNT(remote_job.job_work_from_home) AS job_counting
FROM 
    skills_job_dim AS sj
LEFT JOIN remote_job
ON sj.job_id = remote_job.job_id    
JOIN (
    SELECT 
        skill_id,
        skills
    FROM
        skills_dim
) AS theskills
ON sj.skill_id = theskills.skill_id
WHERE 
    job_work_from_home = TRUE AND
    remote_job.job_title_short = 'Data Analyst'
GROUP BY
    sj.skill_id, theskills.skills
ORDER BY job_counting DESC    



--ANS VERSION 2
WITH remote_job_skill AS (
SELECT
    skill_id,
    COUNT(*) AS job_count
FROM
    skills_job_dim AS skills_to_job  
INNER JOIN job_postings_fact AS job_postings
ON skills_to_job.job_id = job_postings.job_id
WHERE
    job_work_from_home = TRUE
GROUP BY
    skill_id    
)

SELECT
    skills,
    job_count
FROM
    skills_dim AS skills
INNER JOIN remote_job_skill 
ON remote_job_skill.skill_id = skills.skill_id       
ORDER BY
    job_count DESC
LIMIT 5;    

-- while using CTEs, the colums included in CTE table are only able to use in other main
-- query.
-- SELECT job_work_from_home
-- FROM job_postings_fact
-- WHERE job_work_from_home = TRUE

