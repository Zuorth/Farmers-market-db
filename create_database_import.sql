CREATE DATABASE IF NOT EXISTS farmers_market;
USE farmers_market;

CREATE TABLE market (
  market_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  street VARCHAR(120) NOT NULL,
  city VARCHAR(60) NOT NULL,
  manager_phone VARCHAR(20)
);

CREATE TABLE market_day (
  market_id INT NOT NULL,
  market_date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  PRIMARY KEY (market_id, market_date),
  FOREIGN KEY (market_id) REFERENCES market(market_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE vendor (
  vendor_id INT AUTO_INCREMENT PRIMARY KEY,
  business_name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  permit_number VARCHAR(30) NOT NULL UNIQUE,
  permit_expiration_date DATE NOT NULL
);

CREATE TABLE vendor_phone (
  vendor_id INT NOT NULL,
  phone VARCHAR(20) NOT NULL,
  PRIMARY KEY (vendor_id, phone),
  FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  vendor_id INT NOT NULL,
  name VARCHAR(80) NOT NULL,
  unit VARCHAR(20) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE attends (
  vendor_id INT NOT NULL,
  market_id INT NOT NULL,
  market_date DATE NOT NULL,
  stall_fee DECIMAL(8,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (vendor_id, market_id, market_date),
  FOREIGN KEY (vendor_id) REFERENCES vendor(vendor_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (market_id, market_date) REFERENCES market_day(market_id, market_date)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sale (
  sale_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  market_id INT NOT NULL,
  market_date DATE NOT NULL,
  quantity INT NOT NULL,
  sale_price DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (market_id, market_date) REFERENCES market_day(market_id, market_date)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
