use sc;
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL
);

CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL
);

CREATE TABLE Semesters (
    SemesterID INT IDENTITY(1,1) PRIMARY KEY,
    SemesterName NVARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,               
    FirstName NVARCHAR(50) NOT NULL,                       
    LastName NVARCHAR(50) NOT NULL,                        
    DateOfBirth DATE NOT NULL,                             
    Email NVARCHAR(100) UNIQUE NOT NULL,                   
    PhoneNumber NVARCHAR(15) NOT NULL,                     
    DepartmentID INT NOT NULL,                              -- Foreign key reference to Departments
    EnrollmentDate DATE DEFAULT GETDATE(),                  
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Courses (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    CourseName NVARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID INT NOT NULL,                             -- Foreign key reference to Departments
    CategoryID INT NOT NULL,                               -- Foreign key reference to Categories
    SemesterID INT NOT NULL,                               -- Foreign key reference to Semesters
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID)
);

CREATE TABLE StudentCourses (
    StudentCourseID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,                                -- Foreign key reference to Students
    CourseID INT NOT NULL,                                 -- Foreign key reference to Courses
    SemesterID INT NOT NULL,                               -- Foreign key reference to Semesters
    EnrollmentDate DATE DEFAULT GETDATE(),                
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID)
);

INSERT INTO Departments (DepartmentName)
VALUES 
('Computer Science'),    -- DepartmentID = 1
('Mathematics'),         -- DepartmentID = 2
('Chemistry'),           -- DepartmentID = 3
('Physics'),             -- DepartmentID = 4
('Biology'),             -- DepartmentID = 5
('Economics'),           -- DepartmentID = 6
('Electrical Engineering'), -- DepartmentID = 7
('Mechanical Engineering'), -- DepartmentID = 8
('Civil Engineering'),   -- DepartmentID = 9
('Psychology'),          -- DepartmentID = 10
('Philosophy'),          -- DepartmentID = 11
('History'),             -- DepartmentID = 12
('Sociology'),           -- DepartmentID = 13
('Political Science'),   -- DepartmentID = 14
('Business Administration'); -- DepartmentID = 15


-- Insert Categories
INSERT INTO Categories (CategoryName)
VALUES 
('Core'),               -- CategoryID = 1
('Elective'),           -- CategoryID = 2
('Lab'),                -- CategoryID = 3
('Research'),           -- CategoryID = 4
('Seminar'),            -- CategoryID = 5
('Workshop'),           -- CategoryID = 6
('Practical'),          -- CategoryID = 7
('Lecture'),            -- CategoryID = 8
('Online'),             -- CategoryID = 9
('Field Work'),         -- CategoryID = 10
('Thesis'),             -- CategoryID = 11
('Project'),            -- CategoryID = 12
('Internship'),         -- CategoryID = 13
('Independent Study'),  -- CategoryID = 14
('Directed Research');  -- CategoryID = 15

INSERT INTO Semesters (SemesterName, StartDate, EndDate)
VALUES 
('Spring 2024', '2024-01-10', '2024-05-10'),   -- SemesterID = 1
('Fall 2024', '2024-08-20', '2024-12-15'),     -- SemesterID = 2
('Winter 2024', '2024-12-20', '2025-02-15'),   -- SemesterID = 3
('Spring 2025', '2025-01-10', '2025-05-10'),   -- SemesterID = 4
('Summer 2025', '2025-06-15', '2025-08-20'),   -- SemesterID = 5
('Fall 2025', '2025-09-10', '2025-12-15'),     -- SemesterID = 6
('Winter 2025', '2025-12-20', '2026-02-15'),   -- SemesterID = 7
('Spring 2026', '2026-01-10', '2026-05-10'),   -- SemesterID = 8
('Summer 2026', '2026-06-15', '2026-08-20'),   -- SemesterID = 9
('Fall 2026', '2026-09-10', '2026-12-15'),     -- SemesterID = 10
('Winter 2026', '2026-12-20', '2027-02-15'),   -- SemesterID = 11
('Spring 2027', '2027-01-10', '2027-05-10'),   -- SemesterID = 12
('Summer 2027', '2027-06-15', '2027-08-20'),   -- SemesterID = 13
('Fall 2027', '2027-09-10', '2027-12-15'),     -- SemesterID = 14
('Winter 2027', '2027-12-20', '2028-02-15');   -- SemesterID = 15



INSERT INTO Students (FirstName, LastName, DateOfBirth, Email, PhoneNumber, DepartmentID, EnrollmentDate)
VALUES 
('John', 'Doe', '2000-05-15', 'john.doe@example.com', '123-456-7890', 1, GETDATE()),  
('Jane', 'Smith', '1999-11-22', 'jane.smith@example.com', '234-567-8901', 2, GETDATE()), 
('Alice', 'Johnson', '2001-07-30', 'alice.johnson@example.com', '345-678-9012', 3, GETDATE()), 
('Bob', 'Brown', '1998-10-20', 'bob.brown@example.com', '456-789-0123', 4, GETDATE()), 
('Charlie', 'White', '2002-01-18', 'charlie.white@example.com', '567-890-1234', 1, GETDATE()),
('Emily', 'Clark', '2000-03-25', 'emily.clark@example.com', '678-901-2345', 2, GETDATE()), 
('David', 'Lee', '2001-08-10', 'david.lee@example.com', '789-012-3456', 3, GETDATE()), 
('Sophia', 'Morris', '1999-12-11', 'sophia.morris@example.com', '890-123-4567', 4, GETDATE()), 
('James', 'Evans', '1998-04-09', 'james.evans@example.com', '901-234-5678', 1, GETDATE()), 
('Oliver', 'Scott', '2002-02-05', 'oliver.scott@example.com', '012-345-6789', 2, GETDATE()), 
('Ella', 'Taylor', '2000-09-16', 'ella.taylor@example.com', '123-890-5678', 3, GETDATE()), 
('Mia', 'Hall', '1999-05-22', 'mia.hall@example.com', '234-567-0123', 4, GETDATE()), 
('Lucas', 'Anderson', '2001-06-14', 'lucas.anderson@example.com', '345-678-9012', 1, GETDATE()), 
('Lily', 'Walker', '1998-07-19', 'lily.walker@example.com', '456-789-0123', 2, GETDATE()), 
('Aiden', 'Young', '2002-10-12', 'aiden.young@example.com', '567-890-1234', 3, GETDATE());



-- Insert Courses
INSERT INTO Courses (CourseName, Credits, DepartmentID, CategoryID, SemesterID)
VALUES 
('Introduction to Programming', 4, 1, 1, 1),  
('Linear Algebra', 3, 2, 1, 1),              
('Organic Chemistry Lab', 1, 3, 3, 2),       
('Quantum Physics', 4, 4, 2, 2),             
('Data Structures', 3, 1, 1, 1),             
('Calculus II', 4, 2, 1, 1),                
('Physical Chemistry', 4, 3, 2, 2),          
('Mechanics', 3, 4, 1, 1),                   
('Algorithms', 3, 1, 1, 1),                  
('Database Systems', 3, 1, 1, 2);

INSERT INTO StudentCourses (StudentID, CourseID, SemesterID)
VALUES 
(1, 1, 1),  -- John in Introduction to Programming (Semester 1)
(1, 4, 2),  -- John in Quantum Physics (Semester 2)
(2, 2, 1),  -- Jane in Linear Algebra (Semester 1)
(2, 3, 2),  -- Jane in Organic Chemistry Lab (Semester 2)
(3, 1, 1),  -- Alice in Introduction to Programming (Semester 1)
(3, 5, 1),  -- Alice in Data Structures (Semester 1)
(4, 6, 1),  -- Bob in Calculus II (Semester 1)
(4, 7, 2),  -- Bob in Physical Chemistry (Semester 2)
(5, 8, 1),  -- Charlie in Mechanics (Semester 1)
(5, 9, 1),  -- Charlie in Algorithms (Semester 1)
(6, 10, 2), -- Emily in Database Systems (Semester 2)
(6, 1, 1),  -- Emily in Introduction to Programming (Semester 1)
(7, 3, 2),  -- David in Organic Chemistry Lab (Semester 2)
(8, 4, 2),  -- Sophia in Quantum Physics (Semester 2)
(9, 6, 1);  -- James in Calculus II (Semester 1)



SELECT * FROM Courses;
SELECT * FROM StudentCourses;
SELECT * FROM Departments;
SELECT * FROM Categories;
SELECT * FROM Semesters;
SELECT * FROM Students;




SELECT s.FirstName, s.LastName, c.CourseName, sc.EnrollmentDate
FROM Students s
INNER JOIN StudentCourses sc ON s.StudentID = sc.StudentID
INNER JOIN Courses c ON sc.CourseID = c.CourseID
ORDER BY sc.EnrollmentDate;



Select c.CourseName,cy.CategoryName from Courses c 
join Categories cy on cy.CategoryID  = c.CategoryID;



Select sm.SemesterName,Count(c.CourseID) as Totalnumberofcourses From Courses c
inner join Semesters sm  on sm.SemesterID = c.SemesterID 
Group by sm.SemesterName;

Select d.DepartmentName,Count(s.StudentID) As Numberofstudents From Students s
inner join Departments d  on s.DepartmentID = d.DepartmentID 
Group by d.DepartmentName ;


Select s.FirstName,s.LastName from Students s
Inner Join	StudentCourses sc on s.StudentID = sc.StudentID
Inner join Semesters sm   on sc.SemesterID= sm.SemesterID
where SemesterName = 'Spring 2024';



Select s.FirstName,s.LastName,d.DepartmentName from Students s
Inner join Departments d  on s.DepartmentID = d.DepartmentID;

select s.FirstName,s.LastName,c.CourseName from StudentCourses sc 
Inner join  Students s on sc.StudentID = s.StudentID
Inner join Courses c on sc.CourseID = c.CourseID 
where c.CourseName = 'Introduction to Programming';


Select c.CourseName from Courses c 
join Departments d on c.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Computer Science';



