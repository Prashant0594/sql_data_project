SELECT job_schedule_type,avg(salary_year_avg) as yearly_avg, avg(salary_hour_avg) as hourly_avg
FROM job_postings_fact
where date(job_posted_date)>'2023-06-01'
group by job_schedule_type;


SELECT EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS posted_month,
count(job_id) as job_count
FROM job_postings_fact
group by posted_month
order by posted_month;


select * from company_dim LIMIT 10;

SELECT company_dim.name
FROM job_postings_fact LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
where (job_postings_fact.job_health_insurance = TRUE)
AND
EXTRACT(QUARTER FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2;