create database db_car;
use db_car;

select*from audi;
select*from bmw;
select*from cclass;
select*from fueltype;
select*from hyndai;
select*from merc;
select*from models;
select*from transmission;

--a.  Create an analysis to find income class of UK citizens based on price of Cars(You can use per-capita income in UK from internet sources)

--Audi
select*,
case when price >= 54000 then 'Top class'
	when price >= 35700 then 'Second Top class'
	when price >= 26800 then 'Middle Class'
	when price >= 20500 then 'Second lowest'
	else 'First lowest' 
	end as Income_Class
	from audi
	order by Price desc;


	---BMW
	select*,
case when price >= 54000 then 'Top class'
	when price >= 35700 then 'Second Top class'
	when price >= 26800 then 'Middle Class'
	when price >= 20500 then 'Second lowest'
	else 'First lowest' 
	end as Income_Class
	from bmw
	order by Price desc;

--Cclass
	select*,
case when price >= 54000 then 'Top class'
	when price >= 35700 then 'Second Top class'
	when price >= 26800 then 'Middle Class'
	when price >= 20500 then 'Second lowest'
	else 'First lowest' 
	end as Income_Class
	from cclass
	order by Price desc;

--hyndai
select*,
case when price >= 54000 then 'Top class'
	when price >= 35700 then 'Second Top class'
	when price >= 26800 then 'Middle Class'
	when price >= 20500 then 'Second lowest'
	else 'First lowest' 
	end as Income_Class
	from 
	hyndai
	order by Price desc;

--merc
select*,
case when price >= 54000 then 'Top class'
	when price >= 35700 then 'Second Top class'
	when price >= 26800 then 'Middle Class'
	when price >= 20500 then 'Second lowest'
	else 'First lowest' 
	end as Income_Class
	from 
	merc
	order by Price desc;


	

---c. Find relationship between fuel efficiency & price of car/sales of car/fuel type/, etc.

select*from audi;
select*from bmw;
select*from cclass;
select*from fueltype;
select*from hyndai;
select*from merc;
select*from models;
select*from transmission;
alter table cclass add tax 

create table car_details(
ID int,
model_ID tinyint,
year smallint,
price int,
Milage int,
tax smallint,
mpg float(2),
engineSiz float (2),
transmission_id tinyint,
fuel_id tinyint);

select*from audi;
select*from bmw;
select*from cclass;
select*from fueltype;
select*from hyndai;
select*from merc;
select*from models;
select*from transmission;

select * from audi inner join fueltype on audi.fuel_ID = fueltype.fuel_ID;

INSERT INTO car_details
SELECT * FROM audi
UNION ALL
SELECT * FROM cclass
UNION ALL
SELECT * FROM bmw
UNION ALL
SELECT * FROM hyndai
UNION ALL 
SELECT * FROM merc
order by ID ;
SELECT * FROM car_details inner join fueltype on car_details.fuel_id = fueltype.fuel_ID
--ALTER INCOMESHARE
alter table car_details add  Income_share varchar(50);

------Update the column in Income share of UK citizens base on price of cars

update car_details set Income_share = 'Top class' where price <= 54000;
update car_details set Income_share = 'Second Top class' where price <= 35700;
update car_details set Income_share = 'Middle Class' where price <= 26800;
update car_details set Income_share = 'Second lowest' where price <= 20500;
update car_details set Income_share ='First lowest' where price <13300;

	select * from car_details;
--add car_brand
	alter table car_details add car_Brand varchar(50);
--update car_brands	
	update car_details
	set car_Brand = 'Audi'
	where ID>0 and ID< = 10668;
    Update car_details
	set car_Brand = 'Merc' where id>=14568 and id<=27686 ;
	Update car_details
	set car_Brand = 'BMW' where ID >=27687 and ID<=38467;
	Update car_details
	set car_Brand = 'Hyndai' where ID>=38468 and Id<=43327;
 	update car_details
	set car_brand = 'Cclass' where ID> =10669 and ID<=14567;
	select * from car_details;
	select * from cclass;

--- add Coumn in cclass	
	Alter table cclass add tax smallint;
	alter table cclass add mpg real;

-------b. Categorize the cars on the basis of their price(Create as many buckets as you want as per your understanding of data) and analyze the:
	create Procedure Category_prcd
	as
	begin 
	select *,   
	case when Price >= 140000 then 'Catg A'
		when price > =100000 then 'Catg B'
		when price >=80000 then 'catg C'
		when price >= 50000 then 'Catg D'
		when price  >= 20000 then 'catg E'
		else 'Catg F'
		end as Category_by_price
		from car_details ;
	end;
	EXEC Category_prcd
	--a. price changes across the years and identify the categories which has seen significant jump in its price

		select *,
		lag(price,1)over (partition by year order by year) as lag_,
		lead(price,1)over(partition by year order by year)as lead_
		from (select *,   
	case when Price >= 140000 then 'Catg A'
		when price > =100000 then 'Catg B'
		when price >=80000 then 'catg C'
		when price >= 50000 then 'Catg D'
		when price  >= 20000 then 'catg E'
		else 'Catg F'
		end as Category_by_price
		from car_details)S car_details;


		--b changes in no of cars sold across the years and identify the categories which has seen significant jump in its sales 
select * from car_details order by ID;

select	Category_by_price, count(ID) over(partition by year order by year ) from (select *,   
	case when Price >= 140000 then 'Catg A'
		when price > =100000 then 'Catg B'
		when price >=80000 then 'catg C'
		when price >= 50000 then 'Catg D'
		when price  >= 20000 then 'catg E'
		else 'Catg F'
		end as Category_by_price
		from car_details
select*from car_details;

select*from fueltype;
select*from models;
select*from transmission;
	
		select car_details.*, fueltype.*, models.*, transmission.* from (select *,   
	case when Price >= 140000 then 'Catg A'
		when price > =100000 then 'Catg B'
		when price >=80000 then 'catg C'
		when price >= 50000 then 'Catg D'
		when price  >= 20000 then 'catg E'
		else 'Catg F'
		end as Category_by_price
		from car_details)car_details
	inner join fueltype on car_details.fuel_id = fueltype.fuel_ID
	inner join  models on car_details.model_ID = models.model_ID
	inner join transmission on car_details.transmission_id = transmission.ID order by car_details.ID;
						
----d. Create an analysis to show the effect of fuel expenditure on the sales of car over the years(Get the fuel prices in UK through the years through internet sources)

select distinct year from car_details order by year;  

select*,
case when year = 1970 then 34
	when year = 1991 then 39.5
	when year = 1995 then 50.9
	when year = 1996 then 52.9
	when year = 1997 then 57.9
