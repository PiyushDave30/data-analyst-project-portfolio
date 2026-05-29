# 📂 Raw Data — Bank Loan Analysis

This folder contains the original bank lending dataset used for this project.

---

## 📄 Files in This Folder

| File Name | Description |
|-----------|-------------|
| `finance1.csv` | Primary loan table — loan details, grades, status, purpose |
| `finance2.csv` | Financial details table — income, DTI, installment, funded amounts |

---

## 📊 Dataset Details

| Property | Value |
|----------|-------|
| **Source** | Bank Loan / Lending Club Dataset |
| **Tables** | finance1 + finance2 (joined on id) |
| **Join Key** | `finance1.id = finance2.id` |
| **Coverage** | Multiple US states |

---

## 🔑 Key Fields — finance1

| Field | Description |
|-------|-------------|
| `id` | Unique loan ID |
| `member_id` | Unique member/customer ID |
| `loan_amnt` | Requested loan amount |
| `funded_amnt` | Actually funded amount |
| `int_rate` | Interest rate (stored as % string) |
| `grade` | Loan grade A–G |
| `sub_grade` | Sub-grade (A1–G5) |
| `emp_title` | Employment title |
| `emp_length` | Employment length |
| `home_ownership` | RENT / MORTGAGE / OWN |
| `annual_inc` | Annual income |
| `verification_status` | Verified / Source Verified / Not Verified |
| `issue_d` | Loan issue date |
| `loan_status` | Fully Paid / Charged Off / Current |
| `purpose` | Loan purpose (debt consolidation, credit card, etc.) |
| `addr_state` | US state abbreviation |
| `dti` | Debt-to-Income ratio |

---

## ⚠️ Note
- `int_rate` is stored as a string with % sign — `REPLACE(int_rate,'%','')` used in SQL for numeric conversion
- Raw data kept in original form — all transformations done in SQL
