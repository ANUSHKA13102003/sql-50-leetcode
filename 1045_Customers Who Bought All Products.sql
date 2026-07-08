# 1045. Customers Who Bought All Products

## SQL
```sql
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*)
    FROM Product
);
```

## Approach
- Group by `customer_id`.
- Count distinct products bought by each customer.
- Compare with the total number of products.
- Return customers whose counts are equal.

**Time Complexity:** `O(N + M)`  
**Space Complexity:** `O(1)`

**Concepts:** `GROUP BY`, `HAVING`, `COUNT(DISTINCT)`, `Subquery`