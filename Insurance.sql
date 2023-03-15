-- selecting all columns from Insurance
select * from Insurance
order by age asc

-- average charge by gender and smoker
select sex, smoker, ROUND(AVG(cast(charges as float)),2) as AverageCharges from Insurance
group by sex, smoker

-- checking age ranges
select age, ROUND(AVG(cast(charges as float)),2) as AverageCharges from Insurance
group by age
order by age asc

-- average charges by age range
with temptable as (
select
case 
	when age between 18 and 29 then '18-29'
	when age between 30 and 39 then '30-39'
	when age between 40 and 49 then '40-49'
	when age between 50 and 59 then '50-59'
	when age between 60 and 64 then '60-64'
end as AgeRange, charges
from Insurance
) 
select AgeRange, ROUND(AVG(cast(charges as float)),2) as AverageCharges from temptable
group by AgeRange
order by AgeRange asc

-- sum of charges by the region
select region, SUM(cast(charges as float)) as SumCharges from Insurance
group by region
order by SumCharges desc

-- checking min and max bmi
select min(bmi) as min, max(bmi) as max from Insurance

-- avg charges by bmi

with temptable2 as (
select
case 
	when cast(bmi as float) between 15 and 25 then '15-25'
	when cast(bmi as float) between 25 and 35 then '25-35'
	when cast(bmi as float) between 35 and 45 then '35-45'
	when cast(bmi as float) between 45 and 54 then '45-55'
end as BmiRange, charges, smoker
from Insurance
) 
select BmiRange, smoker, ROUND(AVG(cast(charges as float)),2) as AverageCharges from temptable2
group by BmiRange, smoker
order by BmiRange asc

-- avg charges by number of children having
select children, ROUND(AVG(cast(charges as float)),2) as AverageCharges from Insurance
group by children
order by AverageCharges asc