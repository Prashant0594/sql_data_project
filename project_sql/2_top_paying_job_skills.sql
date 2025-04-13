/* Questions: What skills are required for top paying data analyst jobs? 
   - use the top 10 highest paying data analyst jobs from the first query
   - add the specific skills required for these roles
   - why? it provides a detailed look at the skills that are in demand for high-paying data analyst positions, helping job seekers to 
    understand what skills they need to develop to be competitive in the job market. */



SELECT name as company_name, job_title, skills, salary_year_avg
FROM job_postings_fact
left JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
left JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 

WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;

/* simplified version of the above query, using CTEs to make it more readable and maintainable */
WITH top_paying_jobs AS (
    SELECT job_id,name as company_name, job_title, salary_year_avg
    FROM job_postings_fact
    left JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_work_from_home = TRUE AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*, skills
FROM top_paying_jobs
LEFT JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/* one can export the data from above query and analyze using python or R to get the top 10 skills required for the top paying data analyst jobs */ 
