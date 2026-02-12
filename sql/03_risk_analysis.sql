SELECT
    CASE
        WHEN prior_admissions = 0 THEN 'Low Risk'
        WHEN prior_admissions BETWEEN 1 AND 2 THEN 'Moderate Risk'
        ELSE 'High Risk'
    END AS risk_group,
    COUNT(*) AS visits,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmissions_30,--adding a column for total readmitted
    ROUND(
        100.0 * SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS readmission_rate
FROM encounters
GROUP BY risk_group
ORDER BY
    CASE
        WHEN risk_group = 'Low Risk' THEN 1
        WHEN risk_group = 'Moderate Risk' THEN 2
        ELSE 3
    END;