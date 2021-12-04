create table customer (
    cus_id integer primary key,
    first_name varchar(50) not null,
    sec_name varchar(50) not null,
    date_of_birth date not null,
    phone_number varchar(20) not null,
    email_address varchar(50) not null,
    city varchar(20) not null,
    contract_id integer unique
);

create table BestBuy (
    store_id integer primary key,
    website varchar(255) not null,
    name varchar(10) not null,
    user_id integer references customer
);

create table dealer (
    dealer_id integer primary key,
    first_name varchar(50) not null,
    sec_name varchar(50) not null,
    email_address varchar(50) not null,
    phone_number varchar(20) not null,
    store_id integer references BestBuy
);

create table Menu (
    menu_id integer primary key,
    category_id integer unique not null,
    cart_id integer unique not null,
    store_id integer references BestBuy
);

create table category (
    category_id integer primary key,
    category_name varchar(50) unique not null,
    foreign key (category_id) references Menu(category_id)
);

create table product (
    product_id integer primary key,
    product_name varchar(50) not null,
    category_name varchar(50) references category(category_name),
    brand_name varchar(50) not null,
    model varchar(50) not null,
    color varchar(20),
    current_deals varchar(50),
    product_price integer not null,
    rating integer not null,
    location varchar(20) not null,
    dealer_id integer references dealer
);

create table manufacturer (
    manufact_id integer primary key,
    dealer_id integer references dealer,
    product_id integer references product
);

create table inventory (
    inv_id integer primary key,
    manufact_id integer references manufacturer,
    num_of_products integer
);
create table package (
    tracking_number integer primary key,
    product_id integer references product,
    cus_id integer references customer,
    specified_arrival_date date not null,
    arrival_date date not null
)
create table cart (
    cart_id integer primary key,
    product_id integer references product,
    aviability varchar(20) not null,
    pay_id integer unique not null,
    tracking_number integer references package
);

create table payment (
    pay_id integer primary key,
    product_id integer references product,
    pay_type varchar(30) not null,
    cus_id integer references customer,
    contract_id integer unique,
    foreign key (pay_id) references cart(pay_id)
);

create table contract (
    contract_id integer primary key,
    cus_id integer references customer,
    purchase varchar(50),
    date_of_last_bill date,
    foreign key (contract_id) references customer(contract_id),
    foreign key (contract_id) references payment(contract_id)
);

insert into customer values (1, 'Marinette','Dupeincheng', '2001-05-07', '87017355345', 'marinka@gmail.com', 'Paris', 111 );
insert into customer values (2, 'Adrian', 'Agreste', '2001-03-21', '87025215566', 'adrikeeens@mail.com', 'London', 112);
insert into customer values (3, 'Chloe', 'Burqeouis', '2000-09-16', '87776934545', 'ladychloe@gmail.com', 'California', 113);
insert into customer values (4, 'Gabriel', 'Agreste', '1975-07-27', '87019998877', 'brazhnik@gmail.com', 'London', 114);

insert into BestBuy values (101, 'https://www.bestbuy.com/', 'Best Buy', 2);

insert into dealer values (10, 'Luka', 'Couffaine', 'luka_music@gmail.com', '87751234567', 101);
insert into dealer values (11, 'Zoe', 'Lee', 'lee_zoee@gmail.com', '87751292461', 101);
insert into dealer values (12, 'Kagami', 'Tsurugi', 'dragon_girl@gmail.com', '87021778791', 101);

insert into Menu values (991, 1010, 778, 101);
insert into Menu values (992, 1011, 777, 101);
insert into Menu values (993, 1012, 776, 101);
insert into Menu values (994, 1013, 775, 101);
insert into Menu values (995, 1014, 774, 101);
insert into Menu values (996, 1015, 773, 101);
insert into Menu values (997, 1016, 772, 101);

insert into category values (1010, 'Headphones');
insert into category values (1011, 'TVs & Projectors');
insert into category values (1012, 'Laptops & Computers');
insert into category values (1013, 'Cameras, Camcorders & Drones');
insert into category values (1014, 'PC Gaming');
insert into category values (1015, 'Electric Transportation');
insert into category values (1016, 'Cell Phones');

insert into product values (01, 'headphone', 'Headphones', 'Apple', 'MGYH3AM/A', 'black', 'on sale', 479, 5, 'California', 10);
insert into product values (02,'TraceMR Gaming Desktop', 'PC Gaming',  'iBUYPOWER', 'TraceMR223i', 'black', 'on sale', 1399, 5, 'London', 12);
insert into product values (03,'Mirrorless Camera', 'Cameras, Camcorders & Drones',  'Sony', 'ILCE7RM3A/B', 'white', null, 1999, 5, 'London', 10);
insert into product values (04,'Electric Self-Balancing Scooter', 'Electric Transportation',  'Hover-1', 'H1-RNG+-BLK', 'yellow', null, 179, 3, 'Paris', 10);
insert into product values (05,'Electric Self-Balancing Scooter', 'Electric Transportation',  'Hover-1', 'H1-RGPRO-BLK', 'pink', 'on sale', 129, 2, 'California', 11);
insert into product values (06,'headphone', 'Headphones',  'Sony', 'WF1000XM4/B', 'black', 'on sale', 248, 4, 'California', 12);
insert into product values (07,'Touch Laptop', 'Laptops & Computers', 'Lenovo', '82KN0001US', 'grey', 'on sale', 169, 4, 'California', 11);
insert into product values (08,'Legion Tower 5i Gaming Desktop', 'PC Gaming',  'Lenovo', '90RS0016US', 'black', 'Free Shipping Eligible', 899, 5, 'Paris', 12);
insert into product values (09,'Iphone 13', 'Cell Phones',  'Apple', 'JLS-1LCNMJCW', 'blue', null, 1799, 5, 'Paris', 10);
insert into product values (10,'Smart Tizen TV', 'TVs & Projectors', 'Samsung', 'UN55TU7000FXZA', 'black', 'Free Shipping Eligible', 459, 5, 'London', 11);
insert into product values (11,'Shiva Gaming PC Desktop ', 'PC Gaming',  'Skytech Gaming', 'ST-SHIVA-0297-BU', 'white', 'on sale', 1299, 4, 'California', 10);

insert into manufacturer values (51, 11, 01);
insert into manufacturer values (52, 12, 02);
insert into manufacturer values (53, 10, 03);
insert into manufacturer values (54, 12, 04);
insert into manufacturer values (55, 12, 05);
insert into manufacturer values (56, 10, 06);
insert into manufacturer values (57, 10, 07);
insert into manufacturer values (58, 10, 08);
insert into manufacturer values (59, 11, 09);
insert into manufacturer values (60, 11, 10);
insert into manufacturer values (61, 12, 11);

insert into inventory values (1, 53, 100);
insert into inventory values (2, 58, null);
insert into inventory values (3, 54, 250);
insert into inventory values (4, 51, 500);
insert into inventory values (5, 52, 10);
insert into inventory values (6, 60, 1000);
insert into inventory values (7, 55, 750);
insert into inventory values (8, 57, 30);
insert into inventory values (9, 61, 100);
insert into inventory values (10, 59, 400);
insert into inventory values (11, 56, 550);

insert into package values (111222, 06, 3, '2020-12-03', '2020-12-03');
insert into package values (123456, 09, 4, '2021-11-21', '2021-11-27');
insert into package values (654321, 02, 2, '2020-11-23', '2020-11-23');
insert into package values (404051, 10, 1, '2020-07-01', '2020-08-02');
insert into package values (545455, 01, 3, '2020-03-27', '2020-04-05');
insert into package values (232323, 07, 1, '2021-11-01', '2021-11-05');
insert into package values (161616, 05, 1, '2021-11-01', '2020-11-05');

insert into cart values (1, 06, 'Pickup', 101, 111222);
insert into cart values (2, 02, 'Pickup', 102, 654321);
insert into cart values (3, 09, 'Shipping', 103, 123456);
insert into cart values (4, 10, 'Shipping', 104, 404051);
insert into cart values (5, 01, 'Pickup', 105, 545455);
insert into cart values (6, 07, 'Shipping', 106, 232323);
insert into cart values (7, 05, 'Pickup', 107, 161616);

insert into payment values (102, 02, 'cash', 2, 111);
insert into payment values (103, 09, 'debit card', 4, 112);
insert into payment values (104, 10, 'credit card', 1, 113);
insert into payment values (101, 06, 'cash', 3, 114);
insert into payment values (105, 01, 'cash', 3, 115);
insert into payment values (106, 07, 'credit card', 1, 116);
insert into payment values (107, 05, 'credit card', 1, 117);

insert into contract values (111, 2, 'TraceMR Gaming Desktop', '2021-12-01');
insert into contract values (114, 3, 'headphone', '2021-11-01');

--4.1
select tracking_number, customer, product_name
from  package as p1
join customer on p1.cus_id = customer.cus_id
join product on p1.product_id = product.product_id
where p1.tracking_number=123456;

--4.2
select c.cus_id, first_name, sec_name, product_price
from customer as c
join package as p1 on c.cus_id = p1.cus_id
join product as p2 on p1.product_id = p2.product_id
where extract(year from specified_arrival_date)=2020
order by p2.product_price desc
limit 1;

--4.3
select product_name, product_price
from package as p1
join product as p2 on p1.product_id = p2.product_id
where extract(year from specified_arrival_date)=2020
order by p2.product_price desc
limit 2;

--4.4
select p1.product_id, product_name, product_price, current_deals
from package as p1
join product as p2 on p1.product_id = p2.product_id
where extract(year from specified_arrival_date)=2020 and current_deals='on sale'
order by p2.product_price desc
limit 2;

--4.5
select product_id, product_name
from product
where location<>'California';

--4.6
select p1.product_name, specified_arrival_date, arrival_date
from product as p1
join package as p2 on p1.product_id = p2.product_id
where specified_arrival_date <> arrival_date;

--4.7
select c.cus_id, first_name, sec_name, sum(p1.product_price)
from product as p1
join package p2 on p1.product_id = p2.product_id
join customer c on p2.cus_id = c.cus_id
where extract(month from specified_arrival_date)=11 and extract(year from specified_arrival_date)=2021
group by c.cus_id, first_name, sec_name;


drop table inventory;
drop table manufacturer;
drop table contract;
drop table payment;
drop table cart;
drop table package;
drop table product;
drop table dealer;
drop table category;
drop table menu;
drop table bestbuy;
drop table customer;
