CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  customer_id BIGINT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  address_id BIGINT
);
show tables;
select * from customer;
SELECT first_name, last_name, email
FROM customer
WHERE last_name LIKE 'J%'
ORDER BY first_name;
SELECT address_id, COUNT(*) AS customer_count
FROM customer
GROUP BY address_id;
SELECT c.first_name, c.last_name, p.amount, p.mode
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id;
SELECT c.first_name, c.last_name, p.amount, p.mode
FROM customer c

RIGHT JOIN payment p ON c.customer_id = p.customer_id;
SELECT c.first_name, c.last_name, p.amount, p.mode
FROM payment p
LEFT JOIN customer c ON p.customer_id = c.customer_id;
SELECT c.first_name, c.last_name, p.amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE p.amount > (
    SELECT AVG(amount) FROM payment
);
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(p.amount) AS total_amount,
       AVG(p.amount) AS average_amount
FROM customer c

CREATE VIEW customer_contact AS
SELECT first_name, last_name, email
FROM customer;
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';
DESCRIBE customer_contact;
describe customer_payment_summary;
CREATE INDEX idx_lastname ON customer(last_name);
SHOW INDEXES FROM customer;




















