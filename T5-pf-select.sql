/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T5-pf-select.sql

--Student ID: 34438335
--Student Name: Jiahao Xu


/* Comments for your marker:




*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
WITH TotalAppointments AS (
    SELECT
        v.clinic_id,
        COUNT(*) AS total_appointments
    FROM
        visit v
        JOIN animal an ON v.animal_id = an.animal_id
        JOIN animal_type at ON an.atype_id = at.atype_id
    WHERE
        at.atype_description IN ('Dog', 'Cat')
        AND v.visit_total_cost IS NOT NULL
    GROUP BY
        v.clinic_id
),
VetAppointments AS (
    SELECT
        v.clinic_id,
        v.vet_id,
        (vet.vet_givenname || ' ' || vet.vet_familyname) AS vetname,
        CASE
            WHEN clinic.vet_id = v.vet_id THEN 'HEAD VET'
            ELSE ''
        END AS ishead,
        at.atype_description AS animaltype,
        COUNT(v.visit_id) AS numberappts
    FROM
        visit v
        JOIN animal an ON v.animal_id = an.animal_id
        JOIN animal_type at ON an.atype_id = at.atype_id
        JOIN vet ON v.vet_id = vet.vet_id
        JOIN clinic ON v.clinic_id = clinic.clinic_id
    WHERE
        at.atype_description IN ('Dog', 'Cat')
        AND v.visit_total_cost IS NOT NULL
    GROUP BY
        v.clinic_id,
        v.vet_id,
        vet.vet_givenname,
        vet.vet_familyname,
        clinic.vet_id,
        at.atype_description
)
SELECT
    va.clinic_id AS CLINICID,
    va.vet_id AS VETID,
    va.vetname AS VETNAME,
    va.ishead AS ISHEAD,
    va.animaltype AS ANIMALTYPE,
    va.numberappts AS NUMBERAPPTS,
    ROUND((va.numberappts * 100.0 / ta.total_appointments), 1) AS PERCENTAPPTS
FROM
    VetAppointments va
    JOIN TotalAppointments ta ON va.clinic_id = ta.clinic_id
ORDER BY
    va.clinic_id,
    va.ishead DESC,
    va.vet_id,
    va.animaltype;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT
    VS.SERVICE_CODE,
    S.SERVICE_DESC,
    V.VET_ID,
    VE.VET_GIVENNAME,
    VE.VET_FAMILYNAME,
    V.CLINIC_ID,
    C.CLINIC_NAME,
    V.VISIT_ID,
    TO_CHAR(V.VISIT_DATE_TIME, 'DD-Mon-YYYY HH:MI AM') AS VISITDATETIME,
    VS.VISIT_SERVICE_LINECOST
FROM
    VISIT_SERVICE VS
    JOIN SERVICE S ON S.SERVICE_CODE=VS.SERVICE_CODE
    JOIN VISIT V ON V.VISIT_ID=VS.VISIT_ID
    JOIN VET VE ON V.VET_ID=VE.VET_ID
    JOIN CLINIC C ON V.CLINIC_ID=C.CLINIC_ID
WHERE
    VS.VISIT_SERVICE_LINECOST > (
        SELECT AVG(VS2.VISIT_SERVICE_LINECOST)
        FROM VISIT_SERVICE VS2
        WHERE VS2.SERVICE_CODE = VS.SERVICE_CODE
    )
ORDER BY 
    VS.SERVICE_CODE,
    V.VET_ID,
    V.CLINIC_ID,
    V.VISIT_ID;
COMMIT;