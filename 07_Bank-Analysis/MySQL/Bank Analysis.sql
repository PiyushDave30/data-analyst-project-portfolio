select * from finance1;
select * from finance2;

desc finance1;
desc finance2;

-- ****************************************** BasIC EXPLORATORY ANALYSIS (EDA) *****************************************************************************
-- 1. Total number of loans
select count(*) as `Total Loans` from finance1;

-- 2. Total customers
select count(distinct member_id) as `Total Customers` from finance1;

-- 3. distinct state names and total count in one query
SELECT count(distinct addr_state) as Total_States,group_concat(distinct addr_state order by addr_state separator ' , ') as State_Names from finance1;

-- 4. count loans by grade
select grade,count(*) as `Total Loans` from finance1 group by grade order by count(*) desc;

-- 5. count loans by purpose
select purpose,count(*) as `Total Loans` from finance1 group by purpose order by count(*) desc;

-- 6. Average loan amount
select round(avg(loan_amnt),2) as `Avg Loan Amount` from finance1;

-- 7. Highest annual income
select id,member_id,emp_title,purpose,`desc` from finance1 where annual_inc = (select max(annual_inc) from finance1);

-- 8. Loan status counts
select loan_status,count(*) as `count` from finance1 group by loan_status order by count(*) desc;

-- 9. Top 10 states by loans
select addr_state,sum(loan_Amnt) from finance1 group by addr_state order by sum(loan_amnt) desc limit 10;

-- 10. Average interest rate
select round(avg(int_rate),3) as `Avg Interest Rate` from finance1;

-- ****************************************** CUSTOMER & FINANCIAL ANALYSIS & Business Insight  *****************************************************************************
-- 1. Average loan amount by grade
select grade, round(avg(loan_amnt),2) as `Avg Loan Amount` from finance1 group by grade order by avg(loan_amnt) desc;

-- 2. Loan default rate by state
SELECT addr_state,count(*) as Total_Loans, SUM(CasE WHEN loan_status='Charged Off' THEN 1 ELSE 0 END) as Default_count,
       ROUND( SUM(CasE WHEN loan_status='Charged Off' THEN 1 ELSE 0 END)*100.0/count(*),2 ) as Default_Rate_Pct
from finance1 GROUP BY addr_state order by Default_Rate_Pct DESC; 

-- Stored Procedure by Loan Status( Charged Off, Current, Fully Paid )
Delimiter == 
Create Procedure Loan_Status ( in a varchar(50) )
begin
select addr_state, count(*) as "Total Loans" , sum(case when loan_status = a then 1 else 0 end) as "Default count",
round( sum(case when loan_status = a then 1 else 0 end) * 100.0 / count(*),2) as "Defualt Rate Percent"
from finance1 group by addr_state order by `Defualt Rate Percent` desc;
end ==
Delimiter ;
call loan_status("Fully Paid");

-- 3. Income by home ownership
SELECT home_ownership,ROUND(AVG(annual_inc),2) as Avg_Income,count(*) as Customers from finance1 GROUP BY home_ownership order by Avg_Income DESC;

-- 4. Grade-wise interest rates
SELECT grade,ROUND(AVG(REPLACE(int_rate,'%','') + 0),2) as Avg_Interest_Rate from finance1 GROUP BY grade order by Avg_Interest_Rate DESC;


-- 5. Top purposes by funded amount
SELECT purpose,ROUND(SUM(funded_amnt),2) as Total_Funded_Amount
from finance1 GROUP BY purpose order by Total_Funded_Amount DESC LIMIT 10;

-- 6. Compare verified vs non-verified customers
SELECT verification_status,count(*) as Customers,ROUND(AVG(loan_amnt),2) as Avg_Loan,ROUND(AVG(annual_inc),2) as Avg_Income
from finance1 GROUP BY verification_status;

-- 7. Customers with highest DTI
SELECT id,member_id,dti,annual_inc,loan_amnt
from finance1 order by dti DESC LIMIT 10;

-- 8. Fully paid vs charged off comparison
SELECT loan_status,count(*) as Loans,ROUND(AVG(loan_amnt),2) as Avg_Loan,ROUND(AVG(annual_inc),2) as Avg_Income,ROUND(AVG(dti),2) as Avg_DTI
from finance1 WHERE loan_status IN ('Fully Paid','Charged Off') GROUP BY loan_status;

-- 9. State-wise avg income
SELECT addr_state,ROUND(AVG(annual_inc),2) as Avg_Income,count(*) as Customers
from finance1 GROUP BY addr_state order by Avg_Income DESC;

-- 10. Monthly installment trends
SELECT issue_d,count(*) as Loans,ROUND(AVG(installment),2) as Avg_Installment
from finance1 GROUP BY issue_d order by issue_d;


-- ****************************************** STORED PROCEDURES *****************************************************************************
-- Loan Profile by ID-------------------------------------------------------------------------------------------------
Delimiter ==
Create Procedure Loan_Profile (in p_id int)
Begin
SELECT * from finance1 a JOIN finance2 b ON a.id = b.id WHERE a.id = p_id;
end ==
Delimiter ;
drop procedure loan_profile;
call loan_profile(54734);

-- Grade Analysis------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE GradeAnalysis(IN p_grade VARCHAR(5))
BEGIN
SELECT grade,count(*) as Loans, ROUND(AVG(loan_amnt),2) as Avg_Loan,
       ROUND(AVG(annual_inc),2) as Avg_Income, ROUND(AVG(REPLACE(int_rate,'%','')+0),2) as Avg_Rate
from finance1 WHERE grade = p_grade GROUP BY grade;
END //
DELIMITER ;
CALL GradeAnalysis('A');
CALL GradeAnalysis('C');


-- Loan Analyzer----------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE LoanAnalyzer(
    IN p_column VARCHAR(50),
    IN p_value VARCHAR(100)
)
BEGIN
SET @sql = CONCAT(
'SELECT count(*) as Total_Loans,
ROUND(AVG(loan_amnt),2) as Avg_Loan,
ROUND(AVG(annual_inc),2) as Avg_Income,
ROUND(AVG(dti),2) as Avg_DTI
from finance1
WHERE ', p_column, ' = "', p_value, '"'
);

PREPARE stmt from @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

CALL LoanAnalyzer('loan_status','Charged Off');
CALL LoanAnalyzer('grade','A');
CALL LoanAnalyzer('addr_state','CA');


/* =========================================================
1. MasTER PROCEDURE Returns multiple result tables in one CALL */
DELIMITER //
CREATE PROCEDURE MasTER_SP(IN p_state VARCHAR(10))
BEGIN

-- o/p 1 - State KPI 
SELECT addr_state,count(*) as Total_Loans,ROUND(SUM(funded_amnt),2) as Total_Funded,
				  ROUND(AVG(loan_amnt),2) as Avg_Loan,ROUND(AVG(annual_inc),2) as Avg_Income
from finance1 WHERE addr_state = p_state GROUP BY addr_state;

-- o/p 2 - Grade Distribution
SELECT grade,count(*) as Loans
from finance1 WHERE addr_state = p_state GROUP BY grade order by Loans DESC;

-- o/p 3 - Top 5 Purposes
SELECT purpose,count(*) as Loans
from finance1 WHERE addr_state = p_state GROUP BY purpose order by Loans DESC LIMIT 5;

-- o/p 4 - Loan Status Summary
SELECT loan_status,count(*) as Loans
from finance1 WHERE addr_state = p_state GROUP BY loan_status order by Loans DESC;

END //
DELIMITER ;
CALL MasTER_SP('CA');

-- ****************************************** VIEWS *****************************************************************************
-- View For state
Create view StateRanking as
SELECT addr_state,
       count(*) as Total_Loans,
       SUM(CasE WHEN loan_status='Charged Off' THEN 1 ELSE 0 END) as Defaults,
       ROUND(
       SUM(CasE WHEN loan_status='Charged Off' THEN 1 ELSE 0 END)*100.0/count(*),2
       ) as Default_Rate,
       DENSE_RANK() OVER(
       order by
       SUM(CasE WHEN loan_status='Charged Off' THEN 1 ELSE 0 END)*100.0/count(*) DESC
       ) as Risk_Rank
from finance1
GROUP BY addr_state;
select * from stateranking;
