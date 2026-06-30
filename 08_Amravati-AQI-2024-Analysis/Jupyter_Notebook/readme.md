# Jupyter Notebook — Amravati AQI 2024 Analysis

This folder contains the Python Jupyter Notebook used for data cleaning and preparation of the Amravati AQI dataset before loading into Power BI.

**Notebook file:** [Amravati AQI Analysis](AQI_AMT_Maharastra_PY.ipynb)

---
 
## Files in This Folder

| File Name | Description |
|-----------|-------------|
| [Amravati AQI Analysis](AQI_AMT_Maharastra_PY.ipynb) | Complete notebook — data loading, cleaning, type fixing, export |

---

## Notebook Sections & Exact Steps

### Section 1 — Import Libraries
```python
import pandas as pd        # Data Handling
import numpy as np         # Numerical Operations
import matplotlib.pyplot as plt   # Normal Visualisation
import seaborn as sns      # Advanced Visualisation
```

---

### Section 2 — Importing Dataset
```python
AQI = pd.read_excel("AQI_daily_city_level_amravati_2024_amravati_2024.xlsx")
# Taking data in AQI variable
```

---

### Section 3 — Basic Data Understanding
```python
AQI.head()     # First 5 rows
AQI.tail()     # Bottom 5 rows — showed NaN rows (Very poor, Severe labels at end)
AQI.info()     # Data types — 41 entries, 13 columns, all float64 except Day (object)
AQI.describe() # Basic statistics — mean, std, min, max per month
AQI.shape      # (41, 13) — 41 rows, 13 columns
```

**Raw data structure:** 13 columns — `Day` + 12 month columns (January to December)  
**Key issue found:** Last few rows contained labels like "Very poor", "Severe", NaN — not actual day data

---

### Section 4 — Data Cleaning

**Step 1 — Check null values before cleaning:**
```python
AQI.isnull().sum()   # Showing column wise null count
```
| Column | Nulls Before |
|--------|-------------|
| Day | 1 |
| January | 6 |
| February | 9 |
| March | 7 |
| April | 7 |
| May | 6 |
| June | 7 |
| July | 7 |
| August | 7 |
| September | 8 |
| October | 6 |
| November | 7 |
| December | 6 |

**Step 2 — Fill null values with column mean:**
```python
AQI.fillna(AQI.mean(numeric_only=True), inplace=True)
# Replacing null value with mean value only for numeric columns
```

**Step 3 — Verify cleaning:**
```python
AQI.isnull().sum()   # After data cleaning — all month columns show 0 nulls
```

---

### Section 5 — Checking Data Type
```python
AQI['Day'] = pd.to_numeric(AQI['Day'], errors='coerce')
# Convert Day column from object to numeric (coerce invalid strings to NaN)

AQI.info()   # After conversion — Day becomes float64, all 41 non-null
```

---

### Section 6 — Remove Invalid Rows
```python
AQI.shape                              # (41, 13) — before removing invalid rows

AQI.dropna(subset=['Day'], inplace=True)
# Removing rows where Day column is null
# (removes "Very poor", "Severe", blank label rows at end of raw file)

AQI.shape                              # (31, 13) — final clean shape
```

**Result:** From 41 rows → **31 valid day rows** after removing invalid label rows

---

## Input & Output Files

| File | Type | Description |
|------|------|-------------|
| [Raw File](AQI_daily_city_level_amravati_2024_amravati_2024.xlsx) | Input | Raw CPCB data — 41 rows including invalid label rows |
| [Cleaned File](AQI_Cleaned_Final.xlsx) | Output | Cleaned data — 31 valid rows, all nulls filled, correct data types |

---

## Python Libraries Used

| Library | Purpose |
|---------|---------|
| `pandas` | Data loading, cleaning, null handling, type conversion, export |
| `numpy` | Numerical operations |
| `matplotlib` | Normal visualisation |
| `seaborn` | Advanced visualisation |

---

## Key Cleaning Summary

| Step | Action | Result |
|------|--------|--------|
| Load data | `pd.read_excel()` | 41 rows, 13 columns |
| Check nulls | `isnull().sum()` | Found 6–9 nulls per month column |
| Fill nulls | `fillna(mean)` | All month columns → 0 nulls |
| Fix data type | `pd.to_numeric(errors='coerce')` | Day column: object → float64 |
| Remove invalid rows | `dropna(subset=['Day'])` | 41 rows → 31 valid rows |
| Final shape | `AQI.shape` | **(31, 13)** |

---

## Data Source
Raw data downloaded from:  
**[CPCB Official AQI Repository](https://airquality.cpcb.gov.in/ccr/#/caaqm-dashboard-all/caaqm-landing/aqi-repository)**
