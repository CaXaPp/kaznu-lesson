CREATE TABLE employees (
employee_id BIGSERIAL PRIMARY KEY,
full_name VARCHAR(255) NOT NULL,
position VARCHAR(100) NOT NULL,
internal_phone VARCHAR(20),
manager_id INTEGER,
FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE clients (
client_id BIGSERIAL PRIMARY KEY,
employee_id INTEGER NOT NULL,
full_name VARCHAR(255) NOT NULL,
icon VARCHAR(255),
home_address TEXT NOT NULL,
city VARCHAR(100),
region VARCHAR(100),
country VARCHAR(100),
phone_number VARCHAR(20),
email VARCHAR(255),
fax VARCHAR(50),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE goods (
good_id BIGSERIAL PRIMARY KEY,
good_name VARCHAR(255) NOT NULL,
price DECIMAL(10, 2) NOT NULL,
quantity INTEGER NOT NULL,
storage_location VARCHAR(255)
);

CREATE TABLE orders (
order_id BIGSERIAL PRIMARY KEY,
client_id INTEGER NOT NULL,
order_sum DECIMAL(10, 2) NOT NULL,
payment_date DATE,
order_number INTEGER NOT NULL,
employee_id INTEGER,
FOREIGN KEY (client_id) REFERENCES clients(client_id),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE order_items (
order_item_id BIGSERIAL PRIMARY KEY,
order_id INTEGER NOT NULL,
good_id INTEGER NOT NULL,
quantity_ordered INTEGER NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (good_id) REFERENCES goods(good_id)
);

CREATE TABLE payment_methods (
payment_method_id BIGSERIAL PRIMARY KEY,
payment_method_name VARCHAR(100) NOT NULL,
card_number VARCHAR(20)
);

CREATE TABLE payments (
payment_id BIGSERIAL PRIMARY KEY,
order_id INTEGER NOT NULL,
payment_method_id INTEGER NOT NULL,
payment_sum DECIMAL(10, 2) NOT NULL,
payment_date DATE NOT NULL,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id)
);

CREATE TABLE deliveries (
delivery_id BIGSERIAL PRIMARY KEY,
payment_method_id INTEGER NOT NULL,
delivery_method VARCHAR(100) NOT NULL,
FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id)
);