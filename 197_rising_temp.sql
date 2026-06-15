SQL Solution
SELECT w1.id
FROM Weather w1
JOIN Weather w2
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
Explanation

This solution uses a self-join to compare each day's temperature with the temperature from the previous day.

w1 represents the current day's record.
w2 represents the previous day's record.
DATEDIFF(w1.recordDate, w2.recordDate) = 1 ensures that the dates are exactly one day apart.
w1.temperature > w2.temperature filters only those records where the temperature increased compared to the previous day.