--Task 1

--a.Increments given values by 1 and returns it
create function increment (x integer)
returns integer as $$
    begin
        return x+1;
    end;$$
language plpgsql;

select increment (7);

--b.Returns sum of 2 numbers
create function sum (a integer,b integer)
returns integer as $$
    begin
        return a+b;
    end; $$
language plpgsql;

select sum(4,2);

--c.Returns true or false if numbers are divisible by 2
create function is_even (x integer)
returns bool as $$
    begin
        if x % 2 = 0 then
            return true;
        else
            return false;
        end if;
    end; $$
language plpgsql;

select is_even (10);

--d.Check some password for validity
create function check_password (password varchar)
returns bool as $$
    begin
       if password similar to '\w+\d*' then
           return true;
       else
           return false;
       end if;
    end;$$
language plpgsql;
drop function check_password (password varchar);
SELECT check_password ('database');

--e)Returns two outputs, but has one input
create function funct (a integer, out b1 integer, out b2 integer)
as $$
    begin
        b1:= a * 8;
        b2:= a * 9;
    end;$$
language plpgsql;

drop function funct;

select funct(2);

--Task 2

create table person (
    id integer primary key,
    name varchar,
    last_name varchar,
    date_of_birth date,
    age integer,
    insertion_time timestamp
);
create table item (
    item_id integer primary key,
    item_name varchar,
    price_initial numeric,
    price_final numeric
);

--a.Return timestamp of the occurred action within the database.

create function trig_func()
returns trigger as $$
    begin
        new.insertion_time = now();
        return new;
    end;$$
language plpgsql;

create trigger time_of_action before insert or update
    on person
    for each row
    execute procedure trig_func();

--b.Computes the age of a person when persons’ date of birth is inserted.
create function  calc_age_function()
returns trigger as $$
    declare year_c integer;
    begin
        select date_part ('year', age(new.date_of_birth)) into year_c;
        new.age = year_c;
        return new;
    end;$$
language plpgsql;

create trigger calc_age_trigger
    before insert
    on person
    for each row
    execute procedure calc_age_function();

-- drop trigger calc_age_trigger ON person;
-- drop function calc_age_function;
-- drop function trig_func;
-- drop trigger  time_of_action ON person;

insert into person values (1,'Marinette','Dupeincheng','2001-05-07');
-- delete from person where id = 1;

--c)Adds 12% tax on the price of the inserted item.
create function adding_tax()
returns trigger as $$
    begin
        new.price_final = new.price_initial * 1.12;
        return new;
    end;$$
language plpgsql;

create trigger adding_tax_trigger
    before update or insert
    on item
    for each row
    execute procedure adding_tax();


insert into item values(5,'nkdjckzckkcjm', 500);
insert into item values(6,'ksmxsmsc', 600);

--d)Prevents deletion of any row from only one table.
create function prev_del()
returns trigger as $$
    begin
        insert into item values (old.item_id,old.item_name,old.price_initial);
        return old;
    end;$$
language plpgsql;

create trigger prevent_deletion after delete
    ON item
    for each row
    execute procedure prev_del();

drop trigger prevent_deletion ON item;
drop function prev_del;

delete from item where item_id = 3;

create table accounts(
    acc_id integer primary key,
    acc_name varchar,
    password varchar
);

--Task 3 What is the difference between procedure and function?

-- In Postgres, the main functional difference between a function and
-- a stored procedure is that a function returns a result,
-- whereas a stored procedure does not.
-- This is because the intention behind
-- a stored procedure is to perform some sort of activity and then finish,
-- which would then return control to the caller.
