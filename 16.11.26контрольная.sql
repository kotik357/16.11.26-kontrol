create table roles(
    role_id int primary key,
    role_name varchar(25)
);

create table users(
    users_id int primary key,
    name varchar(25),
    second_name varchar(50) not null,
    phone varchar(11),
    mail varchar(50),
    role_id int,
    foreign key (role_id) references roles(role_id)
);

create table autos(
    autos_id int primary key,
    vin varchar(20),
    brands varchar(50),
    years int,
    mileage int
);

create table point(
    point_id int primary key,
    city varchar(50),
    address varchar(50),
    work_hours varchar(50),
    max_point int,
    manager varchar(100),
    users_id int,
    foreign key (users_id) references users(users_id)
);

create table contracts(
    contracts_id int primary key,
    pickup_point int,
    return_point int,
    start_date date,
    end_date date,
    status varchar(30),
    users_id int,
    autos_id int,
    foreign key (pickup_point) references point(point_id),
    foreign key (return_point) references point(point_id),
    foreign key (users_id) references users(users_id),
    foreign key (autos_id) references autos(autos_id)
);

create table booking(
    booking_id int primary key,
    users_id int,
    contracts_id int,
    foreign key (users_id) references users(users_id),
    foreign key (contracts_id) references contracts(contracts_id)
);


insert into roles (role_id, role_name) values
(1,'Admin'),
(2,'Client'),
(3,'Manager');

insert into users (users_id, name, second_name, phone, mail, role_id) values
(1,'Иван',   'Иванов',    '89000111233','ivan@mail.ru',  2),
(2,'Семен',  'Артемович', '89000111244','semen@mail.ru', 1),
(3,'Сидор',  'Сидиров',   '89000111255','sidor@mail.ru', 3);

insert into autos (autos_id, vin, brands, years, mileage) values
(1,'a777aa77', 'Lada Vesta',  2020, 30000),
(2,'в888вв88', 'Honda Accord',2015, 100000);

insert into point (point_id, city, address, work_hours, max_point, manager, users_id) values
(1,'Москва',           'ул.Тверская, 1', '09:00-21:00',10,'Сидиров Сидор',3),
(2,'Санкт-Петербург', 'Невский пр., 10','10:00-20:00', 5,'Сидиров Сидор',3);

insert into contracts (contracts_id, pickup_point, return_point, start_date, end_date, status, users_id, autos_id) values
(1, 1, 1, '2023-10-01','2023-10-05', 'Завершен', 1, 1),
(2, 2, 2, '2024-10-03','2024-10-05', 'Активен',  3, 2);

insert into booking (booking_id, users_id, contracts_id) values
(1, 1, 1),
(2, 3, 2);
