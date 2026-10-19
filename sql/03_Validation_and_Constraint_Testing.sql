----1----------
INSERT INTO Trainee
    (FullName, Gender, DateOfBirth, Email, Phone, Qualification, RegistrationDate)
VALUES
    ('Validation Test', 'Male', '2005-05-10',
     'validation@test.com', '0599000000',
     'High School', '2026-09-24');

--------2--------------------------------------------------------------
INSERT INTO Trainee
    (FullName, Gender, DateOfBirth, Email, Phone, Qualification, RegistrationDate)
VALUES
    ('Duplicate Email Test', 'Male', '2004-01-01',
     'mohammad@gmail.com', '0598111111',
     'High School', '2026-09-01');
----------3------------------------------------------------------------
INSERT INTO Enrollment
    (TraineeID, OfferingID, EnrollmentDate, Status)
VALUES
    (999, 1, '2026-09-24', 'Registered');
----------4------------------------------------------------------------
INSERT INTO Trainee
    (FullName, Gender, DateOfBirth, Email, Phone, Qualification, RegistrationDate)
VALUES
    (NULL, 'Male', '2004-01-01',
     'nulltest@test.com', '0598111111',
     'High School', '2026-09-24');
---------------5-------------------------------------------------------
INSERT INTO Course
    (CourseCode, Title, Description, TrainingHours, Level, Status, DepartmentID)
VALUES
    ('TEST999',
     'Invalid Course',
     'Validation Test',
     -10,
     'Beginner',
     'Active',
     1);
----------------6------------------------------------------------------
INSERT INTO Enrollment
    (TraineeID, OfferingID, EnrollmentDate, Status)
VALUES
    (1, 1, '2026-09-24', 'Registered');
----------------7------------------------------------------------------
INSERT INTO CoursePrerequisite
    (CourseCode, PrerequisiteCourseCode)
VALUES
    ('CS101', 'CS101');

----------------8------------------------------------------------------
INSERT INTO AssessmentResult
    (AssessmentID, TraineeID, Mark)
VALUES
    (1, 1, -5);
----------------9------------------------------------------------------
SELECT
    AssessmentResult.ResultID,
    AssessmentResult.AssessmentID,
    AssessmentResult.TraineeID,
    AssessmentResult.Mark,
    Assessment.MaxMark
FROM AssessmentResult
INNER JOIN Assessment
    ON AssessmentResult.AssessmentID = Assessment.AssessmentID
WHERE AssessmentResult.Mark > Assessment.MaxMark;
----------------10------------------------------------------------------
SELECT
    AssessmentResult.ResultID,
    AssessmentResult.TraineeID,
    Assessment.AssessmentID,
    Assessment.OfferingID
FROM AssessmentResult
INNER JOIN Assessment
    ON AssessmentResult.AssessmentID = Assessment.AssessmentID
LEFT JOIN Enrollment
    ON AssessmentResult.TraineeID = Enrollment.TraineeID
    AND Assessment.OfferingID = Enrollment.OfferingID
WHERE Enrollment.EnrollmentID IS NULL;