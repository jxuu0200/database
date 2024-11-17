--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-pf-schema.sql

--Student ID: 34438335
--Student Name: Jiahao Xu


/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the Missing TABLES below.
-- Ensure all column comments, and constraints (other than FK's)are included. 
-- FK constraints are to be added at the end of this script

-- VISIT
CREATE TABLE VISIT (
    visit_id NUMBER(5) NOT NULL,
    visit_date_time DATE NOT NULL,
    visit_length NUMBER(2) NOT NULL,
    visit_notes VARCHAR2(200),
    visit_weight NUMBER(4,1),
    visit_total_cost NUMBER(6,2),
    animal_id NUMBER(5) NOT NULL,
    vet_id NUMBER(4) NOT NULL,
    clinic_id NUMBER(2) NOT NULL,
    from_visit_id NUMBER(5)
);
COMMENT ON COLUMN visit.visit_id IS
    'Identifier for visit';
COMMENT ON COLUMN visit.visit_date_time IS
    'Date and time of visit';
COMMENT ON COLUMN visit.visit_length IS
    'Visit length in minutes';
COMMENT ON COLUMN visit.visit_notes IS
    'Vet notes from visit';
COMMENT ON COLUMN visit.visit_weight IS
    'Weight in Kgs';   
COMMENT ON COLUMN visit.visit_total_cost IS
    'Total cost for this visit'; 
COMMENT ON COLUMN visit.animal_id IS
    'Animal identifier'; 
COMMENT ON COLUMN visit.vet_id IS
    'Identifier for the vet'; 
COMMENT ON COLUMN visit.clinic_id IS
    'Identifier for the clinic'; 
COMMENT ON COLUMN visit.from_visit_id IS
    'The previous visit identifier'; 
ALTER TABLE VISIT ADD CONSTRAINT pk_visit PRIMARY KEY (visit_id);
ALTER TABLE VISIT ADD CONSTRAINT unique_visit_date_time UNIQUE (visit_date_time);
ALTER TABLE VISIT ADD CONSTRAINT ch_visit_length CHECK (visit_length <= 90 AND visit_length >= 30);



-- VISIT_DRUG
CREATE TABLE VISIT_DRUG (
    visit_id NUMBER(5) NOT NULL,
    drug_id NUMBER(4) NOT NULL,
    visit_drug_dose VARCHAR2(20) NOT NULL,
    visit_drug_frequency VARCHAR2(20),
    visit_drug_qtysupplied NUMBER(2) NOT NULL,
    visit_drug_linecost NUMBER(5,2) NOT NULL
);
COMMENT ON COLUMN visit_drug.visit_id IS
    'Identifier for visit'; 
COMMENT ON COLUMN visit_drug.drug_id IS
    'Drug identifier'; 
COMMENT ON COLUMN visit_drug.visit_drug_dose IS
    'Dose prescribed in this visit';    
COMMENT ON COLUMN visit_drug.visit_drug_frequency IS
    'Frequency prescribed for this drug for this visit';  
COMMENT ON COLUMN visit_drug.visit_drug_qtysupplied IS
    'Quantity of drug supplied';  
COMMENT ON COLUMN visit_drug.visit_drug_linecost IS
    'Cost charged for drug in this visit'; 
ALTER TABLE VISIT_DRUG ADD CONSTRAINT pk_visit_drug PRIMARY KEY (visit_id, drug_id);

-- VISIT_SERVICE
CREATE TABLE VISIT_SERVICE (
    visit_id NUMBER(5) NOT NULL,
    service_code CHAR(5) NOT NULL,
    visit_service_linecost NUMBER(6,2)
);
COMMENT ON COLUMN visit_service.visit_id IS
    'Identifier for visit'; 
COMMENT ON COLUMN visit_service.service_code IS
    'Service identifier'; 
COMMENT ON COLUMN visit_service.visit_service_linecost IS
    'Cost charged for this service in this visit'; 
ALTER TABLE VISIT_SERVICE ADD CONSTRAINT pk_visit_service PRIMARY KEY (visit_id, service_code);


-- Add all missing FK Constraints below here
ALTER TABLE VISIT ADD CONSTRAINT fk_animal_visit FOREIGN KEY (animal_id) REFERENCES ANIMAL (animal_id);
ALTER TABLE VISIT ADD CONSTRAINT fk_vet_visit FOREIGN KEY (vet_id) REFERENCES VET (vet_id);
ALTER TABLE VISIT ADD CONSTRAINT fk_clinic_visit FOREIGN KEY (clinic_id) REFERENCES CLINIC (clinic_id);
ALTER TABLE VISIT ADD CONSTRAINT fk_visit_visit FOREIGN KEY (from_visit_id) REFERENCES VISIT (visit_id);
ALTER TABLE VISIT_DRUG ADD CONSTRAINT fk_visit_visitdrug FOREIGN KEY (visit_id) REFERENCES VISIT (visit_id);
ALTER TABLE VISIT_DRUG ADD CONSTRAINT fk_drug_visitdrug FOREIGN KEY (drug_id) REFERENCES DRUG (drug_id);
ALTER TABLE VISIT_SERVICE ADD CONSTRAINT fk_visit_visitservice FOREIGN KEY (visit_id) REFERENCES VISIT (visit_id);
ALTER TABLE VISIT_SERVICE ADD CONSTRAINT fk_service_visitservice FOREIGN KEY (service_code) REFERENCES SERVICE (service_code);

COMMIT;