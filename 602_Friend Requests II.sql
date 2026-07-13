# 602. Friend Requests II: Who Has the Most Friends

## Approach
- Each accepted friend request creates a friendship between two users.
- A user can appear as either the `requester_id` or the `accepter_id`.
- Use `UNION ALL` to combine both columns into a single list of user IDs.
- Group by the user ID and count the number of occurrences to get each user's total number of friends.
- Sort the results by the friend count in descending order and return the top user.

## SQL Query

```sql
SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id AS id
    FROM RequestAccepted
) t
GROUP BY id
ORDER BY num DESC
LIMIT 1;
```

## Complexity Analysis
- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(n)`