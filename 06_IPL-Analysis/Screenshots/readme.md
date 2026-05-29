# 🖼️ Screenshots — IPL 18-Season Analysis

This folder contains all chart screenshots from the IPL Analysis Jupyter Notebook.

---

## 📄 Files in This Folder

| File Name | Tool | Section | Chart | Key Number |
|-----------|------|---------|-------|------------|
| [IPL Notebook Structure](ipl_notebook_structure.png) | JupyterLab | Overview | Table of Contents — all notebook sections | 156 cells |
| [Top Run Scorers](top_run_scorers.png) | Seaborn | Batting | Top 10 Run Scorers bar chart | V Kohli — 8,671 runs |
| [Top Six Hitters](top_six_hitters.png) | Seaborn | Batting | Top 10 Six Hitters bar chart | CH Gayle — 359 sixes |
| [Top Four Hitters](top_four_hitters.png) | Seaborn | Batting | Top 10 Four Hitters bar chart | V Kohli — 774 fours |
| [Most Balls Faced](most_balls_faced.png) | Seaborn | Batting | Most Balls Faced bar chart | V Kohli — 6,702 balls |
| [Top Wicket Takers](top_wicket_takers.png) | Seaborn | Bowling | Top 10 Wicket Takers bar chart | YS Chahal — 229 wickets |
| [Most Dot Balls](most_dot_balls.png) | Seaborn | Bowling | Most Dot Balls bar chart | B Kumar — 1,748 dots |
| [Most Wide Balls](most_wide_balls.png) | Seaborn | Bowling | Most Wide Balls bar chart | DJ Bravo — 167 wides |
| [Wins vs Losses](wins_vs_losses.png) | Matplotlib | Team | Wins vs Losses grouped bar chart | MI — 151 wins |
| [Average Run Rate Per Season](avg_run_rate_per_season.png) | Matplotlib | Season | Average Run Rate per Season line chart | Upward trend across seasons |
| [Runs Per Over](runs_per_over.png) | Matplotlib | Season | Runs per Over colour-coded bar chart | Overs 17–18 highest scoring |

---

## 📷 How to Save Charts — Add Before plt.show()

```python
# Batting
plt.savefig('top_run_scorers.png',         dpi=150, bbox_inches='tight')
plt.savefig('top_six_hitters.png',         dpi=150, bbox_inches='tight')
plt.savefig('top_four_hitters.png',        dpi=150, bbox_inches='tight')
plt.savefig('most_balls_faced.png',        dpi=150, bbox_inches='tight')

# Bowling
plt.savefig('top_wicket_takers.png',       dpi=150, bbox_inches='tight')
plt.savefig('most_dot_balls.png',          dpi=150, bbox_inches='tight')
plt.savefig('most_wide_balls.png',         dpi=150, bbox_inches='tight')

# Team
plt.savefig('wins_vs_losses.png',          dpi=150, bbox_inches='tight')  # MP version

# Season
plt.savefig('avg_run_rate_per_season.png', dpi=150, bbox_inches='tight')
plt.savefig('runs_per_over.png',           dpi=150, bbox_inches='tight')  # MP version
```

**Notebook structure:** Press `Ctrl + Shift + F` in JupyterLab → Table of Contents opens → take screenshot → save as `ipl_notebook_structure.png`

---

## 📌 Quick Reference — All Key Numbers

### Batting
| Player | Metric | Value |
|--------|--------|-------|
| V Kohli | Total Runs | 8,671 |
| V Kohli | Total Fours | 774 |
| V Kohli | Balls Faced | 6,702 |
| CH Gayle | Total Sixes | 359 |
| RG Sharma | Total Sixes | 303 |
| DA Warner vs SP Narine | Runs scored | 195 |

### Bowling
| Player | Metric | Value |
|--------|--------|-------|
| YS Chahal | Wickets | 229 |
| B Kumar | Dot Balls | 1,748 |
| B Kumar | Extras | 320 |
| DJ Bravo | Wide Balls | 167 |
| R Ashwin | Runs Conceded | 5,721 |
| R Ashwin | Balls Bowled | 4,868 |

### Teams
| Team | Metric | Value |
|------|--------|-------|
| Mumbai Indians | Wins | 151 |
| Mumbai Indians | Matches | 277 |
| Mumbai Indians | Total Runs | 45,088 |
| Mumbai Indians | Toss Wins | 151 |

### Seasons
| Metric | Value |
|--------|-------|
| Highest Scoring Season | 2025 — 26,527 runs |
| Most Matches in Season | 2025 — 74 matches |
| Avg Run Rate Trend | Consistently increasing season by season |
| Highest Runs Over | Over 17–18 |
| COVID Season Dip | 2020 — UAE pitches |

### Matches
| Metric | Value |
|--------|-------|
| Field First after Toss | 58.4% |
| Matches with Result | 99.3% (only 8 no-results) |
| Most Common Dismissal | Caught — ~50% |
| Most Player of Match | AB de Villiers — 25 awards |
| Most Common Score | 140–180 runs per innings |
