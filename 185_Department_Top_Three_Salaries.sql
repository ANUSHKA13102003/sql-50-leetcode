# 185. Department Top Three Salaries

## Problem
Find the employees who are among the top three highest-paid employees in each department.

## Approach
- Rank employees within each department using the `DENSE_RANK()` window function based on salary in descending order.
- `DENSE_RANK()` assigns the same rank to employees with the same salary.
- Filter employees whose rank is less than or equal to `3`.
- Join the `Department` table to retrieve the department name.
- Return the department name, employee name, and salary.

## SQL Query

```sql
SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT *,
           DENSE_RANK() OVER (
               PARTITION BY departmentId
               ORDER BY salary DESC
           ) AS rnk
    FROM Employee
) e
JOIN Department d
ON e.departmentId = d.id
WHERE rnk <= 3;
```

## Complexity Analysis

- **Time Complexity:** `O(n log n)`
- **Space Complexity:** `O(n)`

## Key SQL Concepts
- Window Functions
- `DENSE_RANK()`
- `PARTITION BY`
- `ORDER BY`
- Subqueries
- `INNER JOIN`