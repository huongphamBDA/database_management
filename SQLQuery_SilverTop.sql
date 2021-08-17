/*********************************************/
/*  ENTERPRISE DATABASE MANAGEMENT PROJECT   */
/*	SILVER TOP GROUP ADULT FOSTER CARE       */
/*  --SQL QUERY--                            */
/*********************************************/


/********************************************************************/
/*  SELECT AND EXECUTE THIS BLOCK TO CREATE THE SILVERTOP DATABASE  */
/********************************************************************/

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
        CREATE TABLE	tblDepartments
        (	DeptID		Int				PRIMARY KEY	,
            DeptName	Varchar(128)				,
            DeptHead	Varchar(128)
        );

        -- Insert data into the DEPARTMENTS table
        INSERT INTO tblDepartments VALUES
        (1, 'OutReach', 'Courteney Cox'),
        (2, 'Human Resources', 'Jennifer Aniston'),
        (3, 'Accounting & Finance', 'Lisa Kudrow'),
        (4, 'Operations Management', 'Matt Le Blanc'),
        (5, 'Health Management', 'Matthew Perry'),
        (6, 'Supervision', 'David Schwimmer');



    -- 2. The PEOPLE Table
        -- Schema:
            --	PEOPLE (PeopleID, FirstName, LastName, DOB, Gender, Ethnicity, SSN, Phone, Language, Email, HomeAddress, DeptID, SupervisorID)
            --	FK DeptID references DEPARTMENTS
            --	FK SupervisorID references PEOPLE
            --	Not null SSN, Language, HomeAddress

        -- Create the PEOPLE table
        CREATE TABLE		tblPeople
        (	PeopleID		Int				PRIMARY KEY						,
            FirstName		Varchar(128)									,
            LastName		Varchar(128)									,
            DOB				Date											,
            Gender			Varchar(30)										,
            Ethnicity		Varchar(30)										,
            SSN				Char(15)		NOT NULL						,
            Phone			Varchar(20)										,
            [Language]		Varchar(128)	NOT NULL						,
            Email			Varchar(128)									,
            HomeAddress		Varchar(128)	NOT NULL						,
            DeptID			Int				REFERENCES	  tblDepartments	,
            SupervisorID	Int				REFERENCES    tblPeople
        );

        -- Insert data into the PEOPLE table
        INSERT INTO tblPeople (PeopleID, FirstName, LastName, DOB, Gender, Ethnicity,
        SSN, Phone, [Language], Email, HomeAddress, DeptID, SupervisorID) VALUES

        (300, 'LINDA', 'MCMAHON', '1965-06-13', 'Female', 'Alaska Native', '134177450',
        '781-333-4444', 'English', 'lindamcmahon@hotmail.com', 'Saugus, MA', 6, NULL),					-- president
        (301, 'Courteney', 'Cox', '1950-06-01', 'Female', 'Asian', '111111111',
        '858-222-3333', 'English, Vietnamese', 'c.cox@gmail.com', 'San Diego, CA', 6, 300),				-- OutReach DeptHead
        (302, 'Jennifer', 'Aniston', '1951-07-01', 'Femle', 'White', '222222222',
        '858-333-4444', 'English', 'j.anniston@gmail.com', 'Santa Barbara, CA', 6, 300),				-- Human Resources DeptHead
        (303, 'Lisa', 'Kudrow', '1952-08-01', 'Female', 'White', '333333333',
        '619-444-5555', 'English, Spanish', 'l.kudrwo@gmail.com', 'Cambridge, MA', 6, 300),				-- Accounting & Finance DeptHead
        (304, 'Matt', 'Le Blanc', '1953-09-01', 'Male', 'Hispanic', '444444444',
        '619-555-6666', 'English, Spanish', 'm.leblanc@gmail.com', 'Milton, MA', 6, 300),				-- Operations Management DeptHead
        (305, 'Matthew', 'Perry', '1954-10-01', 'Male', 'White', '555555555',
        '619-666-7777', 'English, Chinese', 'm.perry@gmail.com', 'Boston, MA', 6, 300),					-- Health Management DeptHead
        (306, 'David', 'Schwimmer', '1955-11-01', 'Male', 'White', '666666666',
        '858-777-8888', 'English', 'd.schwimmer@gmail.com', 'Lynn, MA', 6, 300),						-- Supervision DeptHead

        (175, 'CHARLIZE', 'THERON', '1970-05-22', 'Female', 'Hispanic', '341968464',
        '857-889-1357', 'English, Spanish', 'charlizetheron@hotmail.com', 'Boston, MA', 6, 306),		-- supervisor1
        (180, 'MICHAEL', 'BLOOMBERG', '1968-03-15', 'Male', 'Pacific Islander', '488633266',
        '617-345-6789', 'English, Vietnamese', 'michaelbloomberg@gmail.com', 'Newton, MA', 5, 175),		-- nurse1
        (170, 'AMY', 'ISSA', '1975-09-14', 'Female', 'Hispanic', '605271466',
        '857-123-6789', 'English, Spanish', 'amyissa@hotmail.com', 'Milton, MA', 2, 175),				-- coordinator1
        (165, 'STEVEN', 'MNUCHIN', '1979-11-16', 'Male', 'Asian', '509596791',
        '774-223-3445', 'English, Vietnamese', 'stevenmnuchin@gmail.com', 'Worcester, MA', 4, 175),		-- casemanager1

        (197, 'MITT', 'ROMNEY', '1975-05-27', 'Male', 'Asian', '350157794',
        '339-987-6543', 'Vietnamese', 'mittromney@gmail.com', 'Woburn, MA', 4, 170),					-- caregiver1
        (198, 'DONALD', 'TRUMP', '1980-08-13', 'Male', 'Hispanic/Latino', '428593892',
        '781-888-9999', 'Spanish, a little English', 'donaldtrump@gmail.com', 'Saugus, MA', 4, 170),	-- caregiver2
        (199, 'SALLY', 'FIELD', '1985-02-19', 'Female', 'Native Hawaiian', '273769544',
        '857-552-6678', 'English', 'sallyfield@gmail.com', 'Cambridge, MA', 4, 170),					-- caregiver3
        (200, 'MEGHAN', 'MARKLE', '1990-04-21', 'Female', 'Asian', '199905850',
        '857-777-8890', 'Chinese', 'meghanmarkle@yahoo.com', 'Boston, MA', 4, 170),						-- caregiver4

        (149, 'BARACK', 'OBAMA', '1957-11-22', 'Male', 'Native Hawaiian', '400940997',
        '781-123-4567', 'English', 'barackobama@yahoo.com', 'Arlington, MA', 1, 165),					-- client1
        (150, 'THOMAS', 'JEFFERSON', '1934-02-25', 'Male', 'African', '444622945',
        '857-234-4568', 'Zulu', 'thomasjefferson@gmail.com', 'Milton, MA', 1, 165),						-- client2
        (151, 'HILLARY', 'CLINTON', '1949-12-01', 'Female', 'Hispanic', '918220531',
        '339-876-4321', 'Spanish', 'hillaryclinton@gmail.com', 'Woburn, MA', 1, 165),					-- client3
        (152, 'JARED', 'POLIS', '1955-04-23', 'Male', 'Asian', '509890693',
        '781-444-5555', 'Vietnamese', 'jaredpolis@hotmail.com', 'Saugus, MA', 1, 165),					-- client4

        (153, 'GREG', 'GIANFORTE', '1954-05-10', 'Male', 'African', '144681353',
        '339-555-6666' , 'Haiti', 'greggianforte@gmail.com', 'Woburn, MA', 1, 165),						-- client5
        (154, 'RICK', 'SCOTT', '1953-06-11', 'Male', 'American Indian', '927601766',
        '617-666-7777' , 'English', 'rickscott@yahoo.com', 'Newton, MA', 1, 165),						-- client6
        (155, 'ARNOLD', 'SCHWARZENEGGER', '1952-07-12', 'Male', 'Hispanic', '675048206',
        '857-777-8888' , 'Spanish', 'arnodschwarzenegger@hotmail.com', 'Milton, MA', 1, 165),			-- client7
        (156, 'SCARLETT', 'WARNER', '1949-10-15', 'Female', 'Asian', '690575022',
        '339-234-5678', 'Chinese', 'scarlettwarner@yahoo.com', 'Lynn, MA', 1, 165),						-- client8

        (157, 'CAMERON', 'DIAZ', '1947-12-17', 'Female', 'White', '947398961',
        '774-334-4556', 'English, Spanish', 'camerondiaz@yahoo.com', 'Worcester, MA', 1, 165),			-- client9
        (158, 'ANNE', 'HATHAWAY', '1946-01-18', 'Female', 'Hispanic', '292980551',
        '413-443-5567', 'English', 'annehathaway@hotmail.com', 'Westfield, MA', 1, 165),				-- client10
        (159, 'ANGELINA', 'JOLIE', '1943-03-20', 'Female', 'Asian', '164421697',
        '857-661-7789', 'Vietnamese', 'angelinajolie@gmail.com', 'Cambridge, MA', 1, 165),				-- client11
        (160, 'STEVE', 'JOBS', '1933-07-23', 'Male', 'White', '032504291',
        '413-367-3288', 'English', 'stevejobs@gmail.com', 'Newport, MA', 1, 165),						-- client12, deceased

        (172, 'Naima'   , 'Bernard'   , '1973-01-28', 'Female', 'White'   , '123-66-6680'  , '774-482-2284', 'Both'   , 'nbernard@gmail.com', '85 Bay State Ave Tewksbury, Massachusetts 01876'    , 6	 , 306), --supervisor
        (162, 'Adam'    , 'Faulkner'  , '1974-08-09', 'Male'  , 'White'   , '669-96-7400'  , '781-444-4611', 'English', 'afaulk@gmail.com'  , '75 Union Ave Sudbury, Massachusetts 01776'          , 4   , 172), --Case Manager
        (167, 'Jose'    , 'Garcia'    , '1970-01-22', 'Male'  , 'Hispanic', '751-55-7700'  , '351-870-0005', 'Both'   , 'jgarcia@gmail.com' , '846 Broadway Saugus, Massachusetts 01906'           , 2   , 172), --Coordinator
        (185, 'Bonnie'  , 'Craig'     , '1972-03-04', 'Female', 'White'   , '488-88-0005'  , '781-447-0808', 'English', 'bcraig@gmail.com'  , '85 Brainerd Rd Allston, Massachusetts 02134'        , 4   , 167), --caregiver
        (186, 'Joyce'   , 'Lloyd'     , '1973-01-18', 'Female', 'White'   , '579-00-3641'  , '774-089-9900', 'English', 'JLloyd@gmail.com'  , '85 Brick Hill Rd Orleans, Massachusetts 01522'      , 4   , 167), --caregiver
        (187, 'Craig'   , 'Cordova'   , '1983-07-16', 'Male'  , 'Hispanic', '777-07-7790'  , '781-449-0709', 'Both'   , 'ccordova@gmail.com', '85 Brook Bend Rd Holden, Massachusetts 01520'       , 4   , 167), --caregiver
        (188, 'Chris'   , 'Martinez'  , '1982-06-12', 'Male'  , 'Hispanic', '999-99-9900'  , '351-189-7776', 'Both'   , 'Cmartz33@gmail.com', '85 Carroage House Ln Wrentham, Massachusetts 02093' , 4   , 167), --caregiver
        (177, 'Candice' , 'Shannon'   , '1985-11-14', 'Female', 'White'   , '480-00-7918'  , '781-776-4805', 'Both'   , 'cshannon@gmail.com', '85 Chelmsford St Chelmsford, Massachusetts 01824'   , 5   , 172), --nurse

        (113, 'Steve'   , 'Collins' , '1948-04-27', 'Male'  , 'White'   , '845-99-1817'  , '781-555-4869', 'English', 'scollins@yahoo.com', '325 Bullard St Holden, Massachusetts 01520'           , 1, 162), --client
        (114, 'Victoria', 'Gomez'   , '1936-06-11', 'Female', 'Hispanic', '459-10-1678'  , '351-661-4768', 'Spanish', 'vgomez@gmail.com'  , '106 Stephen St South Dartmouth, Massachusetts 02748'  , 1, 162), --client
        (115, 'Austin'  , 'Carty'   , '1946-07-29', 'Male'  , 'White'   , '881-01-4687'  , '781-449-7720', 'English', 'acarty@hotmail.com', '69 Agnes Dr Framingham, Massachusetts 01701'          , 1, 162), --client
        (116, 'Eilish'  , 'Bull'    , '1937-06-26', 'Female', 'White'   , '354-97-1684'  , '781-220-1213', 'English', 'ebull37@yahoo.com' , '14 Mark Cir Holden, Massachusetts 01520'              , 1, 162), --client
        (117, 'Marianne', 'Costa'   , '1949-08-28', 'Female', 'Hispanic', '786-44-8821'  , '774-015-7684', 'Spanish', 'mcosta@gmail.com'  , '1112 Wachusett St Jefferson, Massachusetts 01522'     , 1, 162), --client
        (118, 'Chloe'   , 'Martinez', '1940-09-07', 'Female', 'Hispanic', '447-98-4873'  , '351-445-6868', 'Both'   , 'cmartz@gmail.com'  , '362 Sterling Rd Jefferson, Massachusetts 01522'       , 1, 162), --client
        (119, 'Dollie'  , 'Lucero'  , '1937-04-27', 'Female', 'White'   , '183-47-7821'  , '774-943-1177', 'English', 'dlucero@gmail.com' , '29 Walnut Ter Holden, Massachusetts 01520'            , 1, 162), --client
        (120, 'James'   , 'Lee'     , '1941-02-05', 'Male'  , 'Asian'   , '688-77-1818'  , '351-321-2251', 'English', 'jmlee@yahoo.com'   , '64 Bayberry Cmn Franklin, Massachusetts 02038'        , 1, 162), --client
        (121, 'Franklin', 'Giles'   , '1951-10-02', 'Male'  , 'White'   , '468-84-4488'  , '774-197-9724', 'English', 'fgiles@gmail.com'  , '1 Ruben Duren Way Bedford, Massachusetts 01730'       , 1, 162), --client
        (122, 'Shereen' , 'Delgado' , '1940-03-12', 'Female', 'Hispanic', '133-35-4876'  , '781-456-8791', 'Spanish', 'sdelgalo@gmail.com', '480 Broadway Methuen, Massachusetts 01844'            , 1, 162), --client
        (123, 'Grace'   , 'Meyer'   , '1945-02-10', 'Female', 'White'   , '654-48-7798'  , '351-444-7878', 'English', 'gmeyer45@gmail.com', '100 Crosby Dr Bedford, Massachusetts 01730'           , 1, 162), --client
        (124, 'Tanner'  , 'Ridley'  , '1950-11-15', 'Male'  , 'White'   , '186-41-1168'  , '781-159-9997', 'English', 'tridley@yahoo.com' , '25 Allied Dr Dedham, Massachusetts 02026'             , 1, 162), --client

        (173     , 'Brian'    ,  'Lara'    , '1981-07-09' ,  'Male'  , 'Indian'  , '580-01-140' , '781-609-720' , 'Hindi'    , 'brianla@gmail.com' , '72 Blackstone St, Mendon, MA 01756'     ,   6, 306                  ), --Supervisor
        (163     , 'Shaheen'  ,  'Afridi'  , '1975-02-26' ,  'Male'  , 'Iranian' , '515-75-658' , '781-802-016' , 'Persian'  , 'shaheen@gmail.com' , '674 West St, Leominster, MA 01453'      ,   4, 173                 ), --Case Manager
        (168     , 'Sean'     ,  'Michael' , '1979-10-14' ,  'Male'  , 'Arab'    , '021-58-965' , '351-640-404' , 'Arabic'   , 'Seanmic@gmail.com' , '61 Brandywine Rd, Franklin, MA 02038'   ,   2, 173                 ), --Coordinator
        (189     , 'Lisa'     ,  'Smith'   , '1974-03-18' ,  'Female', 'Iranian' , '102-03-730' , '781-677-209' , 'Persian'  , 'lisasmi@gmail.com' , '222 Green St, Northborough, MA 01522'   ,   4, 168                 ), --Caregiver
        (190     , 'Tori'     ,  'White'   , '1978-12-05' ,  'Female', 'Arab'    , '165-41-003' , '781-630-202' , 'Arabic'   , 'toriwhi@gmail.com' , '98 Populatic St, Franklin, MA 02038'    ,   4, 168                ), --Caregiver
        (191     , 'Zaboon'   ,  'Firash'  , '1980-08-07' ,  'Male'  , 'Indian'  , '479-55-977' , '781-205-024' , 'Hindi'    , 'zaboonf@gmail.com' , '123 High St, Weymouth, MA 02189'        ,   4, 168                ), --Caregiver
        (192     , 'Dilbar'   ,  'Kumar'   , '1981-12-27' ,  'Male'  , 'Arag'    , '458-55-997' , '781-680-204' , 'Spanish'   , 'dilbark@gmail.com' , '29 Hanford Rd, Stoneham, MA 02180 '     ,   4, 168               ), --Caregiver
        (178     , 'Katrina'  ,  'John'    , '1985-11-20' ,  'Female', 'Iranian' , '205-50-982' , '351-625-709' , 'Persian'  , 'katrina@gmail.com' , '12 A Barber St, Medway, MA 02053'       ,   5, 173                ), --Nurse

        (125     , 'Akshay'   ,  'Kumar'   , '1944-11-02' ,  'Male'  , 'Iranian' , '471-55-987' , '781-624-224' , 'Persian'  , 'akshay1@gmail.com' , '75 Ashcroft Rd, Medford, MA 02155'      ,   1, 163      ), --Client
        (126     , 'Neil'     ,  'Singh'   , '1943-05-15' ,  'Male'  , 'Arab'    , '340-35-930' , '351-677-274' , 'Arabic'   , 'Nieil23@yahoo.com' , '6 Elm Ct, Maynard, MA 01754'            ,   1, 163      ), --Client
        (127     , 'Sam'      ,  'Curren'  , '1940-10-01' ,  'Male'  , 'Indian'  , '254-42-145' , '781-745-488' , 'Hindi'    , 'samcurr@yahoo.com' , '16 Garfield Ave, Maynard, MA 01754'     ,   1, 163      ), --Client
        (128     , 'zeeba'    ,  'Khan'    , '1939-12-22' ,  'Female', 'Arab'    , '359-47-977' , '351-674-857' , 'Arabic'   , 'zeebakh@gmail.com' , '86 Washington St, Reading, MA 01867'    ,   1, 163      ), --Client
        (129     , 'Mark'     ,  'Kluzner' , '1935-06-25' ,  'Male'  , 'Hispanic', '788-36-547' , '781-745-854' , 'Spanish'  , 'markklz@yahoo.com' , '500 Belknap Rd, Framingham, MA 01701'   ,   1, 163      ), --Client
        (130     , 'Steve'    ,  'Waugh'   , '1942-03-20' ,  'Male'  , 'Black'   , '699-57-954' , '351-644-287' , 'Spanish'  , 'stevewa@gmail.com' , '316 Eliot St, Ashland, MA 01721'        ,   1, 163      ), --Client
        (131     , 'Zain'     ,  'Shams'   , '1934-04-17' ,  'Male'  , 'Iranian' , '474-85-963' , '781-851-620' , 'Persian'  , 'zainsha@yahoo.com' , '34 Everett Ave #1, Somerville, MA 02145',   1, 163      ), --Client
        (132     , 'Shair'    ,  'Shah'    , '1940-01-31' ,  'Male'  , 'Arab'    , '682-12-734' , '781-554-743' , 'Arabic'   , 'shairsh@gmail.com' , '82 North St, Stoneham, MA 02180'        ,   1, 163      ), --Client
        (133     , 'Shawn'    ,  'Wilson'  , '1938-02-02' ,  'Male'  , 'White'   , '225-98-957' , '351-677-241' , 'English'  , 'shawnwi@gmail.com' , '15 Village Grn, Norfolk, MA 02056'      ,   1, 163      ), --Client
        (134     , 'Zabit'    ,  'Shikh'   , '1935-12-07' ,  'Male'  , 'Black'   , '788-47-254' , '781-980-014' , 'Spanish'  , 'zabitsh@yahoo.com' , '2 Carter Rd, Woburn, MA 01801'          ,   1, 163      ), --Client
        (135     , 'Sharif'   ,  'Salman'  , '1945-05-17' ,  'Male'  , 'Indian'  , '014-78-965' , '781-102-058' , 'Hindi'    , 'sharifs@gmail.com' , '36 Nashaway Rd, Bolton, MA 01740'       ,   1, 163      ), --Client
        (136     , 'Amir'     ,  'Firoz'   , '1933-08-24' ,  'Male'  , 'White'   , '870-36-014' , '351-019-782' , 'English'  , 'amirfir@gmail.com' , '28 Hemlock Ln, Lancaster, MA 01523'     ,   1, 163      ), --Client

        (171, 'MARY', 'MARYFIELD', '1982-08-17', 'Female', 'White', '687872693',
        '617-023-2123', 'English', 'marymaryfield60@gmail.com', '1034 Mother Mary Ln', NULL, 306),			--supervisor
        (176, 'THOMAS', 'THOMPSON', '1975-02-27', 'Male', 'Black', '478214389',
        '617-498-1560', 'Spanish', 'thomthompson@cox.net', '95 Woodbridge St', 5, 171),						--nurse
        (166, 'OSCAR', 'OBRIEN', '1980-03-14', 'Male', 'White', '045218761',
        '617-545-3094', 'English, Spanish', 'oscarobrien31@hotmail.com', '205 Otis St', 2, 171),			--coordinator
        (161, 'NANCY', 'NGUYEN', '1985-01-24', 'Female', 'Asian', '084345904',
        '617-121-4190', 'Vietnamese, English', 'nnguyen33@aol.com', '24 Clarendon St', 4, 171),				--casemanager

        (181, 'PENELOPE', 'PACKWOOD', '1990-12-03', 'Female', 'Black', '092238831',
        '617-736-1333', 'Spanish', 'ppackwood@cox.net', '2048 Harbor Lights Cir', 4, 166),					--caregiver5
        (182, 'QUINCY', 'QUARK', '1974-08-19', 'Male', 'White', '812419896',
        '617-143-0091', 'English', 'qquark203@gmail.com', '205 Bussey St', 4, 166),							--caregiver6
        (183, 'ROGELIO', 'RODRIGUEZ', '1979-10-30', 'Male', 'Hispanic', '679253087',
        '617-029-2475', 'Spanish', 'rrodriguez2222@gmail.com', '56 June St', 4, 166),						--caregiver7
        (184, 'SALLY', 'SEASHELL', '1988-11-11', 'Female', 'White', '878950457',
        '617-349-1209', 'English, Spanish', 'sallyseashell33@yahoo.com', '555 Seashore St', 4, 166),		--caregiver8

        (101, 'ANDREA', 'ANDERSON', '1955-02-12', 'Female', 'White', '687022365',
        '617-485-2039', 'English', 'aanderson32498@gmail.com', '34 Craig Dr #APT 6G', 1, 161),				--client
        (102, 'BRAD', 'BENNETT', '1950-05-03', 'Male', 'White', '348203049',
        '617-394-1093', 'English', 'bbennett4333@yahoo.com', '34 Cypress Ave', 1, 161),						--client
        (103, 'CHRISTINE', 'CHEN', '1953-07-01', 'Female', 'Asian', '102221736',
        '617-102-2388', 'Chinese', 'cchen22@gmail.com', '1408 Gardners Neck Rd', 1, 161),					--client
        (104, 'DRAKE', 'DOWNEY', '1950-03-04', 'Male', 'White', '381284878',
        '617-274-2833', 'English', 'ddowney@cox.net', '9231 Avalon Dr', 1, 161),							--client

        (105, 'EMILY', 'EDWARDS', '1952-10-28', 'Female', 'White', '659257201',
        '617-332-6565', 'English', 'eedwards2@gmail.com', '259 Lund Farm Way', 1, 161),						--client
        (106, 'FRANKLIN', 'FOWLER', '1955-04-19', 'Male', 'Black', '885210390',
        '617-825-4597', 'English', 'ffowler111@hotmail.com', '210 Leeward Rd', 1, 161),						--client
        (107, 'GABRIEL', 'GARCIA', '1954-12-14', 'Male', 'Hispanic', '587628841',
        '617-525-7784', 'Spanish', 'ggabriel0@gmail.com', '2102 Archstone Ave', 1, 161),					--client
        (108, 'HEATHER', 'HANSEN', '1951-11-15', 'Female', 'White', '988206820',
        '617-023-2981', 'English', 'heatherh009@yahoo.com', '210 Massachusetts Ave', 1, 161),				--client

        (109, 'ISABELLA', 'IGLESIAS', '1946-02-09', 'Female', 'Hispanic', '874639250',
        '617-778-2842', 'Spanish', 'iglesiasi@gmail.com', '1911 Beacon St', 1, 161),						--client
        (110, 'JOHN', 'JOHNSON', '1945-07-04', 'Male', 'White', '966521849',
        '617-366-5297', 'English', 'jjohnson0293784@cox.net', '192 Johnson St', 1, 161),					--client
        (111, 'KATHERINE', 'KENNEDY', '1949-05-10', 'Female', 'Black', '755632010',
        '617-209-2874', 'English', 'katkennedy3@yahoo.com', '102 Union St', 1, 161),						--client
        (112, 'LI', 'LEUNG', '1949-09-08', 'Male', 'Asian', '561135826',
        '617-883-0290', 'Vietnamese', 'lileung44@gmail.com', '208 Hillside Rd', 1, 161),					--client

        -- Case managers
        (164, 'East', 'River', '1968-09-18', 'Male', 'White', '493-76-9873', '617-417-6969', 'English, Spanish', 'HankyBanky@hotmail.com', '152 RiverBed Dr'
         ,  4, 174),
        -- Coordinator
        (169, 'Jeremy', 'Brady', '1965-09-14', 'Male', 'White', '123-45-6789', '617-555-3698', 'English, Vietnamese', 'jbrady@gmail.com', '123 Seasame Street'
         , 2, 174),
        -- Supervisor
        (174, 'Noah', 'Kittle', '1969-08-10', 'Male', 'Black', '987-65-4321', '617-444-4758', 'English, Spanish', 'Nkittle@gmail.com', '65 Ynez Way'
        , 6, 306),
        -- Nurse
        (179, 'Lindsi', 'Frank', '1996-07-15', 'Female', 'White', '789-45-3210', '617-582-7824', 'English','LFrank@gmail.com', '69 Jefferson Ave'
         , 5, 174),
        -- Caregivers
        (193, 'Lincoln', 'Abraham', '1986-03-04', 'Male', 'Hispanic','852-96-7410', '617-573-4879', 'Spanish', 'LAbraham@gmail.com', '5267 Milkweed Way'
         , 4, 169),
        (194, 'Malcom', 'Stewart', '1991-02-03', 'Male', 'Black', '963-85-2741', '617-873-4508', 'English', 'MStewwie@gmail.com', '358 Bottoms Up Dr'
        , 4, 169),
        (195, 'Trek', 'Topper', '1975-07-06', 'Male', 'White', '321-54-6978', '617-574-6214', 'English', 'TTopper@gmail.com', 'Apt 789 Marry Way'
         , 4, 169),
        (196, 'Kelsey', 'Sun', '1989-09-09', 'Female', 'Asain','741-85-2096', '617-951-0127', 'English', 'KSunDancer@gmail.com', '6587 BlackBeard Ave'
        , 4, 169),
        -- Clients
        (137, 'George', 'Marquez', '1955-01-20', 'Male', 'Hispanic', '147-85-3690', '617-858-3311', 'Spanish', 'GPeso@yahoo.com', '*1 Plymouth Rock'
        , 1, 164),
        (138, 'Jack', 'Smith', '1952-05-10', 'Male', 'White', '258-36-9852', '617-676-4187', 'English', 'JackieSmith@yahoo.com', '193 Johnson St'
        , 1, 164),
        (139, 'Jane', 'Doe', '1942-09-22', 'Female', 'Asian', '015-45-2478','617-551-3488','Vietnamese', 'DontKnow@yahoo.com','193 Johnson St'
        , 1, 164),
        (140, 'Serena', 'Valdes', '1947-12-19', 'Female', 'Hispanic', '125-98-6348', '617-595-2204', 'Spanish', 'PesoMaker@hotmail.com', '254-36 Ark St'
        , 1, 164),
        (141, 'Mary', 'Margrot', '1952-04-17', 'Female', 'White', '759-32-4591', '617-859-3498', 'English', 'MMargrot@hotmail.com', 'APT 52 Pancakes Rd'
        , 1, 164),
        (142, 'West', 'North', '1955-06-15', 'Male', 'White', '364-59-7104','617-559-9966', 'English', 'DirectionMan@hotmail.com', '36 East Village Park'
        , 1, 164),
        (143, 'South', 'Bank', '1953-05-13', 'Female', 'Black', '453-94-7610','617-697-4582', 'English', 'RiverMeDown@hotmail.com', '62 Bankers Hill Lane'
        , 1, 164),
        (144, 'Breanna', 'Homer', '1949-11-12', 'Female', 'Asain', '547-86-4890','617-458-9630', 'Spanish', 'BHomer@outlook.com','03214 Simpson Ave'
        , 1, 164),
        (145, 'Greg', 'Edlemen', '1953-04-11', 'Male', 'White', '159-75-6973', '617-112-3366', 'Porteguese','GBallerE@outlook.com', 'Suite 5 Patriot Way'
        , 1, 164),
        (146, 'Kayla', 'Chung', '1951-08-13', 'Female', 'Black', '292-69-1283','617-448-3322','English', 'KChung@outlook.com','12 Brady Lane'
        , 1, 164),
        (147, 'Garrett', 'Mathews', '1948-05-16', 'Male', 'White', '555-66-777', '617-111-7777','Madrain','GMathews@outlook.com', '5943 SpringField Courte'
        , 1,164),
        (148, 'Dick', 'Peanut', '1954-09-19', 'Female', 'White', '111-69-9669', '617-111-1111', 'English', 'DickPea@outlook.com','7777 LuckyBall Dr'
        , 1, 164);

        --select * from tblPeople



    -- 3. The CLIENTS Table
        -- Schema:
            --	CLIENTS (ClientID, MedRecNum, CareHourLimit, Deceased)
            --	FK ClientID references PEOPLE
            --	Not null MedRecNum

        -- Create the CLIENTS table
        CREATE TABLE		tblClients
        (	ClientID		int				PRIMARY KEY		REFERENCES tblPEOPLE,
            MedRecNum		varchar(30)		NOT NULL							,
            CareHourLimit	int													,
            Deceased		varchar(128)	DEFAULT 'No'
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
        (160, '11243553', 12, 'Yes'),

        (113, '48586920', 10, 'No'),
        (114, '11875930', 12, 'No'),
        (115, '15976384', 14, 'Yes'),
        (116, '87975641', 11, 'Yes'),
        (117, '48480041', 10, 'NO'),
        (118, '12419952', 13, 'No'),
        (119, '87538412', 12, 'No'),
        (120, '75481374', 12, 'No'),
        (121, '18471300', 14, 'No'),
        (122, '44011547', 12, 'Yes'),
        (123, '12458700', 10, 'No'),
        (124, '10004798', 12, 'No'),

        (125     , '36521478' ,     12       , 'No'      ),
        (126     , '57548248' ,     14       , 'No'      ),
        (127     , '46534557' ,     10       , 'Yes'     ),
        (128     , '53468568' ,     12       , 'No'      ),
        (129     , '15453478' ,     10       , 'Yes'     ),
        (130     , '65434857' ,     12       , 'No'      ),
        (131     , '54613545' ,     12       , 'No'      ),
        (132     , '87586214' ,     10       , 'No'      ),
        (133     , '15246844' ,     10       , 'Yes'     ),
        (134     , '34653254' ,     12       , 'No'      ),
        (135     , '80546546' ,     10       , 'No'      ),
        (136     , '54850405' ,     12       , 'No'      ),

        (101, '63510878', 10, 'No'),
        (102, '47335356', 11, 'No'),
        (103, '30078456', 12, 'No'),
        (104, '94005475', 11, 'No'),
        (105, '68858449', 13, 'No'),
        (106, '98095510', 13, 'No'),
        (107, '34934303', 14, 'No'),
        (108, '53030178', 09, 'No'),
        (109, '64179092', 10, 'No'),
        (110, '62064706', 10, 'No'),
        (111, '45783732', 11, 'No'),
        (112, '87955973', 12, 'No'),

        (137, '12345678', '08', 'Yes'),
        (138, '87654321', '10', 'No'),
        (139, '54861485', '11', 'No'),
        (140, '58649102', '12', 'No'),
        (141, '45236547', '14', 'No'),
        (142, '55647895', '09', 'No'),
        (143, '56286533', '12', 'No'),
        (144, '52789987', '10', 'Yes'),
        (145, '86314597', '11', 'No'),
        (146, '32564780', '08', 'No'),
        (147, '69696996', '14', 'No'),
        (148, '88008800', '13', 'No');



    -- 4. The COORDINATORS Table
        -- Schema:
            --	COORDINATORS (CoordinatorID, EmploymentType)
            --	FK CoordinatorID references PEOPLE

        -- Create the COORDINATORS table
        CREATE TABLE			tblCoordinators
        (	CoordinatorID		int				PRIMARY KEY		REFERENCES tblPeople,
            EmploymentType		varchar(30)
        );

        -- Insert data into the COORDINATORS table
        INSERT INTO tblCoordinators VALUES
        (170, 'Full-time'),  --huong's coordinator
        (167, 'Full-Time'),  --tim's coordinator
        (168, 'Full-Time'),	 -- Mohammad's data
        (166, 'Full-time'),	 -- Andrew's data
        (169, 'Full-time');  -- Cullen's data

        --select * from tblCoordinators



    -- 5. The CAREGIVERS Table
        -- Schema:
            --	CAREGIVERS (CaregiverID, DateRecruited, HrPayRate, CoordinatorID)
            --	FK CaregiverID references PEOPLE
            --	FK CoordinatorID references COORDINATORS
            --	Not null CoordinatorID

        -- Create the CAREGIVERS table
        CREATE TABLE		tblCaregivers
        (	CaregiverID		int		PRIMARY KEY	 REFERENCES	tblPeople		,
            DateRecruited	date											,
            HrPayRate		int												,
            CoordinatorID	int		NOT NULL	 REFERENCES	tblCoordinators
        );

        -- Insert data into the CAREGIVERS table
        INSERT INTO tblCaregivers VALUES
        (197, '2019-05-05', 15, 170),
        (198, '2015-02-23', 20, 170),
        (199, '2016-03-20', 19, 170),
        (200, '2017-04-19', 18, 170),

        (185, '2008-05-01', 25, 167),
        (186, '2010-04-01', 22, 168),
        (187, '2015-03-15', 20, 166),
        (188, '2015-02-01', 20, 166),

        (189, '2009-01-15', 25, 168),
        (190, '2013-05-25', 20, 168),
        (191, '2010-09-24', 24, 168),
        (192, '2014-11-19', 22, 168),

        (181, '2010-08-24', 23, 166),
        (182, '2009-10-11', 24, 166),
        (183, '2005-01-13', 29, 166),
        (184, '2015-06-03', 21, 166),

        (193, '2016-05-12', 25, 169),
        (194, '2018-06-19', 28, 169),
        (195, '2019-08-05', 27, 169),
        (196, '2020-11-13', 30, 169);

        --select * from tblCaregivers



    -- 6. The CARESERVICES Table
        -- Schema:
            --	CARESERVICES (PK:CareServiceID identity(10000, 1), AK(ClientID, CaregiverID, DateOfService), NumOfHours, HrBillRate, ClientReview)
            --  FK ClientID references CLIENTS
            --	FK CaregiverID references CAREGIVERS
            --  Unique (ClientID, CaregiverID, DateOfService)
            --	Not Null ClientID, CaregiverID, DateOfService

        -- Create the CARESERVICES table
        CREATE TABLE		tblCareServices
        (	CareServiceID	int			IDENTITY (1000, 1)		PRIMARY KEY													,
            ClientID		int			NOT NULL  				REFERENCES tblClients (ClientID)		ON DELETE CASCADE	,
            CaregiverID		int			NOT NULL				REFERENCES tblCaregivers (CaregiverID)						,
            DateOfService	date		NOT NULL																			,
                                        UNIQUE	 (ClientID, CaregiverID, DateOfService)										,
            NumOfHours		int																								,
            HrBillRate		int																								,
            ClientReview	varchar		(2000)
        );

        -- Insert data into the CARESERVICES table
        INSERT INTO tblCareServices VALUES
        (149, 197, '2020-07-19', 08, 25, 'My caregiver is nice and helpful.')													 ,
        (150, 197, '2019-05-05', 09, 23, 'I wish my caregiver can speak better Chinese.')										 ,
        (151, 197, '2020-01-02', 10, 21, 'My caregiver was late a couple of times.')											 ,
        (152, 198, '2015-02-23', 11, 17, 'My caregiver did a great job.')														 ,
        (153, 198, '2015-12-01', 12, 25, 'My caregiver is a good communicator. She cheered up my day by chitchating with me.')	 ,
        (154, 198, '2016-04-07', 13, 23, 'My caregiver reminded me to take pills regularly, which I appreciated.')				 ,
        (155, 199, '2020-05-19', 14, 15, 'I just did not like my caregiver. He drove my car like a maniac.')					 ,
        (156, 199, '2016-03-20', 08, 13, 'I think my caregiver sneaked my painkiller pills away. What should I do?')			 ,
        (157, 199, '2021-03-21', 09, 20, 'I want my caregiver to wash her hands longer due to Covid.')							 ,
        (158, 200, '2017-04-19', 10, 20, 'Great caregiver. Wish to have my caregiver''s help longer next month.')				 ,
        (159, 200, '2018-06-20', 11, 20, 'I don''t understand my caregiver''s Vietnamese.')										 ,
        (160, 200, '2015-07-05', 12, 20, 'Cultural difference/ language barrier. My caregiver did not get my jokes.')			 ,
        (160, 198, '2016-07-05', 12, 25, 'Thorough work. Responsible. No complaints. ')											 ,
        (160, 198, '2016-10-05', 14, 26, 'My caregiver spent too much time on his phone. He loves Tweets more than his job.')	 ,
        (160, 200, '2016-12-05', 14, 20, 'My caregiver has improved her performance. She reminded me to take pills on time. I''m thankful for that.'),
        (155, 198, '2021-01-02', 15, 22, 'He has good sense of humor and is fun to chat with.')									 ,
        (156, 197, '2021-01-15', 10, 25, 'He rearranged my furniture to clear out my pathway very fast and clean.')				 ,
        (157, 197, '2021-04-29', 10, 20, 'Note from client''family member: He fed my father very carefully. Thanks.')			 ,
        (159, 198, '2021-03-12', 11, 20, 'He is a bit too talkative, but finished his job in time and good quality.')			 ,

        (113, 185, '2021-01-06', 8, 31, 'Positive'),
        (114, 185, '2021-01-11', 9, 30, 'Negative'),
        (115, 185, '2021-02-02', 10, 29, 'Positive'),
        (116, 186, '2021-02-05', 11, 28, 'Negative'),
        (117, 186, '2021-02-11', 12, 27, 'Positive'),
        (118, 186, '2021-02-12', 13, 26, 'Positive'),
        (119, 187, '2021-02-26', 14, 25, 'Negative'),
        (120, 187, '2021-03-03', 8, 25, 'Positive'),
        (121, 187, '2021-03-12', 9, 20, 'Positive'),
        (122, 188, '2021-03-22', 10, 15, 'Negative'),
        (123, 188, '2021-03-23', 11, 20, 'Negative'),
        (124, 188, '2021-03-30', 12, 20, 'Positive'),

        (125     ,   189      ,  '2021-01-12',    3      ,    20     ,   'Negative'),
        (126     ,   189      ,  '2021-01-13',    2      ,    20     ,   'Positive'),
        (127     ,   189      ,  '2021-02-17',    4      ,    15     ,   'Positive'),
        (128     ,   190      ,  '2021-02-20',    4      ,    25     ,   'Negative'),
        (129     ,   190      ,  '2021-02-22',    5      ,    20     ,   'Positive'),
        (130     ,   190      ,  '2021-02-27',    6      ,    20     ,   'Negative'),
        (131     ,   191      ,  '2021-02-28',    5      ,    15     ,   'Negative'),
        (132     ,   191      ,  '2021-03-07',    7      ,    20     ,   'Positive'),
        (133     ,   191      ,  '2021-03-09',    3      ,    25     ,   'Negative'),
        (134     ,   192      ,  '2021-03-14',    7      ,    20     ,   'Negative'),
        (135     ,   192      ,  '2021-03-18',    5      ,    15     ,   'Negative'),
        (136     ,   192      ,  '2021-03-27',    2      ,    15     ,   'Negative'),

        (101, 181, '2021-04-01', 03, 25, 'Positive'),
        (102, 182, '2021-04-02', 02, 24, 'Positive'),
        (103, 183, '2021-04-04', 02, 24, 'Positive'),
        (104, 184, '2021-04-05', 03, 24, 'Positive'),
        (105, 181, '2021-04-05', 02, 24, 'Positive'),
        (106, 182, '2021-04-06', 03, 27, 'Positive'),
        (107, 183, '2021-04-09', 01, 22, 'Negative'),
        (108, 184, '2021-04-11', 03, 29, 'Positive'),
        (109, 181, '2021-04-11', 02, 28, 'Positive'),
        (110, 182, '2021-04-14', 01, 29, 'Negative'),
        (111, 183, '2021-04-16', 04, 30, 'Positive'),
        (112, 184, '2021-04-16', 02, 24, 'Positive'),

        (137, 193, '2021-02-14', 3, 20, 'Good'     ),
        (138, 193, '2021-02-17', 5, 25, 'Good'     ),
        (139, 193, '2021-03-15', 2, 15, 'Bad'      ),
        (140, 194, '2021-03-04', 4, 20, 'Good'     ),
        (141, 194, '2021-03-06', 2, 25, 'Good'     ),
        (142, 194, '2021-03-20', 3, 20, 'Good'     ),
        (143, 195, '2021-04-01', 1, 15, 'Bad'      ),
        (144, 195, '2021-04-03', 5, 20, 'Bad'      ),
        (145, 195, '2021-04-04', 2, 25, 'Good'     ),
        (146, 196, '2021-04-10', 3, 15, 'Good'     ),
        (147, 196, '2021-04-11', 4, 20, 'Good'     ),
        (148, 196, '2021-04-12', 6, 20, 'Good'     );

        --select * from tblCareServices



    -- 7. The TRANSPORTMODES Table
        -- Schema: TRANSPORTMODES (PK: TransportModeID identity (2000, 1), TransportMode not null)

        -- Create the TRANSPORTMODES table
        CREATE TABLE tblTransportModes
        (	TransportModeID		int			IDENTITY (2000, 1)	PRIMARY KEY	,
            TransportMode		varchar(30) NOT NULL
        );

        -- Insert data into the TRANSPORTMODES table
        INSERT INTO tblTransportModes VALUES
        ('car'),
        ('bus'),
        ('ferry'),
        ('train'),
        ('bike'),
        ('bike + train'),
        ('bike + bus'),
        ('car + train'),
        ('bus + train');

        --select * from tblTransportModes



    -- 8. The CAREGIVER_TRANSPORTS Table
        -- Schema:
            --	CAREGIVER_TRANSPORTS (PK: CaregiverTransportID identity (3000, 1), AK: (CaregiverID, TransportMode))
            --	FK CaregiverID references CAREGIVERS
            --	FK TransportMode references TRANSPORTMODES
            --	Unique(CaregiverID, TransportMode)
            --  Not null CaregiverID, TransportMode

        -- Create the CAREGIVER_TRANSPORTS table
        CREATE TABLE  tblCaregiverTransports
        (	CaregiverTransportID	int			IDENTITY (3000, 1)		PRIMARY KEY							,
            CaregiverID				int			NOT NULL				REFERENCES		tblCaregivers		,
            TransportMode			int			NOT NULL				REFERENCES		tblTransportModes	,
                                    UNIQUE		(CaregiverID, TransportMode)
        );

        -- Insert data into the CAREGIVER_TRANSPORTS table
        INSERT INTO tblCaregiverTransports VALUES
        (185, 2005),
        (186, 2006),
        (187, 2007),
        (188, 2008),

        (197, 2001),
        (198, 2002),
        (199, 2003),
        (200, 2004),

        (189, 2001),
        (190, 2003),
        (191, 2005),
        (192, 2007),

        (181, 2001),
        (182, 2001),
        (183, 2001),
        (184, 2004),

        (193, 2008),
        (194, 2005),
        (195, 2001),
        (196, 2002);

        --select * from tblCaregiverTransports



    -- 9. The CASEMANAGERS Table
        -- Schema:
            --	CASEMANAGERS (CaseManagerID, YearsOfExperience)
            --	FK CaseManagerID references PEOPLE

        -- Create the CASEMANAGERS table
        CREATE TABLE			tblCaseManagers
        (	CaseManagerID		int		PRIMARY KEY		REFERENCES	  tblPEOPLE,
            YearsOfExperience	int
        );

        -- Insert data into the CASEMANAGERS table
        INSERT INTO tblCaseManagers VALUES
        (165, 5),
        (162, 10),
        (163, 7),
        (161, 7),
        (164, 15);

        --select * from tblCaseManagers



    -- 10. The CASEREPORTS Table
        -- Schema:
            --	CASEREPORTS (PK: CaseReportID identity(4000, 1), AK: (ClientID, CaseManagerID, Time, Date), CaseReports)
            --	FK ClientID references CLIENTS ON DELETE CASCADE
            --	FK CaseManagerID references CASEMANAGERS
            --  UNIQUE (ClientID, CaseManagerID)
            --  NOT NULL ClientID, CaseManagerID

        -- Create the CASEREPORTS table
        CREATE TABLE		tblCaseReports
        (	CaseReportID	int			IDENTITY (4000, 1)		PRIMARY KEY											,
            ClientID		int			NOT NULL				REFERENCES	tblClients			ON DELETE CASCADE	,
            CaseManagerID	int			NOT NULL				REFERENCES	tblCaseManagers							,
                            UNIQUE		(ClientID, CaseManagerID, [Time], [Date])									,
            [Time]			time(0)		NOT NULL																	,
            [Date]			date		NOT NULL																	,
            CaseReports		varchar(2000)
        );

        -- Insert data into the CASEREPORTS table
        INSERT INTO tblCaseReports VALUES

        (149, 165, '10:00:00', '2021-01-05', 'Things go on schedule.'),
        (150, 165, '08:30:00', '2021-02-05', 'Client has no complaint about his caregiver''s service.'										 ),
        (151, 165, '12:15:00', '2021-03-05', 'CM reminds client to continue COVID19 precautions: keep 6 feet apart from other people.'		 ),
        (152, 165, '14:00:00', '2021-04-05', 'CM reminds client to wear mask, wash hand frequently with soap and water for at least 20 secs.'),
        (153, 165, '16:00:00', '2020-01-05', 'CM reminds client of home safety, taking medications as prescribed.'							 ),
        (154, 165, '13:00:00', '2020-01-05', 'CM will help contact client''PCP for depress refills.'										 ),
        (155, 165, '14:30:00', '2020-01-05', 'Client needs help requesting refills for antibiotics.'										 ),
        (156, 165, '10:00:00', '2020-01-05', 'Client is happy that she got vaccinated for Covid19.'											 ),
        (157, 165, '11:00:00', '2020-01-05', 'Client reported that he fell and went to emergency last week.'								 ),
        (158, 165, '11:30:00', '2019-01-05', 'Client had no fever, cough, chest pain, or difficulty of breath.'								 ),
        (159, 165, '09:00:00', '2019-01-05', 'Client had fever and very tired. CM needs to arrange for her to have nurse check on him.'		 ),
        (160, 165, '09:45:00', '2015-08-05', 'Client looked really weak. CM will arrange hospice service for him'							 ),

        (113, 162, '12:50:00', '2021-01-25', 'Client is alert and oriented. Client reports no falls.'               ),
        (114, 162, '13:30:00', '2021-01-26', 'Client is alert and oriented. Client reports no falls.'               ),
        (115, 162, '14:55:00', '2021-01-27', 'Client is alert and oriented. Client is pleased with caregiver.'      ),
        (116, 162, '04:30:00', '2021-01-30', 'Client denies signs of COVID. Client reports no falls.'               ),
        (117, 162, '10:45:00', '2021-02-01', 'Client is not pleased with caregiver. Client has seen signs of COVID.'),
        (118, 162, '16:30:00', '2021-02-05', 'Client denies signs of COVID. Client is pleased with caregiver.'      ),
        (119, 162, '17:20:00', '2021-02-06', 'Client is not pleased with caregiver. Client has seen signs of COVID.'),
        (120, 162, '18:40:00', '2021-02-12', 'Client is alert and oriented. Client is pleased with caregiver.'      ),
        (121, 162, '08:20:00', '2021-02-14', 'Client denies signs of COVID. Client reports no falls.'               ),
        (122, 162, '09:30:00', '2021-02-15', 'Client denies signs of COVID. Client is pleased with caregiver.'      ),
        (123, 162, '09:47:00', '2021-02-21', 'Client is alert and oriented. Client is pleased with caregiver.'      ),
        (124, 162, '11:25:00', '2021-02-22', 'Client denies signs of COVID. Client reports no falls.'               ),

        (125, 163, '10:14:00', '2021-01-20', 'Client is in pain and discomfort. Client energy level is down.'       ),
        (126, 163, '19:24:00', '2021-01-27', 'Client has sleep problem. Client worries about things.'				),
        (127, 163, '02:14:00', '2021-01-29', 'Client is tense and anxious. Client has difficulty with walking.'     ),
        (128, 163, '11:42:00', '2021-01-31', 'Client denies signs of stroke. Client energy level is high.'          ),
        (129, 163, '10:30:00', '2021-02-03', 'Client is active and happy. Client is satisfied with caregiver.'      ),
        (130, 163, '17:32:00', '2021-02-09', 'Client is tense and anxious. Client has difficulty with walking.'		),
        (131, 163, '22:14:00', '2021-02-14', 'Client is in pain and discomfort. Client energy level is down.'       ),
        (132, 163, '23:15:00', '2021-02-19', 'Client has sleep problem. Client worries about things.'				),
        (133, 163, '05:19:00', '2021-02-24', 'Client is tense and anxious. Client has difficulty with walking'		),
        (134, 163, '09:28:00', '2021-03-05', 'Client is in pain and discomfort. Client energy level is down.'       ),
        (135, 163, '10:19:00', '2021-03-16', 'Client denies signs of stroke. Client energy level is high.'			),
        (136, 163, '10:50:00', '2021-03-20', 'Client denies signs of COVID. Client reports no falls.'               ),

        (101, 161, '08:31:00', '2021-04-04', 'Satisfied with care.'),
        (102, 161, '12:50:00', '2021-04-04', 'Satisfied with care.'),
        (103, 161, '09:01:00', '2021-04-05', 'Satisfied with care.'),
        (104, 161, '13:20:00', '2021-04-05', 'Satisfied with care.'),
        (105, 161, '10:55:00', '2021-04-06', 'Satisfied with care.'),
        (106, 161, '14:00:00', '2021-04-06', 'Satisfied with care.'),
        (107, 161, '09:45:00', '2021-04-07', 'Dissatisfied with service, requesting new caregiver. Will investigate further.'),
        (108, 161, '12:32:00', '2021-04-07', 'Satisfied with care.'),
        (109, 161, '08:00:00', '2021-04-08', 'Satisfied with care.'),
        (110, 161, '11:09:00', '2021-04-08', 'Dissatisfied with care, label for painkiller medication had a mistake in doses. Took two instead of one, will investigate incident.'),
        (111, 161, '13:00:00', '2021-04-08', 'Satisfied with care.'),
        (112, 161, '16:10:00', '2021-04-08', 'Satisfied with care.'),

        (137, 164, '11:30:00', '2021-01-03', 'Client is satisfied and safe. No issues reported'),
        (138, 164, '15:15:00', '2021-01-12', 'Client was disoreinted and confused.'),
        (139, 164, '17:00:00', '2021-01-22', 'Client shows no sign of illness.'),
        (140, 164, '09:30:00', '2021-01-30', 'Client shows signs of illness. Client was put on medication'),
        (141, 164, '08:15:00', '2021-02-10', 'Client reports fall. No sign of injuries.'),
        (142, 164, '10:15:00', '2021-02-25', 'Client has clear report. No issues reported.'),
        (143, 164, '18:30:00', '2021-03-05', 'Client has clear report. No issues reported.'),
        (144, 164, '13:45:00', '2021-03-09', 'Client reports fall. Signs of bruising.'),
        (145, 164, '12:00:00', '2021-03-20', 'Client is on medication.'),
        (146, 164, '09:00:00', '2021-04-01', 'Client reports allergies to prescribed medication.'),
        (147, 164, '16:45:00', '2021-04-06', 'Client is A okay tipy top shape lad.'),
        (148, 164, '14:30:00', '2021-04-11', 'Client is a funny individual. No issues to report.');

        --select * from tblCaseReports



    -- 11. The HRTASKS Table
        -- Schema:
            --	HRTASKS (HRTaskID, TaskDescription)
            --	Not null TaskDescription

        -- Create the HRTASKS table
        CREATE TABLE tblHrTasks
        (	HRTaskID			int				PRIMARY KEY ,
            TaskDescription		varchar(1000)	NOT NULL
        );

        -- Insert data into the HRTASKS table
        INSERT INTO tblHrTasks VALUES
        (1, 'Train caregivers'),
        (2, 'Recruite caregivers'),
        (3, 'Arrange schedule for caregivers'),
        (4, 'Collect caregiver''s timesheet'),
        (5, 'Evaluate caregiver''s performance');

        --select * from tblHrTasks;



    -- 12. The COORD_HRTASKS Table
        -- Schema:
            --	COORD_HRTASKS (PK: Coord_HRTask_ID identity (5000, 1), AK: (CoordinatorID, HRTaskID))
            --	FK CoordinatorID references COORDINATORS
            --	FK HRTaskID references HRTASKS
            --  Unique (CoordinatorID, HRTaskID)
            --  NOT NULL CoordinatorID, HRTaskID

        -- Create the COORD_HRTASKS table
        CREATE TABLE tblCoord_HRTasks
        (	Coord_HRTask_ID	int			IDENTITY (5000, 1)			PRIMARY KEY						,
            CoordinatorID	int			NOT NULL					REFERENCES		tblCoordinators	,
            HRTaskID		int			NOT NULL					REFERENCES		tblHrTasks		,
                            UNIQUE		(CoordinatorID, HRTaskID)
        );

        -- Insert data into the COORD_HRTASKS table
        INSERT INTO tblCoord_HRTasks VALUES
        (170, 1),
        (170, 2),
        (170, 3),
        (170, 4),
        (170, 5),

        (167, 2),
        (167, 3),
        (167, 4),

        (168, 1),
        (168, 5),

        (166, 1),
        (166, 4),
        (166, 5),

        (169, 3),
        (169, 4),
        (169, 1);

        --select * from tblCoord_HRTasks



    -- 13. The NURSES Table
        -- Schema:
            --	NURSES (NurseID, NurseType, NursePayRate)
            --	FK NurseID references PEOPLE
            --	Not Null NursePayRate, NurseType

        -- Create the NURSES table
        CREATE TABLE	  tblNurses
        (	NurseID		  int			PRIMARY KEY	    REFERENCES	   tblPEOPLE,
            NurseType	  varchar(30)	NOT NULL								,
            NursePayRate  int			NOT NULL
        );

        -- Insert data into the NURSES table
        INSERT INTO tblNurses VALUES
        (180, 'Registered Nurse', 120000),
        (177, 'Registered Nurse', 125000),
        (178, 'Practioner Nurse', 150000),
        (176, 'Registered Nurse', 125000),
        (179, 'Registered Nurse', 130000);

        --select * from tblNurses



    -- 14. The ACCIDENTREPORTS Table
        -- Schema:
            --	ACCIDENTREPORTS (PK: AccidentReportID identity (6000,1), AK: (NurseID, ClientID, AccidentDate, AccidentTime), AccidentLocation, AccidentDescription)
            --	FK NurseID references NURSES
            --	FK ClientID references CLIENTS
            --  UNIQUE (NurseID, ClientID, AccidentDate, AccidentTime)
            --  NOT NULL NurseID, ClientID, AccidentDate, AccidentTime)

        -- Create the ACCIDENTREPORTS table
        CREATE TABLE			tblAccidentReports
        (	AccidentReportID	int			IDENTITY(6000, 1)		PRIMARY KEY										 ,
            NurseID				int			NOT NULL				REFERENCES		tblNurses						 ,
            ClientID			int			NOT NULL				REFERENCES		tblClients		ON DELETE CASCADE,
                                UNIQUE		(NurseID, ClientID, AccidentDate, AccidentTime)							 ,
            AccidentDate		date		NOT NULL 																 ,
            AccidentTime		time(0)		NOT NULL																	 ,
            AccidentLocation	varchar(300)																		 ,
            AccidentDescription varchar(1000)
        );

        -- Insert data into the ACCIDENTREPORTS table
        INSERT INTO tblAccidentReports VALUES
        (180, 149, '2021-01-30', '21:30:00', 'Home', 'break his leg'									),
        (180, 160, '2016-12-23', '20:34:00', 'Bathroom', 'dropped death'								),
        (180, 149, '2021-02-15', '16:13:00', 'Dining Table', 'chocked up on food and could not breath'	),

        (177, 113, '2021-01-09', '20:05:00', 'Home', 'Fell from bed'									),
        (177, 114, '2021-01-15', '18:15:00', 'Home', 'Forgot to take their medication'					),

        (178, 125, '2021-02-16', '23:50:00', 'Home', 'Fell in the shower'								),
        (178, 126, '2021-03-22', '19:12:00', 'Home', 'Fire and burn'									),

        (176, 109, '2021-04-01', '15:23:00', 'apartment', 'Fell downstairs, could not get up. Arrived at apartment to help her up and gather her bearings. No broken bones, just minor bruises.'),
        (176, 110, '2021-04-04', '08:40:00', 'home', 'Accidentally doubled the dose of painkiller medication. Stayed with him to monitor heart for a couple of hours. Heart rate was steady.'),

        (179, 137, '2021-04-11', '15:30:00', 'Kitchen', 'Tried cooking soup, accidentally poured it on herself. Client has mild burns and discomfort.'),
        (179, 138, '2021-04-20', '08:15:00', 'bedroom', 'Client reported falling out of the bed. Client shows signs of mild concussion.'              );

        --select * from tblAccidentReports



    -- 15. The NURSEVISITREPORTS Table
        -- Schema:
            --	NURSEVISITREPORTS (PK: NurseReportIDNurseID identity(7000, 1) PRIMARY KEY, AK: (NurseID, ClientID, Date, Time), Date, Time, VisitNotes)
            --	FK NurseID references NURSES
            --	FK ClientID references CLIENTS ON DELETE CASCADE
            --  UNIQUE (NurseID, ClientID, Date, Time)
            --  NOT NULL NurseID, ClientID, Date, Time

        -- Create the NURSEVISITREPORTS table
        CREATE TABLE		tblNurseVisitReports
        (	NurseReportID	int				IDENTITY(7000, 1)	  PRIMARY KEY								 ,
            NurseID			int				NOT NULL			  REFERENCES	tblNurses					 ,
            ClientID		int				NOT NULL			  REFERENCES	tblClients	ON DELETE CASCADE,
            [Date]			date			NOT NULL														 ,
            [Time]			time(0)			NOT NULL														 ,
            VisitNotes		varchar(1000)																	 ,
                            UNIQUE			(NurseID, ClientID, [Date], [Time])								 ,
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
        (180, 160, '2015-07-06', '10:45:00', 'The patient could not breath well. Oxygen level is low.'),

        (177, 113, '2021-03-01', '14:00:00', 'Blood pressure good. Heart rate excellent.'),
        (177, 114, '2021-03-12', '16:00:00', 'Heart rate good. Blood pressure excellent.'),
        (177, 115, '2021-03-13', '15:00:00', 'Heart rate a little slow.'                 ),
        (177, 116, '2021-03-25', '15:15:00', 'Blood pressure a little high.'             ),
        (177, 117, '2021-03-28', '15:45:00', 'Temperature high and heart rate high.'     ),
        (177, 118, '2021-04-03', '16:40:00', 'Temperature high and blood pressure high.' ),
        (177, 119, '2021-04-04', '18:45:00', 'Blood pressure great. Heart rate perfect.' ),
        (177, 120, '2021-04-08', '19:20:00', 'Heart rate good. Temperature high.'        ),
        (177, 121, '2021-04-10', '18:30:00', 'Feverish temperature. Heart rate high.'    ),
        (177, 122, '2021-04-24', '17:45:00', 'Blood pressure high. Heart rate high.'     ),
        (177, 123, '2021-04-25', '10:05:00', 'Heart rate good. Blood pressure excellent.'),
        (177, 124, '2021-04-27', '11:15:00', 'Heart rate a little slow.'                 ),

        (178, 125, '2021-01-03', '18:00:00', 'Heart rate a little slow.'                 ),
        (178, 126, '2021-01-14', '16:45:00', 'Heart rate good. Blood pressure excellent.'),
        (178, 127, '2021-02-19', '13:30:00', 'Heart rate a little slow.'                 ),
        (178, 128, '2021-02-20', '11:15:00', 'Blood pressure a little high.'             ),
        (178, 129, '2021-02-22', '15:00:00', 'Temperature high and heart rate high.'     ),
        (178, 130, '2021-03-01', '19:30:00', 'Heart rate a little slow.'                 ),
        (178, 131, '2021-03-05', '18:00:00', 'Blood pressure great. Heart rate perfect.' ),
        (178, 132, '2021-03-09', '15:45:00', 'Heart rate good. Temperature high.'        ),
        (178, 133, '2021-03-11', '18:15:00', 'Heart rate a little slow.'                 ),
        (178, 134, '2021-04-14', '12:30:00', 'Blood pressure high. Heart rate high.'     ),
        (178, 135, '2021-04-20', '06:15:00', 'Heart rate good. Blood pressure excellent.'),
        (178, 136, '2021-04-23', '08:45:00', 'Heart rate a little slow.'                 ),

        (176, 101, '2021-03-29', '08:35:00', 'Steady vitals, client is doing well.'),
        (176, 102, '2021-03-29', '12:45:00', 'Heart soudned irregular, asking client to come into clinic in order to get MRI. Will get the appointment scheduled early next month'),
        (176, 103, '2021-03-30', '09:02:00', 'Heartbeat still irregular, will stay on medication. Other vitals are good.'),
        (176, 104, '2021-03-30', '11:23:00', 'Legs looked swollen; veins popping out. Will bring into clinic for scans next month.'),
        (176, 105, '2021-03-31', '10:00:00', 'Steady vitals, client is doing well.'),
        (176, 106, '2021-03-31', '15:05:00', 'Hair is falling out at alarming rates; said he has been feeling more and more tired lately. Need to bring in for scans for cancer.'),
        (176, 107, '2021-04-01', '09:31:00', 'Steady vitals, client is doing well.'),
        (176, 108, '2021-04-01', '12:46:00', 'Client needs refill of blood pressure medication. Prescription got sent in today.'),
        (176, 109, '2021-04-02', '10:02:00', 'Client is complaining of sharp pains in the left knee. This could be another gout flare-up. Needs a blood test this month.'),
        (176, 110, '2021-04-02', '14:20:00', 'Arthritis is getting worse, especially in fingers. Will continue to prescribe more painkillers.'),
        (176, 111, '2021-04-03', '07:30:00', 'Client is continuing with dialysis as needed. No word from the kidney waitlist.'),
        (176, 112, '2021-04-03', '11:50:00', 'Steady vitals, client is doing well.'),

        (179, 137, '10:00:00', '2021-01-04', 'Vitals all in check.'),
        (179, 138, '14:30:00', '2021-01-08', 'Vitals show signs of ilness.'),
        (179, 139, '16:45:00', '2021-01-14', 'Blood pressure improved since lst visit.'),
        (179, 140, '08:15:00', '2021-01-30', 'Heart rate high. Blood pressure low.'),
        (179, 141, '07:30:00', '2021-02-13', 'Vitals all in check. Minus mild temperature.'),
        (179, 142, '09:30:00', '2021-02-27', 'Vitals look great. Client appears healthly but old.'),
        (179, 143, '17:15:00', '2021-03-02', 'Client passed away.'),
        (179, 144, '12:45:00', '2021-03-11', 'Vitals are high. Client show signs of mild injury.'),
        (179, 145, '11:00:00', '2021-03-18', 'Vitals good.'),
        (179, 146, '08:45:00', '2021-04-03', 'Client has allergic reaction to medication. Vitals unstable. We are losing them.'),
        (179, 147, '14:30:00', '2021-04-05', 'Vitals are high. Client is very intoxicated'),
        (179, 148, '15:30:00', '2021-04-12', 'Vitals are great but his jokes are greater.');


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
        UPDATE	tblPeople
        SET		FirstName = UPPER (FirstName);

        UPDATE	tblPeople
        SET		LastName = UPPER (LastName);

        select * from tblPeople


    --> Add new attribute 'YearRecruited' into tblNurses to help with calculating total costs later
        ALTER TABLE tblNurses
        ADD	   YearRecruited  varchar(4);


    --> Add values for 'YearRecruited' attribute in tblNurses
        UPDATE tblNurses
        SET	   YearRecruited = '2018'
        WHERE  NurseID = 176;

        UPDATE tblNurses
        SET	   YearRecruited = '2019'
        WHERE  NurseID = 177
        OR	   NurseID = 178;

        UPDATE tblNurses
        SET	   YearRecruited = '2020'
        WHERE  NurseID = 179;

        UPDATE tblNurses
        SET	   YearRecruited = '2020'
        WHERE  NurseID = 180;


    --> Change data type for attribute PayRate in the tblNurses from INTEGER to FLOAT with 2 decimal places
        ALTER TABLE tblNurses
        ALTER COLUMN NursePayRate FLOAT(2);

        select * from tblNurses;


    GO

/*******************************************************************************/
/*			END OF BLOCK TO CREATE THE SILVERTOP DATABASE					   */
/*******************************************************************************/




/*******************************************************************************/
/*					10 BUSINESS DATA RETRIEVAL QUERIES						   */
/*******************************************************************************/


----------------------------------------------------------------------------------
-- 1st Business Needs: REDUCE FALLING RISK AND IMPROVE CLIENTS' SAFETY AT HOME	--
--					(addressed by Business Questions 1 - 3)					    --
----------------------------------------------------------------------------------



-- 1. BUSINESS QUESTION 1 (Ref BR1)
    --> How many accidents happened so far for each client?
    --> SHOW:	AccidentReportID, ClientID, NurseID, AccidentDate, AccidentTime, AccidentDescription, Count of Accidents per client
    -- 			Label the count of accidents as Count Of Accidents
    --			Display results in descending order by count of accidents per client, then in descending order by AccidentDate.

        SELECT	AccidentReportID, ar.ClientID, NurseID, AccidentDate, AccidentTime, AccidentDescription, [Count of Accidents]
        FROM	tblAccidentReports ar
        JOIN	(	SELECT		ClientID,   COUNT (AccidentReportID) [Count of Accidents]
                    FROM		tblAccidentReports
                    GROUP BY	ClientID
                )	accident_count   ON	    accident_count.ClientID  =	ar.ClientID
        ORDER BY	[Count of Accidents]    DESC,  AccidentDate DESC;



-- 2. BUSINESS QUESTION 2: (Ref BR1) Queries about deceased clients

    --> The supervisor heard about some client's passing and his name sounds like 'Job'? What's the clientID and full name of this client?
    --> What kind of accident happened to this client? When and where did it happen?
    --> SHOW:	ClientID, FirstName, LastName, AccidentDescription, AccidentDate, AccidentTime, AccidentLocation

    --> Did he have any complaints about his caregivers? What exactly did he complain about?
    --> SHOW:	ClientID, FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate

    --> Provide information about all the deceased clients so far.
    --> SHOW:	ClientID, FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate


        GO

        CREATE VIEW vw_deceased_client AS	--	creating view for all the information about this deceased client, privacy purposes

        SELECT	ar.ClientID, FirstName, LastName, AccidentDescription, AccidentDate, AccidentTime, AccidentLocation
        FROM	tblAccidentReports ar
        JOIN	tblPeople p ON ar.ClientID = p.PeopleID
        WHERE	FirstName LIKE '%job%'
        OR		LastName  LIKE '%job%';

        GO

        SELECT * FROM vw_deceased_client	--	This is the information we found about this specific client


    --	Search into his reviews about the caregivers who worked for him:
        SELECT	cs.ClientID,	FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate
        FROM	tblCareServices cs
        JOIN	tblPeople p		ON	 cs.ClientID = p.PeopleID
        WHERE	cs.ClientID		=	(SELECT ClientID FROM vw_deceased_client);


    --> Provide information about all the deceased clients so far.
    --> SHOW:	ClientID, FirstName, LastName, CaregiverID, DateOfService, ClientReview, NumOfHours, HrBillRate

    --  We can use Correlated Subquery, but will replace it with a JOIN to a temporary table because correlated subquery is suboptimal.
        SELECT		DISTINCT cs.ClientID, p.FirstName, p.LastName, Deceased, [Loss Of Revenue for Silver Top]
        FROM		tblCareServices cs
        JOIN		tblPeople p ON cs.ClientID = p.PeopleID
        JOIN		(	SELECT	 ClientID,  Deceased
                        FROM	 tblClients c
                        JOIN	 tblPeople  p ON c.ClientID = p.PeopleID
                        WHERE	 Deceased   = 'yes')	deceased_clients
                    ON	deceased_clients.ClientID = cs.ClientID
        JOIN		(	SELECT   ClientID,  SUM (NumOfHours * HrBillRate) [Loss Of Revenue for Silver Top]
                        FROM	 tblCareServices cs
                        GROUP BY ClientID)  lor
                    ON	cs.ClientID = lor.ClientID
        ORDER BY	LastName ASC;



-- 3. BUSINESS QUESTION 3 (Ref BR2)
    --> Are there any caregivers who take care of more than five clients in 2021?
    --> SHOW: CaregiverID, Number of Clients each Caregiver provides care service. Each row in the results should be unique.

        SELECT		DISTINCT cs.CaregiverID, ClientNoPerCaregiver
        FROM		tblCareServices cs
        JOIN		(	SELECT		CaregiverID,	 COUNT (ClientID) ClientNoPerCaregiver
                        FROM		tblCareServices
                        GROUP BY	CaregiverID
                        HAVING		COUNT (ClientID) >= 5
                    )	client_count
                    ON	client_count.CaregiverID = cs.CaregiverID
        WHERE		YEAR(DateOfService) = 2021
        ORDER BY	ClientNoPerCaregiver;




-------------------------------------------------------------------------------------------
-- 2nd Business Needs: RECRUIT CAREGIVERS EFFECTIVELY AND INCREASE THE NUMBER OF CLIENTS --
--							(addressed by Business Questions 4 - 6)						 --
-------------------------------------------------------------------------------------------


-- 4. BUSINESS QUESTION 4 (Ref BR3)
    --> We have a new client named Marianne Costa. The coordinator wants to find out her ClientID and zip code, whether
    --  we have any caregivers in this client's zip code, and whether the caregiver have a car to drive to the client𠏋 home. This
    --  would help the coordinator to decide whether she needs to recruit a new caregiver for this new client, and how to coordinate the
    --  work schedule for caregivers to come and provide care for this client.

        SELECT PeopleID, HomeAddress
        FROM   tblPeople
        WHERE  FirstName = 'Marianne'
        AND    LastName  = 'Costa';
        -->	   From this we found out that her zip code is 01522

        SELECT c.CaregiverID,  FirstName, LastName, HomeAddress, tm.TransportMode
        FROM   tblCaregivers		  c
        JOIN   tblPeople			  p	 ON c.CaregiverID      = p.PeopleID
        JOIN   tblCaregiverTransports ct ON ct.CaregiverID     = c.CaregiverID
        JOIN   tblTransportModes      tm ON tm.TransportModeID = ct.TransportMode
        WHERE  HomeAddress     LIKE  '% 01522';
        -->    Luckily, we found two caregivers who live in zip code 01522. CaregiverID 186 and CaregiverID 189.
        -->    However, these two caregivers depend on bus and bike to go to work. Not the best. But it should work, though.



-- 5. BUSINESS QUESTION 5 (Ref BR3)
    --> What languages can clients speak but the caregivers can't?
    --  (It means that we need to hire new caregivers who can speak these languages.)

    --  First we need to update the Language for some people to make it consistent before joining tables
        UPDATE  tblPeople
        SET		[Language] = 'English, Spanish'
        WHERE   [Language] = 'Spanish, a little English';


        SELECT		*
        FROM		(  SELECT	DISTINCT p.[Language] AS client_language
                       FROM		tblPeople p
                       JOIN		tblClients c ON p.PeopleID = c.ClientID
                    )  AS client_lang

        FULL JOIN	(  SELECT	DISTINCT [Language]	  AS caregiver_language
                       FROM		tblPeople p
                       JOIN		tblCaregivers cg ON p.PeopleID = cg.CaregiverID
                    )  AS caregiver_lang
                    ON caregiver_lang.[caregiver_language] = client_lang.[client_language]

        WHERE		caregiver_language IS NULL ;



-- 6. BUSINESS QUESTION 6 (Ref BR3)
    --> How many caregivers did each coordinator recruit, give training, evaluate or collect timesheets?
    --> SHOW:	CoordinatorID, TaskDescription, CaregiverID

        SELECT	cd_hr.CoordinatorID, TaskDescription, CaregiverID
        FROM	tblCoord_HRTasks cd_hr
        JOIN	tblHrTasks       hr_t  ON hr_t.HRTaskID = cd_hr.HRTaskID
        JOIN	tblCaregivers    c	   ON cd_hr.CoordinatorID = c.CoordinatorID;


    --> Who are the top three coordinators who deal with the most caregivers?
        SELECT   TOP 3 CoordinatorID, COUNT (CaregiverID) AS [CaregiverNumberPerCoordinator]
        FROM	 tblCaregivers
        GROUP BY CoordinatorID
        ORDER BY CaregiverNumberPerCoordinator DESC;



-----------------------------------------------------------------------------------------------
-- 3nd Business Needs: IMPROVE FINANCIAL REPORT SYSTEM (MORE EFFICIENT, TRANSPARENT FINANCE) --
--					(addressed by Business Questions 7 - 10)								 --
-----------------------------------------------------------------------------------------------


-- 7. BUSINESS QUESTION 7 (Ref BR4)
    --> How much money does Silver Top get from the insurance companies for each Client in total, based on the hourly bill rate
    --  and number of hours for each client?

    --> SHOW: ClientID, Sum of HrBillRate * NumOfHours grouped by ClientID (alias: TotalBillPerClient)

        SELECT	 ClientID, SUM (HrBillRate * NumOfHours) OVER(PARTITION BY ClientID) AS TotalBillPerClient
        FROM	 tblCareServices
        ORDER BY ClientID;



-- 8. BUSINESS QUESTION 8 (Ref BR5)
    -->	How much does each caregiver earn per hour and compare their rates with average pay rate, minimum rate, and maximum rate?
    --  What percentage caregivers earn more than the average pay rate, using two decimal places

    --> SHOW:	CaregiverID, FirstName, LastName, HrPayRate, average HrPayRate, percentage of the difference, Min HrPayRate, Max HrPayRate
    -- 			Show only for those caregivers that have their hourly payrate greater than the average rate for all caregivers

    --  Before doing the calculation, we need to update the HrPayRate data type in the tblCaregivers table from INTEGER into FLOAT
    --  with two decimal values.
        ALTER TABLE		tblCaregivers
        ALTER COLUMN	HrPayRate		FLOAT(2); 	-- (2) means it will show two decimal places


        SELECT		c.CaregiverID, FirstName, LastName, HrPayRate				,
                    ROUND	(	(SELECT AVG (HrPayRate)
                                 FROM tblCaregivers), 2
                            )	 AS AverageHrPayRate							,	-- round the AverageHrPayRate to 2 decimal places
                    ROUND	(
                            (	(HrPayRate - (SELECT AVG (HrPayRate)
                                              FROM tblCaregivers)
                                )			/ (SELECT AVG (HrPayRate)
                                              FROM tblCaregivers) * 100
                            ), 2
                            )	 AS PercentHigherThanAvg						,	-- round the PercentHigherThanAvg to 2 decimal places
                    (SELECT MIN (HrPayRate)	FROM tblCaregivers) MinHrPayRate	,
                    (SELECT MAX (HrPayRate) FROM tblCaregivers) MaxHrPayRate
        FROM		tblCaregivers c
        JOIN		tblPeople	  p	 ON c.CaregiverID = p.PeopleID
        WHERE		HrPayRate	  >	 (SELECT AVG (HrPayRate) FROM tblCaregivers)
        ORDER BY	HrPayRate;



-- 9. BUSINESS QUESTION 9 (Ref BR5)
    --> Are there any cases the rates we pay for caregivers are higher than the rates we bill the insurance companies for their corresponding
    --  clients? Warning if that happens.
    --> SHOW:	CareServiceID, DateOfService, 'We''re paying for caregiver more than what we bill our client's insurance company!' Warning for any case like that

        SELECT	CareServiceID, DateOfService, 'We''re paying for caregiver more than what we bill our client''s insurance company!' Warning
        FROM	tblCaregivers c
        JOIN	tblCareServices cs ON c.CaregiverID = cs.CaregiverID
        WHERE	EXISTS (SELECT	*
                        FROM	tblCaregivers c
                        JOIN	tblCareServices cs ON c.CaregiverID = cs.CaregiverID
                        WHERE	HrBillRate < HrPayRate
                        );



-- 10. BUSINESS QUESTION 10 (Ref BR5)
    --> This question is for the company's financial report on their money outflows. What is the average sum of hourly pay rate for caregivers
    --  and for nurses for each Date Of Service in the most recent year, if a client meets with caregiver as frequently as they meet nurses?
    --  Smooth it out by calculating 7 rows and 30 rows rolling average of this combined hourly pay rate.

    --  Create view to calculate the total number of clients Silver Top provides care service in the most recent year. Creating this view
    --  vw_count_clients will help hide complexity (We don't have to write the same query over and over again everytime the number of clients
    --  changes, which can easily introduces bugs)

        GO

        CREATE VIEW vw_count_clients	AS
        SELECT		COUNT(ClientID)		AS	[Total Clients In 2021]
        FROM		tblCareServices
        WHERE		YEAR(DateOfService) =	(SELECT MAX(YEAR(DateOfService)) FROM tblCareServices);

        GO

        select * from vw_count_clients


    --  NursePayRate in the data is for annual rate. In order to get an hourly rate for nurses, we need to divide the annual rate
    --  for 12 months, 4.3 weeks/month, 40 hours/week, and total number of clients (from the view vw_count_clients).

        SELECT  DateOfService, HrPayRate +		NursePayRate/12/4.3/40/(SELECT * FROM vw_count_clients) AS CaregiverNursePayRate,
                AVG	(HrPayRate			 +		NursePayRate/12/4.3/40/(SELECT * FROM vw_count_clients))
                    OVER(ORDER BY DateOfService ASC ROWS 6 PRECEDING) '7-row Average',
                AVG	(HrPayRate			 +		NursePayRate/12/4.3/40/(SELECT * FROM vw_count_clients))
                    OVER(ORDER BY DateOfService ASC ROWS BETWEEN CURRENT ROW AND 29 FOLLOWING) '30-row Average'
        FROM	tblCaregivers			 c
        JOIN	tblCareServices			 cs		ON c.CaregiverID = cs.CaregiverID
        JOIN	tblNurseVisitReports	 nvr	ON nvr.ClientID = cs.ClientID
        JOIN	tblNurses				 n		ON n.NurseID = nvr.NurseID
        WHERE	YEAR(DateOfService)		 =		(SELECT MAX(YEAR(DateOfService)) FROM tblCareServices);



----------------------------------------------------------------------------------
--		TURN ON THE TIMER THAT SHOWS THE DURATION OF PROCESSES					--
----------------------------------------------------------------------------------

        SET STATISTICS TIME ON -- This prepares the Studio to show the time difference between queries over unindexed and indexed fields.
        GO


    -- business question 2 had elapsed time = 12 ms before using indexes. It reduced to 0 ms after using indexes.
    -- Note: every time we ran this query again, the value of elapsed time changed, and the elapsed time always reduces after using indexes

        SELECT		DISTINCT cs.ClientID, p.FirstName, p.LastName, Deceased, [Loss Of Revenue for Silver Top]
        FROM		tblCareServices cs
        JOIN		tblPeople p  ON cs.ClientID = p.PeopleID
        JOIN		(	SELECT	 ClientID,  Deceased
                        FROM	 tblClients c
                        JOIN	 tblPeople  p ON c.ClientID = p.PeopleID
                        WHERE	 Deceased   = 'yes')	deceased_clients
                    ON	deceased_clients.ClientID = cs.ClientID
        JOIN		(	SELECT   ClientID,  SUM (NumOfHours * HrBillRate) [Loss Of Revenue for Silver Top]
                        FROM	 tblCareServices cs
                        GROUP BY ClientID)	lor
                    ON	cs.ClientID = lor.ClientID
        ORDER BY	LastName ASC;



    -- business question 4 has elapsed time = 3 ms before using indexes. It reduced to 0 ms after using indexes.
    -- (every time we ran this query again, the elapsed time changed, and it always reduces after using indexes)

        SELECT c.CaregiverID,  FirstName, LastName, HomeAddress, tm.TransportMode
        FROM   tblCaregivers		  c
        JOIN   tblPeople			  p	 ON c.CaregiverID      = p.PeopleID
        JOIN   tblCaregiverTransports ct ON ct.CaregiverID     = c.CaregiverID
        JOIN   tblTransportModes      tm ON tm.TransportModeID = ct.TransportMode
        WHERE  HomeAddress     LIKE  '% 01522';



    -- business question 5 has elapsed time = 6 ms before using indexes. It reduced to 0 ms after using indexes.
    -- (every time we ran this query again, the elapsed time changed, and it always reduces after using indexes)

        SELECT		*
        FROM		(  SELECT	DISTINCT p.[Language] AS client_language
                       FROM		tblPeople p
                       JOIN		tblClients c ON p.PeopleID = c.ClientID
                    )  AS		client_lang

        FULL JOIN	(  SELECT	DISTINCT [Language]	  AS caregiver_language
                       FROM		tblPeople p
                       JOIN		tblCaregivers cg	  ON p.PeopleID = cg.CaregiverID
                    )  AS		caregiver_lang
                    ON caregiver_lang.[caregiver_language] = client_lang.[client_language]

        WHERE		caregiver_language IS NULL ;



-- Create three indexes to improve the performance of the queries in Business Questions 2, 4, and 5
-- Indexing tblPeople over non-key attributes: FirstName, LastName, and Language

-------------------------------------------------------------------------------------------------
--		CREATE INDEX    Index Name                  ON		Table Name      (Attribute Name)  --
-------------------------------------------------------------------------------------------------

        CREATE INDEX	ndx_TblPeople_FirstName		ON		tblPeople		(FirstName)		;
        CREATE INDEX	ndx_TblPeople_LastName		ON		tblPeople		(LastName)		;
        CREATE INDEX	ndx_TblPeople_Language		ON		tblPeople		([Language])	;

        GO

    -- Foreign keys are not automatically indexed
    -- Non-key fields are not automatically indexed
    -- Speed up joins and searching for FirstName, LastName, and Language in Question 2, 4, 5 by indexing tblPeople over those non-key attributes