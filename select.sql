# 1.Query the existence of 1 course
SELECT * FROM course WHERE id = 1;

# 2.Query the presence of both 1 and 2 courses
SELECT * FROM course WHERE id = 1 OR id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT stu.id,stu.name,AVG(sc.score) AS average_score FROM student stu,student_course sc
WHERE stu.id = sc.studentId 
GROUP BY stu.id,stu.name HAVING AVG(sc.score) >= 60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student stu WHERE stu.id NOT IN (SELECT DISTINCT sc.studentId FROM student_course sc);

# 5.Query all SQL with grades
SELECT DISTINCT stu.* FROM student stu,student_course sc WHERE stu.id = sc.studentId;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT stu.* FROM student stu,student_course sc 
WHERE stu.id = sc.studentId and sc.courseId - 1 and EXISTS
(SELECT stu.* FROM student_course sc2 WHERE stu.id = sc2.studentId AND sc2.courseId = 2);

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT stu.*,sc.courseId,sc.score FROM student stu,student_course sc
WHERE stu.id = sc.studentId AND sc.courseId = 1 AND score < 60
ORDER BY sc.score DESC;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT c.*,AVG(sc.score) as average_score FROM course c,student_course sc
WHERE c.id = sc.courseId
GROUP BY c.id,c.`name`,c.teacherId
ORDER BY average_score DESC,c.id;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT stu.`name`,sc.score FROM student stu,course c,student_course sc
WHERE stu.id = sc.studentId AND c.id = sc.courseId AND c.`name` = 'Math' and sc.score < 60; 