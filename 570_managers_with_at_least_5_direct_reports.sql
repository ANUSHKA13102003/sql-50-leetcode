/*
LeetCode 570. Managers with at Least 5 Direct Reports

Approach:
1. Use a self join on Employee table.
2. Match each manager's id with employees' managerId.
3. Group by manager.
4. Count direct reports and keep only those with 5 or more.

Time Complexity: O(n)
Space Complexity: O(n)
*/

SELECT e.name
FROM Employee e
JOIN Employee emp
    ON e.id = emp.managerId
GROUP BY e.id, e.name
HAVING COUNT(emp.id) >= 5;