/*
Question: What are the top skills based on salary?
- look at the average salary associated with each skill for data analyst positions
- focuses on roles with specified salaries, regardless of location
- why? it provides insights into the skills that are associated with higher salaries, 
helping job seekers to understand which skills are most valuable in the job market.
*/

SELECT skills, round(avg(salary_year_avg),0) as avg_salary
from job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 10;