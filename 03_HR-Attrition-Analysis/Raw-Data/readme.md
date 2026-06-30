# Raw Data — HR Attrition Analysis

This folder contains the original, unmodified HR datasets used for this project.  
The data was provided by **ExcelR** as part of the AI Variant virtual internship curriculum.

---
 
## Files in This Folder

| File Name | Description |
|-----------|-------------|
| `HR_1.csv` | Employee profile table — demographics, department, job role, attrition flag |
| `HR_2.csv` | Employee compensation table — monthly income, hourly rate, years at company, working years |

---

## Dataset Details

| Property | Value |
|----------|-------|
| **Source** | HR Analytics Dataset — ExcelR Internship |
| **Tables** | HR_1 (employee info) + HR_2 (salary/work data) |
| **Total Records** | 50,000 employees |
| **Departments** | R&D, Software, Support, Sales, HR, Hardware |
| **Key Fields in HR_1** | EmployeeNumber, Department, JobRole, Gender, Attrition, OverTime, WorkLifeBalance, YearsSinceLastPromotion, BusinessTravel |
| **Key Fields in HR_2** | Employee ID, MonthlyIncome, HourlyRate, YearsAtCompany, TotalWorkingYears, Education |

---

## Note
- Data is in **original raw form** — no changes applied here
- JOIN key between tables: `HR_1.EmployeeNumber = HR_2.'Employee ID'`
