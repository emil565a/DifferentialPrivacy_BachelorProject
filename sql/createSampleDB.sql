-- select count(*) from yellow_2016_01
-- 10906858

create table taxi_pickup_201601
(pu timestamp,
 jan_day int,
 day_hour int,
 hour_min int)

 insert into taxi_pickup_201601 
 select  tpep_pickup_datetime,
 		 extract(day from tpep_pickup_datetime),
 		 extract(hour from tpep_pickup_datetime),
 		 extract(minute from tpep_pickup_datetime)
 from yellow_2016_01
--inserts 10906858 
 
 
 

-- rowLimit = 16384
-- devide by day 
select concat(TO_CHAR(jan_day, 'fm00'))::integer as day, 
count(*) 
from taxi_pickup_201601
group by day -- 31 rows
limit 16384

-- devide by each hour
select concat(TO_CHAR(jan_day, 'fm00'),TO_CHAR(day_hour , 'fm00'))::integer as hour, count(*)
from taxi_pickup_201601
group by hour -- 744 rows
limit 16384

-- devide by each minute
select concat(TO_CHAR(jan_day, 'fm00'),TO_CHAR(day_hour , 'fm00'),TO_CHAR(hour_min , 'fm00'))::integer as min, count(*) 
from taxi_pickup_201601
group by min  -- 44062 rows
limit 16384

