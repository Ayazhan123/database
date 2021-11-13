--a
create view a
as select date, count(distinct client_id) as c_of_num, avg(amount), sum(amount) as total
from sell
group by date;

drop view a;

--b
create view b
as select date, amount
from sell
order by amount desc
limit 5;

drop view b;

--c
create view c
as select d, count(s.amount) as c_of_num, avg(s.amount), sum(s.amount) as total
from sell as s
join dealer as d on s.dealer_id = d.id
group by d;

drop view c;

--d
create view d
as select d, sum(s.amount * d.charge) as all
from sell as s
join dealer as d on s.dealer_id = d.id
group by d;

drop view d;

-- e
create view e
as select d.location, count(s.amount) as c_of_num, avg(s.amount),sum(s.amount) as total
from dealer as d
join sell as s on d.id = s.dealer_id
group by d.location;

drop view e;

-- f
create view f
as select c.city , count(s.amount) as c_of_num, avg(s.amount * (d.charge + 1)), sum(s.amount * (d.charge +1)) as total
from client as c
join dealer as d on c.dealer_id = d.id
join sell as s on c.id = s.client_id
group by c.city;

drop view f;

-- g
create view g
as select c.city, sum(s.amount * (d.charge + 1)) as t_expenses, sum(s.amount) as t_amount
from client as c
join sell as s on c.id = s.client_id
join dealer as d on s.dealer_id = d.id and c.city = d.location
group by c.city;

drop view g;

