create table if not exists cargo
(
    id           bigserial primary key,
    name         varchar(255),
    cargo        varchar(255),
    title        varchar(255),
    description  varchar(255),
    location     varchar(255),
    category     varchar(255),
    status_cargo varchar(255),
    date         date
);