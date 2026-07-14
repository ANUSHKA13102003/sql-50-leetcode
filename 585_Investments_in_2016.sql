# 585. Investments in 2016

## Approach
- We need to calculate the total `tiv_2016` for policyholders who satisfy both conditions:
  1. Their `tiv_2015` value appears more than once.
  2. Their location `(lat, lon)` is unique.
- Use a subquery with `GROUP BY` and `HAVING COUNT(*) > 1` to find duplicated `tiv_2015` values.
- Use another subquery with `GROUP BY lat, lon` and `HAVING COUNT(*) = 1` to find unique locations.
- Filter records that satisfy both conditions and compute the sum of `tiv_2016`.
- Round the final answer to two decimal places.

## SQL Query

```sql
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
```

## Complexity Analysis
- **Time Complexity:** `O(n log n)`
- **Space Complexity:** `O(n)`