/* what are the top paying data analyst jobs?
- identify the top 10 highest paying data analyst jobs that are available remotely
- focuses on job postings with specified salaries (remove nulls)
- Why? highlight the top paying opportunities for data analysts, offering insights into employment opportunities */


SELECT name as company_name, job_title, salary_year_avg
FROM job_postings_fact
left JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
