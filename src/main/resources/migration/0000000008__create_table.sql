create table types (
type_id serial primary key,
type_name varchar(100) not null
);

create table products (
product_id serial primary key,
product_name varchar(100) not null,
type_id int not null,
constraint fk_product_type foreign key (type_id)
references types (type_id) on delete restrict
);
create table organizations (
organization_id serial primary key,
organization_name varchar(100) not null,
parent_organization_id int,
address varchar(255),
city varchar(100),
region varchar(100),
postal_index varchar(20),
country varchar(100),
operator varchar(100),
phone_number varchar(20),
fax varchar(20),
constraint fk_parent_organization foreign key (parent_organization_id)
references organizations (organization_id) on delete set null
);

create table employees (
employee_id serial primary key,
employee_name varchar(100),
branch varchar(100),
position varchar(100),
internal_phone varchar(20),
work_phone varchar(20),
constraint unique_employee unique (employee_name, branch, position)
);
create table accesses (
access_id serial primary key,
access_method_id int not null,
constraint fk_access_method foreign key (access_method_id)
references access_methods (access_method_id) on delete restrict
);
create table access_methods (
                                access_method_id serial primary key,
                                access_method_name varchar(100) not null,
                                cost numeric(10, 2) not null
);
create table orders (
order_id serial primary key,
order_number varchar(50) not null,
order_description varchar(255),
organization_id int not null,
employee_id int not null,
product_id int not null,
start_date date not null,
planned_end_date date,
actual_end_date date,
access_method_id int not null,
cost numeric(10, 2),
order_status varchar(50),
interaction_time interval,
constraint fk_order_organization foreign key (organization_id)
references organizations (organization_id) on delete cascade,
constraint fk_order_employee foreign key (employee_id)
references employees (employee_id) on delete cascade,
constraint fk_order_product foreign key (product_id)
references products (product_id) on delete restrict,
constraint fk_order_access_method foreign key (access_method_id)
references access_methods (access_method_id) on delete restrict,
constraint check_dates check (planned_end_date is null or start_date <= planned_end_date),
constraint check_actual_dates check (actual_end_date is null or start_date <= actual_end_date)
);

create index idx_orders_organization_id on orders (organization_id);
create index idx_orders_employee_id on orders (employee_id);
create index idx_orders_product_id on orders (product_id);
create index idx_orders_access_method_id on orders (access_method_id);
create index idx_products_type_id on products (type_id);
create index idx_accesses_access_method_id on accesses (access_method_id);
create index idx_organizations_parent_organization_id on organizations (parent_organization_id);