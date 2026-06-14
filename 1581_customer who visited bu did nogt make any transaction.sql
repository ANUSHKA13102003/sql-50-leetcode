# 1581. Customer Who Visited but Did Not Make Any Transactions

## Approach
This solution uses a `LEFT JOIN` to retain all customer visits from the `Visits` table while matching corresponding records from the `Transactions` table.

Visits that did not result in a transaction will have `NULL` values in the joined transaction columns. By filtering these rows and grouping the results by `customer_id`, we can count the number of visits where no transaction was made.

## SQL Solution

```sql
SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;