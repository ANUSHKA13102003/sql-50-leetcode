# 1667. Fix Names in a Table

## Problem
Format each user's name so that:
- The first letter is uppercase.
- All remaining letters are lowercase.
- Return the result ordered by `user_id`.

## Approach
- Use `UPPER()` to capitalize the first character.
- Use `LOWER()` to convert the remaining characters to lowercase.
- Combine both parts using `CONCAT()`.
- Sort the output by `user_id`.

## SQL Query

```sql
SELECT
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;
```

## Complexity Analysis

- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(1)`

## Key SQL Concepts
- String Functions
- `UPPER()`
- `LOWER()`
- `LEFT()`
- `SUBSTRING()`
- `CONCAT()`
- `ORDER BY`