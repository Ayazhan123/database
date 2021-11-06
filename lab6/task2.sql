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
as select d, count(amount) as c_of_num, avg(amount),sum(amount) as total
from sell as s
join dealer as d ON s.dealer_id = d.id
GROUP BY d;

drop view c;

--d
