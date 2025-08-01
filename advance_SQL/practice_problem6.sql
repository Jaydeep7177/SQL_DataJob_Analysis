-- Practice Problem 6
-- Create Tables from Other Tables
-- Question:
-- Create three tables:
-- Jan 2023 jobs
-- Feb 2023 jobs
-- Mar 2023 jobs
-- Foreshadowing: This will be used in another practice problem below.
-- Hints:
-- Use CREATE TABLE table_name AS syntax to create your table
-- Look at a way to filter out only specific months (EXTRACT)

CREATE TABLE january_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS 
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT * 
FROM january_jobs;


SELECT job_posted_date
FROM march_jobs;
        
