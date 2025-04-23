create table resource_types (
resource_type_id serial primary key,
resource_type_name varchar(100) not null
);

create table resources (
resource_id serial primary key,
resource_name varchar(100) not null,
resource_type_id int not null,
notes text,
constraint fk_resource_type foreign key (resource_type_id)
references resource_types (resource_type_id) on delete restrict
);

create table plans (
plan_id serial primary key,
resource_id int not null,
schedule_date date not null,
constraint fk_plan_resource foreign key (resource_id)
references resources (resource_id) on delete cascade
);

create table clients (
client_id serial primary key,
contact_name varchar(100),
branch varchar(100),
organization varchar(100),
department varchar(100),
address varchar(255),
property varchar(100),
city varchar(100),
region varchar(100),
district varchar(100),
postal_code varchar(20),
country varchar(100),
operator varchar(100),
access_level varchar(50),
phone_number varchar(20),
internal_fax varchar(20)
);

create table movements (
movement_id serial primary key,
data_code int not null,
client_id int not null,
start_time timestamp not null,
end_time timestamp,
is_approved boolean default false,
constraint fk_movement_plan foreign key (data_code)
references plans (plan_id) on delete cascade,
constraint fk_movement_client foreign key (client_id)
references clients (client_id) on delete cascade,
constraint check_time_range check (end_time is null or start_time <= end_time)
);

create index idx_movements_client_id on movements (client_id);
create index idx_movements_data_code on movements (data_code);
create index idx_plans_resource_id on plans (resource_id);
create index idx_resources_resource_type_id on resources (resource_type_id);