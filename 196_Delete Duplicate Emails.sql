# 196. Delete Duplicate Emails

## Solution

```sql
DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;
```

### Approach
- Use a self join to find duplicate emails.
- Delete the row with the larger `id`.
- Keep only the record with the smallest `id` for each email.

**Time Complexity:** O(n²) *(depends on indexing and optimizer)*  
**Space Complexity:** O(1)

**Language:** MySQL