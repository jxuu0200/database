/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-pf-insert.sql

--Student ID: 34438335
--Student Name: Jiahao Xu

/* Comments for your marker:




*/

--------------------------------------
--INSERT INTO visit
--------------------------------------
INSERT INTO visit VALUES (1, TO_DATE('2024-04-01 10:00', 'YYYY-MM-DD HH24:MI'), 30, 'Annual checkup', 15.5, 100.00, 1, 1001, 1, NULL);
INSERT INTO visit VALUES (2, TO_DATE('2024-04-02 14:00', 'YYYY-MM-DD HH24:MI'), 45, 'Vaccination', 20.0, 150.00, 2, 1002, 2, NULL);
INSERT INTO visit VALUES (3, TO_DATE('2024-04-03 09:00', 'YYYY-MM-DD HH24:MI'), 60, 'Dental check', 18.0, 300.00, 3, 1003, 3, NULL);
INSERT INTO visit (visit_id, visit_date_time, visit_length, animal_id, vet_id, clinic_id, from_visit_id) VALUES (4, TO_DATE('2024-06-04 11:00', 'YYYY-MM-DD HH24:MI'), 30, 1, 1001, 1, 1);
INSERT INTO visit (visit_id, visit_date_time, visit_length, animal_id, vet_id, clinic_id, from_visit_id) VALUES (5, TO_DATE('2024-06-05 13:00', 'YYYY-MM-DD HH24:MI'), 30, 2, 1002, 2, 2);
INSERT INTO visit VALUES (6, TO_DATE('2024-04-06 15:00', 'YYYY-MM-DD HH24:MI'), 45, 'Skin allergy', 25.0, 300.00, 4, 1001, 1, NULL);
INSERT INTO visit VALUES (7, TO_DATE('2024-04-07 10:00', 'YYYY-MM-DD HH24:MI'), 30, 'General checkup', 30.0, 200.00, 5, 1002, 3, NULL);
INSERT INTO visit VALUES (8, TO_DATE('2024-04-08 12:00', 'YYYY-MM-DD HH24:MI'), 60, 'X-ray', 20.0, 220.00, 4, 1003, 2, NULL);
INSERT INTO visit VALUES (9, TO_DATE('2024-04-09 14:00', 'YYYY-MM-DD HH24:MI'), 30, 'Vaccination', 18.5, 220.00, 5, 1001, 1, NULL);
INSERT INTO visit VALUES (10, TO_DATE('2024-06-01 11:00', 'YYYY-MM-DD HH24:MI'), 45, 'Upcoming surgery', 22.0, 300.00, 3, 1002, 3, NULL);
--------------------------------------
--INSERT INTO visit_service
--------------------------------------
INSERT INTO visit_service VALUES (1, 'S001', 60.00);
INSERT INTO visit_service VALUES (1, 'S002', 45.00);
INSERT INTO visit_service VALUES (2, 'S001', 60.00);
INSERT INTO visit_service VALUES (3, 'S003', 70.00);
INSERT INTO visit_service VALUES (3, 'S008', 40.00);
INSERT INTO visit_service VALUES (3, 'S002', 45.00);
INSERT INTO visit_service VALUES (6, 'S009', 85.00);
INSERT INTO visit_service VALUES (6, 'S001', 60.00);
INSERT INTO visit_service VALUES (7, 'S004', 150.00);
INSERT INTO visit_service VALUES (8, 'S001', 60.00);
INSERT INTO visit_service VALUES (9, 'S003', 70.00);
INSERT INTO visit_service VALUES (10, 'S002', 45.00);
INSERT INTO visit_service VALUES (10, 'S005', 125.00);
INSERT INTO visit_service VALUES (10, 'S006', 80.00);
INSERT INTO visit_service VALUES (10, 'S007', 50.00);


--------------------------------------
--INSERT INTO visit_drug
--------------------------------------
INSERT INTO visit_drug VALUES (2, 110, 'one shot', 'instructions', 1, 30.00);
INSERT INTO visit_drug VALUES (2, 102, 'one shot', NULL, 1, 99.99);
INSERT INTO visit_drug VALUES (3, 102, 'one shot', NULL, 1, 99.99);
INSERT INTO visit_drug VALUES (6, 103, 'one piece', NULL, 1, 50.00);
INSERT INTO visit_drug VALUES (6, 105, '500mg', NULL, 5, 50.00);
INSERT INTO visit_drug VALUES (6, 114, '0.24mg', NULL, 1, 14.00);
INSERT INTO visit_drug VALUES (7, 102, 'one shot', NULL, 1, 99.99);
INSERT INTO visit_drug VALUES (8, 102, 'one shot', NULL, 1, 99.99);
INSERT INTO visit_drug VALUES (9, 102, 'one shot', NULL, 1, 99.99);
INSERT INTO visit_drug VALUES (9, 118, '800mg', '10 mg twice daily', 4, 40.00);
INSERT INTO visit_drug VALUES (10, 101, '100mg', '5 mg twice daily', 5, 12.00);

COMMIT;