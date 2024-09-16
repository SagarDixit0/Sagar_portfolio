
-- Total number of investors by Gender
-- START

Select 
	Gender, 
    Count(*) As 'Number of investors'
From staging_finance_data
GROUP BY gender
ORDER BY Count(*) desc;
-- END --

-- The average ratings given to different Investment Routes by age 
-- START --

Select 
	age AS Age,
	CAST(Avg(Mutual_funds) As DECIMAL(10,2)) As 'Avg Mutual funds rating',
    CAST(Avg(Equity_Market) As DECIMAL(10,2)) As 'Avg Equity Market',
    CAST(Avg(Debentures) AS DECIMAL(10,2)) AS 'Avg Debentures rating',
    CAST(Avg(Government_Bonds) AS DECIMAL(10,2)) AS 'Avg Government Bonds rating',
    CAST(Avg(Fixed_Deposits) AS DECIMAL(10,2)) AS 'Avg Fixed Deposits rating',
    CAST(Avg(PPF) AS DECIMAL(10,2)) AS 'Avg PPF rating',
    CAST(Avg(Gold) AS DECIMAL(10,2)) AS 'Avg Gold rating'
From staging_finance_data
Group by age
Order by age;

-- END --

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