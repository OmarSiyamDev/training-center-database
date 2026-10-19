USE TechnicalTrainingCenterDB;
GO


/* =========================================================
   1. INSERT INTO Department
   ========================================================= */

INSERT INTO Department
    (DepartmentName, Description, CoordinatorInstructorID)
VALUES
    ('Computer Engineering', 'Programming and computer engineering training', NULL),
    ('Information Technology', 'Information technology and networking training', NULL),
    ('Digital Media', 'Design and multimedia training', NULL);
GO


/* =========================================================
   2. INSERT INTO Instructor
   ========================================================= */

INSERT INTO Instructor
    (FullName, ContactInfo, Specialization, EmploymentDate, Status, DepartmentID)
VALUES
    ('Ahmad Khalil', 'ahmad@ttc.com / 0599001001', 'Software Engineering',
        '2021-02-15', 'Active', 1),

    ('Sara Nasser', 'sara@ttc.com / 0599001002', 'Database Systems',
        '2022-09-01', 'Active', 1),

    ('Omar Hamdan', 'omar@ttc.com / 0599001003', 'Computer Networks',
        '2020-01-10', 'Active', 2),

    ('Lina Saleh', 'lina@ttc.com / 0599001004', 'Cyber Security',
        '2023-03-20', 'Active', 2),

    ('Rami Hassan', 'rami@ttc.com / 0599001005', 'Graphic Design',
        '2019-07-01', 'Active', 3);
GO


/* =========================================================
   3. UPDATE Department Coordinators
   ========================================================= */

UPDATE Department
SET CoordinatorInstructorID = 1
WHERE DepartmentID = 1;

UPDATE Department
SET CoordinatorInstructorID = 3
WHERE DepartmentID = 2;

UPDATE Department
SET CoordinatorInstructorID = 5
WHERE DepartmentID = 3;
GO


/* =========================================================
   4. INSERT INTO Course
   ========================================================= */

INSERT INTO Course
    (CourseCode, Title, Description, TrainingHours, Level, Status, DepartmentID)
VALUES
    ('CS101', 'Programming Fundamentals',
        'Introduction to programming concepts', 40, 'Beginner', 'Active', 1),

    ('CS201', 'Object Oriented Programming',
        'Object oriented programming using C#', 50, 'Intermediate', 'Active', 1),

    ('CS301', 'Advanced Database Systems',
        'Advanced SQL and database management', 60, 'Advanced', 'Active', 1),

    ('CS401', 'Web Development',
        'Modern web development fundamentals', 55, 'Advanced', 'Active', 1),

    ('IT101', 'Computer Networks',
        'Introduction to computer networking', 45, 'Intermediate', 'Active', 2),

    ('IT201', 'Cyber Security',
        'Fundamentals of cyber security', 50, 'Advanced', 'Active', 2),

    ('DM101', 'Graphic Design',
        'Fundamentals of digital graphic design', 35, 'Beginner', 'Active', 3),

    ('DM201', 'Video Editing',
        'Digital video editing techniques', 40, 'Intermediate', 'Active', 3);
GO


/* =========================================================
   5. INSERT INTO Room
   ========================================================= */

INSERT INTO Room
    (RoomCode, RoomType, Capacity, Location)
VALUES
    ('LAB-01', 'Computer Lab', 25, 'First Floor'),
    ('LAB-02', 'Computer Lab', 30, 'First Floor'),
    ('ROOM-101', 'Regular', 35, 'Second Floor'),
    ('LAB-03', 'Multimedia Lab', 20, 'Second Floor');
GO


/* =========================================================
   6. INSERT INTO CourseOffering
   ========================================================= */

INSERT INTO CourseOffering
    (CourseCode, Term, StartDate, EndDate, MaxTrainees, Status, RoomID, InstructorID)
VALUES
    ('CS101', 'Fall 2026',
        '2026-09-01', '2026-10-15', 25, 'Completed', 1, 1),

    ('CS201', 'Fall 2026',
        '2026-09-05', '2026-11-01', 25, 'In Progress', 2, 1),

    ('CS301', 'Fall 2026',
        '2026-09-10', '2026-11-20', 20, 'Open', 1, 2),

    ('CS401', 'Fall 2026',
        '2026-10-01', '2026-12-01', 20, 'Planned', NULL, NULL),

    ('IT101', 'Fall 2026',
        '2026-09-15', '2026-11-01', 30, 'In Progress', 3, 3),

    ('IT201', 'Fall 2026',
        '2026-10-05', '2026-12-05', 25, 'Open', 3, 4),

    ('DM101', 'Fall 2026',
        '2026-09-20', '2026-10-30', 20, 'Completed', 4, 5);
GO


/* =========================================================
   7. INSERT INTO Trainee
   ========================================================= */

INSERT INTO Trainee
    (FullName, Gender, DateOfBirth, Email, Phone, Qualification, RegistrationDate)
VALUES
    ('Mohammad Ali', 'Male', '2004-05-12',
        'mohammad@gmail.com', '0598000001',
        'High School', '2026-08-01'),

    ('Ahmad Yasin', 'Male', '2003-11-20',
        'ahmad@gmail.com', '0598000002',
        'High School', '2026-08-02'),

    ('Lina Omar', 'Female', '2005-02-15',
        'lina@gmail.com', '0598000003',
        'High School', '2026-08-03'),

    ('Sara Mahmoud', 'Female', '2004-08-25',
        'sara@gmail.com', '0598000004',
        'Diploma', '2026-08-04'),

    ('Khaled Samir', 'Male', '2002-12-10',
        'khaled@gmail.com', '0598000005',
        'Diploma', '2026-08-05'),

    ('Noor Hassan', 'Female', '2005-06-18',
        'noor@gmail.com', '0598000006',
        'High School', '2026-08-06'),

    ('Yousef Saleh', 'Male', '2003-03-30',
        'yousef@gmail.com', '0598000007',
        'Bachelor Degree', '2026-08-07'),

    ('Maya Nasser', 'Female', '2004-10-05',
        'maya@gmail.com', '0598000008',
        'High School', '2026-08-08');
GO


/* =========================================================
   8. INSERT INTO Enrollment
   ========================================================= */

INSERT INTO Enrollment
    (TraineeID, OfferingID, EnrollmentDate, Status)
VALUES
    (1, 1, '2026-08-20', 'Completed'),
    (2, 1, '2026-08-21', 'Completed'),
    (3, 1, '2026-08-22', 'Completed'),

    (1, 2, '2026-09-01', 'Registered'),
    (2, 2, '2026-09-02', 'Registered'),
    (4, 2, '2026-09-03', 'Registered'),

    (1, 3, '2026-09-04', 'Registered'),
    (5, 3, '2026-09-05', 'Registered'),

    (2, 5, '2026-09-10', 'Registered'),
    (6, 5, '2026-09-11', 'Registered'),

    (3, 6, '2026-09-15', 'Registered'),
    (7, 6, '2026-09-16', 'Registered'),

    (3, 7, '2026-09-17', 'Completed'),
    (4, 7, '2026-09-18', 'Completed');
GO


/* =========================================================
   9. INSERT INTO Assessment
   ========================================================= */

INSERT INTO Assessment
    (OfferingID, Title, AssessmentType, AssessmentDate, MaxMark, Weight)
VALUES
    (1, 'Programming Quiz', 'Quiz',
        '2026-09-15', 20, 20),

    (1, 'Programming Midterm', 'Midterm',
        '2026-09-30', 30, 30),

    (1, 'Programming Final', 'Final',
        '2026-10-12', 50, 50),

    (2, 'OOP Assignment', 'Assignment',
        '2026-09-20', 20, 20),

    (2, 'OOP Midterm', 'Midterm',
        '2026-10-05', 30, 30),

    (3, 'Database Project', 'Project',
        '2026-10-20', 40, 40),

    (3, 'Database Final', 'Final',
        '2026-11-15', 60, 60),

    (7, 'Design Project', 'Project',
        '2026-10-20', 100, 100);
GO


/* =========================================================
   10. INSERT INTO AssessmentResult
   ========================================================= */

INSERT INTO AssessmentResult
    (AssessmentID, TraineeID, Mark)
VALUES
    (1, 1, 18),
    (1, 2, 15),
    (1, 3, 19),

    (2, 1, 27),
    (2, 2, 22),
    (2, 3, 28),

    (3, 1, 45),
    (3, 2, 40),
    (3, 3, 47),

    (4, 1, 18),
    (4, 2, 16),
    (4, 4, 19),

    (5, 1, 25),
    (5, 2, 21),
    (5, 4, 27),

    (6, 1, 35),
    (6, 5, 32),

    (7, 1, 52),
    (7, 5, 48),

    (8, 3, 90),
    (8, 4, 85);
GO


/* =========================================================
   11. INSERT INTO CoursePrerequisite
   ========================================================= */

INSERT INTO CoursePrerequisite
    (CourseCode, PrerequisiteCourseCode)
VALUES
    ('CS201', 'CS101'),
    ('CS301', 'CS201'),
    ('CS401', 'CS201'),
    ('IT201', 'IT101'),
    ('DM201', 'DM101');
GO

SELECT * FROM Department;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Room;
SELECT * FROM CourseOffering;
SELECT * FROM Trainee;
SELECT * FROM Enrollment;
SELECT * FROM Assessment;
SELECT * FROM AssessmentResult;
SELECT * FROM CoursePrerequisite;
