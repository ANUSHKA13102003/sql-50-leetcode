/*
========================================================
LeetCode 1633 - Percentage of Users Attended a Contest
Difficulty: Easy
Language: SQL (MySQL)

Approach:
1. Count total number of users from Users table.
2. Group registrations by contest_id.
3. Calculate percentage of registered users:
      (registered_users / total_users) * 100
4. Round result to 2 decimal places.
5. Sort by:
   - percentage DESC
   - contest_id ASC

Time Complexity: O(N)
Space Complexity: O(1)
========================================================
*/

SELECT
    contest_id,
    ROUND(
        COUNT(user_id) * 100.0 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;