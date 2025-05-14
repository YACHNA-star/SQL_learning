use MyDatabase
/*CODING ORDER 
  ==============
-----------------------------------------------------------------------------
SELECT DISTINCT TOP2 col1  --------->5         
Sum(col2)
FROM table     ------->-------->---->1
WHERE col=10(CONDITON)   ----------->2                       
GROUP BY col1    ------>-------->--->3
HAVING Sum(col2)>30 --------->------>4                 
Order by col1 Asc------>----->------>6
-----------------------------------------------------------------------------
  EXECUTING ORDER
  ================
-----------------------------------------------------------------------------
1.FROM
2.WHERE(filter the data before aggregation )
3.GROUP BY(Aggregate the data(combine the row with same value))
4.HAVING(filter the data like where but after aggregation)
5.SELECT DISTINCT
6.ORDER BY(sort the data)--->1)(defualt)ASC |,2)DESC
7.TOP(Restrict the number of Rows)
more point to note
==--==--==--===
==>aggregation like sum,max,etc 
==>Distinct(remove duplicate)
-----------------------------------------------------------------------------*/
----Retrieve ALL Customer Data-----
SELECT*
FROM customers
----Retrieve each customer first_name,country,score-----
SELECT first_name,country,score
FROM customers
----Retrieve customer with score not equal to zero-----
/*===========
WHERE
=============*/
SELECT*
FROM customers Where score != 0
----Retrieve customer from Germany----
SELECT*
FROM customers Where country='Germany'
/*===========
ORDER BY 
=============*/
----Retrieve all customers and sort the results by the highest score first----
SELECT*
FROM customers
ORDER BY score DESC
----Retrieve all customers and sort the results by the lowest score first----
---BY default (ASC)---
SELECT*
FROM customers
ORDER BY score
----Retrieve all customers and sort the results by country and highest score---
SELECT*
FROM customers
ORDER BY country,score desc/*country have more prioty then score*/
/*===========
GROUP BY(RULE:All columns in the select must be either aggregated or included in the GROUP BY )
=============*/
-----Find total score for the each country---
SELECT country,
sum(score) as TOTAL_Score
FROM customers
group by country
----for veiwng first_name in GROUP BY we need to follow rule----
SELECT country,first_name,
sum(score) as TOTAL_Score
FROM customers
group by country,first_name
/*===========
HAVING(Rule:can be used only after GROUP BY)
=============*/
---- Find the averare score for each country considering only customer with a sore not equal to 0---- 
SELECT country,
avg(score) as Avg_Score
FROM customers where score!=0
group by country
-----also  return only those countries with avg score greater then 430----
SELECT country,
avg(score) as Avg_Score
FROM customers where score!=0
group by country
HAVING avg(score)>430
/*===========
DISTINCT(kept row which comes first and remove restin result ),NOTE:dont use it unless it necessary (bcoz it slow down your query)
=============*/
----Return Unique list of all countries
select DISTINCT country
from customers
/*===========
TOP
=============*/
----Retrieve the top3 customer with highest scores
Select top 3 *
from customers
Order by score desc