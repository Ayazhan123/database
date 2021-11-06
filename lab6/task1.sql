--a
select *
from dealer
join client on dealer.id = client.dealer_id;

--b
select d, c.name, c.city, c.priority, s.id, s.amount, s.date
from dealer as d
join client as c on d.id = c.dealer_id
join sell as s on d.id = s.dealer_id ;

--c
select d.name, c.name, c.city
from dealer as d
join client as c on d.id = c.dealer_id
where d.location = c.city;

--d
select s.id, s.amount, c.name, c.city
from sell as s
join client as c on s.client_id = c.id
where s.amount between 100 and 500;

--e
select *
from dealer as d
full outer join client as c on d.id = c.dealer_id;

--f
select c.name, c.city, d.name, d.charge
from client as c
join dealer as d on c.dealer_id = d.id;

--g
select c.name, c.city, d.charge
from client as c
join dealer as d on c.dealer_id = d.id
where d.charge>0.12;

--h
select c.name, c.city, s.id, s.date, s.amount, d.name, d.charge
from dealer as d
join client as c on d.id = c.dealer_id
join sell as s on c.id = s.client_id;

--i
select c.name, c.priority, d.name, s.id, s.amount
from dealer as d
join client as c on d.id = c.dealer_id
join sell as s on c.id = s.client_id
where c.priority<>0 AND s.amount>2000;



