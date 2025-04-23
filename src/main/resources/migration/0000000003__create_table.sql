CREATE TABLE IF NOT EXISTS contact_types (
    id BIGSERIAL PRIMARY KEY,
    contact_type VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS contacts (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salutation VARCHAR(50),
    address TEXT,
    city VARCHAR(100),
    region VARCHAR(100),
    postal_code VARCHAR(20),
    state VARCHAR(100),
    country VARCHAR(100),
    company_name VARCHAR(150),
    position VARCHAR(100),
    work_phone VARCHAR(50),
    extension_phone VARCHAR(50),
    mobile_phone VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(150),
    last_meeting_date DATE,
    contact_type_id INT REFERENCES contact_types (id),
    recommended_by TEXT,
    notes TEXT
);

CREATE TABLE IF NOT EXISTS calls (
    call_id BIGSERIAL PRIMARY KEY,
    contact_id INT REFERENCES contacts (id),
    call_date DATE NOT NULL,
    call_time TIME,
    subject VARCHAR(255),
    notes TEXT
);