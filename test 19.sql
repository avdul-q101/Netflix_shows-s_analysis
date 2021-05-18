select type,title, country, duration ,count(*)  over(partition by country) parted from netflix_
order by parted desc--about 32% of TV Shows and Movies are from USA in Netflix , which is highest from a single country and second is india




select release_year,count(RELEASE_YEAR) c_d 
from netflix_ nt
group by release_year
order by c_d desc--2018 Movies are most Frequent
                 -- Most movies in netflix are from 2010-2020
                 

                 
with cte1 as(          
SELECT regexp_replace(duration, '[a-z]', '') MODIFIED_STRING  
FROM netflix_ nt
where type='Movie')
select avg(MODIFIED_STRING) from cte1
-- The average run time for movies in netflix is 99 minutes or  1 Hour 39 Minutes





with cte2 as(          
SELECT regexp_replace(duration, '[Season]', '') MODIFIED_STRING  
FROM netflix_ nt
where type='TV Show')
select avg(MODIFIED_STRING) from cte2
-- The average runtime for most of the TV Shows is 1 season






select country, count(country)
from netflix_
where rating='TV-MA'
group by country
-- USA is responsible for the production of MATURE CONTENT 12 % of the total mature content comes from USA
-- You can customize this query by puting the rating of your choice after the WHERE CLAUSE





select director,count(*)
from netflix_
group by director 
order by count(*) desc
-- Jay Karas,'RaAl Campos , Jan suter', youssef chahine are the top director for netflix tv shows and movies






select count(rating) over(partition by rating)ct,rating,country,title
from netflix_
where country ='United States'
order by ct desc
--THIS QUERY RETURNS COUNT OF VARIOUS RATINGS AND THE COUNTRIES IN THE ROW ACROSS THEM WITH TITLE 
--36 % OF THE MOVIES AND TV SHOWS ARE RATED WITH TV-MA "MATURE AUDIENCE"
--SELECT 1753/4861*100 FROM DUAL







select count(*),rating
from netflix_
group by rating
order by count(*)desc
/* THIS QUERY RETURNS THE DISTRIBUTION  OF VARIOUS RATINGS IN NETFLIX*/







/*What different types of show or movie uploaded on Netflix?
Which director is the most common on the Netflix?
Which director directs the shows maximum?
What different types of celebrities cast the shows more often?
In which country these shows are cast maximum that were added on Netflix?
In which month or year these shows added onto the Netflix mainly?
In which year the shows were released maximum and added onto the Netflix?
What are the different types of rating were giving on the Netflix?
What are the different categories were found on the Netflix?
What is the most common duration that were added on the Netflix?*/


--I TRIED TO ANSWER SOME OF THESE QUESTIONS BY USING PL/SQL 
--I PUT MY DECENT EFFORT AND THE RESULT IS ABOVE THANK YOU VERY MUCH!
