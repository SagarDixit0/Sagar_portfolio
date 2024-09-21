-- Selecting the database
USE project;

-- Creating a staging table

	Create table staging_finance_data AS
    Select * from finance_data;

-- Searching for duplicates
-- Start
	WITH duplicate_cte AS
    (
    SELECT *,
    ROW_NUMBER() OVER(
    PARTITION BY 
			gender, age, Investment_Avenues, 
            Mutual_Funds, Equity_Market, 
            Debentures, Government_Bonds, 
            Fixed_Deposits,PPF,Gold,
            Stock_Marktet, Factor,
            Objective, Purpose,
            Duration, Invest_Monitor,
            Expect, Avenue,
            `What are your savings objectives?`, Reason_Equity,
            Reason_Mutual, Reason_Bonds,
            Reason_FD, Source) AS row_num
FROM staging_finance_data)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;

-- END
-- Total number of investors by Gender
-- START

Select 
	Gender, 
    Count(*) As 'Number of investors'
From staging_finance_data
GROUP BY gender
ORDER BY Count(*) desc;
-- END --

-- Total number of investors be age

SELECT 
	age, 
    Count(*) As 'Number of investors'
From staging_finance_data
GROUP BY age
ORDER BY Count(*) desc;

-- The average ratings given to different Investment Routes by age 
-- START --
Alter table staging_finance_data
ADD Age_bracket TEXT;

UPDATE staging_finance_data
SET Age_bracket = CASE 
    WHEN age BETWEEN 21 AND 25 THEN '21-25'
    WHEN age BETWEEN 26 AND 30 THEN '26-30'
    WHEN age BETWEEN 30 AND 35 THEN '30-35'
END;

Select
	Age_bracket ,
	CAST(Avg(Mutual_funds) As DECIMAL(10,2)) As 'Avg Mutual funds rating',
    CAST(Avg(Equity_Market) As DECIMAL(10,2)) As 'Avg Equity Market',
    CAST(Avg(Debentures) AS DECIMAL(10,2)) AS 'Avg Debentures rating',
    CAST(Avg(Government_Bonds) AS DECIMAL(10,2)) AS 'Avg Government Bonds rating',
    CAST(Avg(Fixed_Deposits) AS DECIMAL(10,2)) AS 'Avg Fixed Deposits rating',
    CAST(Avg(PPF) AS DECIMAL(10,2)) AS 'Avg PPF rating',
    CAST(Avg(Gold) AS DECIMAL(10,2)) AS 'Avg Gold rating'
From staging_finance_data
Group by Age_bracket
Order by Age_bracket;

-- What is average rating given to different Investment Routes by gender?
-- START --

Select 
	gender AS Gender,
	CAST(Avg(Mutual_funds) As DECIMAL(10,2)) As 'Avg Mutual funds rating',
    CAST(Avg(Equity_Market) As DECIMAL(10,2)) As 'Avg Equity Market',
    CAST(Avg(Debentures) AS DECIMAL(10,2)) AS 'Avg Debentures rating',
    CAST(Avg(Government_Bonds) AS DECIMAL(10,2)) AS 'Avg Government Bonds rating',
    CAST(Avg(Fixed_Deposits) AS DECIMAL(10,2)) AS 'Avg Fixed Deposits rating',
    CAST(Avg(PPF) AS DECIMAL(10,2)) AS 'Avg PPF rating',
    CAST(Avg(Gold) AS DECIMAL(10,2)) AS 'Avg Gold rating'
From staging_finance_data
Group by gender;

-- What source do investers look at when investing ?

SELECT 
	Source,
    count(*) As 'Number of investors'
    FROM staging_finance_data
    GROUP BY Source
    ORDER BY count(*) desc;
    
-- Total investment by Financial Consultants in Different Categories
-- START --

SELECT 
	Sum(Mutual_Funds) AS 'Total Mutual Funds ratings', 
    Sum(Equity_Market) AS 'Total Equity Market ratings', 
    Sum(Debentures) AS 'Total Debentures ratings', 
    Sum(Government_Bonds) AS 'Total Government Bonds ratings',
    Sum(Fixed_Deposits) AS 'Total Fixed Deposits ratings',
	Sum(PPF) AS 'Total PPF ratings',
    Sum(Gold) AS 'Total Gold ratings'
FROM staging_finance_data
Where Source Like 'Financial Consultants';

-- END --

-- Number of Investors by Investment Duration
-- START --

Select Duration, count(*) As 'No. of investor' from staging_finance_data
Group by Duration
Order by count(*) Desc;

-- END --

-- How often do investors check their investment ?
-- START --

SELECT Invest_Monitor AS 'Investment checked', count(*) AS 'Number of investors' FROM staging_finance_data
Group by Invest_Monitor
Order by count(*) Desc;

-- END --

-- Distribution of Investment Avenues
-- START --

SELECT Avenue AS 'Investment Avenues', count(*) AS 'Number of investors' FROM staging_finance_data
Group by Avenue
Order by 'Number of investors' Desc;

-- END --

-- Why do investors invest their money ?
-- Start

 SELECT `What are your savings objectives?` AS 'Saving goals', count(*) AS 'Number of investors' FROM staging_finance_data
Group by `What are your savings objectives?`
Order by count(*) Desc;

-- End

-- Reasons for equity investment
-- START --

SELECT Reason_Equity AS 'Reasons given', count(*) AS 'Number of investors' FROM staging_finance_data
Group by Reason_Equity
Order by 'Number of investors' Desc;

-- END --

-- Reasons for Mutual Fund investment
-- START --

SELECT Reason_Mutual AS 'Reasons given', count(*) AS 'Number of investors' FROM staging_finance_data
Group by Reason_Mutual
Order by count(*) Desc;

-- END --
-- Reasons for Bonds investment
-- START --

SELECT Reason_Bonds AS 'Reasons given', count(*) AS 'Number of investors' FROM staging_finance_data
Group by Reason_Bonds
Order by count(*) Desc;

 -- END --
 
 -- Reason for Fixed Deposit
 -- START --
 
 SELECT Reason_FD AS 'Reasons given', count(*) AS 'Number of investors' FROM staging_finance_data
Group by Reason_FD
Order by count(*) Desc;

-- END --