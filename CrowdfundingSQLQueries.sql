SELECT * FROM crowdfunding.projects;

/* 5(a) Total no.of projects based on outcome(state)*/
select state as Outcome, count(ProjectID) as TotalnumProjects from projects
group by state
order by count(ProjectID) desc;

/* 5(b) Total no.of projects based on locations*/
select count(ProjectID) as Totalnumprojects ,l.country from projects p
join crowdfunding_location l
on  p.location_id=l.id
group by l.country;

/* 5(c) Total no.of projects based on category*/
select count(ProjectID) as Totalnumprojects, c.name as categoryname from projects p
join crowdfunding_category c
on p.category_id=c.id
group by c.name
order by Totalnumprojects desc ;

/* 5(d) Total no.of projects based on Y,Q.M*/
SELECT 
    YEAR(FROM_UNIXTIME(created_at)) AS year,
    QUARTER(FROM_UNIXTIME(created_at)) AS quarter,
    MONTH(FROM_UNIXTIME(created_at)) AS month,count(ProjectID) as Totalnumprojects from projects
group by year,quarter,month 
order by year,quarter,month ;

/* 6(a,b,c) successful projects based on Amount Raised,num of backers,avg no:of days*/
select sum(goal*static_usd_rate)as AmountRaised,
count(backers_count) as Numberofbackers,
round(avg(deadline-created_at)/86400.0) as averagedays from projects
where state="successful";
/*avg(datediff(FROM_UNIXTIME(deadline),FROM_UNIXTIME(created_at))) from projects*/

/* 7(a) Top 10 successful projects based on Amount Raised*/

select name as TopSuccessful_Project, sum(goal*static_usd_rate)as AmountRaised from projects
where state="successful" 
group by name
order by AmountRaised desc limit 10;

/* 7(b) Top 10 successful projects based on num of backers*/

select name as TopSuccessful_Project, backers_count as Numberofbackers from projects
where state="successful" 
order by Numberofbackers desc limit 10;

/*8(a) percentage successful projects by overall*/
select 
concat(round(sum(if(state="successful",1,0))/count(*)*100,2), "%") as OverallSuccessful_Percentage
from projects;

/*8(b) percentage successful projects by category*/
select c.name as category,
concat(round(sum(if(state="successful",1,0))/count(*)*100,2), "%") as CategorySuccessful_Percentage 
FROM projects p
join crowdfunding_category c
on p.category_id=c.id
GROUP BY 
   c.name;

   /*8(c) percentage successful projects by Year,quarter,month*/
     SELECT 
    YEAR(FROM_UNIXTIME(created_at)) AS year,
    QUARTER(FROM_UNIXTIME(created_at)) AS quarter,
    MONTH(FROM_UNIXTIME(created_at)) AS month,
   concat(round(sum(state= 'successful')*100 / COUNT(*),2), "%") as SuccessPercentageY_Q_M
     /*sum(case when state='successful' then 1 else 0 end)*100.0/count(*)as SuccessPercentageY_Q_M*/
    from projects
group by year,quarter,month
order by year,quarter,month ;
   
/*8(d) percentage successful projects by Goal Range*/
select
concat(ROUND(SUM(state='successful')*100/ count(ProjectID),2),'%') AS successpercentage_of_goalrange ,
CASE
        WHEN goal < 1000 THEN '0 - 999'
        WHEN goal BETWEEN 1000 AND 4999 THEN '1000 - 4999'
        WHEN goal BETWEEN 5000 AND 9999 THEN '5000 - 9999'
        WHEN goal BETWEEN 10000 AND 49999 THEN '10000 - 49999'
        WHEN goal >= 50000 THEN '50000 and above'
        ELSE 'Unknown'
        end as goal_range
          from projects          
          group by goal_range;
          