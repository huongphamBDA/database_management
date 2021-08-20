/**********************************************************************************************************************/
/*                                       ENTERPRISE DATABASE MANAGEMENT PROJECT                                       */
/*                                         SILVER TOP GROUP ADULT FOSTER CARE                                         */
/*                                                   --SQL QUERY--                                                    */
/**********************************************************************************************************************/


/**********************************************************************************************************************/
/*                         SELECT AND EXECUTE THIS BLOCK TO CREATE THE SILVER TOP DATABASE                            */
/**********************************************************************************************************************/

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



    -- 1. The DEPARTMENTS Table
        -- Schema: DEPARTMENTS (DeptID, DeptName, DeptHead)
        -- Create the DEPARTMENTS table
        CREATE TABLE tblDepartments
        ( DeptID   Int          PRIMARY KEY ,
          DeptName Varchar(128)             ,
          DeptHead Varchar(128)
        );

        -- Insert data into the DEPARTMENTS table
        INSERT INTO tblDepartments VALUES
        (1, 'OutReach', 'Courteney Cox')             ,
        (2, 'Human Resources', 'Jennifer Aniston')   ,
        (3, 'Accounting & Finance', 'Lisa Kudrow')   ,
        (4, 'Operations Management', 'Matt Le Blanc'),
        (5, 'Health Management', 'Matthew Perry')    ,
        (6, 'Supervision', 'David Schwimmer')        ;



    -- 2. The PEOPLE Table
        -- Schema:
        -- PEOPLE (PeopleID, FirstName, LastName, DOB, Gender, Ethnicity, SSN, Phone, Language, Email, HomeAddress, DeptID, SupervisorID)
        -- FK DeptID references DEPARTMENTS
        -- FK SupervisorID references PEOPLE
        -- Not null SSN, Language, HomeAddress

    -- Create the PEOPLE table
        CREATE TABLE  tblPeople
        ( PeopleID     Int            PRIMARY KEY                 ,
          FirstName    Varchar(128)                               ,
          LastName     Varchar(128)                               ,
          DOB          Date                                       ,
          Gender       Varchar(30)                                ,
          Ethnicity    Varchar(30)                                ,
          SSN          Char(15)       NOT NULL                    ,
          Phone        Varchar(20)                                ,
          [Language]   Varchar(128)   NOT NULL                    ,
          Email        Varchar(128)                               ,
          HomeAddress  Varchar(128)   NOT NULL                    ,
          DeptID       Int            REFERENCES    tblDepartments,
          SupervisorID Int            REFERENCES    tblPeople
        );

    -- Insert data into the PEOPLE table
        INSERT INTO tblPeople (PeopleID, FirstName, LastName, DOB, Gender, Ethnicity,
                               SSN, Phone, [Language], Email, HomeAddress, DeptID, SupervisorID) VALUES

        (300, 'LINDA', 'MCMAHON', '1965-06-13', 'Female', 'Alaska Native', '134177450',
        '781-333-4444', 'English', 'lindamcmahon@hotmail.com', 'Saugus, MA', 6, NULL),               -- president
        (301, 'Courteney', 'Cox', '1950-06-01', 'Female', 'Asian', '111111111',
        '858-222-3333', 'English, Vietnamese', 'c.cox@gmail.com', 'San Diego, CA', 6, 300),          -- OutReach DeptHead
        (302, 'Jennifer', 'Aniston', '1951-07-01', 'Femle', 'White', '222222222',
        '858-333-4444', 'English', 'j.anniston@gmail.com', 'Santa Barbara, CA', 6, 300),             -- Human Resources DeptHead
        (303, 'Lisa', 'Kudrow', '1952-08-01', 'Female', 'White', '333333333',
        '619-444-5555', 'English, Spanish', 'l.kudrwo@gmail.com', 'Cambridge, MA', 6, 300),          -- Accounting & Finance DeptHead
        (304, 'Matt', 'Le Blanc', '1953-09-01', 'Male', 'Hispanic', '444444444',
        '619-555-6666', 'English, Spanish', 'm.leblanc@gmail.com', 'Milton, MA', 6, 300),            -- Operations Management DeptHead
        (305, 'Matthew', 'Perry', '1954-10-01', 'Male', 'White', '555555555',
        '619-666-7777', 'English, Chinese', 'm.perry@gmail.com', 'Boston, MA', 6, 300),              -- Health Management DeptHead
        (306, 'David', 'Schwimmer', '1955-11-01', 'Male', 'White', '666666666',
        '858-777-8888', 'English', 'd.schwimmer@gmail.com', 'Lynn, MA', 6, 300),                     -- Supervision DeptHead

        (175, 'CHARLIZE', 'THERON', '1970-05-22', 'Female', 'Hispanic', '341968464',
        '857-889-1357', 'English, Spanish', 'charlizetheron@hotmail.com', 'Boston, MA', 6, 306),     -- supervisor1
        (180, 'MICHAEL', 'BLOOMBERG', '1968-03-15', 'Male', 'Pacific Islander', '488633266',
        '617-345-6789', 'English, Vietnamese', 'michaelbloomberg@gmail.com', 'Newton, MA', 5, 175),  -- nurse1
        (170, 'AMY', 'ISSA', '1975-09-14', 'Female', 'Hispanic', '605271466',
        '857-123-6789', 'English, Spanish', 'amyissa@hotmail.com', 'Milton, MA', 2, 175),            -- coordinator1
        (165, 'STEVEN', 'MNUCHIN', '1979-11-16', 'Male', 'Asian', '509596791',
        '774-223-3445', 'English, Vietnamese', 'stevenmnuchin@gmail.com', 'Worcester, MA', 4, 175),  -- casemanager1

        (197, 'MITT', 'ROMNEY', '1975-05-27', 'Male', 'Asian', '350157794',
        '339-987-6543', 'Vietnamese', 'mittromney@gmail.com', 'Woburn, MA 01522', 4, 170),           -- caregiver1
        (198, 'DONALD', 'TRUMP', '1980-08-13', 'Male', 'Hispanic/Latino', '428593892',
        '781-888-9999', 'Spanish, a little English', 'donaldtrump@gmail.com', 'Saugus, MA', 4, 170), -- caregiver2
        (199, 'SALLY', 'FIELD', '1985-02-19', 'Female', 'Native Hawaiian', '273769544',
        '857-552-6678', 'English', 'sallyfield@gmail.com', 'Cambridge, MA', 4, 170),                 -- caregiver3
        (200, 'MEGHAN', 'MARKLE', '1990-04-21', 'Female', 'Asian', '199905850',
        '857-777-8890', 'Chinese', 'meghanmarkle@yahoo.com', 'Worcester, MA 01522', 4, 170),         -- caregiver4

        (149, 'BARACK', 'OBAMA', '1957-11-22', 'Male', 'Native Hawaiian', '400940997',
        '781-123-4567', 'English', 'barackobama@yahoo.com', 'Arlington, MA', 1, 165),                -- client1
        (150, 'THOMAS', 'JEFFERSON', '1934-02-25', 'Male', 'African', '444622945',
        '857-234-4568', 'Zulu', 'thomasjefferson@gmail.com', 'Milton, MA', 1, 165),                  -- client2
        (151, 'HILLARY', 'CLINTON', '1949-12-01', 'Female', 'Hispanic', '918220531',
        '339-876-4321', 'Spanish', 'hillaryclinton@gmail.com', 'Woburn, MA', 1, 165),                -- client3
        (152, 'JARED', 'POLIS', '1955-04-23', 'Male', 'Asian', '509890693',
        '781-444-5555', 'Vietnamese', 'jaredpolis@hotmail.com', 'Saugus, MA', 1, 165),               -- client4

        (153, 'GREG', 'GIANFORTE', '1954-05-10', 'Male', 'African', '144681353',
        '339-555-6666' , 'Haiti', 'greggianforte@gmail.com', 'Woburn, MA', 1, 165),                  -- client5
        (154, 'RICK', 'SCOTT', '1953-06-11', 'Male', 'American Indian', '927601766',
        '617-666-7777' , 'English', 'rickscott@yahoo.com', 'Newton, MA', 1, 165),                    -- client6
        (155, 'ARNOLD', 'SCHWARZENEGGER', '1952-07-12', 'Male', 'Hispanic', '675048206',
        '857-777-8888' , 'Spanish', 'arnodschwarzenegger@hotmail.com', 'Milton, MA', 1, 165),        -- client7
        (156, 'SCARLETT', 'WARNER', '1949-10-15', 'Female', 'Asian', '690575022',
        '339-234-5678', 'Chinese', 'scarlettwarner@yahoo.com', 'Lynn, MA', 1, 165),                  -- client8

        (157, 'CAMERON', 'DIAZ', '1947-12-17', 'Female', 'White', '947398961',
        '774-334-4556', 'English, Spanish', 'camerondiaz@yahoo.com', 'Worcester, MA 01522', 1, 165), -- client9
        (158, 'ANNE', 'HATHAWAY', '1946-01-18', 'Female', 'Hispanic', '292980551',
        '413-443-5567', 'English', 'annehathaway@hotmail.com', 'Westfield, MA', 1, 165),             -- client10
        (159, 'ANGELINA', 'JOLIE', '1943-03-20', 'Female', 'Asian', '164421697',
        '857-661-7789', 'Vietnamese', 'angelinajolie@gmail.com', 'Cambridge, MA', 1, 165),           -- client11
        (160, 'STEVE', 'JOBS', '1933-07-23', 'Male', 'White', '032504291',
        '413-367-3288', 'English', 'stevejobs@gmail.com', 'Newport, MA', 1, 165);                    -- client12, deceased

        --select * from tblPeople



    -- 3. The CLIENTS Table
        -- Schema:
        -- CLIENTS (ClientID, MedRecNum, CareHourLimit, Deceased)
        -- FK ClientID references PEOPLE
        -- Not null MedRecNum

        -- Create the CLIENTS table
        CREATE TABLE  tblClients
        ( ClientID      int          PRIMARY KEY  REFERENCES tblPEOPLE,
          MedRecNum     varchar(30)  NOT NULL                         ,
          CareHourLimit int                                           ,
          Deceased      varchar(128) DEFAULT 'No'
        );


        -- Insert data into the CLIENTS table
        -- schema: CLIENTS (PeopleID, MedRecNum, CareHourLimit, Deceased)
        INSERT INTO tblClients VALUES
        (149, '12345678', 10, 'No'),
        (150, '23456789', 14, 'No'),
        (151, '13579223', 14, 'No'),
        (152, '35678493', 14, 'No'),
        (153, '46392981', 12, 'No'),
        (154, '98723521', 12, 'No'),
        (155, '52124145', 12, 'No'),
        (156, '35285234', 13, 'No'),
        (157, '09123786', 13, 'No'),
        (158, '12359846', 13, 'No'),
        (159, '90786781', 14, 'No'),
        (160, '11243553', 12, 'Yes');



    -- 4. The COORDINATORS Table
        -- Schema:
        -- COORDINATORS (CoordinatorID, EmploymentType)
        -- FK CoordinatorID references PEOPLE

        -- Create the COORDINATORS table
        CREATE TABLE      tblCoordinators
        ( CoordinatorID   int    PRIMARY KEY  REFERENCES tblPeople,
          EmploymentType  varchar(30)
        );

        -- Insert data into the COORDINATORS table
        INSERT INTO tblCoordinators VALUES
        (170, 'Full-time');

        --select * from tblCoordinators



    -- 5. The CAREGIVERS Table
        -- Schema:
        -- CAREGIVERS (CaregiverID, DateRecruited, HrPayRate, CoordinatorID)
        -- FK CaregiverID references PEOPLE
        -- FK CoordinatorID references COORDINATORS
        -- Not null CoordinatorID

        -- Create the CAREGIVERS table
        CREATE TABLE     tblCaregivers
        ( CaregiverID    int   PRIMARY KEY  REFERENCES tblPeople       ,
          DateRecruited  date                                          ,
          HrPayRate      int                                           ,
          CoordinatorID  int   NOT NULL     REFERENCES tblCoordinators
        );

        -- Insert data into the CAREGIVERS table
        INSERT INTO tblCaregivers VALUES
        (197, '2019-05-05', 15, 170),
        (198, '2015-02-23', 20, 170),
        (199, '2016-03-20', 19, 170),
        (200, '2017-04-19', 18, 170);

        --select * from tblCaregivers



    -- 6. The CARESERVICES Table
        -- Schema:
        -- CARESERVICES (PK:CareServiceID identity(10000, 1), AK(ClientID, CaregiverID, DateOfService), NumOfHours, HrBillRate, ClientReview)
        --  FK ClientID references CLIENTS
        -- FK CaregiverID references CAREGIVERS
        --  Unique (ClientID, CaregiverID, DateOfService)
        -- Not Null ClientID, CaregiverID, DateOfService

        -- Create the CARESERVICES table
        CREATE TABLE  tblCareServices
        ( CareServiceID  int    IDENTITY (1000, 1)   PRIMARY KEY                                                ,
          ClientID       int    NOT NULL             REFERENCES   tblClients (ClientID)       ON DELETE CASCADE ,
          CaregiverID	 int    NOT NULL             REFERENCES   tblCaregivers (CaregiverID)                   ,
          DateOfService  date   NOT NULL                                                                        ,
                         UNIQUE	 (ClientID, CaregiverID, DateOfService)                                         ,
          NumOfHours	 int                                                                                    ,
          HrBillRate	 int                                                                                    ,
          ClientReview   varchar(2000)
        );

        -- Insert data into the CARESERVICES table
        INSERT INTO tblCareServices VALUES
        (149, 197, '2020-07-19', 08, 25, 'My caregiver is nice and helpful.')                                                   ,
        (150, 197, '2019-05-05', 09, 23, 'I wish my caregiver can speak better Chinese.')                                       ,
        (151, 197, '2020-01-02', 10, 21, 'My caregiver was late a couple of times.')                                            ,
        (152, 198, '2015-02-23', 11, 17, 'My caregiver did a great job.')                                                       ,
        (153, 198, '2015-12-01', 12, 25, 'My caregiver is a good communicator. She cheered up my day by chitchating with me.')  ,
        (154, 198, '2016-04-07', 13, 23, 'My caregiver reminded me to take pills regularly, which I appreciated.')              ,
        (155, 199, '2020-05-19', 14, 15, 'I just did not like my caregiver. He drove my car like a maniac.')                    ,
        (156, 199, '2016-03-20', 08, 13, 'I think my caregiver sneaked my painkiller pills away. What should I do?')            ,
        (157, 199, '2021-03-21', 09, 20, 'I want my caregiver to wash her hands longer due to Covid.')                          ,
        (158, 200, '2017-04-19', 10, 20, 'Great caregiver. Wish to have my caregiver''s help longer next month.')               ,
        (159, 200, '2018-06-20', 11, 20, 'I don''t understand my caregiver''s Vietnamese.')           ,
        (160, 200, '2015-07-05', 12, 20, 'Cultural difference/ language barrier. My caregiver did not get my jokes.')    ,
        (160, 198, '2016-07-05', 12, 25, 'Thorough work. Responsible. No complaints. ')            ,
        (160, 198, '2016-10-05', 14, 26, 'My caregiver spent too much time on his phone. He loves Tweets more than his job.')  ,
        (160, 200, '2016-12-05', 14, 20, 'My caregiver has improved her performance. She reminded me to take pills on time. I''m thankful for that.'),
        (155, 198, '2021-01-02', 15, 22, 'He has good sense of humor and is fun to chat with.')          ,
        (156, 197, '2021-01-15', 10, 25, 'He rearranged my furniture to clear out my pathway very fast and clean.')     ,
        (157, 197, '2021-04-29', 10, 20, 'Note from client''family member: He fed my father very carefully. Thanks.')    ,
        (159, 198, '2021-03-12', 11, 20, 'He is a bit too talkative, but finished his job in time and good quality.')    ;

       --select * from tblCareServices



    -- 7. The TRANSPORTMODES Table
        -- Schema: TRANSPORTMODES (PK: TransportModeID identity (2000, 1), TransportMode not null)

        -- Create the TRANSPORTMODES table
        CREATE TABLE tblTransportModes
          ( TransportModeID  int   IDENTITY (2000, 1) PRIMARY KEY ,
            TransportMode  varchar(30) NOT NULL
          );

        -- Insert data into the TRANSPORTMODES table
        INSERT INTO tblTransportModes VALUES
          ('car')         ,
          ('bus')         ,
          ('ferry')       ,
          ('train')       ,
          ('bike')        ,
          ('bike + train'),
          ('bike + bus')  ,
          ('car + train') ,
          ('bus + train') ;

        --select * from tblTransportModes



    -- 8. The CAREGIVER_TRANSPORTS Table
       -- Schema:
       -- CAREGIVER_TRANSPORTS (PK: CaregiverTransportID identity (3000, 1), AK: (CaregiverID, TransportMode))
       -- FK CaregiverID references CAREGIVERS
       -- FK TransportMode references TRANSPORTMODES
       -- Unique(CaregiverID, TransportMode)
       -- Not null CaregiverID, TransportMode

       -- Create the CAREGIVER_TRANSPORTS table
       CREATE TABLE          tblCaregiverTransports
       (CaregiverTransportID int   IDENTITY    (3000, 1)   PRIMARY KEY        ,
        CaregiverID          int   NOT NULL    REFERENCES  tblCaregivers      ,
        TransportMode        int   NOT NULL    REFERENCES  tblTransportModes  ,
                             UNIQUE  (CaregiverID, TransportMode)
       );

       -- Insert data into the CAREGIVER_TRANSPORTS table
        INSERT INTO tblCaregiverTransports VALUES
        (197, 2001),
        (198, 2002),
        (199, 2003),
        (200, 2004);

       --select * from tblCaregiverTransports



    -- 9. The CASEMANAGERS Table
       -- Schema:
       -- CASEMANAGERS (CaseManagerID, YearsOfExperience)
       -- FK CaseManagerID references PEOPLE

       -- Create the CASEMANAGERS table
       CREATE TABLE       tblCaseManagers
       (CaseManagerID     int             PRIMARY KEY  REFERENCES   tblPEOPLE,
        YearsOfExperience int
       );

       -- Insert data into the CASEMANAGERS table
       INSERT INTO tblCaseManagers VALUES
       (165, 5);

       --select * from tblCaseManagers



    -- 10. The CASEREPORTS Table
       -- Schema:
       -- CASEREPORTS (PK: CaseReportID identity(4000, 1), AK: (ClientID, CaseManagerID, Time, Date), CaseReports)
       -- FK ClientID references CLIENTS ON DELETE CASCADE
       -- FK CaseManagerID references CASEMANAGERS
       --  UNIQUE (ClientID, CaseManagerID)
       --  NOT NULL ClientID, CaseManagerID

       -- Create the CASEREPORTS table
       CREATE TABLE       tblCaseReports
          ( CaseReportID  int      IDENTITY   (4000, 1)      PRIMARY KEY                       ,
            ClientID      int      NOT NULL   REFERENCES     tblClients      ON DELETE CASCADE ,
            CaseManagerID int      NOT  NULL  REFERENCES     tblCaseManagers                   ,
                          UNIQUE   (ClientID, CaseManagerID, [Time], [Date])                   ,
                          [Time]   time(0)    NOT NULL                                         ,
                          [Date]   date       NOT NULL                                         ,
            CaseReports   varchar(2000)
          );

       -- Insert data into the CASEREPORTS table
       INSERT INTO tblCaseReports VALUES
       (149, 165, '10:00:00', '2021-01-05', 'Things go on schedule.'),
       (150, 165, '08:30:00', '2021-02-05', 'Client has no complaint about his caregiver''s service.'           ),
       (151, 165, '12:15:00', '2021-03-05', 'CM reminds client to continue COVID19 precautions: keep 6 feet apart from other people.'   ),
       (152, 165, '14:00:00', '2021-04-05', 'CM reminds client to wear mask, wash hand frequently with soap and water for at least 20 secs.'),
       (153, 165, '16:00:00', '2020-01-05', 'CM reminds client of home safety, taking medications as prescribed.'        ),
       (154, 165, '13:00:00', '2020-01-05', 'CM will help contact client''PCP for depress refills.'           ),
       (155, 165, '14:30:00', '2020-01-05', 'Client needs help requesting refills for antibiotics.'           ),
       (156, 165, '10:00:00', '2020-01-05', 'Client is happy that she got vaccinated for Covid19.'            ),
       (157, 165, '11:00:00', '2020-01-05', 'Client reported that he fell and went to emergency last week.'         ),
       (158, 165, '11:30:00', '2019-01-05', 'Client had no fever, cough, chest pain, or difficulty of breath.'         ),
       (159, 165, '09:00:00', '2019-01-05', 'Client had fever and very tired. CM needs to arrange for her to have nurse check on him.'   ),
       (160, 165, '09:45:00', '2015-08-05', 'Client looked really weak. CM will arrange hospice service for him'        );

       --select * from tblCaseReports



    -- 11. The HRTASKS Table
       -- Schema:
       -- HRTASKS (HRTaskID, TaskDescription)
       -- Not null TaskDescription

       -- Create the HRTASKS table
       CREATE TABLE       tblHrTasks
       ( HRTaskID         int           PRIMARY KEY ,
         TaskDescription  varchar(1000) NOT NULL
       );

        -- Insert data into the HRTASKS table
       INSERT INTO tblHrTasks VALUES
       (1, 'Train caregivers')                 ,
       (2, 'Recruite caregivers')              ,
       (3, 'Arrange schedule for caregivers')  ,
       (4, 'Collect caregiver''s timesheet')   ,
       (5, 'Evaluate caregiver''s performance');

       --select * from tblHrTasks;



    -- 12. The COORD_HRTASKS Table
       -- Schema:
       -- COORD_HRTASKS (PK: Coord_HRTask_ID identity (5000, 1), AK: (CoordinatorID, HRTaskID))
       -- FK CoordinatorID references COORDINATORS
       -- FK HRTaskID references HRTASKS
       --  Unique (CoordinatorID, HRTaskID)
       --  NOT NULL CoordinatorID, HRTaskID

      -- Create the COORD_HRTASKS table
      CREATE TABLE      tblCoord_HRTasks
      ( Coord_HRTask_ID int   IDENTITY     (5000, 1)   PRIMARY KEY         ,
        CoordinatorID   int   NOT NULL     REFERENCES  tblCoordinators ,
        HRTaskID        int   NOT NULL     REFERENCES  tblHrTasks      ,
        UNIQUE          (CoordinatorID, HRTaskID)
      );

      -- Insert data into the COORD_HRTASKS table
      INSERT INTO tblCoord_HRTasks VALUES
      (170, 1),
      (170, 2),
      (170, 3),
      (170, 4),
      (170, 5);

      --select * from tblCoord_HRTasks



    -- 13. The NURSES Table
       -- Schema:
       -- NURSES (NurseID, NurseType, NursePayRate)
       -- FK NurseID references PEOPLE
       -- Not Null NursePayRate, NurseType

       -- Create the NURSES table
       CREATE TABLE   tblNurses
       ( NurseID      int         PRIMARY KEY     REFERENCES    tblPEOPLE,
         NurseType    varchar(30) NOT NULL                               ,
         NursePayRate int         NOT NULL
       );

        -- Insert data into the NURSES table
        INSERT INTO tblNurses VALUES
        (180, 'Registered Nurse', 120000);

        --select * from tblNurses



    -- 14. The ACCIDENTREPORTS Table
        -- Schema:
        -- ACCIDENTREPORTS (PK: AccidentReportID identity (6000,1), AK: (NurseID, ClientID, AccidentDate, AccidentTime), AccidentLocation, AccidentDescription)
        -- FK NurseID references NURSES
        -- FK ClientID references CLIENTS
        --  UNIQUE (NurseID, ClientID, AccidentDate, AccidentTime)
        --  NOT NULL NurseID, ClientID, AccidentDate, AccidentTime)

        -- Create the ACCIDENTREPORTS table
        CREATE TABLE          tblAccidentReports
        ( AccidentReportID    int       IDENTITY(6000, 1)  PRIMARY KEY                                 ,
          NurseID             int       NOT NULL           REFERENCES     tblNurses                    ,
          ClientID            int       NOT NULL           REFERENCES     tblClients  ON DELETE CASCADE,
                              UNIQUE    (NurseID, ClientID, AccidentDate, AccidentTime)                ,
          AccidentDate        date      NOT NULL                                                       ,
          AccidentTime        time(0)   NOT NULL                                                       ,
          AccidentLocation    varchar(300)                                                             ,
          AccidentDescription varchar(1000)
        );

        -- Insert data into the ACCIDENTREPORTS table
        INSERT INTO tblAccidentReports VALUES
        (180, 149, '2021-01-30', '21:30:00', 'Home', 'break his leg'                                   ),
        (180, 160, '2016-12-23', '20:34:00', 'Bathroom', 'dropped death'                               ),
        (180, 149, '2021-02-15', '16:13:00', 'Dining Table', 'chocked up on food and could not breath' );

        --select * from tblAccidentReports



    -- 15. The NURSEVISITREPORTS Table
        -- Schema:
        -- NURSEVISITREPORTS (PK: NurseReportIDNurseID identity(7000, 1) PRIMARY KEY, AK: (NurseID, ClientID, Date, Time), Date, Time, VisitNotes)
        -- FK NurseID references NURSES
        -- FK ClientID references CLIENTS ON DELETE CASCADE
        --  UNIQUE (NurseID, ClientID, Date, Time)
        --  NOT NULL NurseID, ClientID, Date, Time

        -- Create the NURSEVISITREPORTS table
        CREATE TABLE    tblNurseVisitReports
        ( NurseReportID int       IDENTITY(7000, 1)   PRIMARY KEY                            ,
          NurseID       int       NOT NULL            REFERENCES tblNurses                   ,
          ClientID      int       NOT NULL            REFERENCES tblClients ON DELETE CASCADE,
          [Date]        date      NOT NULL                                                   ,
          [Time]        time(0)   NOT NULL                                                   ,
          VisitNotes    varchar(1000)                                                        ,
          UNIQUE        (NurseID, ClientID, [Date], [Time])                                  ,
        );

        -- Insert data into the NURSEVISITREPORTS table
        INSERT INTO tblNurseVisitReports VALUES
        (180, 149, '2021-01-31', '09:30:00', 'The patient went to emergency last night. Still have to stay put in bed.'),
        (180, 150, '2021-02-15', '13:30:00', 'The patient does not sleep well at night. Lose appetite.'),
        (180, 151, '2021-03-15', '13:15:00', 'High blood pressure. Need to increase dose.'),
        (180, 152, '2021-04-15', '15:00:00', 'Diabetes. No feeling in toes.'),
        (180, 153, '2020-01-15', '17:00:00', 'Swollen feet. Need to hang feet higher when sleeping.'),
        (180, 154, '2020-02-05', '14:00:00', 'The patient has symptoms of being depressed.'),
        (180, 155, '2020-02-15', '15:30:00', 'The patient has UTI.'),
        (180, 156, '2020-02-25', '11:00:00', 'The patient''s health has improved since the patient''s last surgery.'),
        (180, 157, '2020-01-15', '12:00:00', 'The patient can''t walk yet. His balance is off and will need physical therapist.'),
        (180, 158, '2019-04-25', '12:30:00', 'The patient''s health is good overall.'),
        (180, 159, '2019-06-05', '10:00:00', 'The patient had infection from his previous cuts.'),
        (180, 160, '2015-07-06', '10:45:00', 'The patient could not breath well. Oxygen level is low.');


        Select * From tblDepartments;
        Select * From tblPeople;
        Select * From tblClients;
        Select * From tblCoordinators;
        Select * From tblCaregivers;
        Select * From tblCareServices;
        Select * From tblTransportModes;
        Select * From tblCaregiverTransports;
        Select * From tblCaseManagers;
        Select * From tblCaseReports;
        Select * From tblHrTasks;
        Select * From tblCoord_HRTasks;
        Select * From tblNurses;
        Select * From tblAccidentReports;
        Select * From tblNurseVisitReports;


        --> update to capitalize FirstName and LastName in tblPeople
        --> (because some FirstName and LastName are originally in lowercase, some in uppercase)
        UPDATE tblPeople
        SET  FirstName = UPPER (FirstName);

        UPDATE tblPeople
        SET  LastName = UPPER (LastName);

        select * from tblPeople


        --> Add new attribute 'YearRecruited' into tblNurses to help with calculating total costs later
        ALTER TABLE tblNurses
        ADD    YearRecruited  varchar(4);


        --> Add values for 'YearRecruited' attribute in tblNurses
        UPDATE tblNurses
        SET    YearRecruited = '2020'
        WHERE  NurseID = 180;


        --> Change data type for attribute PayRate in the tblNurses from INTEGER to FLOAT with 2 decimal places
        ALTER TABLE tblNurses
        ALTER COLUMN NursePayRate FLOAT(2);

        select * from tblNurses;

 GO

/**********************************************************************************************************************/
/*                                      END OF BLOCK TO CREATE THE SILVER TOP DATABASE                                */
/**********************************************************************************************************************/



/**********************************************************************************************************************/
/*                                            TEN BUSINESS DATA RETRIEVAL QUERIES                                     */
/**********************************************************************************************************************/


----------------------------------------------------------------------------------
-- 1st Business Needs: REDUCE FALLING RISK AND IMPROVE CLIENTS' SAFETY AT HOME --
--     (addressed by Business Questions 1 - 3)         --
----------------------------------------------------------------------------------



-- 1. BUSINESS QUESTION 1 (Ref BR1)
--> How many accidents happened so far for each client?
--> SHOW: AccidentReportID, ClientID, NurseID, AccidentDate, AccidentTime, AccidentDescription, Count of Accidents per client
--   Label the count of accidents as Count Of Accidents
--   Display results in descending order by count of accidents per client, then in descending order by AccidentDate.

      SELECT AccidentReportID, ar.ClientID, NurseID, AccidentDate, AccidentTime, AccidentDescription, [Count of Accidents]
      FROM   tblAccidentReports ar
      JOIN   ( SELECT    ClientID,    COUNT  (AccidentReportID) [Count of Accidents]
               FROM      tblAccidentReports
               GROUP BY  ClientID
             ) accident_count         ON     accident_count.ClientID  = ar.ClientID
      ORDER BY [Count of Accidents]   DESC,  AccidentDate       DESC;



-- 2. BUSINESS QUESTION 2: (Ref BR1) Queries about deceased clients

  --> The supervisor heard about some client's passing and his name sounds like 'Job'? What's the clientID and full name of this client?
     --> What kind of accident happened to this client? When and where did it happen?
  --> SHOW: ClientID, FirstName, LastName, AccidentDescription, AccidentDate, AccidentTime, AccidentLocation

  --> Did he have any complaints about his caregivers? What exactly did he complain about?
  --> SHOW: ClientID, FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate

  --> Provide information about all the deceased clients so far.
  --> SHOW: ClientID, FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate


  GO

  CREATE VIEW vw_deceased_client AS -- creating view for all the information about this deceased client, privacy purposes

      SELECT ar.ClientID, FirstName, LastName, AccidentDescription, AccidentDate, AccidentTime, AccidentLocation
      FROM   tblAccidentReports ar
      JOIN   tblPeople p ON     ar.ClientID = p.PeopleID
      WHERE  FirstName   LIKE   '%job%'
      OR     LastName    LIKE   '%job%';

  GO

  SELECT * FROM vw_deceased_client -- This is the information we found about this specific client


  -- Search into his reviews about the caregivers who worked for him:
  SELECT cs.ClientID, FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate
  FROM   tblCareServices  cs
  JOIN   tblPeople p  ON  cs.ClientID      =    p.PeopleID
  WHERE  cs.ClientID  =   (SELECT ClientID FROM vw_deceased_client);


 --> Provide information about all the deceased clients so far.
 --> SHOW: ClientID, FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate

 --  We can use Correlated Subquery, but will replace it with a JOIN to a temporary table because correlated subquery is suboptimal.
  SELECT  DISTINCT cs.ClientID, p.FirstName, p.LastName, Deceased, [Loss Of Revenue for Silver Top]
  FROM    tblCareServices       cs
  JOIN    tblPeople             p           ON cs.ClientID = p.PeopleID
  JOIN    ( SELECT   ClientID,  Deceased
            FROM     tblClients c
            JOIN     tblPeople  p           ON c.ClientID = p.PeopleID
            WHERE    Deceased   = 'yes')    deceased_clients
            ON       deceased_clients.ClientID = cs.ClientID
  JOIN    ( SELECT   ClientID,  SUM (NumOfHours * HrBillRate) [Loss Of Revenue for Silver Top]
            FROM     tblCareServices cs
            GROUP BY ClientID)  lor         ON cs.ClientID = lor.ClientID
            ORDER BY LastName   ASC;



-- 3. BUSINESS QUESTION 3 (Ref BR2)
 --> Are there any caregivers who take care of more than five clients in 2021?
 --> SHOW: CaregiverID, Number of Clients each Caregiver provides care service. Each row in the results should be unique.

  SELECT  DISTINCT  cs.CaregiverID,   ClientNoPerCaregiver
  FROM    tblCareServices cs
  JOIN    ( SELECT   CaregiverID,     COUNT (ClientID) ClientNoPerCaregiver
            FROM     tblCareServices
            GROUP BY CaregiverID
            HAVING  COUNT (ClientID)  >= 5
          ) client_count
          ON client_count.CaregiverID = cs.CaregiverID
  WHERE   YEAR(DateOfService) = 2021
  ORDER BY ClientNoPerCaregiver;




-------------------------------------------------------------------------------------------
-- 2nd Business Needs: RECRUIT CAREGIVERS EFFECTIVELY AND INCREASE THE NUMBER OF CLIENTS --
--       (addressed by Business Questions 4 - 6)       --
-------------------------------------------------------------------------------------------


-- 4. BUSINESS QUESTION 4 (Ref BR3)
  --> We have a new client named Cameron Diaz. The coordinator wants to find out her ClientID and zip code, whether
  --  we have any caregivers in this client's zip code, and whether the caregiver have a car to drive to the client’s home. This
  --  would help the coordinator to decide whether she needs to recruit a new caregiver for this new client, and how to coordinate the
  --  work schedule for caregivers to come and provide care for this client.

  SELECT PeopleID, HomeAddress
  FROM   tblPeople
  WHERE  FirstName = 'Cameron'
  AND    LastName  = 'Diaz';
  -->    From this we found out that her zip code is 01522

  SELECT c.CaregiverID,   FirstName, LastName, HomeAddress, tm.TransportMode
  FROM   tblCaregivers    c
  JOIN   tblPeople        p        ON c.CaregiverID      = p.PeopleID
  JOIN   tblCaregiverTransports ct ON ct.CaregiverID     = c.CaregiverID
  JOIN   tblTransportModes      tm ON tm.TransportModeID = ct.TransportMode
  WHERE  HomeAddress      LIKE  '% 01522';
  -->    Luckily, we found two caregivers who live in zip code 01522. CaregiverID 197 and CaregiverID 200.
  -->    These two caregivers depend on bus and bike to go to work. Not the best. But it should work, though.



-- 5. BUSINESS QUESTION 5 (Ref BR3)
  --> What languages can clients speak but the caregivers can't?
  --  (It means that we need to hire new caregivers who can speak these languages.)

  --  First we need to update the Language for some people to make it consistent before joining tables
  UPDATE  tblPeople
  SET     [Language] = 'English, Spanish'
  WHERE   [Language] = 'Spanish, a little English';


  SELECT  *
  FROM  ( SELECT DISTINCT    p.[Language] AS client_language
          FROM   tblPeople   p
          JOIN   tblClients  c  ON p.PeopleID = c.ClientID
        ) AS     client_lang

  FULL JOIN (  SELECT DISTINCT [Language]     AS caregiver_language
               FROM   tblPeople p
               JOIN   tblCaregivers cg        ON p.PeopleID = cg.CaregiverID
            )  AS     caregiver_lang
          ON   caregiver_lang.[caregiver_language] = client_lang.[client_language]

  WHERE  caregiver_language IS NULL ;



-- 6. BUSINESS QUESTION 6 (Ref BR3)
    --> How many caregivers did each coordinator recruit, give training, evaluate or collect timesheets?
 --> SHOW: CoordinatorID, TaskDescription, CaregiverID

  SELECT cd_hr.CoordinatorID, TaskDescription, CaregiverID
  FROM   tblCoord_HRTasks cd_hr
  JOIN   tblHrTasks       hr_t  ON hr_t.HRTaskID = cd_hr.HRTaskID
  JOIN   tblCaregivers    c     ON cd_hr.CoordinatorID = c.CoordinatorID;


 --> Who are the top three coordinators who deal with the most caregivers?
  SELECT   TOP 3 CoordinatorID,  COUNT (CaregiverID) AS [CaregiverNumberPerCoordinator]
  FROM     tblCaregivers
  GROUP BY CoordinatorID
  ORDER BY CaregiverNumberPerCoordinator DESC;



-----------------------------------------------------------------------------------------------
-- 3nd Business Needs: IMPROVE FINANCIAL REPORT SYSTEM (MORE EFFICIENT, TRANSPARENT FINANCE) --
--     (addressed by Business Questions 7 - 10)         --
-----------------------------------------------------------------------------------------------


-- 7. BUSINESS QUESTION 7 (Ref BR4)
 --> How much money does Silver Top get from the insurance companies for each Client in total, based on the hourly bill rate
 --  and number of hours for each client?

 --> SHOW: ClientID, Sum of HrBillRate * NumOfHours grouped by ClientID (alias: TotalBillPerClient)

  SELECT   ClientID, SUM (HrBillRate * NumOfHours) OVER(PARTITION BY ClientID) AS TotalBillPerClient
  FROM     tblCareServices
  ORDER BY ClientID;



-- 8. BUSINESS QUESTION 8 (Ref BR5)
 --> How much does each caregiver earn per hour and compare their rates with average pay rate, minimum rate, and maximum rate?
 --  What percentage caregivers earn more than the average pay rate, using two decimal places

 --> SHOW: CaregiverID, FirstName, LastName, HrPayRate, average HrPayRate, percentage of the difference, Min HrPayRate, Max HrPayRate
 --    Show only for those caregivers that have their hourly payrate greater than the average rate for all caregivers

 --  Before doing the calculation, we need to update the HrPayRate data type in the tblCaregivers table from INTEGER into FLOAT
 --  with two decimal values.
  ALTER TABLE  tblCaregivers
  ALTER COLUMN HrPayRate  FLOAT(2);  -- (2) means it will show two decimal places


  SELECT   c.CaregiverID, FirstName, LastName, HrPayRate    ,
     ROUND ((SELECT AVG (HrPayRate) FROM tblCaregivers), 2) AS AverageHrPayRate       , -- round the AverageHrPayRate to 2 decimal places
     ROUND (((HrPayRate - (SELECT AVG (HrPayRate) FROM tblCaregivers)) / (SELECT AVG (HrPayRate)
                                                                               FROM tblCaregivers)    * 100
            ), 2
           ) AS PercentHigherThanAvg      , -- round the PercentHigherThanAvg to 2 decimal places
     (SELECT MIN (HrPayRate) FROM tblCaregivers) MinHrPayRate ,
     (SELECT MAX (HrPayRate) FROM tblCaregivers) MaxHrPayRate
  FROM     tblCaregivers c
  JOIN     tblPeople     p   ON c.CaregiverID = p.PeopleID
  WHERE    HrPayRate     >   (SELECT AVG (HrPayRate) FROM tblCaregivers)
  ORDER BY HrPayRate;



-- 9. BUSINESS QUESTION 9 (Ref BR5)
 --> Are there any cases the rates we pay for caregivers are higher than the rates we bill the insurance companies for their corresponding
 --  clients? Warning if that happens.
 --> SHOW: CareServiceID, DateOfService, 'We''re paying for caregiver more than what we bill our client's insurance company!' Warning for any case like that

  SELECT CareServiceID, DateOfService, 'We''re paying for caregiver more than what we bill our client''s insurance company!' Warning
  FROM   tblCaregivers c
  JOIN   tblCareServices cs ON c.CaregiverID = cs.CaregiverID
  WHERE EXISTS (SELECT *
                FROM   tblCaregivers c
                JOIN   tblCareServices cs ON c.CaregiverID = cs.CaregiverID
                WHERE  HrBillRate < HrPayRate
               );



-- 10. BUSINESS QUESTION 10 (Ref BR5)
 --> This question is for the company's financial report on their money outflows. What is the average sum of hourly pay rate for caregivers
 --  and for nurses for each Date Of Service in the most recent year, if a client meets with caregiver as frequently as they meet nurses?
 --  Smooth it out by calculating 7 rows and 30 rows rolling average of this combined hourly pay rate.

 --  Create view to calculate the total number of clients Silver Top provides care service in the most recent year. Creating this view
 --  vw_count_clients will help hide complexity (We don't have to write the same query over and over again everytime the number of clients
 --  changes, which can easily introduces bugs)

  GO

  CREATE VIEW vw_count_clients AS
  SELECT COUNT(ClientID)       AS [Total Clients In 2021]
  FROM   tblCareServices
  WHERE  YEAR(DateOfService)   =  (SELECT MAX(YEAR(DateOfService)) FROM tblCareServices);

  GO

  select * from vw_count_clients


 --  NursePayRate in the data is for annual rate. In order to get an hourly rate for nurses, we need to divide the annual rate
 --  for 12 months, 4.3 weeks/month, 40 hours/week, and total number of clients (from the view vw_count_clients).

  SELECT  DateOfService, HrPayRate +  NursePayRate/12/4.3/40/(SELECT * FROM vw_count_clients) AS CaregiverNursePayRate,
          AVG  (HrPayRate       +   NursePayRate/12/4.3/40/(SELECT   * FROM vw_count_clients))
          OVER(ORDER BY DateOfService ASC ROWS 6 PRECEDING)                                     '7-row Average',
          AVG  (HrPayRate       +   NursePayRate/12/4.3/40/(SELECT   * FROM vw_count_clients))
          OVER(ORDER BY DateOfService ASC ROWS BETWEEN CURRENT ROW AND 29 FOLLOWING)            '30-row Average'
  FROM    tblCaregivers         c
  JOIN    tblCareServices       cs  ON c.CaregiverID = cs.CaregiverID
  JOIN    tblNurseVisitReports  nvr ON nvr.ClientID  = cs.ClientID
  JOIN    tblNurses             n   ON n.NurseID     = nvr.NurseID
  WHERE YEAR(DateOfService)     =   (SELECT MAX(YEAR(DateOfService)) FROM tblCareServices);



----------------------------------------------------------------------------------
--  TURN ON THE TIMER THAT SHOWS THE DURATION OF PROCESSES     --
----------------------------------------------------------------------------------

  SET STATISTICS TIME ON -- This prepares the Studio to show the time difference between queries over unindexed and indexed fields.
  GO


 -- business question 2 had elapsed time = 12 ms before using indexes. It reduced to 0 ms after using indexes.
 -- Note: every time we ran this query again, the value of elapsed time changed, and the elapsed time always reduces after using indexes

  SELECT  DISTINCT cs.ClientID, p.FirstName, p.LastName, Deceased, [Loss Of Revenue for Silver Top]
  FROM    tblCareServices       cs
  JOIN    tblPeople             p    ON   cs.ClientID = p.PeopleID
  JOIN    ( SELECT  ClientID,   Deceased
            FROM    tblClients  c
            JOIN    tblPeople   p    ON   c.ClientID  = p.PeopleID
            WHERE   Deceased    = 'yes')  deceased_clients
          ON        deceased_clients.ClientID         = cs.ClientID
  JOIN    ( SELECT  ClientID,        SUM  (NumOfHours * HrBillRate) [Loss Of Revenue for Silver Top]
            FROM    tblCareServices  cs
            GROUP BY ClientID)  lor
          ON        cs.ClientID =    lor.ClientID
  ORDER BY LastName ASC;



 -- business question 4 has elapsed time = 3 ms before using indexes. It reduced to 0 ms after using indexes.
 -- (every time we ran this query again, the elapsed time changed, and it always reduces after using indexes)

  SELECT c.CaregiverID,  FirstName, LastName, HomeAddress, tm.TransportMode
  FROM   tblCaregivers          c
  JOIN   tblPeople              p     ON c.CaregiverID      = p.PeopleID
  JOIN   tblCaregiverTransports ct    ON ct.CaregiverID     = c.CaregiverID
  JOIN   tblTransportModes      tm    ON tm.TransportModeID = ct.TransportMode
  WHERE  HomeAddress            LIKE  '% 01522';



 -- business question 5 has elapsed time = 6 ms before using indexes. It reduced to 0 ms after using indexes.
 -- (every time we ran this query again, the elapsed time changed, and it always reduces after using indexes)

  SELECT  *
  FROM  (  SELECT DISTINCT   p.[Language]   AS client_language
           FROM  tblPeople   p
           JOIN  tblClients  c              ON p.PeopleID = c.ClientID
        )  AS    client_lang

  FULL JOIN (  SELECT DISTINCT [Language]   AS caregiver_language
               FROM  tblPeople p
               JOIN  tblCaregivers cg       ON p.PeopleID = cg.CaregiverID
            )  AS    caregiver_lang
            ON caregiver_lang.[caregiver_language] = client_lang.[client_language]

  WHERE  caregiver_language IS NULL ;



-- Create three indexes to improve the performance of the queries in Business Questions 2, 4, and 5
-- Indexing tblPeople over non-key attributes: FirstName, LastName, and Language

-------------------------------------------------------------------------------------------------
--  CREATE INDEX    Index Name                  ON  Table Name      (Attribute Name)  --
-------------------------------------------------------------------------------------------------

  CREATE INDEX ndx_TblPeople_FirstName  ON  tblPeople  (FirstName)  ;
  CREATE INDEX ndx_TblPeople_LastName   ON  tblPeople  (LastName)   ;
  CREATE INDEX ndx_TblPeople_Language   ON  tblPeople  ([Language]) ;

  GO

 -- Foreign keys are not automatically indexed
 -- Non-key fields are not automatically indexed
 -- Speed up joins and searching for FirstName, LastName, and Language in Question 2, 4, 5 by indexing tblPeople over those non-key attributes