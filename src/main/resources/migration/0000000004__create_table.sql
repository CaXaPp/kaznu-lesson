CREATE TABLE event_types (
id BIGSERIAL PRIMARY KEY,
event_type_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
id BIGSERIAL PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
position VARCHAR(100),
internal_phone VARCHAR(20),
work_phone VARCHAR(20)
);

CREATE TABLE events (
id BIGSERIAL PRIMARY KEY,
event_name VARCHAR(255) NOT NULL,
event_type_id INTEGER NOT NULL REFERENCES event_types(id),
status VARCHAR(50),
location VARCHAR(255),
start_date DATE,
end_date DATE,
start_time TIME,
end_time TIME,
required_resources TEXT,
is_approved BOOLEAN DEFAULT FALSE,
has_food BOOLEAN DEFAULT FALSE,
event_description TEXT,
employee_id INTEGER REFERENCES employees(id)
);

CREATE TABLE event_fees (
id BIGSERIAL PRIMARY KEY,
event_id INTEGER NOT NULL REFERENCES events(id),
fee_description TEXT,
amount DOUBLE PRECISION NOT NULL
);

CREATE TABLE visitors (
id BIGSERIAL PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
position VARCHAR(100),
company_name VARCHAR(255),
address TEXT,
city VARCHAR(100),
region VARCHAR(100),
postal_code VARCHAR(20),
country VARCHAR(100),
phone_number VARCHAR(20),
fax VARCHAR(20)
);

CREATE TABLE registrations (
id BIGSERIAL PRIMARY KEY,
employee_id INTEGER REFERENCES employees(id),
event_id INTEGER NOT NULL REFERENCES events(id),
registration_date DATE NOT NULL,
order_number VARCHAR(50),
tax_rate NUMERIC(5, 2),
fee_id INTEGER REFERENCES event_fees(id),
participation_payment DOUBLE PRECISION
);

CREATE TABLE payment_methods (
id BIGSERIAL PRIMARY KEY,
method_name VARCHAR(100) NOT NULL,
card_type VARCHAR(50)
);

CREATE TABLE payments (
id BIGSERIAL PRIMARY KEY,
registration_id INTEGER NOT NULL REFERENCES registrations(id),
payment_amount DOUBLE PRECISION NOT NULL,
payment_date DATE NOT NULL,
card_number VARCHAR(50),
card_holder VARCHAR(100),
card_expiry_date DATE,
payment_method_id INTEGER REFERENCES payment_methods(id)
);