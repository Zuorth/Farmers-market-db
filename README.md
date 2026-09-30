# Farmers-market-db
Farmers Market Vendor Management System

CIS 344 - Individual Project

This project is a MySQL database designed to manage the daily operations of a farmers market vendor network.

Project Overview

The database manages:

Markets
Market days
Vendors
Products
Vendor attendance
Sales

The database is named farmers_market and contains seven related tables:

MARKET, MARKET_DAY, VENDOR, VENDOR_PHONE, PRODUCT, ATTENDS, and SALE.

MARKET_DAY is a weak entity, identified by the combination of market and date. ATTENDS and SALE are junction tables that resolve the many-to-many relationships between vendors and market days, and between products and market days.

Repository Contents


create_database.sql - Database creation script

02_insert_script_data.sql - Sample data

03_script_queries.sql - SQL queries (joins, aggregate, update, delete)

farmers_market.mwb - MySQL Workbench database model

handrawnchen.jpg - Hand-drawn Chen ER diagram

farmers_market.mwb - UML/EER diagram created in MySQL Workbench

requirements-gathering.pdf - Requirements gathering process and findings

final-report.pdf - Final project report
Database Features

Primary keys and foreign keys

One-to-many and many-to-many relationships

Weak entity with a composite primary key (MARKET_DAY)

ATTENDS and SALE junction tables

Constraints
Sample data
JOIN queries
Aggregate query
UPDATE and DELETE examples
