create table if not exists employee
(
    id bigserial primary key,
    num_passport varchar(255),
    name varchar(255),
    surname varchar(255),
    position varchar(255),
    address varchar(255),
    city varchar(255),
    phone varchar(255),
    phone_job varchar(255),
    tab_num varchar(255)

    );

create table if not exists expenses
(
    id bigserial primary key,
    employee_id bigint references employee (id),
    type_expenses varchar(255),
    name_expenses varchar(255),
    description_expenses varchar(255),
    date_check date
    );

create table if not exists type_expenses
(
    id bigserial primary key ,
    category_expenses varchar(255),
    type_expense varchar(255)
    );

create table if not exists expense_information
(
    id bigserial primary key ,
    expenses_id bigint references expenses (id),
    type_expenses_id bigint references  type_expenses (id),
    description_expenses varchar(255),
    date_expenses date
    );

insert into employee (num_passport, tab_num, name, surname, position, city, phone, phone_job)
values ('AB1234567', '12345', 'Иван', 'Иванов', 'Менеджер', 'Москва', '+7(900)123-45-67', '+7(495)987-65-43');

insert into type_expenses (category_expenses, type_expense)
values ('Путевые расходы', 'Такси');

insert into expenses (employee_id, type_expenses, name_expenses, description_expenses, date_check)
values ((select id from employee where num_passport = 'AB1234567'),
        'Путевые расходы', 'Такси до офиса', 'Поездка на такси до офисного здания', '2025-04-22');

insert into expense_information (expenses_id, type_expenses_id, description_expenses, date_expenses)
values ((select id from expenses where name_expenses = 'Такси до офиса' and date_check = '2025-04-22'),
        (select id from type_expenses where category_expenses = 'Путевые расходы' and type_expense = 'Такси'),
        'Поездка на такси', '2025-04-22');

