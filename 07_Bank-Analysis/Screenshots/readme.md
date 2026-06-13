# Screenshots — Bank Loan Analysis

This folder contains all SQL query and output screenshots for the Bank Analysis project.

---

## Files in This Folder

| File Name | Content |
|-----------|---------|
| [BA1](BA1.png) | Stored Procedures — `Loan_Profile(54734)` output showing full loan row + `GradeAnalysis` procedure code |
| [BA2](BA2.png) | `MASTER_SP('CA')` — 4-result-table procedure code + Result 4 showing Fully Paid (5824), Charged Off (1125), Current (150) |
| [BA3](BA3.png) | `StateRanking` VIEW using `DENSE_RANK()` — output: NE (60%), NV (21.73%), AK/SD (18.75%), CA (15.85%) |
| [BA4](BA4.png) | Basic EDA section — 10 queries: total loans, customers, states, grade/purpose breakdown, avg loan, highest income subquery, loan status, top 10 states, avg interest rate |
| [BA5](BA5.png) | Customer & Financial Analysis — avg loan by grade, default rate by state with CASE WHEN, Loan_Status SP, income by home ownership, grade-wise interest rates |
| [BA6](BA6.png) | Business Insights — top purposes by funded amount, verified vs non-verified, highest DTI, fully paid vs charged off comparison, state-wise income, monthly installment trends |

---

## Quick Reference — Key Outputs Visible in Screenshots

| Metric | Value |
|--------|-------|
| **Highest Risk State** | NE — 60% default rate |
| **California Loans** | 7,099 total (CA fully paid: 5,824) |
| **Sample Customer (ID 54734)** | Loan $25K, Grade B4, RENT, $85K income, Fully Paid |
| **Top Loan Status (CA)** | Fully Paid: 5,824 \| Charged Off: 1,125 \| Current: 150 |
| **Highest Default % States** | NE (60%), NV (21.73%), AK (18.75%), FL (17.59%) |
