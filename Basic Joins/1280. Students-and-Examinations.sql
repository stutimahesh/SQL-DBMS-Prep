SELECT student.student_id, 
    student.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams
FROM Students AS student
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS e
ON student.student_id=e.student_id
    AND e.subject_name=sub.subject_name
GROUP BY student.student_id , student.student_name, sub.subject_name
ORDER BY student.student_id , sub.subject_name

