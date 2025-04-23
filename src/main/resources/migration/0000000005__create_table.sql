CREATE TABLE asset_types (
id BIGSERIAL PRIMARY KEY,
type_name VARCHAR(255) NOT NULL
);

CREATE TABLE employees (
id BIGSERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
position VARCHAR(255),
team VARCHAR(255),
is_active_employee BOOLEAN DEFAULT TRUE
);

CREATE TABLE states (
id BIGSERIAL PRIMARY KEY,
state_name VARCHAR(255) NOT NULL
);

CREATE TABLE fixed_assets (
id BIGSERIAL PRIMARY KEY,
asset_type_id bigint references asset_types (id),
employee_id bigint references employees (id),
inventory_number VARCHAR(50),
serial_number VARCHAR(50),
acquisition_date DATE,
manufacture_date DATE,
initial_cost DECIMAL(15, 2),
depreciation_method VARCHAR(255),
depreciation_amount DECIMAL(15, 2),
current_value DECIMAL(15, 2),
);

CREATE TABLE cost_write_offs (
id BIGSERIAL PRIMARY KEY,
asset_id bigint references asset_types(id),
write_off_date DATE,
write_off_amount DECIMAL(15, 2),
);