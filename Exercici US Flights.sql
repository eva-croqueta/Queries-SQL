select * from usairports;
select * from carriers;
select * from flights;
ALTER TABLE flights ADD CarrierDelay int;
select * from flights;
ALTER TABLE flights ADD WeatherDelay smallint;
select * from flights;
ALTER TABLE flights ADD NASDelay smallint;
ALTER TABLE flights ADD SecurityDelay smallint;
ALTER TABLE flights ADD LateAircraftDelay smallint;
select * from flights;
select count(1) from flights;
SELECT Origin, AVG(DepDelay), AVG(ArrDelay) from flights GROUP BY Origin;
SELECT Origin, colYear, colMonth, AVG(ArrDelay) from flights GROUP BY Origin, colYear, colMonth;
select u.city, f.colYear, f.colMonth, AVG(ArrDelay) from flights f join usairports u on f.origin = u.iata group by u.iata, f.colYear, f.colMonth order by u.city, f.colYear, f.colMonth;
select c.carrierCode, f.colYear, f.colMonth, sum(f.cancelled) from carriers c join flights f on f.uniqueCarrier = c.carrierCode group by c.carrierCode, f.colYear, f.colMonth order by sum(f.cancelled) desc;
select TailNum, sum(Distance) from flights where TailNum != '' group by TailNum order by sum(Distance) desc limit 10;
select f.uniqueCarrier, AVG(f.ArrDelay) from flights f join carriers c on f.uniqueCarrier = c.carrierCode group by c.CarrierCode having AVG(f.ArrDelay) > 10 order by AVG(f.ArrDelay) desc;