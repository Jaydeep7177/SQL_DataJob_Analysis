# SQL Data Job Analysis

## Introduction

This project explores the data job market for data analysts, specifically focusing on remote positions. The analysis aims to identify the highest-paying opportunities, most in-demand skills, and optimal skills that combine high demand with competitive salaries. Using SQL queries on a comprehensive job posting database, this project provides valuable insights for aspiring data analysts and professionals looking to advance their careers.

## Background

The data job market has experienced significant growth in recent years, with data analyst positions becoming increasingly popular. However, navigating this competitive landscape requires understanding which skills are most valuable and which companies offer the best compensation. This project addresses five key questions:

1. **What are the top-paying data analyst jobs?** - Identifying the highest-paying remote positions
2. **What skills are required for top-paying jobs?** - Understanding skill requirements for high-compensation roles
3. **What are the most in-demand skills?** - Analyzing overall market demand for specific skills
4. **What are the top skills based on salary?** - Identifying skills that command the highest average salaries
5. **What are the most optimal skills to learn?** - Finding skills that offer both high demand and high compensation

The dataset includes job postings from various companies, encompassing salary information, required skills, and job details. This analysis focuses specifically on remote data analyst positions to provide insights into location-flexible opportunities.

## Tools I Used

- **SQL**: The core language used for database queries and data extraction
- **PostgreSQL**: Database management system for storing and querying the job posting data
- **VS Code**: Primary code editor for writing and executing SQL queries
- **GitHub**: Version control and project repository hosting
- **Git**: Version control system for tracking changes and collaboration

## The Analysis

### Question 1: Top-Paying Data Analyst Jobs

The analysis revealed the top 10 highest-paying remote data analyst positions, with salaries ranging from $184,000 to $650,000 annually.

**Key Findings:**
- **Mantys** leads with an exceptional salary of $650,000
- **Meta** offers $336,500, significantly higher than other tech companies
- **AT&T** provides $255,830, showing traditional telecom companies are competitive
- Several companies appear multiple times, indicating consistent high-paying opportunities

**SQL Query:**
```sql
SELECT
    jp.company_id,
    cd.name,
    job_title_short,
    job_location,
    salary_year_avg
FROM
    job_postings_fact AS jp
INNER JOIN company_dim AS cd
ON jp.company_id = cd.company_id    
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

### Question 2: Skills Required for Top-Paying Jobs

Analysis of the skills required for the highest-paying positions revealed that technical proficiency across multiple domains is essential.

**Key Findings:**
- **SQL** is the most critical skill, appearing in 8 out of 10 top-paying jobs
- **Python** follows closely, required in 7 positions
- **Tableau** visualization skills are needed in 6 positions
- Cloud platforms (**Azure**, **AWS**) and big data tools are increasingly important
- Traditional tools like **Excel** remain relevant even in high-paying roles

**SQL Query:**
```sql
WITH top_paying_jobs AS (
    SELECT
        jp.job_id,
        jp.company_id,
        cd.name,
        job_title_short,
        job_location,
        salary_year_avg
    FROM
        job_postings_fact AS jp
    INNER JOIN company_dim AS cd
    ON jp.company_id = cd.company_id    
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    sj.skill_id,
    sd.skills,
    tpj.*
FROM
    skills_job_dim AS sj
INNER JOIN top_paying_jobs AS tpj
ON sj.job_id = tpj.job_id
INNER JOIN skills_dim AS sd
ON sd.skill_id = sj.skill_id
ORDER BY salary_year_avg DESC;
```

### Question 3: Most In-Demand Skills for Data Analysts

| Skill | Job Postings Count |
|-------|-------------------|
| SQL | 7,291 |
| Excel | 4,611 |
| Python | 4,330 |
| Tableau | 3,745 |
| Power BI | 2,609 |

**Analysis:**
SQL dominates the market with over 7,000 job postings, confirming its status as the foundational skill for data analysts. Excel remains surprisingly relevant with 4,611 postings, while Python's importance is evident with 4,330 mentions. Visualization tools like Tableau and Power BI round out the top 5, emphasizing the importance of data presentation skills.

### Question 4: Top Skills Based on Salary

| Skill | Average Salary ($) |
|-------|-------------------|
| PySpark | $208,172 |
| Bitbucket | $189,155 |
| Couchbase | $160,515 |
| Watson | $160,515 |
| DataRobot | $155,486 |
| GitLab | $154,500 |
| Swift | $153,750 |
| Jupyter | $152,777 |
| Pandas | $151,821 |
| Elasticsearch | $145,000 |

**Analysis:**
Specialized big data and machine learning tools command the highest salaries. PySpark leads with over $208,000 average salary, highlighting the value of big data processing skills. Development tools like Bitbucket and GitLab also show high compensation, indicating the importance of DevOps skills in data roles.

### Question 5: Most Optimal Skills to Learn

| Skill | Job Count | Average Salary ($) |
|-------|-----------|-------------------|
| Go | 27 | $115,320 |
| Confluence | 11 | $114,210 |
| Hadoop | 22 | $113,193 |
| Snowflake | 37 | $112,948 |
| Azure | 34 | $111,225 |
| BigQuery | 13 | $109,654 |
| AWS | 32 | $108,317 |
| Java | 17 | $106,906 |
| SSIS | 12 | $106,683 |
| Jira | 20 | $104,918 |

**Analysis:**
This analysis identifies skills that offer both reasonable job availability and high compensation. Cloud platforms (Snowflake, Azure, AWS) feature prominently, showing their importance in modern data infrastructure. Programming languages like Go and Java offer excellent salary potential with moderate demand.

## What I Learned

Throughout this project, I developed several key insights about the data analyst job market:

1. **SQL is Non-Negotiable**: SQL appeared in nearly every high-paying position and had the highest overall demand, confirming its status as the fundamental skill for data analysts.

2. **Specialization Pays**: The highest salaries are associated with specialized skills like PySpark, advanced cloud platforms, and machine learning tools rather than general skills.

3. **Cloud Skills are Critical**: Modern data analysts must be proficient in cloud platforms (AWS, Azure, Snowflake) as traditional on-premise solutions become less common.

4. **Visualization Remains Important**: Despite the technical nature of many high-paying roles, data visualization tools (Tableau, Power BI) remain consistently in demand.

5. **Programming Versatility**: While Python dominates, knowledge of additional languages like Go, Java, or R can significantly increase earning potential.

6. **Tool Ecosystem Matters**: Understanding not just individual tools but how they work together (e.g., Python + Pandas + Jupyter) is increasingly important.

## Conclusions

Based on this comprehensive analysis of the data analyst job market, several strategic recommendations emerge:

**For Aspiring Data Analysts:**
- Master SQL as your foundation - it's required in 90% of positions
- Learn Python for data manipulation and analysis
- Gain proficiency in at least one major visualization tool (Tableau or Power BI)
- Develop cloud platform skills, starting with AWS or Azure

**For Career Advancement:**
- Specialize in big data technologies (PySpark, Hadoop, Snowflake) for highest earning potential
- Consider learning programming languages beyond Python (Go, Java) for competitive advantage
- Develop DevOps skills (Git, GitLab, Jira) as data roles increasingly require collaboration tools
- Stay current with machine learning and AI tools as they become mainstream

**Market Insights:**
- Remote opportunities exist across all salary ranges, with top positions offering $650,000+
- Traditional companies (AT&T, healthcare) compete with tech giants for data talent
- The skill premium for specialized knowledge is substantial - specialized skills can double earning potential
- The market rewards technical depth over breadth, but foundational skills remain essential

This analysis demonstrates that while the data analyst field offers excellent opportunities, success requires strategic skill development focusing on both foundational capabilities and emerging technologies. The combination of strong SQL skills, cloud proficiency, and specialized knowledge in areas like big data or machine learning provides the best path to high-compensation roles in this dynamic field.