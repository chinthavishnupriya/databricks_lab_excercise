-- Databricks Lab 2: Advanced SQL Querying, Aggregations & AI Functions
-- Source guide: Databricks & Delta Lakehouse Practice Guide

USE lab_db;

CREATE OR REPLACE TABLE review_logs (
    review_id INT,
    customer_id INT,
    rating INT,
    review_text STRING
);

-- Source-guide review records
INSERT INTO review_logs VALUES
(1, 101, 5, 'Absolute best product! Fast delivery and great support.'),
(2, 102, 1, 'Horrible experience. Package arrived damaged and support was rude.');

-- Additional practice records used to demonstrate aggregation, ranking, and sentiment analysis
INSERT INTO review_logs VALUES
(3, 103, 4, 'Very good product. Quality is excellent and delivery was quick.'),
(4, 104, 2, 'The product was okay, but the delivery was late and packaging was poor.'),
(5, 105, 5, 'Excellent experience! I am very happy with this purchase.'),
(6, 106, 3, 'Average product. It works as expected but nothing special.'),
(7, 107, 1, 'Very disappointing. The product stopped working after a short time.'),
(8, 108, 4, 'Good quality and useful product. Customer service was helpful.');

-- Verify input data
SELECT *
FROM review_logs
ORDER BY review_id;

-- Aggregation
SELECT
    rating,
    COUNT(*) AS review_count,
    AVG(rating) AS average_rating
FROM review_logs
GROUP BY rating
ORDER BY rating DESC;

-- Window function
SELECT
    review_id,
    customer_id,
    rating,
    DENSE_RANK() OVER (ORDER BY rating DESC) AS rating_rank
FROM review_logs
ORDER BY rating DESC, review_id;

-- AI sentiment analysis + window function
SELECT
    review_id,
    customer_id,
    rating,
    DENSE_RANK() OVER (ORDER BY rating DESC) AS rating_rank,
    ai_analyze_sentiment(review_text) AS sentiment_category
FROM review_logs
ORDER BY rating DESC, review_id;
