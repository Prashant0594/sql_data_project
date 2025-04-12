/* Questions: What skills are required for top paying data analyst jobs? 
   - use the top 10 highest paying data analyst jobs from the first query
   - add the specific skills required for these roles
   - why? it provides a detailed look at the skills that are in demand for high-paying data analyst positions, helping job seekers to 
    understand what skills they need to develop to be competitive in the job market. */



SELECT name as company_name, job_title, salary_year_avg
FROM job_postings_fact
left JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

