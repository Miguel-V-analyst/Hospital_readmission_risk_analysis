--Objective 2. What share of readmission_30 come from the High Risk Group? Use a CTE
WITH risk AS (
  SELECT
      CASE
          WHEN prior_admissions = 0 THEN 'Low Risk'
          WHEN prior_admissions BETWEEN 1 AND 2 THEN 'Moderate Risk'
          ELSE 'High Risk'
      END AS risk_group,
      COUNT(*) AS visits,
      SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmissions_30
  FROM encounters
  GROUP BY risk_group --same thing we have been doing
),
totals AS (
  SELECT SUM(readmissions_30) AS total_readmissions_30
  FROM risk
)
SELECT
    r.risk_group,
    r.visits,
    r.readmissions_30,
    ROUND(100.0 * r.readmissions_30 / t.total_readmissions_30, 2) AS pct_of_all_readmissions --% of all readmissions
FROM risk r
CROSS JOIN totals t
ORDER BY pct_of_all_readmissions DESC
--this table shows that if we target only the High Risk group, we can reduce hospital readmission by 16%
-- But what is causing the readmission? 

--Objective 3. Find out what casues readmission for High Risk group.
SELECT 
	risk_group,
	ROUND(AVG(medication_count),2 ) AS avg_medications,
	ROUND(AVG(lab_count),2) AS avg_labs,
	ROUND(AVG(er_visits),2) AS avg_er_visits
FROM (
	Select *,
	CASE 
		when prior_admissions = 0 then 'Low Risk'
		When prior_admissions between 1 and 2 then 'Moderate Risk'
		else 'High Risk'
	END as risk_group
FROM encounters
)
Group By risk_group