/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T4-pf-mods.sql

--Student ID: 34438335
--Student Name: Jiahao Xu


/* Comments for your marker:




*/

/*(a)*/
ALTER TABLE visit ADD (not_standard NUMBER(2) DEFAULT 0);
desc visit;

UPDATE VISIT
SET not_standard=not_standard+1
WHERE VISIT_ID in (select v.VISIT_ID from VISIT_SERVICE v WHERE (v.visit_service_linecost<>(select s.service_std_cost from SERVICE s where v.SERVICE_CODE=s.SERVICE_CODE)) );
SELECT * FROM visit;

/*(b)*/

ALTER TABLE visit ADD (finish_paid NUMBER(1) DEFAULT 0); 
ALTER TABLE visit ADD (payment_method VARCHAR2(20));
ALTER TABLE visit ADD (payment_date_time DATE);
ALTER TABLE visit ADD (payment_number NUMBER(10,2));
update VISIT
set finish_paid=1,
    payment_method='Historical',
    payment_date_time=visit_date_time,
    payment_number=visit_total_cost
where visit_total_cost is not null;
desc visit;
SELECT * from visit;
COMMIT;