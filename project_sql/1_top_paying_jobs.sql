/*
Quiestion: What are the top-paying data analyst jobs in Texas?
- Identify the top 10 highest paying data analyst roles in Texas or are fully remote.
- Focuses on job postings with specified salaries (remove nulls)
- Why? Highlight the top paying opportunities for data analysts, offering insights
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    (job_location = 'Texas' OR job_location = 'Anywhere') AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;