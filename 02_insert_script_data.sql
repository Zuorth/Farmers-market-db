USE farmers_market;

-- MARKET
INSERT INTO market (name, street, city, manager_phone) VALUES
('Downtown Farmers Market', '123 Main St', 'Riverdale', '555-201-0001'),
('Uptown Farmers Market', '45 Elm Ave', 'Riverdale', '555-201-0002');

-- MARKET_DAY (weak entity, depends on market)
INSERT INTO market_day (market_id, market_date, start_time, end_time) VALUES
(1, '2026-10-03', '08:00:00', '13:00:00'),
(1, '2026-10-10', '08:00:00', '13:00:00'),
(2, '2026-10-04', '09:00:00', '14:00:00');

-- VENDOR
INSERT INTO vendor (business_name, category, permit_number, permit_expiration_date) VALUES
('Green Acres Farm', 'Produce', 'PN-1001', '2027-03-01'),
('Sweet Grain Bakery', 'Baked Goods', 'PN-1002', '2027-05-15'),
('Wildflower Honey Co', 'Preserves', 'PN-1003', '2026-12-01');

-- VENDOR_PHONE (multivalued attribute)
INSERT INTO vendor_phone (vendor_id, phone) VALUES
(1, '555-301-1111'),
(1, '555-301-1112'),
(2, '555-301-2222'),
(3, '555-301-3333');

-- PRODUCT (owned by a vendor)
INSERT INTO product (vendor_id, name, unit, price) VALUES
(1, 'Heirloom Tomatoes', 'lb', 3.50),
(1, 'Sweet Corn', 'dozen', 5.00),
(2, 'Sourdough Loaf', 'each', 7.00),
(3, 'Wildflower Honey Jar', 'each', 9.50);

-- ATTENDS (M:N between vendor and market_day, with a stall fee)
INSERT INTO attends (vendor_id, market_id, market_date, stall_fee) VALUES
(1, 1, '2026-10-03', 25.00),
(2, 1, '2026-10-03', 20.00),
(1, 1, '2026-10-10', 25.00),
(3, 2, '2026-10-04', 15.00);

-- SALE (M:N between product and market_day, with quantity and price)
INSERT INTO sale (product_id, market_id, market_date, quantity, sale_price) VALUES
(1, 1, '2026-10-03', 10, 3.50),
(2, 1, '2026-10-03', 6, 5.00),
(3, 1, '2026-10-03', 12, 7.00),
(4, 2, '2026-10-04', 8, 9.50);
