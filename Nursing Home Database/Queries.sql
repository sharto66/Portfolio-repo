

--Queries for Nursing Home

--View Patients who are forbidden from eating certain foods e.g. nuts

SELECT Patient_ID, Food_Forbidden FROM Dietary_Requirement
WHERE Food_Forbidden LIKE '%nut%';

--(Inner Equi-Join) Join the Special Care Requirements and Dietary Requirements using Patient_ID

SELECT * FROM Special_Care_Requirement
JOIN Dietary_Requirement USING (Patient_ID);

--(Inner Equi-Join) View the names of all Patients in Rooms

SELECT Name, Secured FROM Patient
JOIN Room USING (Room_ID);

--(Left Outer Join) View Patients names and type of Special Care they require

SELECT Name, Type_of_Treatment FROM Patient
LEFT JOIN Special_Care_Requirement USING (Patient_ID);

--(Non Equi-join) View Patients whose total is greater than 3000

SELECT Name, Total FROM Patient, Cost
WHERE patient.patient_id = cost.patient_id AND Total > 3000;

--(Natural Join) View Emergency Contacts for all patients

SELECT Patient_ID, Name, Next_of_Kin, Contact_Number, Address FROM Patient NATURAL JOIN Emergency_Contact;

--(Right outer Join) View all rooms

SELECT Room_ID, Patient_ID, Name FROM Patient
RIGHT JOIN Room USING (Room_ID) ORDER by Room_ID;

