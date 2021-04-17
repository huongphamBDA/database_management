/************************************************************************/
/*           VOLTAIRE SEMESTER PROJECT, MIS 686, SPRING 2021            */
/*                SILVER TOP GROUP ADULT FOSTER CARE                    */
/*                              --SQL QUERY--                           */
/************************************************************************/

--- add some more!
/************************************************************************/
/*    SELECT AND EXECUTE THIS BLOCK TO CREATE THE SILVERTOP DATABASE    */
/************************************************************************/

    -- Set Context to Master 
            USE MASTER; 
            GO
    
    -- If the SilverTop database exists, delete it 
            IF EXISTS (SELECT * FROM Master.dbo.sysdatabases WHERE NAME = 'SilverTop')
            DROP DATABASE SilverTop; 
    
    -- Create the SilverTop database 
            CREATE DATABASE SilverTop; 
            GO 
            
    -- CREATE TABLES IN THE SILVERTOP DATABASE 
            USE SilverTop; 


	-- 0. The PEOPLE Table 
		-- Schema:
			--	PEOPLE (PeopleID, FirstName, LastName, DOB, Gender, Ethnicity, SSN, Phone, Language, Email, HomeAdd, DeptID, SupervisorID)
			--	FK DeptID references DEPARTMENTS
			--	FK SupervisorID references PEOPLE 
			--	Not null SSN, Language, HomeAdd, DeptID, SupervisorID

		-- Create the PEOPLE table 
				CREATE TABLE tblPeople
				(	PeopleID Int IDENTITY (100, 1) PRIMARY KEY, 
					FirstName Varchar(128),
					LastName Varchar(128),
					DOB Date, 
					Gender Varchar(30),  
					Ethnicity Varchar(30),
					SSN Char(10) NOT NULL, 
					Phone Varchar(20), 
					Language Varchar(128) NOT NULL, 
					Email Varchar(128), 

				);
		-- Insert data into the PEOPLE table 
		
    -- 1. The CLIENTS Table 
        -- Schema: 
			--	CLIENTS (PeopleID, MedRecNum, InsurNum, CareHourLimit, Deceased)
			--	FK PeopleID references PEOPLE
			--	Not null MedRecNum, InsurNum

        -- Create the CLIENTS table 
				CREATE TABLE tblClients 
				(	PeopleID		Int		IDENTITY (100, 1) PRIMARY KEY REFERENCES tblPEOPLE	, 
					MedRecNum		Int		NOT NULL											, 
					InsurNum		Int		NOT NULL											, 
					CareHourLimit	Int															, 
					Deceased		Varchar(128) DEFAULT 'No'
				); 

        -- Insert data into the CLIENTS table 
		-- schema: CLIENTS (PeopleID, MedRecNum, InsurNum, CareHourLimit, Deceased)
				INSERT INTO tblClients VALUES
				(1001, 12345678, ABC0000001, 200) 

    -- 2. The CAREGIVERS Table 
		-- Schema:
			--	CAREGIVERS (PeopleID, DateRecruited, HrPayRate, CoordinatorID)
			--	FK PeopleID references PEOPLE
			--	FK CoordinatorID references COORDINATORS
			--	Not null CoordinatorID 

		-- Create the CAREGIVERS table 
        
        -- Insert data into the CAREGIVERS table 
    
    -- 3. The CARESERVICES Table  
		-- Schema:
			--	CARESERVICES (ClientID, CaregiverID, DateOfService, NumOfHours, HrBillRate, ClientReview)
			--	FK ClientID references CLIENTS
			--	FK CaregiverID references CAREGIVERS

		-- Create the CARESERVICES table 
 
        -- Insert data into the CARESERVICES table 
    
    -- 4. The TRANSPORTMODES Table
        -- Schema: TRANSPORTMODES (TransportMode)

		-- Create the TRANSPORTMODES table 

        
        -- Insert data into the TRANSPORTMODES table
    
    -- 5. The CAREGIVER_TRANSPORTS Table
        -- Schema:
			--	CAREGIVER_TRANSPORTS (CaregiverID, TransportMode)
			--	FK CaregiverID references CAREGIVERS
			--	FK TransportMode references TRANSPORTMODES

		-- Create the CAREGIVER_TRANSPORTS table 

        -- Insert data into the CAREGIVER_TRANSPORTS table 
    
    -- 6. The CASEMANAGERS Table 
        -- Schema:
			--	CASEMANAGERS (PeopleID, YearsOfExperience)
			--	FK PeopleID references PEOPLE

		-- Create the CASEMANAGERS table 

        -- Insert data into the CASEMANAGERS table
    
    -- 7. The CASEREPORTS Table 
        -- Schema:
			--	CASEREPORTS (ClientID, CaseManagerID, Time, Date, CaseReports)
			--	FK ClientID references CLIENTS
			--	FK CaseManagerID references CASEMANAGERS

		-- Create the CASEREPORTS table 
        
        -- Insert data into the CASEREPORTS table
    
    -- 8. The COORDINATORS Table
        -- Schema:
			--	COORDINATORS (PeopleID, Full-or-parttime)
			--	FK PeopleID references PEOPLE 

		-- Create the COORDINATORS table 
        
        -- Insert data into the COORDINATORS table 
    
    -- 9. The HRTASKS Table 
        -- Schema: 
			--	HRTASKS (HRTaskID, TaskDescription)
			--	Not null TaskDescription

		-- Create the HRTASKS table 

        -- Insert data into the HRTASKS table 
    
    -- 10. The COORD_HRTASKS Table
        -- Schema:
			--	COORD_HRTASKS (CoordinatorID, HRTaskID)
			--	FK CoordinatorID references COORDINATORS
			--	FK HRTaskID references HRTASKS 

		-- Create the COORD_HRTASKS table


        -- Insert data into the COORD_HRTASKS table
    
    -- 11. The NURSES Table 
        -- Schema:
			--	NURSES (PeopleID, Rank, PayRate)
			--	FK PeopleID references PEOPLE

		-- Create the NURSES table
        -- Insert data into the NURSES table
    
    -- 12. The ACCIDENTREPORTS Table
        -- Schema:
			--	ACCIDENTREPORTS (NurseID, ClientID, AccidentDate, AccidentTime, AccidentLocation, AccidentDescription)
			--	FK NurseID references NURSES
			--	FK ClientID references CLIENTS

		-- Create the ACCIDENTREPORTS table 

        -- Insert data into the ACCIDENTREPORTS table 
        
    -- 13. The NURSEVISITREPORTS Table
        -- Schema:
			--	NURSEVISITREPORTS (NurseID, ClientID, Date, Time, VisitNotes)
			--	FK NurseID references NURSES
			--	FK ClientID references CLIENTS

		-- Create the NURSEVISITREPORTS table 

        -- Insert data into the NURSEVISITREPORTS table 
        
        
    -- 15. The DEPARTMENTS Table 
        -- Schema: DEPARTMENTS (DeptID, DeptName, DeptHead)

		-- Create the DEPARTMENTS table

        -- Insert data into the DEPARTMENTS table
    
    
        
        
/************************************************************************/
/*               10 BUSINESS DATA RETRIEVAL QUERIES                     */
/************************************************************************/

-- 1. BUSINESS QUESTION 1 
    --> What kind of accident happened to client X? When and where did it happen? 

-- 2. BUSINESS QUESTION 2
    --> Does client X have any complaints about his caregiver? What exactly did he complain about? 
    
-- 3. BUSINESS QUESTION 3
    --> Are there any clients who have a blank Date Visiting by Nurse and Case Manager? (check Null cell values, no Null value means that the client is well observed and watched out) 
    
-- 4. BUSINESS QUESTION 4
    --> What location clients need our service, but we don�t have caregivers available? 
    
-- 5. BUSINESS QUESTION 5
    --> What language does the new client speak? She lives in zip code Y. Do we have any caregivers in zip code Y? What language does that caregiver know? Does the caregiver have a car to drive to the client�s home? 
    
-- 6. BUSINESS QUESTION 6
    --> How many caregivers did coordinator Z recruit and give training? Which coordinator recruits and trains more/fewer caregivers? 
    
-- 7. BUSINESS QUESTION 7 
    --> What is client X�s care hour limit to be covered by his insurance? 
    
-- 8. BUSINESS QUESTION 8 
    --> How many hours did caregiver XYZ work this month for each of his clients? Equivalent to how much $$? Is the number beyond the limit accepted by their insurance? (warning if more than) 
    
-- 9. BUSINESS QUESTION 9 (subquery)
-- 10. BUSINESS QUESTION 10 (subquery)