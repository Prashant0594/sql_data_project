/* Question: 
What are the most optimal skills to learn? (aka what skills are in demand and pay well?)
- identify skills in high demand and associated with high salaries for data analyst positions
- concentrates on remote positions with specified salaries
- why? it provides insights into the skills that are both in demand and associated with higher salaries,
helping job seekers to understand which skills are most valuable in the job market.
*/

SELECT
skills,
count(skills_job_dim.job_id) as demand_count,
round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND job_work_from_home = TRUE AND salary_year_avg IS NOT NULL
GROUP BY skills
HAVING count(skills_job_dim.job_id) > 10
ORDER BY 
avg_salary DESC, demand_count DESC
LIMIT 25;