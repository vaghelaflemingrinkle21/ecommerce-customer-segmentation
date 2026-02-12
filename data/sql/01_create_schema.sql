-- E-Commerce Data Warehouse Schema
-- Simulates a production analytics environment

-- Transactions table (fact table)
CREATE TABLE IF NOT EXISTS transactions (
    invoice_id VARCHAR(20),
    stock_code VARCHAR(20),
    description TEXT,
    quantity INTEGER,
    invoice_date TIMESTAMP,
    unit_price DECIMAL(10,2),
    customer_id INTEGER,
    country VARCHAR(50)
);

-- Customers dimension table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY,
    country VARCHAR(50),
    first_purchase_date DATE,
    total_orders INTEGER,
    total_revenue DECIMAL(10,2)
);

-- Products dimension table
CREATE TABLE IF NOT EXISTS products (
    stock_code VARCHAR(20) PRIMARY KEY,
    description TEXT,
    category VARCHAR(50)
);
