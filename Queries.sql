-- 1. Find investors who are making on average a loss across all their portfolios in 2024.
SELECT i.Name, AVG(ugl.Amount) AS Avg_Loss
FROM Investor i
JOIN Portfolio p ON i.Phone = p.Phone
JOIN UnrealisedGainLoss ugl ON p.PID = ugl.PID
WHERE YEAR(ugl.Date) = 2024
 	
HAVING AVG(ugl.Amount) < 0;


-- 2. Find investors who are seeing an annualized return of more than 10% from their portfolios in 2024.
SELECT DISTINCT i.Name
FROM Investor i
JOIN Portfolio p ON i.Phone = p.Phone
WHERE p.Annualised_Returns > 0.10;

-- 3. Find the monthly average unrealized gain/loss of portfolios for each month in 2024.
SELECT
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    AVG(Amount) AS Avg_Unrealized_Gain_Loss
FROM UnrealisedGainLoss
WHERE YEAR(Date) = 2024
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;


-- 4. What is the top three most popular first financial goals for investors in 2024?
SELECT Top 3 Goal, COUNT(*) AS Goal_Count
FROM FinancialGoal
WHERE YEAR(Created_Date) = 2024
GROUP BY Goal
ORDER BY Goal_Count DESC;

-- 5. Find investors who consistently top up their investment at the beginning of every month (dollar-cost
-- averaging) in 2024 for at least one of their portfolios.
SELECT I.Name, P.PID
FROM Investor I
JOIN Portfolio P ON I.Phone = P.Phone
WHERE P.PID IN (
    SELECT PID
    FROM TransactionLog
    WHERE DateTime BETWEEN '2024-01-01' AND '2024-12-31'
      AND DAY(DateTime) BETWEEN 1 AND 5
      AND Type = 'TopUp'
    GROUP BY PID
    HAVING COUNT(DISTINCT MONTH(DateTime)) = 12
);


-- 6. Find the most popular financial goals for investors working in the same company and whose age is
-- between 30 to 40 years old
SELECT Company, Goal, Goal_Count
FROM (
    SELECT
        i.Company,
        fg.Goal,
        COUNT(*) AS Goal_Count,
        ROW_NUMBER() OVER (PARTITION BY i.Company ORDER BY COUNT(*) DESC) AS rn
    FROM Investor i
    JOIN FinancialGoal fg ON i.Phone = fg.Phone
    WHERE DATEDIFF(YEAR, i.DoB, GETDATE()) BETWEEN 30 AND 40
    GROUP BY i.Company, fg.Goal
) AS Ranked
WHERE rn <= 3
ORDER BY Company, Goal_Count DESC;

-- query 7
-- 7. Are male investors in their 20s making more money from their investments than their female
-- counterparts in 2024?
SELECT
    i.Gender,
    AVG(ugl.Amount) AS Avg_Unrealized_Gain_Loss
FROM Investor i
JOIN Portfolio p ON i.Phone = p.Phone
JOIN UnrealisedGainLoss ugl ON p.PID = ugl.PID
WHERE
    YEAR(ugl.Date) = 2024
    AND DATEDIFF(YEAR, i.DoB, GETDATE()) BETWEEN 20 AND 29
    AND i.Gender IN ('Male', 'Female')
GROUP BY i.Gender;


