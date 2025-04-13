/* Question: What are the most in demand skills for a data analyst?
- join job postings to inner join table similar to query 2
- identify the top 5 in-demand skills for data analyst
- focus on all job postings
- why? retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers */

SELECT *
FROM job_postings_fact
limit 10;

With data_analyst_jobs AS (
    SELECT job_title, skills
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    where job_title_short = 'Data Analyst'
)
SELECT skills, COUNT(*) as count
FROM data_analyst_jobs
GROUP BY skills
ORDER BY count DESC
LIMIT 5;