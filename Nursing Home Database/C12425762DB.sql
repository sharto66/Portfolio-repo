--C12425762		Sean Hartnett

--The Drop Table statements below delete the the named tables from the database and purges the data in them

DROP TABLE Monthly_Accounts CASCADE CONSTRAINTS PURGE;

DROP TABLE Room CASCADE CONSTRAINTS PURGE;

DROP TABLE Patient CASCADE CONSTRAINTS PURGE;

DROP TABLE Dietary_Requirement CASCADE CONSTRAINTS PURGE;

DROP TABLE Special_Care_Requirement CASCADE CONSTRAINTS PURGE;

DROP TABLE Emergency_Contact CASCADE CONSTRAINTS PURGE;

DROP TABLE Cost CASCADE CONSTRAINTS PURGE;

CREATE TABLE Monthly_Accounts --This creates the Monthly_Accounts table
(
	Month                VARCHAR(20) NOT NULL ,
	Year                 VARCHAR(20) NOT NULL ,
	Gross_Payments       NUMBER(7,2) NULL ,
	Tax_Paid             NUMBER(7,2) NULL ,
	VAT_Paid             NUMBER(7,2) NULL ,
	Profit               NUMBER(7,2) NULL ,
CONSTRAINT  XPKMonthly_Accounts PRIMARY KEY (Month,Year) --This make Month and Year a Primary Key
);

CREATE TABLE Room --This creates the Room table
(
	Room_ID              NUMBER(5) NOT NULL ,
	Floor_No             NUMBER(1) NULL ,
	Secured              CHAR(1) NULL ,
	Bed_Type             VARCHAR(20) NULL ,
	Equipment_Available  VARCHAR(30) NULL ,
	Vacancy              CHAR(1) NULL ,
CONSTRAINT  XPKRoom PRIMARY KEY (Room_ID) --This make Room_ID a Primary Key
);

CREATE TABLE Patient --This creates the Patient table
(
	Patient_ID           NUMBER(5) NOT NULL ,
	Name                 VARCHAR(30) NULL ,
	DOB                  DATE NULL ,
	Reason_of_Stay       VARCHAR(100) NULL ,
	Home_Address         VARCHAR(50) NULL ,
	Notes                VARCHAR(200) NULL ,
	Room_ID              NUMBER(5) NOT NULL ,
	Arrival_Date         DATE NULL ,
	Departure_Date       DATE NULL ,
CONSTRAINT  XPKPatient PRIMARY KEY (Patient_ID), --This make Patient_ID a Primary Key
CONSTRAINT XIF1Patient FOREIGN KEY (Room_ID) REFERENCES Room (Room_ID) --Makes Room_ID a foreign key, referenced from the Room table
);

CREATE TABLE Cost --This creates the Cost table
(
	Patient_ID           NUMBER(5) NOT NULL ,
	Total                NUMBER(6,2) NULL ,
	Doctor_Visits        NUMBER(6,2) NULL ,
	Stay                 NUMBER(6,2) NULL ,
	Food                 NUMBER(6,2) NULL ,
	Extra_Care           NUMBER(6,2) NULL ,
CONSTRAINT  XPKCost PRIMARY KEY (Patient_ID), --This make Patient_ID a Primary Key
CONSTRAINT XIF1Cost FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) --Makes Patient_ID a foreign key, referenced from the Patient table
);

CREATE TABLE Emergency_Contact --This creates the Emergency_Contact table
(
	Patient_ID           NUMBER(5) NOT NULL ,
	Next_of_Kin          VARCHAR(20) NOT NULL ,
	Contact_Number       VARCHAR(20) NULL ,
	Address              VARCHAR(50) NULL ,
CONSTRAINT  XPKEmergency_Contact PRIMARY KEY (Patient_ID), --This make Patient_ID a Primary Key
CONSTRAINT XIF1Emergency_Contact FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) --Makes Patient_ID a foreign key, referenced from the Patient table
);

CREATE TABLE Special_Care_Requirement --This creates the Special_Care_Requirement table
(
	Patient_ID           NUMBER(5) NOT NULL ,
	Type_of_Treatment    VARCHAR(50) NULL ,
	Frequency_of_Treatment VARCHAR(20) NULL ,
	Required_Equipment   VARCHAR(50) NULL ,
CONSTRAINT  XPKSpecial_Care_Requirement PRIMARY KEY (Patient_ID), --This make  a Primary Key
CONSTRAINT XIF1Special_Care_Requirement FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) --Makes Patient_ID a foreign key, referenced from the Patient table
);

CREATE TABLE Dietary_Requirement --This creates the Dietary_Requirement table
(
	Patient_ID           NUMBER(5) NOT NULL ,
	Foods_Required       VARCHAR(100) NULL ,
	Foods_Forbidden      VARCHAR(100) NULL ,
	Calorie_Intake       NUMBER(4) NULL ,
CONSTRAINT  XPKDietary_Requirement PRIMARY KEY (Patient_ID), --This make Patient_ID a Primary Key
CONSTRAINT XIF1Dietary_Requirement FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID) --Makes Patient_ID a foreign key, referenced from the Patient table
);

--Room insert statements

INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(01, 1, 'N', 'Orthopedic', 'Wheelchair,Hoist,Bed pan', 'Y');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(16, 2, 'N', 'Standard', 'Commode,Hoist,Call Bell', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(03, 1, 'N', 'Orthopedic', 'Wheelchair,Hoist,Commode', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(07, 1, 'Y', 'Standard', 'Wheelchair,Commode,Hoist', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(17, 2, 'N', 'Orthopedic', 'Wheelchair,Hoist', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(21, 2, 'N', 'Standard', 'Wheelchair,Hoist,Bed Pan', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(13, 2, 'N', 'Standard', 'Wheelchair,Commode', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(10, 1, 'Y', 'Standard', 'Wheelchair,Hoist,Commode', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(24, 2, 'N', 'Orthopedic', 'Wheelchair,BPMachine', 'N'); 
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(23, 2, 'N', 'Orthopedic', 'Wheelchair,Commode,Hoist', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(19, 2, 'N', 'Orthopedic', 'Bed Pan, Hoist', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(02, 1, 'N', 'Orthopedic', 'Wheelchair,Commode,', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(09, 1, 'Y', 'Standard', 'Walking Frame,Commode', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(18, 2, 'N', 'Standard', 'Wheelchair,Hoist', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(04, 1, 'N', 'Standard', 'Walking Frame,Commode', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(05, 1, 'Y', 'Standard', 'Wheelchair,Commode,Hoist', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(06, 1, 'Y', 'Standard', 'Wheelchair,Bed Pan,Hoist', 'Y');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(08, 1, 'Y', 'Orthopedic', 'Wheelchair,Bed Pan,Hoist', 'Y');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(11, 1, 'Y', 'Orthopedic', 'Wheelchair,Bed Pan,Hoist', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(12, 1, 'Y', 'Standard', 'Walking Frame,Commode', 'Y');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(14, 2, 'N', 'Standard', 'Wheelchair,Commode,', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(15, 2, 'N', 'Orthopedic', 'Wheelchair,BP Machine,Bed Pan', 'N');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(20, 2, 'N', 'Standard', 'Walking Frame,Commode', 'Y');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(22, 2, 'N', 'Standard', 'Wheelchair,BP Machine,IV Stand', 'Y');
INSERT INTO ROOM (Room_ID, Floor_No, Secured, Bed_Type, Equipment_Available, Vacancy) Values(25, 2, 'N', 'Orthopedic', 'Wheelchair, Hoist, Bed Pan', 'Y');

--Patient Insert statements

INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (12710,'Amelia Moody','12-SEP-1951','Recovering from injury','46 Drop Road Dublin','Walked around the room with no pain',1,'11-JAN-2013','28-FEB-2013'); 
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (23631,'Kaitlin Stone','14-JUL-1961','Rehabilitation','27 Kettle Avenue Kerry','Feeling better and is now able to sit up straight',2,'03-NOV-2013','05-JAN-2014');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (29262,'Cruz G. Frederick','04-SEP-1952','Functional Disability','66 Client Drive Kildare','Complained about back pain',3,'15-JUN-2013','29-NOV-2013');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (10243,'Cassandra Q. Short','17-FEB-1964','Dementia','21 Sandra Street Dublin','Required extra attention as she felt ill',4,'22-JUL-2013','10-JAN-2014');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (20594,'Keane D. Dodson','21-OCT-1951','Arthritis','31 Relatives Drive Waterford','Took painkillers to relieve leg pain',5,'05-AUG-2013','11-FEB-2014');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (24335,'Rudyard Chaney','02-JUN-1955','Parkinsons Disease','9 Beaver Road Dublin','Needed extra care, and took painkillers',6,'30-MAY-2013','02-SEP-2013');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (17386,'Gray Tate','17-APR-1958','Rehabilitation','51 Cast Street Kildare','Had a small rise in temperature but felt better after medication',7,'10-SEP-2013','12-DEC-2013');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (11947,'Willow Hopper','24-MAY-1956','Dementia','39 Market Street Dublin','Mental health is stable',8,'19-MAR-2013','01-SEP-2013');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (27042,'Brady R. Larsen','26-OCT-1954','Recovering from injury','71 Fiction Avenue Dublin','Recovering very fast ',9,'28-NOV-2013','01-FEB-2014');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (17033,'Brent D. Coffey','15-JUL-1957','Arthritis','12 Bed Lane Kildare','Ate all required food and is happy with the treatments',10,'06-MAY-2013','09-DEC-2013');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (12440,'Jesse E. Hooper','22-JUN-1951','Functional Disability','16 Baker Street Dublin','Feels tired because of sleepless night',11,'30-OCT-2013','29-JAN-2014');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (12390,'Reese O. Park','22-MAY-1955','Functional Disability','19 Panther Lane Dublin','Took all the prescribed medication',12,'09-JUL-2013','14-OCT-2013');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (26206,'Clarke W. Lopez','10-APR-1954','Dementia','64 Nurse Road Kildare','Found it difficult to communicate',13,'26-JUN-2013','22-DEC-2013');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (12815,'Daquan Browning','27-MAY-1965','Parkinsons Disease', '98 Rainbow Street Waterford','Patient did not have any complaints', 14, '01-DEC-2013', '15-APR-2014');
INSERT INTO Patient (Patient_ID,Name,DOB,Reason_of_Stay,Home_Address,Notes,Room_ID,Arrival_Date,Departure_Date) VALUES (13111,'Florence Y. Mccall','05-MAY-1960','Rehabilitation','90 Multi-Hop Road Dublin','Arms and legs still in pain',15,'20-NOV-2013','02-MAR-2014');

--Cost insert statemnts

INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (12710,247.50,474.50,1547.25,214.50,2450.75);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (23631,156.50,465.50,1599.25,604.50,2825.75);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (29262,153.25,361.50,1898.25,941.50,3354.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (10243,184.50,633.50,1851.50,735.50,3405.00);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (20594,179.25,344.50,1916.25,478.50,2908.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (24335,155.50,212.50,1637.00,480.50,2485.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (17386,191.25,331.50,1599.25,862.50,2984.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (11947,191.50,214.50,1780.50,547.50,2734.00);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (27042,172.25,157.50,1474.25,703.50,2507.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (17033,250.50,370.50,1964.00,842.50,3427.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (12440,183.25,227.50,1586.25,883.50,2880.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (12390,198.50,492.50,1528.50,404.50,2624.00);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (26206,190.25,145.50,1863.25,879.50,3078.50);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (12815,0,0,0,0,0);
INSERT INTO Cost (Patient_ID,Food,Doctor_Visits,Stay,Extra_Care,Total) VALUES (13111,241.25,226.50,1660.25,756.50,2884.50);

--Special Care Insert statements

INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	12710,
	'Patient needs Dialyisis',
	'4 times a day',
	'Dialyisis machine'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	23631,
	'Patient requires cathader, needs constant changing',
	'6 times a day',
	'Cathader bags and tubes'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	20594,
	'Reguarly needs deep tissue massages',
	'8 times a day',
	'Body oil, lube and gloves'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	24335,
	'Needs to be moved reguarly to prevent bedsores',
	'4 times a day',
	'Gloves'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	10243,
	'Leg injury rehabilitation',
	'once a day',
	'Leg brace and dumbells'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	26206,
	'Cleaning of leg amputation stump',
	'3 times a day',
	'Disinfectant and clean bandages'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	17386,
	'Patient is suicidal, needs to be restrained',
	'N/A',
	'Ankle and wrist straps secured to bed'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	11947,
	'Needs brain shock theraphy',
	'2 times a day',
	'Electrodes and battery'
);
INSERT INTO Special_Care_Requirement (Patient_ID, Type_of_Treatment, Frequency_of_Treatment, Required_Equipment) VALUES
(
	13111,
	'Patient needs regular enemas',
	'4 times a day',
	'Enema bags and tubes'
);

--Dietary requirements insert statements

INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (12710, 'Jello. Lots of Jello', 'Rice cakes', 1700);
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (23631, 'Fish and Pultry', 'Carbohydrates',  2300 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (29262, 'Jumbo Sandwiches', 'Cinnamon',  2750);
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (10243, 'Olives, mustard, lettuce, honey, coffee', 'Raspberries',  1200 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (20594, 'Lollypops', 'Red meat',  2300 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (24335, 'Jello', 'Cucumber, Peppers, Melons',  2000 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (17386, 'Dry toast only', 'All other Foods',  1700 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (11947, 'Foods rich in fiber, green tea', 'Sugar',  2400 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (27042, 'Dairy', '',  2000 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (17033, 'Fish fingers, chicken nuggets', 'Milkshake',  2500 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (12440, 'Gummy bears', 'Gummy worms',  2200 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (12390, 'Starchy Foods', 'Fizzy drinks',  2000 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (26206, 'Pork sausages', 'Nuts',  2400 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (12815, 'Red meat, dairy, eggs', 'Fried Foods',  2700 );
INSERT INTO  Dietary_Requirement  ( Patient_ID , Foods_Required , Foods_Forbidden , Calorie_Intake ) VALUES (13111, '', 'Dairy, gluten',  2100 );

--Emergency Accounts insert statements

INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (12710, 'Alfreda Nixon', '675-7733105', 'Ap #233-2319 Libero Av.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (23631, 'Quynn Carson', '988-6634367', '542-8297 Nunc Avenue');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (29262, 'Ava Morales', '087-9666290', '609-484 Mollis St.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (10243, 'Vivian Becker', '705-3634033', 'P.O. Box 430, 8231 Feugiat Ave');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (20594, 'Nevada Walker', '869-7666515', '4269 Lectus St.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (24335, 'Randall Bentley', '865-3684510', '327-3036 In Avenue');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (17386, 'Jolie Boyle', '721-5892339', 'P.O. Box 251, 3298 Et Street');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (11947, 'Kevin Higgins', '605-3368150', '129-7534 Fames Road');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (27042, 'Harding Cooper', '439-9390634', '6837 Ullamcorper. Rd.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (17033, 'Anthony Flynn', '786-9865556', 'Ap #783-3419 Quisque Ave');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (12440, 'Garrett Ratliff', '030-7276031', 'Ap #264-3164 Ornare Rd.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (12390, 'Cooper Ward', '656-6973140', 'Ap #985-7539 Leo, St.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (26206, 'Chava Charles', '107-3803505', '169-6490 Purus, Rd.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (12815, 'Baker Benjamin', '322-4631615', 'P.O. Box 664, 3669 Turpis Av.');
INSERT INTO Emergency_Contact ( Patient_ID , Next_of_Kin , Contact_Number , Address ) VALUES (13111, 'Jena Parks', '057-4898530', 'Ap #237-7967 Dui Avenue');

--Monthly Accounts insert statements

INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('JAN', '2013',  40000,  5800,  600,  33600); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('FEB', '2013',  38500,  5400,  600,  32500); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('MAR', '2013',  49000,  6300,  800,  41900); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('APR', '2013',  29000,  3900,  620,  24480); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('MAY', '2013',  36000,  4950,  390,  30660); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('JUN', '2013',  51600,  6700,  690,  44210); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('JUL', '2013',  49600,  6200,  650,  42750); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('AUG', '2013',  36000,  6700,  460,  28840); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('SEP', '2013',  61200,  7390,  800,  53010); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('OCT', '2013',  39200,  4310,  390,  34500); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('NOV', '2013',  29900,  5450,  600,  23850); 
INSERT INTO Monthly_Accounts(Month, Year, Gross_Payments, VAT_Paid, TAX_Paid, Profit) VALUES('DEC', '2013',  21360,  3970,  490,  16900);

COMMIT;