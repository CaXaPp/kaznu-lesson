CREATE TABLE IF NOT EXISTS payment_methods (
    payment_method_id bigserial PRIMARY KEY,
    method_name VARCHAR(100),
    is_card BOOLEAN
    );

CREATE TABLE IF NOT EXISTS clients (
    client_id bigserial PRIMARY KEY,
    company_name VARCHAR(255),
    contact_first_name VARCHAR(100),
    contact_last_name VARCHAR(100),
    billing_address TEXT,
    city VARCHAR(100),
    state_region VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    recipient_position VARCHAR(100),
    phone_number VARCHAR(20),
    fax VARCHAR(20)
    );

CREATE TABLE IF NOT EXISTS employees (
    employee_id bigserial PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    position VARCHAR(100),
    extension VARCHAR(20),
    work_phone VARCHAR(20),
    rate NUMERIC(10, 2)
    );

CREATE TABLE IF NOT EXISTS equipment (
    equipment_id bigserial PRIMARY KEY,
    name VARCHAR(255),
    price NUMERIC(10, 2),
    description TEXT
    );

CREATE TABLE IF NOT EXISTS work_orders (
    order_id bigserial PRIMARY KEY,
    client_id INT REFERENCES clients(client_id),
    employee_id INT REFERENCES employees(employee_id),
    order_number VARCHAR(50),
    received_date DATE,
    assigned_date DATE,
    manufacturer_model VARCHAR(255),
    serial_number VARCHAR(100),
    problem_description TEXT,
    completion_date DATE,
    is_issued BOOLEAN,
    tax_rate NUMERIC(5, 2)
    );

CREATE TABLE IF NOT EXISTS required_equipment (
    required_equipment_id bigserial PRIMARY KEY,
    order_id INT REFERENCES work_orders(order_id),
    equipment_id INT REFERENCES equipment(equipment_id),
    quantity INT,
    unit_price NUMERIC(10, 2)
    );

CREATE TABLE IF NOT EXISTS payments (
    payment_id bigserial PRIMARY KEY,
    order_id INT REFERENCES work_orders(order_id),
    amount NUMERIC(10, 2),
    payment_date DATE,
    card_number VARCHAR(50),
    cardholder_name VARCHAR(100),
    card_expiry DATE,
    payment_method_id INT REFERENCES payment_methods(payment_method_id)
    );

CREATE TABLE IF NOT EXISTS required_resources (
    required_resource_id bigserial PRIMARY KEY,
    order_id INT REFERENCES work_orders(order_id),
    employee_id INT REFERENCES employees(employee_id),
    paid_hours NUMERIC(5, 2),
    hourly_rate NUMERIC(10, 2),
    notes TEXT
    );
