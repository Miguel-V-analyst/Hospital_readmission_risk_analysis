SELECT 
	COUNT (*) AS total_visits,-- OUR DENOMINATOR 
	SUM(case when readmitted = '<30' then 1 else 0 end) AS readmissions_30,--KEEP ONLY <30 THIS FINDS THE TOTAL, NUMERATOR
	ROUND(
	100 *  SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS readmission_rate_percent--READMITTED / COUNT * 100 TO GET THE RATE
FROM encounters;