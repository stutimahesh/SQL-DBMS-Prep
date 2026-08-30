SELECT t.teacher_id,
    COUNT(DISTINCT(s.subject_id)) AS unique_subjects
FROM Teachers AS t  
GROUP BY t.teacher_id