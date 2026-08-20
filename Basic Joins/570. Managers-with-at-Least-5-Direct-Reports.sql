SELECT manager.name
FROM Employee AS emp
JOIN Employee AS manager
ON emp.managerId=manager.id
GROUP BY emp.managerId
HAVING COUNT(emp.id) >= 5