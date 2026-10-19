--Q1 — Active Advanced Courses
SELECT CourseCode, Title, TrainingHours, Level
FROM Course
WHERE Level = 'Advanced'
AND Status = 'Active'
ORDER BY TrainingHours DESC;

--Q2 — Trainees باستخدام Pattern Matching
SELECT TraineeID, FullName, Email
FROM Trainee
WHERE FullName LIKE '%a%';

--Q3 — Trainees حسب Registration Date
SELECT TraineeID, FullName, RegistrationDate
FROM Trainee
WHERE RegistrationDate
BETWEEN '2026-08-01' AND '2026-08-31'
ORDER BY RegistrationDate;

--Q4 — Active/Open Offerings مع Course وInstructor
SELECT
    CourseOffering.OfferingID,
    Course.Title,
    Instructor.FullName,
    CourseOffering.Term,
    CourseOffering.StartDate,
    CourseOffering.Status
FROM CourseOffering
INNER JOIN Course
    ON CourseOffering.CourseCode = Course.CourseCode
LEFT JOIN Instructor
    ON CourseOffering.InstructorID = Instructor.InstructorID
WHERE CourseOffering.Status IN ('Open', 'In Progress');

--Q5 — Trainee + Course + Term
SELECT
    Trainee.FullName AS TraineeName,
    Course.Title AS CourseTitle,
    CourseOffering.Term,
    Enrollment.Status
FROM Enrollment
INNER JOIN Trainee
    ON Enrollment.TraineeID = Trainee.TraineeID
INNER JOIN CourseOffering
    ON Enrollment.OfferingID = CourseOffering.OfferingID
INNER JOIN Course
    ON CourseOffering.CourseCode = Course.CourseCode;

    --Q6 — جميع المتدربين حتى الذين لم يسجلوا
    SELECT
    Trainee.TraineeID,
    Trainee.FullName,
    Enrollment.EnrollmentID
FROM Trainee
LEFT JOIN Enrollment
    ON Trainee.TraineeID = Enrollment.TraineeID
ORDER BY Trainee.TraineeID;

--Q7 — Instructors بدون Current Assignment
SELECT
    Instructor.InstructorID,
    Instructor.FullName
FROM Instructor
LEFT JOIN CourseOffering
    ON Instructor.InstructorID = CourseOffering.InstructorID
WHERE CourseOffering.OfferingID IS NULL;

---------
INSERT INTO Instructor
    (FullName, ContactInfo, Specialization, EmploymentDate, Status, DepartmentID)
VALUES
    ('Hani Ibrahim',
     'hani@ttc.com / 0599001006',
     'Artificial Intelligence',
     '2024-01-15',
     'Active',
     1);
--Q8 — عدد المتدربين في كل Offering
SELECT
    CourseOffering.OfferingID,
    Course.Title,
    COUNT(Enrollment.EnrollmentID) AS NumberOfTrainees
FROM CourseOffering
INNER JOIN Course
    ON CourseOffering.CourseCode = Course.CourseCode
LEFT JOIN Enrollment
    ON CourseOffering.OfferingID = Enrollment.OfferingID
GROUP BY
    CourseOffering.OfferingID,
    Course.Title;

--Q9 — Offerings التي لديها أكثر من متدربين
SELECT
    CourseOffering.OfferingID,
    Course.Title,
    COUNT(Enrollment.EnrollmentID) AS NumberOfTrainees
FROM CourseOffering
INNER JOIN Course
    ON CourseOffering.CourseCode = Course.CourseCode
LEFT JOIN Enrollment
    ON CourseOffering.OfferingID = Enrollment.OfferingID
GROUP BY
    CourseOffering.OfferingID,
    Course.Title
HAVING COUNT(Enrollment.EnrollmentID) > 1;

--Q10 — Average / Highest / Lowest Marks
SELECT
    Assessment.AssessmentID,
    Assessment.Title,
    AVG(AssessmentResult.Mark) AS AverageMark,
    MAX(AssessmentResult.Mark) AS HighestMark,
    MIN(AssessmentResult.Mark) AS LowestMark
FROM Assessment
INNER JOIN AssessmentResult
    ON Assessment.AssessmentID = AssessmentResult.AssessmentID
GROUP BY
    Assessment.AssessmentID,
    Assessment.Title;

--Q11 — Trainees فوق متوسط Assessment معين
SELECT
    Trainee.FullName,
    AssessmentResult.Mark
FROM AssessmentResult
INNER JOIN Trainee
    ON AssessmentResult.TraineeID = Trainee.TraineeID
WHERE AssessmentResult.AssessmentID = 1
AND AssessmentResult.Mark >
(
    SELECT AVG(Mark)
    FROM AssessmentResult
    WHERE AssessmentID = 1
);

--Q12 — Course Prerequisites
SELECT
    Course.Title AS Course,
    Prerequisite.Title AS PrerequisiteCourse
FROM CoursePrerequisite
INNER JOIN Course
    ON CoursePrerequisite.CourseCode = Course.CourseCode
INNER JOIN Course AS Prerequisite
    ON CoursePrerequisite.PrerequisiteCourseCode =
       Prerequisite.CourseCode;

--Q13 — UNION
SELECT FullName
FROM Trainee

UNION

SELECT FullName
FROM Instructor;

--Q14 — INTERSECT
SELECT TraineeID
FROM Enrollment
WHERE OfferingID = 1

INTERSECT

SELECT TraineeID
FROM Enrollment
WHERE OfferingID = 2;

--Q15 — EXCEPT
SELECT TraineeID
FROM Enrollment
WHERE OfferingID = 1
AND Status = 'Completed'

EXCEPT

SELECT TraineeID
FROM Enrollment
WHERE OfferingID = 7
AND Status = 'Completed';

--Q16 — CROSS JOIN

SELECT
    CourseOffering.OfferingID,
    Course.Title,
    Room.RoomCode,
    Room.RoomType
FROM CourseOffering
INNER JOIN Course
    ON CourseOffering.CourseCode = Course.CourseCode
CROSS JOIN Room
WHERE CourseOffering.Status = 'Planned';

