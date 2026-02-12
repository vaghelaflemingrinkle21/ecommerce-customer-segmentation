-- Data quality checks and cleaning queries

-- Remove invalid transactions
DELETE FROM transactions 
WHERE customer_id IS NULL 
   OR quantity <= 0 
   OR unit_price <= 0;

-- Remove test/bad stock codes
DELETE FROM transactions 
WHERE stock_code LIKE 'POST%' 
   OR stock_code LIKE 'D%'
   OR stock_code LIKE 'C2%'
   OR stock_code = 'BANK CHARGES';

-- Create indexes for performance
CREATE INDEX idx_customer ON transactions(customer_id);
CREATE INDEX idx_date ON transactions(invoice_date);
CREATE INDEX idx_stock ON transactions(stock_code);
