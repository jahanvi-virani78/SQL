#mini project

#PART 1

create database icc_test;

use icc_test;

select * from icc;
#2
alter table icc drop `player profile`;

select * from icc;
#3
alter table icc add column player_name varchar(20);

alter table icc add column player_country varchar(20);

alter table icc modify column player_name varchar(30);

alter table icc modify column player_country varchar(30);


select substring_index(player, '(', 1) from icc;

update icc set player_name=trim('' from substring_index(player, '(', 1) );

update icc set player_country=trim(')' from substring_index(player, '(', -1));

select * from icc;


#4

alter table icc add column start_year int;
alter table icc add column end_year int;

update icc set start_year=lpad(span, 4, '-');

select player_country from icc
where player_country like '%/icc%';



update icc set end_year=rpad(span, 4 , '-');

update icc set end_year=trim('' from substring_index(span, '-', -1));

select * from icc;

#5

alter table icc add column highest_score int;
alter table icc add column not_out int;

alter table icc drop column not_out;

alter table icc add column status varchar(10);

update icc set highest_score = trim('*' from HS);

update icc set status = case when HS like '%*' then 'not out'
else 'out'
end;


select * from icc;

select * from icc
where start_year = 2019;



#6

select * from icc
where end_year = 2019 and player_country like '%INDIA%'
order by AVG desc
limit 6;

#7

select * from icc
where end_year = 2019 and player_country like '%INDIA%'
order by `100` desc
limit 6;


#8

#where player is not out
#where player has highest 50 and 0
 
select * from icc
where status like '%NOT%' and player_country like '%INDIA%'
order by `50` and `0` desc 
limit 6;

#9

create view  Batting_Order_GoodAvgScorers_SA as
select * from icc
where end_year = 2019 and player_country like 'SA%'
order by AVG desc
limit 6;

#10
 create view Batting_Order_HighestCenturyScorers_SA as
 select * from icc
 where end_year = 2019 and player_country like '%SA%'
 order by `100` desc
 limit 6;



select substring_index(player_country, '/', -1) from icc;

select substring_index(player_country,'/',-1) from icc
where player_country like 'ICC/%';

update icc set player_country =  SUBSTRING_INDEX(player_country,'/',-1) where player_country like 'ICC/%';
update icc  set player_country = SUBSTRING_INDEX(player_country,'/',1) where player_country like '%/ICC';
update icc  set player_country = SUBSTRING_INDEX(player_country,'/',-1) where player_country not like 'ICC/%' and player_country not like 'ICC/%'
 and player_country like '%/%';
 

select player_country from icc;

#11

select count(player_name), player_country from icc
group by player_country;

#12

select *, 
case 
when player_country like '%IN%' or 
	player_country like '%SL%'  or 
    player_country like '%PAK%' or 
    player_country like '%BDESH%' or 
    player_country like '%AFG%' then 'Asian'
else 'Non-Asian'
end as Continent 
FROM icc ;

