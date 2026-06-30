# Data — IPL 18-Season Analysis

This folder contains the IPL datasets used for this project.

--- 

## Files in This Folder

| File | Rows | Columns | Variable | GitHub |
|------|------|---------|----------|--------|
| `ipl_matches_data.csv` | 1,169 | 24 | `matches` |  Uploaded |
| `players-data-updated.csv` | 772 | 8 | `players` |  Uploaded |
| `teams_data.csv` | 16 | 4 | `teams` |  Uploaded |
| `ball_by_ball_data.csv` | 2,78,205 | 30 | `ball` |  25MB+ — not uploaded |

>  **`ball_by_ball_data.csv` is excluded** from GitHub because it exceeds the 25MB file size limit. Download it from Kaggle and place it in this `data/` folder before running the notebook.

---

## Key Columns

### ipl_matches_data.csv
| Column | Description |
|--------|-------------|
| `match_id` | Unique match identifier |
| `season` | IPL season year |
| `season_id` | Season number (1–18) |
| `match_date` | Date of match |
| `venue` | Stadium name |
| `city` | City of match |
| `team1`, `team2` | Competing teams |
| `toss_winner` | Team winning the toss |
| `toss_decision` | Bat or Field |
| `match_winner` | Winning team |
| `win_by_runs` | Margin if won batting first |
| `win_by_wickets` | Margin if won chasing |
| `result` | win / no result |
| `player_of_match` | Player ID of award winner |
| `stage` | League Match / Playoff |
| `year`, `month`, `day_name` | Extracted date fields |

### ball_by_ball_data.csv
| Column | Description |
|--------|-------------|
| `match_id` | Links to matches dataset |
| `innings` | 1st or 2nd innings |
| `over_number` | Over (0–19) |
| `ball_number` | Ball within over |
| `batter`, `bowler` | Player names |
| `batter_runs` | Runs scored by batter |
| `extras`, `total_runs` | Extra and total runs |
| `is_wicket` | True/False |
| `wicket_kind` | caught / bowled / lbw etc. |
| `player_out` | Dismissed player |
| `is_wide_ball`, `is_no_ball` | Delivery type flags |
| `wide_runs`, `noball_runs` | Extra run values |
| `team_batting`, `team_bowling` | Teams per delivery |

### players-data-updated.csv
| Column | Description |
|--------|-------------|
| `player_id` | Unique player ID |
| `player_name` | Full name |
| `bat_style` | Right/Left hand |
| `bowl_style` | Pace/Spin style |
| `field_pos` | Fielding position |

### teams_data.csv
| Column | Description |
|--------|-------------|
| `team_id` | Unique team ID |
| `team_name` | Full team name |
| `team_short_name` | Abbreviation |
| `team_home_ground` | Home stadium |

---

## Dataset Stats

| Metric | Value |
|--------|-------|
| Total Seasons | 18 (2008–2025) |
| Total Matches | 1,169 |
| Total Deliveries | 2,78,205 |
| Total Players | 772 |
| Total Teams | 16 |
| Duplicates | 0 in all datasets |
