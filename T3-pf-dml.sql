/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T3-pf-dml.sql

--Student ID: 34438335
--Student Name: Jiahao Xu

/* Comments for your marker:




*/

/*(a)*/
CREATE SEQUENCE visit_id
             START WITH 100 INCREMENT BY 10;

/*(b)*/
INSERT INTO visit VALUES (10200,to_date('19/05/2024 14:00','dd/mm/yyyy hh24:mi'),30,NULL,NULL,NULL,
(SELECT
    ANIMAL_ID
FROM
    ANIMAL
WHERE
    OWNER_ID in(
        SELECT
            owner_id
        FROM
            owner
        WHERE
            owner_givenname='Jack' and upper(owner_familyname)='JONES'
    ) and ANIMAL_BORN=TO_DATE('2018-06-01', 'YYYY-MM-DD')),
(SELECT
    vet_id
FROM
    vet
WHERE
    vet_givenname='Anna' and upper(vet_familyname)='KOWALSKI'),
3,NULL);

/*(c)*/
INSERT INTO VISIT_SERVICE VALUES (10200,(
    SELECT
        service_code
    FROM
        service
    WHERE
        lower(service_desc)='ear infection treatment'
),(
    SELECT
        service_std_cost
    FROM
        service
    WHERE
        lower(service_desc)='ear infection treatment'
));

INSERT INTO VISIT_DRUG VALUES (10200,(
    SELECT
        DRUG_ID
    FROM
        DRUG
    WHERE
        drug_name='Clotrimazole'
),'one bottle','three times','1',(
    SELECT
        drug_std_cost
    FROM
        DRUG
    WHERE
        drug_name='Clotrimazole'
));


UPDATE VISIT
SET VISIT_NOTES='ear infection',
    visit_weight=10,
    visit_total_cost=(SELECT visit_service_linecost FROM VISIT_SERVICE WHERE VISIT_ID=10200)+(SELECT visit_drug_linecost FROM VISIT_DRUG where VISIT_ID=10200)
WHERE visit_id=10200;

INSERT INTO VISIT VALUES (10240,to_date('26/05/2024 14:00','dd/mm/yyyy hh24:mi'),30,'ear infection treatment',10,
(SELECT
        service_std_cost
    FROM
        service
    WHERE
        lower(service_desc)='ear infection treatment'),
(SELECT animal_id FROM VISIT where VISIT_ID=10200),(SELECT VET_ID FROM VISIT where VISIT_ID=10200),3,10200);

/*(d)*/
DELETE FROM VISIT
WHERE ANIMAL_ID in (SELECT ANIMAL_ID FROM ANIMAL where OWNER_ID in(SELECT owner_id FROM owner WHERE owner_givenname='Jack' and upper(owner_familyname)='JONES') and ANIMAL_BORN=TO_DATE('2018-06-01', 'YYYY-MM-DD') and atype_id in (select atype_id from ANIMAL_TYPE where atype_description='Rabbit')
    and VISIT_DATE_TIME>to_date('21/05/2024 00:00','dd/mm/yyyy hh24:mi') and FROM_VISIT_ID is not NULL);

select * from visit; 

COMMIT;