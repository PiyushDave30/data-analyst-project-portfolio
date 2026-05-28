# 🗄️ SQL Queries — HR Attrition Analysis

This folder contains all SQL queries written for the HR Attrition project using **MySQL Workbench**.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [HR Attrition SQL](HR_Analytics_Queries.sql) | Complete SQL file with all 15+ queries |
| [HR1](HR1.png) | Screenshot — Gender, Department, Salary, Job Role queries |
| [HR2](HR2.png) | Screenshot — Top 5 paid, Top salaries, Dept avg, Job role count |
| [HR3](HR3.png) | Screenshot — Salary categorization, Attrition count, Attrition rate |
| [HR4](HR4.png) | Screenshot — Avg salary left vs stayed, Education, Working years |

---

## 📋 Queries Covered

| # | Query | Description |
|---|-------|-------------|
| 1 | Gender Count | Count employees by gender from `hr_1` |
| 2 | Sales Dept Filter | All employees with JobRole LIKE "Sales %" |
| 3 | Dept Employee Count | Count employees per department |
| 4 | High Salary Filter | Employees with MonthlyIncome >= 50,000 |
| 5 | Dept + Job Role Breakdown | Unique job roles per department with count |
| 6 | Male/Female Count | Gender-wise total employee count |
| 7 | Yearly Salary Calculation | Monthly income × 12 with JOIN on HR_1 and HR_2 |
| 8 | Top 5 Highest Paid | MAX income per employee with LIMIT 5 |
| 9 | Top Salaries by Job Role | EmployeeNumber + JobRole + Income ordered desc |
| 10 | Dept Avg Salary | AVG monthly income per department |
| 11 | Job Role Employee Count | COUNT employees per job role |
| 12 | Total Salary per Dept | SUM of MonthlyIncome grouped by department |
| 13 | Same Job Role Pairs | Self JOIN to find employees sharing job roles |
| 14 | Salary Categorization | CASE WHEN — Low (<30K), Medium (30K–40K), High (>40K) |
| 15 | Attrition Count | SUM(CASE WHEN attrition = "Yes") |
| 16 | Attrition Rate % | Attrition rate + Active + Attrited employee counts |
| 17 | Dept-wise Attrition | Attrition count and % per department |
| 18 | Job Role Attrition | Attrition count and % per job role |
| 19 | Avg Salary Left vs Stayed | AVG income by Attrition (Yes/No) |
| 20 | Employees > 5 Years | Filter employees with YearsAtCompany > 5 |
| 21 | Gender by Company Years | Gender count + years at company > 5 |
| 22 | Salary by Education | AVG income grouped by education level |
| 23 | Avg Income by Job Role | AVG monthly income per job role |
| 24 | Avg Hourly Rate Male RS | Hourly rate filtered: Gender = Male + JobRole = Research Scientist |
| 25 | Avg Working Years by Dept | AVG TotalWorkingYears per department |

---

## 🛠️ SQL Concepts Used
- `JOIN` — HR_1 and HR_2 tables on EmployeeNumber = Employee ID
- `Self JOIN` — find employees with same job role
- `GROUP BY`, `ORDER BY DESC`, `LIMIT`
- `CASE WHEN` — multi-level salary categorization + attrition flag
- `WHERE` with multiple conditions (Gender + JobRole filter)
- `SUM()`, `COUNT()`, `AVG()`, `MAX()`, `ROUND()`, `CONCAT()`
- `LIKE` for pattern matching

---

## 💡 Key Attrition Rate Query
```sql
SELECT
  ROUND((SUM(CASE WHEN attrition = "Yes" THEN 1 ELSE 0 END) * 100) / COUNT(*), 2)
    AS 'Attrition rate Percent',
  SUM(CASE WHEN attrition = "Yes" THEN 1 ELSE 0 END) AS Attrition_count,
  SUM(CASE WHEN attrition = "No" THEN 1 ELSE 0 END) AS Active_Employee
FROM hr_1;
```
