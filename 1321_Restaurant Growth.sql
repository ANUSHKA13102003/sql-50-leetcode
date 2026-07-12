# 1321. Restaurant Growth

## Approach
- First, calculate the total revenue for each day by grouping records with the same `visited_on`.
- Use a window function to compute the sum of revenue over the current day and the previous 6 days (7-day rolling sum).
- Use `ROW_NUMBER()` to identify the first day where a complete 7-day window exists.
- Keep only rows with `rn >= 7`.
- Compute the 7-day average by dividing the rolling sum by `7` and rounding to two decimal places.

## SQL Query

```sql
SELECT
    visited_on,
    amount,
    ROUND(amount / 7, 2) AS average_amount
FROM (
    SELECT
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
    FROM (
        SELECT
            visited_on,
            SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
    ) t
) x
WHERE rn >= 7;
```

## Complexity Analysis
- **Time Complexity:** `O(n log n)`
- **Space Complexity:** `O(n)`