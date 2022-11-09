CREATE TABLE brands (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE categories (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE reviews (
id INT PRIMARY KEY AUTO_INCREMENT,
content TEXT,
rating DECIMAL(10, 2) NOT NULL,
picture_url VARCHAR(80) NOT NULL,
published_at DATETIME NOT NULL
);

CREATE TABLE products (
id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
price DECIMAL(19, 2) NOT NULL,
quantity_in_stock INT,
`description` TEXT,
brand_id INT NOT NULL,
category_id INT NOT NULL,
review_id INT,
CONSTRAINT fk_products_brands
FOREIGN KEY (brand_id)
REFERENCES brands(id),
CONSTRAINT fk_products_categories
FOREIGN KEY (category_id)
REFERENCES categories(id),
CONSTRAINT fk_products_reviews
FOREIGN KEY (review_id)
REFERENCES reviews(id)
);

CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
phone VARCHAR(30) NOT NULL UNIQUE,
address VARCHAR(60) NOT NULL,
discount_card BIT(1) NOT NULL DEFAULT 0
);

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
order_datetime DATETIME NOT NULL,
customer_id INT NOT NULL,
CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(id)
);

CREATE TABLE orders_products (
order_id INT,
product_id INT,
CONSTRAINT fk_orders_products_orders
FOREIGN KEY (order_id)
REFERENCES orders(id),
CONSTRAINT fk_orders_products_products
FOREIGN KEY (product_id)
REFERENCES products(id)
);

-- -----------------------------------
-- INSERT INTO reviews (content, picture_url, published_at, rating)
-- SELECT LEFT(`description`, 15), reverse(`name`), '2010-10-10', price % 8
-- FROM products;

INSERT INTO reviews (content,rating,picture_url,published_at)
SELECT left(p.description,15),p.price/8,reverse(p.name),'2010-10-10' FROM products AS p
WHERE p.id >= 5;

-- -----------------------------------
UPDATE products
SET quantity_in_stock = quantity_in_stock - 5
WHERE quantity_in_stock >= 60 and quantity_in_stock <= 70;

-- ------------------------------------
DELETE FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders);
-- ------------------------------------
SELECT id, name FROM categories
ORDER BY name DESC;

-- ---------------------------------------
SELECT id, brand_id, `name`, quantity_in_stock
FROM products
WHERE price > 1000 AND quantity_in_stock < 30
ORDER BY quantity_in_stock ASC, id;

-- -----------------------------------------
SELECT * FROM reviews
WHERE LEFT(content, 2) = 'My' and length(content) > 63
ORDER BY rating DESC;
-- ------------------------------------------
SELECT concat(c.first_name, ' ', c.last_name) as 'full_name',
c.address, o.order_datetime
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
WHERE YEAR(o.order_datetime) <= 2018
ORDER BY full_name DESC;

-- -------------------------------------------
SELECT COUNT(*) AS 'items_count', c.`name`, SUM(p.quantity_in_stock) as 'total_quantity' 
FROM categories AS c
LEFT JOIN products AS p ON p.category_id = c.id
GROUP BY c.id
ORDER BY items_count DESC, total_quantity ASC
LIMIT 5;

-- --------------------------------------------
DELIMITER %% 
CREATE FUNCTION udf_customer_products_count(`name` VARCHAR(30)) 
   RETURNS INT
   DETERMINISTIC
   BEGIN 
   RETURN (SELECT COUNT(*) FROM orders AS o 
		JOIN customers AS c 
		ON o.customer_id = c.id
		JOIN orders_products as op 
		ON o.id = op.order_id
		WHERE c.first_name = `name`);
    END %%
    
delimiter ;;
    
SELECT c.first_name,c.last_name, udf_customer_products_count('Shirley') as `total_products` FROM customers c
WHERE c.first_name = 'Shirley';

-- ---------------------------------------------------
DELIMITER %%

CREATE PROCEDURE udp_reduce_price(category_name VARCHAR(50))
BEGIN
update products as p
join categories as c
on c.id = p.category_id
join reviews as r
on r.id = p.review_id
set price = price - 0.3 * price
where c.name = category_name and rating < 4;
END; 
%%

CALL udp_reduce_price ('Phones and tablets');

