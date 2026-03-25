/*
Project: International Debt Analysis
Source: World Bank dataset

Description:
This script answers the following questions:
1. How many distinct countries are in the dataset?
2. Which country has the highest total debt?
3. Which country has the lowest principal repayment?
*/


/* =====================================================
1. Number of distinct countries
===================================================== */

SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;


/* =====================================================
2. Country with the highest total debt
===================================================== */

SELECT 
    country_name,
    SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;


/* =====================================================
3. Country with the lowest principal repayment
===================================================== */

SELECT 
    country_name,
    indicator_name,
    SUM(debt) AS lowest_repayment
FROM international_debt
WHERE indicator_name = 'Principal repayments on external debt, long-term (AMT, current US$)'
GROUP BY country_name, indicator_name
ORDER BY lowest_repayment ASC
LIMIT 1;