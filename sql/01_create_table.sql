--Raw table
Select * from encounters_raw;

--Clean table
--here we are only pulling out the columns we want/need and giving them more normal names
CREATE TABLE encounters AS
SELECT
    encounter_id,
    patient_nbr AS patient_id,
    CAST(time_in_hospital AS INTEGER) AS length_of_stay,
    CAST(num_lab_procedures AS INTEGER) AS lab_count,
    CAST(num_procedures AS INTEGER) AS procedure_count,
    CAST(num_medications AS INTEGER) AS medication_count,
    CAST(number_outpatient AS INTEGER) AS outpatient_visits,
    CAST(number_emergency AS INTEGER) AS er_visits,
    CAST(number_inpatient AS INTEGER) AS prior_admissions,
    readmitted
FROM encounters_raw;


SELECT count(*) from encounters;