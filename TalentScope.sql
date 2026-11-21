CREATE DATABASE talentscope;


USE talentscope;

SHOW DATABASES;

CREATE TABLE company_table (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    industry VARCHAR(100),
    company_location VARCHAR(100),
    company_size VARCHAR(50),
    website VARCHAR(200)
);

describe company_table;

INSERT INTO company_table
(company_id, company_name, industry, company_location, company_size)
VALUES
(1, 'TCS', 'IT Services', 'Hyderabad', 'Large'),
(2, 'Infosys', 'IT Services', 'Bangalore', 'Large'),
(3, 'Wipro', 'IT Services', 'Chennai', 'Large'),
(4, 'Deloitte', 'Consulting', 'Hyderabad', 'Large'),
(5, 'Accenture', 'IT Services', 'Bangalore', 'Large');

UPDATE company_table
SET website = 'www.tcs.com'
WHERE company_id = 1;

UPDATE company_table
SET website = 'www.infosys.com'
WHERE company_id = 2;

UPDATE company_table
SET website = 'www.wipro.com'
WHERE company_id = 3;

UPDATE company_table
SET website = 'www.deloitte.com'
WHERE company_id = 4;

UPDATE company_table
SET website = 'www.accenture.com'
WHERE company_id = 5;

SELECT * FROM company_table;

CREATE TABLE job_postings (
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title VARCHAR(100),
    location VARCHAR(100),
    salary_min DECIMAL(10,2),
    salary_max DECIMAL(10,2),
    experience_required INT,
    employment_type VARCHAR(50),
    work_mode VARCHAR(30),
    interview_rounds INT,
    job_posted_date DATE,
    application_deadline DATE,
    job_status VARCHAR(30),

    FOREIGN KEY (company_id)
    REFERENCES company_table(company_id)
);

INSERT INTO job_postings
(job_id, company_id, job_title, location, salary_min, salary_max,
experience_required, employment_type, work_mode, interview_rounds,
job_posted_date, application_deadline, job_status)
VALUES
(101, 1, 'Data Analyst', 'Hyderabad', 300000, 500000, 0, 'Full-Time', 'Hybrid', 3, '2026-11-01', '2026-12-01', 'Open'),
(102, 2, 'Python Developer', 'Bangalore', 350000, 600000, 1, 'Full-Time', 'Onsite', 4, '2026-11-03', '2026-12-05', 'Open'),
(103, 3, 'SQL Developer', 'Chennai', 300000, 450000, 0, 'Full-Time', 'Remote', 3, '2026-11-05', '2026-12-10', 'Open'),
(104, 4, 'Business Analyst', 'Hyderabad', 400000, 650000, 1, 'Full-Time', 'Hybrid', 4, '2026-11-07', '2026-12-15', 'Open'),
(105, 5, 'Power BI Developer', 'Bangalore', 350000, 550000, 0, 'Full-Time', 'Onsite', 3, '2026-11-10', '2026-12-20', 'Open');
select *from job_postings;

CREATE TABLE skills (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(100),
    skill_category VARCHAR(50)
);

INSERT INTO skills (skill_id, skill_name, skill_category)
VALUES
(1, 'SQL', 'Database'),
(2, 'Python', 'Programming'),
(3, 'Excel', 'Analytics'),
(4, 'Power BI', 'Visualization'),
(5, 'Tableau', 'Visualization'),
(6, 'Statistics', 'Analytics'),
(7, 'Machine Learning', 'AI'),
(8, 'MySQL', 'Database'),
(9, 'Communication', 'Soft Skills'),
(10, 'Data Cleaning', 'Analytics');

SELECT * FROM skills;

CREATE TABLE job_skills (
    job_skill_id INT PRIMARY KEY,
    job_id INT,
    skill_id INT,

    FOREIGN KEY (job_id)
    REFERENCES job_postings(job_id),

    FOREIGN KEY (skill_id)
    REFERENCES skills(skill_id)
);

INSERT INTO job_skills (job_skill_id, job_id, skill_id)
VALUES
(1, 101, 1),
(2, 101, 2),
(3, 101, 3),
(4, 101, 4),
(5, 102, 2),
(6, 102, 1),
(7, 103, 1),
(8, 103, 8),
(9, 104, 3),
(10, 104, 4);

SELECT * FROM job_skills;

CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    job_id INT,
    applicant_name VARCHAR(100),
    experience_years INT,
    application_date DATE,
    application_status VARCHAR(30),

    FOREIGN KEY (job_id)
    REFERENCES job_postings(job_id)
);

INSERT INTO applications
(application_id, job_id, applicant_name, experience_years,
application_date, application_status)
VALUES
(1, 101, 'Rahul', 0, '2026-11-05', 'Selected'),
(2, 101, 'Priya', 1, '2026-11-06', 'Rejected'),
(3, 101, 'Arjun', 0, '2026-11-07', 'In Progress'),
(4, 102, 'Sneha', 1, '2026-11-08', 'Selected'),
(5, 102, 'Kiran', 2, '2026-11-09', 'Rejected'),
(6, 103, 'Ananya', 0, '2026-11-10', 'In Progress'),
(7, 103, 'Ravi', 1, '2026-11-11', 'Selected'),
(8, 104, 'Meera', 0, '2026-11-12', 'Rejected'),
(9, 104, 'Vikram', 2, '2026-11-13', 'Selected'),
(10, 101, 'Divya', 0, '2026-11-14', 'In Progress');

SELECT * FROM applications;

CREATE TABLE interview_process (
    interview_id INT PRIMARY KEY,
    job_id INT,
    round_number INT,
    round_name VARCHAR(100),
    round_status VARCHAR(30),

    FOREIGN KEY (job_id)
    REFERENCES job_postings(job_id)
);

INSERT INTO interview_process
(interview_id, job_id, round_number, round_name, round_status)
VALUES
(1, 101, 1, 'Aptitude', 'Completed'),
(2, 101, 2, 'Technical', 'Completed'),
(3, 101, 3, 'HR', 'Pending'),
(4, 102, 1, 'Technical', 'Completed'),
(5, 102, 2, 'Coding', 'Completed'),
(6, 102, 3, 'Managerial', 'Pending'),
(7, 102, 4, 'HR', 'Pending'),
(8, 103, 1, 'Technical', 'Completed'),
(9, 103, 2, 'Coding', 'Pending'),
(10, 103, 3, 'HR', 'Pending'),
(11, 104, 1, 'Aptitude', 'Completed'),
(12, 104, 2, 'Technical', 'Completed'),
(13, 104, 3, 'Managerial', 'Pending'),
(14, 104, 4, 'HR', 'Pending');

select *from interview_process;

USE talentscope;

SELECT COUNT(*) AS total_companies FROM company_table;

SELECT COUNT(*) AS total_jobs FROM job_postings;

SELECT COUNT(*) AS total_skills FROM skills;

SELECT COUNT(*) AS job_skill_mappings FROM job_skills;

SELECT COUNT(*) AS total_applications FROM applications;

SELECT COUNT(*) AS interview_records FROM interview_process;

SELECT
    c.company_name,
    COUNT(j.job_id) AS total_job_openings
FROM company_table c
LEFT JOIN job_postings j
    ON c.company_id = j.company_id
GROUP BY c.company_id, c.company_name
ORDER BY total_job_openings DESC;

SELECT
    s.skill_name,
    COUNT(js.job_id) AS number_of_jobs
FROM skills s
LEFT JOIN job_skills js
    ON s.skill_id = js.skill_id
GROUP BY s.skill_id, s.skill_name
ORDER BY number_of_jobs DESC;

SELECT
    job_title,
    ROUND(AVG((salary_min + salary_max) / 2), 2) AS average_salary
FROM job_postings
GROUP BY job_title
ORDER BY average_salary DESC;

SELECT
    location,
    COUNT(job_id) AS total_openings
FROM job_postings
GROUP BY location
ORDER BY total_openings DESC;

SELECT
    job_title,
    company_id,
    location,
    experience_required
FROM job_postings
WHERE experience_required = 0;

SELECT
    c.company_name,
    COUNT(j.job_id) AS fresher_openings
FROM company_table c
INNER JOIN job_postings j
    ON c.company_id = j.company_id
WHERE j.experience_required = 0
GROUP BY c.company_name
ORDER BY fresher_openings DESC;

SELECT
    c.company_name,
    j.job_title,
    j.location,
    j.work_mode
FROM company_table c
INNER JOIN job_postings j
    ON c.company_id = j.company_id
WHERE j.work_mode = 'Remote';

SELECT
    application_status,
    COUNT(*) AS total_applications
FROM applications
GROUP BY application_status
ORDER BY total_applications DESC;

SELECT
    application_status,
    COUNT(*) AS total_applications
FROM applications
GROUP BY application_status;

SELECT
    COUNT(*) AS total_applications,
    SUM(CASE WHEN application_status = 'Selected' THEN 1 ELSE 0 END) AS selected,
    ROUND(
        SUM(CASE WHEN application_status = 'Selected' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*), 2
    ) AS selection_percentage
FROM applications;

SELECT
    c.company_name,
    AVG(j.interview_rounds) AS average_interview_rounds
FROM company_table c
INNER JOIN job_postings j
    ON c.company_id = j.company_id
GROUP BY c.company_name
ORDER BY average_interview_rounds DESC;

SELECT
    c.company_name,
    j.job_title,
    j.salary_max,
    RANK() OVER (ORDER BY j.salary_max DESC) AS salary_rank
FROM company_table c
INNER JOIN job_postings j
    ON c.company_id = j.company_id;

WITH High_Salary_Jobs AS (
    SELECT
        job_title,
        location,
        salary_max
    FROM job_postings
    WHERE salary_max > 500000
)
SELECT *
FROM High_Salary_Jobs;

SELECT
    job_title,
    location,
    salary_max
FROM job_postings
WHERE salary_max > (
    SELECT AVG(salary_max)
    FROM job_postings
);

SELECT *
FROM job_postings
WHERE job_title IS NULL
   OR location IS NULL
   OR salary_min IS NULL
   OR salary_max IS NULL
   OR company_id IS NULL;

   SELECT
    job_id,
    COUNT(*) AS duplicate_count
FROM job_postings
GROUP BY job_id
HAVING COUNT(*) > 1;

SELECT *
FROM job_postings
WHERE salary_min < 0
   OR salary_max < salary_min;


SELECT *
FROM job_postings
WHERE experience_required < 0;