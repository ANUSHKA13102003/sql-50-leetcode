# 1341. Movie Rating

## Approach
The result consists of two rows:

1. Find the user who submitted the **most ratings**.
   - Join `Users` and `MovieRating`.
   - Group by user.
   - Sort by the number of ratings in descending order.
   - If there is a tie, choose the lexicographically smaller name.

2. Find the movie with the **highest average rating in February 2020**.
   - Join `Movies` and `MovieRating`.
   - Filter ratings from `2020-02`.
   - Group by movie.
   - Sort by average rating in descending order.
   - If there is a tie, choose the lexicographically smaller title.

3. Combine both results using `UNION ALL`.

## SQL Query

```sql
(
SELECT u.name AS results
FROM Users u
JOIN MovieRating mr
ON u.user_id = mr.user_id
GROUP BY u.user_id, u.name
ORDER BY COUNT(*) DESC, u.name
LIMIT 1
)

UNION ALL

(
SELECT m.title AS results
FROM Movies m
JOIN MovieRating mr
ON m.movie_id = mr.movie_id
WHERE DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
GROUP BY m.movie_id, m.title
ORDER BY AVG(mr.rating) DESC, m.title
LIMIT 1
);
```

## Complexity Analysis
- **Time Complexity:** `O(n)`
- **Space Complexity:** `O(n)`