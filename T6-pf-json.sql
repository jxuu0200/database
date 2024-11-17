/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-pf-json.sql

--Student ID: 34438335
--Student Name: Jiahao Xu


/* Comments for your marker:




*/

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

SELECT 
    JSON_OBJECT(
        '_id' VALUE C.CLINIC_ID,
        'name' VALUE C.CLINIC_NAME,
        'address' VALUE C.CLINIC_ADDRESS,
        'phone' VALUE C.CLINIC_PHONE,
        'head_vet' VALUE JSON_OBJECT(
            'id' VALUE HV.VET_ID,
            'name' VALUE HV.VET_GIVENNAME || ' ' || HV.VET_FAMILYNAME
        ),
        'no_of_vets' VALUE (
            SELECT COUNT(*)
            FROM VET V
            WHERE V.CLINIC_ID = C.CLINIC_ID
        ),
        'vets' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'id' VALUE V.VET_ID,
                'name' VALUE V.VET_GIVENNAME || ' ' || V.VET_FAMILYNAME,
                'specialisation' VALUE COALESCE(S.SPEC_DESCRIPTION, 'N/A')
            )
        )
    ) AS clinic_json
FROM 
    CLINIC C
    LEFT JOIN VET HV ON C.VET_ID = HV.VET_ID 
    LEFT JOIN VET V ON C.CLINIC_ID = V.CLINIC_ID
    LEFT JOIN SPECIALISATION S ON V.SPEC_ID = S.SPEC_ID
GROUP BY 
    C.CLINIC_ID, 
    C.CLINIC_NAME, 
    C.CLINIC_ADDRESS, 
    C.CLINIC_PHONE, 
    HV.VET_ID, 
    HV.VET_GIVENNAME, 
    HV.VET_FAMILYNAME
ORDER BY
    C.CLINIC_ID, 
    hV.VET_ID;

COMMIT;