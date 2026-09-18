CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);
    
INSERT INTO customers (
    customer_id,
    customer_name,
    segment
)
SELECT DISTINCT
    customer_id,
    customer_name,
    segment
FROM sales;

select * from customers;


CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    ship_date,
    ship_mode
)
SELECT DISTINCT
    order_id,
    customer_id,
    order_date,
    ship_date,
    ship_mode
FROM sales;

select * from orders;


CREATE TABLE orderItems (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    product_name VARCHAR(255),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

INSERT INTO orderItems (
    row_id,
    order_id,
    product_id,
    product_name,
    category,
    sub_category,
    sales,
    quantity,
    discount,
    profit
)
SELECT
    row_id,
    order_id,
    product_id,
    product_name,
    category,
    sub_category,
    sales,
    quantity,
    discount,
    profit
FROM sales;

select * from orderItems;
    
    
    
