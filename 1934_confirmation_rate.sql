/*
LeetCode 1934. Confirmation Rate

Problem:
Find the confirmation rate for each user.
Confirmation rate = confirmed messages / total confirmation requests.
Round the result to 2 decimal places.
If a user has no confirmation requests, return 0.

Approach:
1. Start from Signups table to include all users.
2. Use LEFT JOIN with Confirmations table.
3. Count confirmed actions using SUM(condition).
4. Divide confirmed count by total requests.
5. Use IFNULL to handle users with no requests.
6. Round result to 2 decimal places.

Time Complexity: O(n)
Space Complexity: O(n)
*/

SELECT
    s.user_id,
    ROUND(
        IFNULL(SUM(c.action = 'confirmed') / COUNT(c.action), 0),
        2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id;
