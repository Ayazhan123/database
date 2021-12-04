--task2

--1
create role accountant;
create role administrator;
create role support;
grant select, insert, update on accounts, transactions to accountant;
grant all privileges on accounts, transactions, customers to administrator;
grant select, insert, update, delete on accounts, customers to support;

--2
create user Aruzhan;
create user Inkar;
create user Zere;

grant accountant to Zere;
grant administrator to Inkar;
grant support to Aruzhan;

--3
create role manager createrole;
grant manager to Inkar;

--4
revoke update on accounts from accountant;

--task3

--2
alter table transactions
alter column date set not null;
alter table transactions
alter column src_account set not null;
alter table transactions
alter column dst_account set not null;
alter table transactions
alter column amount set not null;
alter table transactions
alter column status set not null;

--task5

--1
create unique index indx_acc on accounts(customer_id, currency);

--2
create index indx_cur_bal on accounts(currency, balance);

--task6
DO
$$
    DECLARE
        b int;
        l int;
    BEGIN
        update accounts
        set balance = balance - 100
        where account_id = 'NT10204';
        update accounts
        set balance = balance + 100
        where account_id = 'AB10203';
        select balance into b from accounts where account_id = 'NT10204';
        select accounts.limit into l from accounts where account_id = 'NT10204';
        if b < l then
            rollback;
            update transactions set status = 'rollback' where id = 1;
        else
            commit;
            update transactions set status = 'commit' where id = 1;
        end if;

END$$;

