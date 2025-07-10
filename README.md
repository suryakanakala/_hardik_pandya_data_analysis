# 🏏 Hardik Pandya International Career Analysis (SQL Project)

This repository showcases a comprehensive **SQL-based analysis** of Indian cricketer **Hardik Pandya’s international career**, covering his performances in **One Day Internationals (ODIs), Twenty20 Internationals (T20Is), and Test matches**. The project focuses exclusively on his **international match data**, with no IPL statistics included.

## 📌 Objectives

- Explore Hardik Pandya's match-by-match performances across international formats
- Analyze key metrics such as batting averages, bowling economy, and strike rates
- Identify patterns and trends based on opposition, venue, and year
- Practice structured query techniques using SQL on sports datasets

## 🛠️ Tech Stack

- **SQL** (written and executed using [PostgreSQL / MySQL / SQLite] — update as per your use)
- **Cricket datasets** in CSV format
- [Optional] Data exported to Excel/CSV for visualization

## 🔍 Key Features

- 📅 Breakdown of performances by year and match format
- 📊 Insights into batting and bowling consistency
- 🧠 Analysis of performance against specific teams
- 🏟️ Home vs. away comparisons

## 📂 Dataset Sources

- ESPNcricinfo match data (scraped or manually compiled)
- Publicly available cricket records and databases

## 📈 Sample Queries

```sql
-- Total runs scored by Hardik Pandya in ODIs
SELECT SUM(runs_scored) FROM matches
WHERE format = 'ODI';

-- Best bowling figures in T20Is
SELECT MAX(wickets_taken), match_date FROM matches
WHERE format = 'T20I';
