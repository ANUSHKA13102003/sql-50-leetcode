# 577. Employee Bonus

## Problem
Find the name and bonus amount of each employee whose bonus is less than 1000 or who did not receive a bonus.

## Approach

- Use a LEFT JOIN to include all employees.
- Match records using empId.
- Filter employees whose:
  - bonus is less than 1000, or
  - bonus is NULL.

## SQL Solution

```sql
SELECT
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;