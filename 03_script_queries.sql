USE farmers_market;


-- 1. List every vendor and which market days they attended,
--    along with the stall fee they paid

SELECT v.business_name, md.market_date, m.name AS market_name, a.stall_fee
FROM attends a
JOIN vendor v ON a.vendor_id = v.vendor_id
JOIN market_day md ON a.market_id = md.market_id AND a.market_date = md.market_date
JOIN market m ON md.market_id = m.market_id
ORDER BY md.market_date, v.business_name;


-- 2. Total revenue per vendor across all sales

SELECT v.business_name,
       SUM(s.quantity * s.sale_price) AS total_revenue
FROM sale s
JOIN product p ON s.product_id = p.product_id
JOIN vendor v ON p.vendor_id = v.vendor_id
GROUP BY v.business_name
ORDER BY total_revenue DESC;


-- 3. All products sold by a specific vendor (Green Acres Farm)

SELECT p.name, p.unit, p.price
FROM product p
JOIN vendor v ON p.vendor_id = v.vendor_id
WHERE v.business_name = 'Green Acres Farm';

-- 
-- 4. Vendors whose permit expires before the end of 2026
--    (useful for a renewal reminder report)

SELECT business_name, permit_number, permit_expiration_date
FROM vendor
WHERE permit_expiration_date < '2027-01-01'
ORDER BY permit_expiration_date;


-- 5. Every phone number on file for each vendor
--    (demonstrates the multivalued attribute table)

SELECT v.business_name, vp.phone
FROM vendor_phone vp
JOIN vendor v ON vp.vendor_id = v.vendor_id
ORDER BY v.business_name;


-- 6. UPDATE example: raise a vendor's stall fee

UPDATE attends
SET stall_fee = 30.00
WHERE vendor_id = 1 AND market_id = 1 AND market_date = '2026-10-03';


-- 7. DELETE example: remove a sale record
--    (RESTRICT on the sale FKs means this only works on sale
--     rows themselves, not on the product/market_day they use)

DELETE FROM sale
WHERE product_id = 4 AND market_id = 2 AND market_date = '2026-10-04';


-- 8. How many distinct vendors attended each market

SELECT m.name AS market_name, COUNT(DISTINCT a.vendor_id) AS vendor_count
FROM attends a
JOIN market_day md ON a.market_id = md.market_id AND a.market_date = md.market_date
JOIN market m ON md.market_id = m.market_id
GROUP BY m.name;
