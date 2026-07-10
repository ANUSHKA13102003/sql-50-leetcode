# 1731. The Number of Employees Which Report to Each Employee

## Approach
- Self-join the `Employees` table.
- Treat one copy (`e`) as the manager and the other (`r`) as the employees reporting to that manager.
- Count the number of direct reports using `COUNT()`.
- Calculate the average age of the reporting employees using `AVG()` and round it with `ROUND()`.
- Group by the manager's ID and name.
- Sort the result by `employee_id`.

## SQL Query

```sql
SELECT
    e.employee_id,
    e.name,
    COUNT(r.employee_id) AS reports_count,
    ROUND(AVG(r.age), 0) AS average_age
FROM Employees e
JOIN Employees r
ON e.employee_id = r.reports_to
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id;
```

## Complexity Analysis
- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(n)`