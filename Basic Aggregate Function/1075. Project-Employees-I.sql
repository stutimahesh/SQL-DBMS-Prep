SELECT p.project_id,
    ROUND(SUM(e.experience_years)/COUNT(e.employee_id),2) AS average_years
FROM Projects AS p
LEFT JOIN Employees AS e
ON p.emploee_id=e.employee_id
GROUP BY p.project_id