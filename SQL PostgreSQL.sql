DROP TABLE IF EXISTS classrooms CASCADE;
CREATE TABLE classrooms (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	teacher VARCHAR(100)
);

DROP TABLE IF EXISTS students CASCADE;
CREATE TABLE students (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	classroom_id INT,
	CONSTRAINT fk_classrooms
	FOREIGN KEY(classroom_id)
	REFERENCES classrooms(id)
);

INSERT INTO classrooms
(teacher)
VALUES
('Фролов Константин Иванович'),
('Кузнецов Илья Степанович '),
('Соколова Екатерина Михайловна ');
SELECT * FROM classrooms;

INSERT INTO students
 (name, classroom_id)
VALUES 
('Анна Попова', 2),
('Анастасия Афанасьева',3),
('Евгений Соловьев',2),
('Сергей Морозов', NULL),
('Игорь Воробьев', 1),
('Анжелика Голубева', 3),
('Наталья Орлова', 1);
SELECT * FROM students;

DROP TABLE IF EXISTS academicsubj CASCADE;
DROP TABLE IF EXISTS exam CASCADE;

CREATE TABLE academicsubj (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100)
);

CREATE TABLE exam (
	name VARCHAR(100),
	academicsubj_id INT,
	student_id INT,
	score INT,
	CONSTRAINT fk_academiccsubj
	FOREIGN KEY(academicsubj_id)
	REFERENCES academicsubj(id),
	CONSTRAINT fk_students
	FOREIGN KEY(student_id)
	REFERENCES students(id)
);

INSERT INTO academicsubj
(name)
VALUES
('Математика'),
('Информатика'),
('Физика');
SELECT * FROM academicsubj;

INSERT INTO exam 
(name, academicsubj_id, score, student_id)
VALUES
('Экзамен по математике', 1, 4, 1),
('Экзамен по математике', 1, 3, 3),
('Экзамен по информатике', 2, 5, 2),
('Экзамен по информатике', 2, 4, 6),
('Экзамен по физике', 3, 3, 5),
('Экзамен по физике', 3, 3, 7);
SELECT * FROM exam;