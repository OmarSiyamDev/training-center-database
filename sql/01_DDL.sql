/* =========================================================
   Technical Training Center Management System
   SQL Server DDL
   ========================================================= */


/* =========================================================
   1. CREATE DATABASE
   ========================================================= */

CREATE DATABASE TechnicalTrainingCenterDB;
GO

USE TechnicalTrainingCenterDB;
GO


/* =========================================================
   2. DEPARTMENT
   ========================================================= */

CREATE TABLE Department
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,

    DepartmentName VARCHAR(100) NOT NULL UNIQUE,

    Description VARCHAR(500),

    CoordinatorInstructorID INT NULL
);
GO


/* =========================================================
   3. INSTRUCTOR
   ========================================================= */

CREATE TABLE Instructor
(
    InstructorID INT IDENTITY(1,1) PRIMARY KEY,

    FullName VARCHAR(150) NOT NULL,

    ContactInfo VARCHAR(200) NOT NULL,

    Specialization VARCHAR(150) NOT NULL,

    EmploymentDate DATE NOT NULL,

    Status VARCHAR(50) NOT NULL,

    DepartmentID INT NOT NULL,

    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);
GO


/* =========================================================
   4. ADD FOREIGN KEY
      Department -> Instructor
   ========================================================= */

ALTER TABLE Department
ADD FOREIGN KEY (CoordinatorInstructorID)
    REFERENCES Instructor(InstructorID);
GO


/* =========================================================
   5. COURSE
   ========================================================= */

CREATE TABLE Course
(
    CourseCode VARCHAR(20) PRIMARY KEY,

    Title VARCHAR(150) NOT NULL,

    Description VARCHAR(500),

    TrainingHours INT NOT NULL,

    Level VARCHAR(20) NOT NULL,

    Status VARCHAR(50) NOT NULL,

    DepartmentID INT NOT NULL,

    CHECK (TrainingHours > 0),

    CHECK
    (
        Level IN
        (
            'Beginner',
            'Intermediate',
            'Advanced'
        )
    ),

    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);
GO


/* =========================================================
   6. ROOM
   ========================================================= */

CREATE TABLE Room
(
    RoomID INT IDENTITY(1,1) PRIMARY KEY,

    RoomCode VARCHAR(30) NOT NULL UNIQUE,

    RoomType VARCHAR(50) NOT NULL,

    Capacity INT NOT NULL,

    Location VARCHAR(150) NOT NULL,

    CHECK (Capacity > 0)
);
GO


/* =========================================================
   7. COURSE OFFERING
   ========================================================= */

CREATE TABLE CourseOffering
(
    OfferingID INT IDENTITY(1,1) PRIMARY KEY,

    CourseCode VARCHAR(20) NOT NULL,

    Term VARCHAR(50) NOT NULL,

    StartDate DATE NOT NULL,

    EndDate DATE NOT NULL,

    MaxTrainees INT NOT NULL,

    Status VARCHAR(50) NOT NULL,

    RoomID INT NULL,

    InstructorID INT NULL,

    CHECK (EndDate > StartDate),

    CHECK (MaxTrainees > 0),

    CHECK
    (
        Status IN
        (
            'Planned',
            'Open',
            'In Progress',
            'Completed',
            'Cancelled'
        )
    ),

    FOREIGN KEY (CourseCode)
        REFERENCES Course(CourseCode),

    FOREIGN KEY (RoomID)
        REFERENCES Room(RoomID),

    FOREIGN KEY (InstructorID)
        REFERENCES Instructor(InstructorID)
);
GO


/* =========================================================
   8. TRAINEE
   ========================================================= */

CREATE TABLE Trainee
(
    TraineeID INT IDENTITY(1,1) PRIMARY KEY,

    FullName VARCHAR(150) NOT NULL,

    Gender VARCHAR(20) NOT NULL,

    DateOfBirth DATE NOT NULL,

    Email VARCHAR(150) NOT NULL UNIQUE,

    Phone VARCHAR(30) NOT NULL,

    Qualification VARCHAR(150) NOT NULL,

    RegistrationDate DATE NOT NULL
);
GO


/* =========================================================
   9. ASSESSMENT
   ========================================================= */

CREATE TABLE Assessment
(
    AssessmentID INT IDENTITY(1,1) PRIMARY KEY,

    OfferingID INT NOT NULL,

    Title VARCHAR(150) NOT NULL,

    AssessmentType VARCHAR(50) NOT NULL,

    AssessmentDate DATE NOT NULL,

    MaxMark DECIMAL(6,2) NOT NULL,

    Weight DECIMAL(5,2) NOT NULL,

    CHECK (MaxMark > 0),

    CHECK
    (
        Weight >= 0
        AND Weight <= 100
    ),

    CHECK
    (
        AssessmentType IN
        (
            'Quiz',
            'Assignment',
            'Midterm',
            'Project',
            'Final'
        )
    ),

    FOREIGN KEY (OfferingID)
        REFERENCES CourseOffering(OfferingID)
);
GO


/* =========================================================
   10. COURSE PREREQUISITE
   ========================================================= */

CREATE TABLE CoursePrerequisite
(
    CourseCode VARCHAR(20) NOT NULL,

    PrerequisiteCourseCode VARCHAR(20) NOT NULL,

    PRIMARY KEY
    (
        CourseCode,
        PrerequisiteCourseCode
    ),

    CHECK
    (
        CourseCode <> PrerequisiteCourseCode
    ),

    FOREIGN KEY (CourseCode)
        REFERENCES Course(CourseCode),

    FOREIGN KEY (PrerequisiteCourseCode)
        REFERENCES Course(CourseCode)
);
GO


/* =========================================================
   11. ENROLLMENT
   ========================================================= */

CREATE TABLE Enrollment
(
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,

    TraineeID INT NOT NULL,

    OfferingID INT NOT NULL,

    EnrollmentDate DATE NOT NULL,

    Status VARCHAR(50) NOT NULL,

    UNIQUE
    (
        TraineeID,
        OfferingID
    ),

    CHECK
    (
        Status IN
        (
            'Registered',
            'Withdrawn',
            'Completed',
            'Failed'
        )
    ),

    FOREIGN KEY (TraineeID)
        REFERENCES Trainee(TraineeID),

    FOREIGN KEY (OfferingID)
        REFERENCES CourseOffering(OfferingID)
);
GO


/* =========================================================
   12. ASSESSMENT RESULT
   ========================================================= */

CREATE TABLE AssessmentResult
(
    ResultID INT IDENTITY(1,1) PRIMARY KEY,

    AssessmentID INT NOT NULL,

    TraineeID INT NOT NULL,

    Mark DECIMAL(6,2) NOT NULL,

    UNIQUE
    (
        AssessmentID,
        TraineeID
    ),

    CHECK (Mark >= 0),

    FOREIGN KEY (AssessmentID)
        REFERENCES Assessment(AssessmentID),

    FOREIGN KEY (TraineeID)
        REFERENCES Trainee(TraineeID)
);
GO


/* =========================================================
   13. FINISH
   ========================================================= */

PRINT 'Database and all tables were created successfully.';
GO