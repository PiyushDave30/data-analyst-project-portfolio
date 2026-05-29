# 🗄️ SQL Queries — Bank Loan Analysis

All queries are written in **MySQL Workbench** on the `finance1` and `finance2` tables organized into 3 sections + stored procedures + views.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Bank Analysis SQL](Bank%20Analysis.sql) | Complete SQL file — all 20+ queries |
| [BA1](BA1.png) | Screenshot — Stored Procedures: Loan_Profile + GradeAnalysis |
| [BA2](BA2.png) | Screenshot — MASTER_SP returning 4 result tables |
| [BA3](BA3.png) | Screenshot — StateRanking VIEW with DENSE_RANK + output |
| [BA4](BA4.png) | Screenshot — Basic EDA section |
| [BA5](BA5.png) | Screenshot — Customer & Financial Analysis |
| [BA6](BA6.png) | Screenshot — Business Insight queries |

---

## 📋 Query Sections

### Section 1 — Basic Exploratory Analysis (EDA)
| # | Query | Description |
|---|-------|-------------|
| 1 | Total Loans | `COUNT(*)` from finance1 |
| 2 | Total Customers | `COUNT(DISTINCT member_id)` |
| 3 | All States | `COUNT(DISTINCT addr_state)` + `GROUP_CONCAT` all state names |
| 4 | Loans by Grade | COUNT grouped by grade A–G |
| 5 | Loans by Purpose | COUNT grouped by purpose |
| 6 | Avg Loan Amount | `ROUND(AVG(loan_amnt), 2)` |
| 7 | Highest Income Customer | Subquery — `WHERE annual_inc = (SELECT MAX(annual_inc))` |
| 8 | Loan Status Counts | Fully Paid / Charged Off / Current counts |
| 9 | Top 10 States by Loan Amount | SUM of loan_amnt grouped by state |
| 10 | Avg Interest Rate | `ROUND(AVG(int_rate), 3)` |

### Section 2 — Customer & Financial Analysis
| # | Query | Description |
|---|-------|-------------|
| 11 | Avg Loan by Grade | Grade-wise avg loan amount sorted desc |
| 12 | Default Rate by State | `SUM(CASE WHEN loan_status='Charged Off')` / COUNT(*) × 100 per state |
| 13 | Loan_Status SP | Stored Procedure — state-wise breakdown for any loan status input |
| 14 | Income by Home Ownership | Avg income and customer count by RENT/MORTGAGE/OWN |
| 15 | Grade-wise Interest Rates | `REPLACE(int_rate,'%','')` → numeric → `AVG()` per grade |

### Section 3 — Business Insights
| # | Query | Description |
|---|-------|-------------|
| 16 | Top Purposes by Funded Amount | SUM(funded_amnt) per purpose — Top 10 |
| 17 | Verified vs Non-Verified | Count, avg loan, avg income by verification_status |
| 18 | Highest DTI Customers | Top 10 riskiest customers by DTI ratio |
| 19 | Fully Paid vs Charged Off | Avg loan, avg income, avg DTI side-by-side comparison |
| 20 | State-wise Avg Income | Avg annual income per state sorted desc |
| 21 | Monthly Installment Trends | Loans count + avg installment by issue_d |

### Stored Procedures
| Procedure | Description |
|-----------|-------------|
| `Loan_Profile(p_id INT)` | Full loan + financial profile for any customer ID (JOIN finance1 + finance2) |
| `GradeAnalysis(p_grade VARCHAR)` | Loan count, avg loan, avg income, avg interest rate for any grade |
| `Loan_Status(a VARCHAR)` | State-wise count + default rate for any loan_status input |
| `MASTER_SP(p_state VARCHAR)` | **Returns 4 result tables in 1 CALL**: State KPI + Grade Distribution + Top 5 Purposes + Loan Status Summary |

### Views
| View | Description |
|------|-------------|
| `StateRanking` | State-wise Total Loans, Defaults, Default Rate %, `DENSE_RANK()` by default rate descending |

---

## 🛠️ SQL Concepts Used
- `GROUP BY`, `ORDER BY DESC`, `LIMIT`
- `COUNT(DISTINCT)`, `GROUP_CONCAT(DISTINCT ... SEPARATOR ',')`
- `CASE WHEN` — default rate calculation, loan status filtering
- **Subquery** — find customer with MAX annual income
- `REPLACE(int_rate,'%','') + 0` — string to numeric conversion for interest rate
- `IN ('Fully Paid','Charged Off')` — multi-value filter
- **Window Function** — `DENSE_RANK() OVER(ORDER BY default_rate DESC)`
- **Stored Procedures** — 4 procedures with VARCHAR and INT parameters
- **`MASTER_SP`** — single procedure returning multiple result sets in one CALL
- `CREATE VIEW` for reusable state ranking logic

---

## 💡 Key Outputs

**StateRanking VIEW Sample:**
```
State | Total_Loans | Defaults | Default_Rate | Risk_Rank
NE    | 5           | 3        | 60.00        | 1
NV    | 497         | 108      | 21.73        | 2
AK    | 80          | 15       | 18.75        | 3
CA    | 7099        | 1125     | 15.85        | 9
```

**MASTER_SP('CA') — Result 4 (Loan Status):**
```
loan_status  | Loans
Fully Paid   | 5824
Charged Off  | 1125
Current      | 150
```
