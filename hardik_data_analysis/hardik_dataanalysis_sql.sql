#    HARDIK PANDYA INTERNATIONAL MATCHES DATA ANALYSIS
use jai_sriram;
-- CREATING TABLE
CREATE table KUNFU (
Match_ID INT PRIMARY KEY AUTO_INCREMENT,
Date DATE,
Opponent VARCHAR(50) NOT NULL,
Format CHAR(10),
Runs INT NOT NULL,
Balls_Faced INT NOT NULL,
Strike_Rate FLOAT ,
Fours INT,
Sixes INT,
Wickets INT,
Overs INT,
Economy FLOAT,
Catches int
);
 
-- INSERTING THE DATA VIA EXCEL

-- RETRIVING THE DATA 
SELECT * FROM kunfu;

-- checking the null values
SELECT COUNT(RUNS) FROM kunfu WHERE RUNS IS NULL;

# DATA ANALYSIS ON BATTING

-- highest runs in batting
SELECT MAX(RUNS) AS HIGHESTRUNS FROM kunfu; 

-- lowest runs in batting
SELECT MIN(RUNS) AS LOWESTRUNS FROM kunfu; 

-- AVG RUNS IN BATTING
SELECT AVG(RUNS) AS AVERAGERUNS FROM KUNFU; 

-- MAX, BOUNDARIES
SELECT FORMAT,MAX(FOURS) AS MAXFOURS FROM kunfu GROUP BY FORMAT;
-- MAX, SIXES
SELECT FORMAT,MAX(SIXES) AS MAXSIXES FROM kunfu GROUP BY FORMAT;

-- what is pandya's average batting strike rate in each format
SELECT format,AVG(strike_rate) FROM  kunfu GROUP BY format;

-- identify his highest individual score and the opponent/format context
SELECT DISTINCT  opponent,format,MAX(runs) AS highest_individual_score 
FROM kunfu GROUP BY format,opponent
ORDER BY highest_individual_score DESC;

-- how often does he score 50+ runs vs 30-49 range
select COUNT(runs) from kunfu where runs = 50;
select COUNT(runs) from kunfu where runs BETWEEN 30 AND 49;
--  IM APPLYING SUBQUERY TO COOMBINE THESE BOTH
select COUNT(runs),(select COUNT(runs) from kunfu where runs >= 50)AS COUNTOF50 
from kunfu where runs BETWEEN 30 AND 49;

-- find his highest score and lowest score in t20
select max(runs) as highest,min(runs)as lowest FROM kunfu where format like'%t20%';
-- find his highest score and lowest score in test
select max(runs) as highest,min(runs)as lowest FROM kunfu where format like'%test%';
-- find his highest score and lowest score in odi
select max(runs) as highest,min(runs)as lowest FROM kunfu where format like'%odi%';

# DATA ANALYSIS ON HIS BOWLING

-- calculate average economy rate by format
SELECT FORMAT,AVG(economy)  FROM KUNFU GROUP BY FORMAT;

-- HIGHEST WICKETS AND LOWEST WICKETS GROUP BY FORMAT
SELECT FORMAT,MAX(WICKETS),MIN(WICKETS) FROM KUNFU GROUP BY FORMAT;

-- BEST BOWLING FIGURES 
SELECT match_id,date,opponent,format,wickets,overs
FROM kunfu
ORDER BY wickets DESC LIMIT 1;

-- adding another row
INSERT INTO KUNFU VALUES (21,'2016-07-25','ENGLAND','TEST',107,90,120,5,7,5,13,5,0);

-- BEST BATTING FIGURES
SELECT match_id,date,format,opponent,RUNS FROM kunfu 
ORDER BY RUNS DESC LIMIT 1;

-- BEST BOWLING FIGURES
SELECT match_id,date,format,opponent,WICKETS FROM kunfu 
ORDER BY WICKETS DESC LIMIT 1;


-- 2ND HIGHEST RUNS 
-- using subquery
SELECT match_id ,date,format,opponent,runs FROM kunfu WHERE runs < (SELECT MAX(RUNS) FROM KUNFU) ORDER BY RUNS DESC LIMIT 1;
-- using windows function
SELECT match_id ,date,format,opponent,runs FROM
(SELECT match_id ,date,format,opponent, RUNS,
RANK() OVER(ORDER BY RUNS DESC) AS RANKS FROM kunfu)t
WHERE RANKS = 2;

-- 2ND BEST BOWLING
SELECT match_id ,date,format,opponent,wickets FROM
(SELECT match_id ,date,format,opponent, wickets,
RANK() OVER(ORDER BY wickets DESC) AS RANKS FROM kunfu)t
WHERE RANKS = 2;

-- performance summary by opponent
SELECT opponent,
count(*) as matches_played,
sum(runs) as total_runs,
sum(wickets) as total_wickets,
sum(catches) as total_catches
FROM kunfu
GROUP BY opponent
ORDER BY total_runs  desc;


