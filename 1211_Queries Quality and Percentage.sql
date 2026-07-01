/*
========================================================
LeetCode 1211 - Queries Quality and Percentage
Difficulty: Easy
Language: SQL (MySQL)
Author: Anushka
========================================================

Problem:
Calculate:
1. Query Quality = average(rating / position)
2. Poor Query Percentage = percentage of queries with rating < 3

Approach:
- Group records by query_name
- Use AVG(rating / position) for quality
- Use CASE WHEN to mark poor queries
- Convert ratio to percentage by multiplying by 100

Time Complexity: O(n)
Space Complexity: O(1)
========================================================
*/

SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(
        AVG(
            CASE
                WHEN rating < 3 THEN 1
                ELSE 0
            END
        ) * 100,
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;