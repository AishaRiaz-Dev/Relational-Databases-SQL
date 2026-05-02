CREATE DATABASE LSP_Training;
USE LSP_Training;
CREATE TABLE Trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    specialization VARCHAR(30) NOT NULL,
    experience_years INT CHECK (experience_years >= 0)
);
CREATE TABLE Training_Programs (
    program_id INT AUTO_INCREMENT PRIMARY KEY,
    program_name VARCHAR(50) NOT NULL,
    duration_weeks INT CHECK (duration_weeks > 0)
);
CREATE TABLE Assignments (
    assign_id INT AUTO_INCREMENT PRIMARY KEY,
    trainer_id INT,
    program_id INT,
    session VARCHAR(10),
    performance_score INT CHECK (performance_score BETWEEN 0 AND 100),
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id),
    FOREIGN KEY (program_id) REFERENCES Training_Programs(program_id),
    CHECK (session IN ('Morning','Evening','Weekend'))
);
INSERT INTO Trainers (name, specialization, experience_years) VALUES
('Ali Raza','Database',5),
('Sara Khan','AI',7),
('Hassan Ali','Web Dev',3),
('Fatima Noor','Data Science',6),
('Ahmed Iqbal','Networking',2),
('Ayesha Malik','AI',4),
('Bilal Tariq','Database',5),
('Zara Mehmood','Web Dev',6);
INSERT INTO Training_Programs (program_name, duration_weeks) VALUES
('SQL Mastery',6),
('Python Programming',8),
('Cloud Computing',5),
('Machine Learning',7),
('Full Stack Development',10);
INSERT INTO Assignments (trainer_id, program_id, session, performance_score) VALUES
(1,1,'Morning',85),
(1,2,'Morning',79),
(2,1,'Evening',91),
(2,3,'Evening',87),
(3,2,'Morning',66),
(4,4,'Evening',92),
(4,5,'Evening',84),
(5,3,'Morning',58),
(6,4,'Morning',90),
(7,1,'Evening',73),
(7,5,'Morning',88),
(2,5,'Morning',95),
(3,1,'Evening',60),
(6,2,'Evening',80),
(4,1,'Morning',88);
SELECT name,
       (SELECT program_name 
        FROM Training_Programs 
        WHERE program_id = a.program_id) AS program_name
FROM Trainers t JOIN Assignments a ON t.trainer_id = a.trainer_id
  AND a.session = 'Morning';
  SELECT name
FROM Trainers
WHERE specialization = 'Database'
   OR experience_years > 6;
   SELECT specialization,
       (SELECT AVG(performance_score)
        FROM Assignments a
        WHERE a.trainer_id IN (
            SELECT trainer_id
            FROM Trainers t2
            WHERE t2.specialization = t.specialization
              AND t2.experience_years > 3
        )) AS avg_score
FROM Trainers t
WHERE experience_years > 3
GROUP BY specialization
ORDER BY avg_score DESC;
SELECT name,
       (SELECT performance_score
        FROM Assignments a 
        WHERE a.trainer_id = t.trainer_id
          AND performance_score > 85
        LIMIT 1) AS score
FROM Trainers t
WHERE trainer_id IN (
    SELECT trainer_id
    FROM Assignments
    WHERE performance_score > 85
);
SELECT name, specialization
FROM Trainers
WHERE experience_years BETWEEN 3 AND 6;
SELECT name
FROM Trainers
WHERE (name LIKE 'A%' OR name LIKE '%q')
  AND specialization = 'AI';
  SELECT session, COUNT(DISTINCT trainer_id) AS total_trainers
FROM Assignments
GROUP BY session;
SELECT program_name,
       (SELECT AVG(performance_score)
        FROM Assignments a
        WHERE a.program_id = p.program_id) AS avg_score
FROM Training_Programs p;
SELECT session,
       MAX(performance_score) AS max_score,
       MIN(performance_score) AS min_score
FROM Assignments
GROUP BY session;
SELECT DISTINCT session
FROM Assignments;


