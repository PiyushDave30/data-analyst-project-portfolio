-- ** Find total number of employees **
select Gender,count(employeenumber) as Employees from hr_1 group by Gender;

-- ** Show all employees from Sales department Sales Executive **
select * from hr_1 where JobRole like "Sales %";

-- ** Count employees in each department ** 
select department,count(EmployeeNumber) from HR_1 group by department;

-- ** Find employees with monthly salary > 50,000 **
select * from HR_2 where monthlyIncome >= 50000;

-- ** Display unique job roles **
select department, Jobrole , count(`Employeenumber`) as num from HR_1 group by department , jobrole;

-- ** Find number of male and female employees **
select gender,count(employeENUMBER) as  `Total Employee`from HR_1 group by GENDER;

-- ** Get average salary of all employees by calculating yearly **
select b.`employee id`, concat(round((b.monthlyincome * 12)/1000), ' K') as Yearly_Salary
from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID` order by (b.monthlyincome * 12) desc;
-- *********************************************************************************************************************************************
-- ** Top 5 highest paid employees **
select `employee id`,max(monthlyincome) as "Max Income" from HR_1 a join hr_2 b on a.Employeenumber = b.`Employee ID`
group by`employee id`order by max(monthlyincome) desc limit 5;

-- ** Top Salaries in each job role **
select a.EmployeeNumber, a.JobRole, b.MonthlyIncome from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID`
order by b.MonthlyIncome desc limit 5;

-- ** Department with highest average salary **
select department , round(avg(monthlyincome)) from HR_1 a join hr_2 b on a.Employeenumber = b.`Employee ID`
group by department order by avg(MonthlyIncome) desc; -- also use limit 1/2/3

-- Count employees by job role
select jobrole,count(`employee id`) as " No. of Employees" from HR_1 a join hr_2 b on a.Employeenumber = b.`Employee ID`
group by jobrole;

-- Find total salary expense per department
select a.Department, SUM(b.MonthlyIncome) as Total_Salary from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID`
group by a.Department;

-- Find employees with same job role
select a.employeenumber , a.jobrole , b.employeenumber , b.jobrole from HR_1 a join hr_1 b on a.Employeenumber = b.`Employeenumber`
where a.jobrole = b.jobrole;
-- ******************************************************************************************************************************

-- Employees with same job role
select JobRole, count(*) as count
from HR_1
group by JobRole
HAVING count(*) > 1;

select a.*
from HR_1 a
join (
    select JobRole
    from HR_1
    group by JobRole
    HAVING count(*) > 1
) b 
on a.JobRole = b.JobRole;

-- Get min, max salary in each department
select department , min(monthlyincome) , max(monthlyincome)
from HR_1 a join hr_2 b on a.Employeenumber = b.`Employee ID`
group by department;

-- Find departments having more than 10 employees
select department, count(`employee id`) as numbers
from HR_1 a join hr_2 b on a.Employeenumber = b.`Employee ID`
group by department
having numbers > 10;

select a.Department, count(*) as Employee_count
from HR_1 a
group by a.Department
HAVING count(*) > 10;

-- Average age of employees by gender
select gender , avg(age)
from HR_1 a join hr_2 b on a.Employeenumber = b.`Employee ID`
group by gender;

-- ---------------------------------------------------------------------------------
select * from hr_1;
select * from hr_2;

/* Categorize employees: Salary < 30K → Low , 30K–60K → Medium , 60K → High */
select a.employeenumber , b.MonthlyIncome,
case when monthlyincome < 30000 then "low"
	 when monthlyincome > 30000 and monthlyincome < 40000 then "Medium"
     else "High"
end as Sal
from HR_1 a join hr_2 b on a.Employeenumber = b.`Employee ID`;

-- Find attrition count (employees who left)
select sum(case when attrition = "Yes" then 1 else 0 end) as count from hr_1;

-- Attrition rate (%) Active and Atrrited Employee count
select round((sum(case when attrition = "Yes" then 1 else 0 end)* 100) / count(*),2 ) as `Attrition rate Percent`,
sum(case when attrition = "Yes" then 1 else 0 end) as Attrition_count,
sum(case when attrition = "No" then 1 else 0 end) as Active_Employee
from hr_1;

-- Department-wise attrition count and attrition percent
select department,count(*) as Total, sum(case when attrition = "Yes" then 1 else 0 end) as Attrition_count,
concat(round((sum(case when attrition = "Yes" then 1 else 0 end)* 100) / count(*),2 )," %") as `Attrition rate Percent`
from hr_1 group by department order by`Attrition rate Percent` desc;

-- Job role with highest attrition
select jobrole,count(*) as Total, sum(case when attrition = "Yes" then 1 else 0 end) as Attrition_count,
concat(round((sum(case when attrition = "Yes" then 1 else 0 end)* 100) / count(*),2 )," %") as `Attrition rate Percent`
from hr_1 group by jobrole order by`Attrition rate Percent`desc;

-- ************************************************************************************************************************************************

-- Average salary of employees who left vs stayed
select a.Attrition, ROUND(avg(b.MonthlyIncome), 2) as avg_Salary
from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID` group by a.Attrition;

-- Find employees working more than 5 years
select * from hr_2 where YearsAtCompany > 5;

-- Gender count by years at company
select gender, count(*) as Total , sum(case when yearsatcompany > 5 then 1 else 0 end ) as "Years_at_Company"
from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID` group by gender;

-- Compare salary by education level
select a.Education, ROUND(avg(b.MonthlyIncome), 2) as avg_Salary
from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID` group by a.Education order by avg_Salary desc;

-- Avg monthly income for job role
select a.JobRole, round(avg(b.MonthlyIncome),2) as avg_Income from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID`
group by a.JobRole order by avg_Income desc;

-- Avg hourly rate for male research scientist
select ROUND(avg(HourlyRate), 2) as avg_Hourly_Rate from hr_1
where Gender = 'Male'and JobRole = 'Research Scientist';

-- Avg working hours for dept
select Department, ROUND(avg(TotalWorkingYears), 2) as avg_Working_Years
from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID` group by Department order by avg_Working_Years desc;

-- Job role vs Work-life Balance
select JobRole,WorkLifeBalance as `Work-Life Balance`,count(*) as Employee_count from HR_1 a join HR_2 b on a.EmployeeNumber = b.`Employee ID`
group by JobRole, WorkLifeBalance order by JobRole, WorkLifeBalance;


