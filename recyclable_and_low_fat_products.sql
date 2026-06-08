-- Problem: Recyclable and Low Fat Products
-- Difficulty: Easy
-- Topic: SELECT + WHERE
-- Link: https://leetcode.com/problems/recyclable-and-low-fat-products/

-- Problem statement:
-- Find products that are both low fat AND recyclable

-- My solution:
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- What I learned:
-- Simple WHERE with AND condition
-- Always filter with = 'Y' not = 1  ENUM columns