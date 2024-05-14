SELECT * FROM pizza_sales_csv;


SELECT sum(total_price)/count(DISTINCT (order_id)) AS AVG_order FROM pizza_sales_csv;

SELECT SUM(quantity) as Total_pizza_sold FROM pizza_sales_csv;

SELECT count(distinct(order_id)) as Toatal_orders FROM pizza_sales_csv;

SELECT cast(sum(quantity)/count(distinct order_id) as DECIMAL(10,2)) as Avg_pizzas_per_order FROM pizza_sales_csv;


--Hourly Trend for Total Pizzas Sold:

SELECT HOUR(order_time) as Hour_order, SUM(quantity) as Total_pizzas_sold FROM pizza_sales_csv
GROUP BY HOUR(order_time) ORDER BY HOUR(order_time);


--Weekly Trend for Total Pizzas Sold:

SELECT WEEK(str_to_date(order_date,'%m/%d/%Y'),1) AS Week_number,
			YEAR (str_to_date(order_date,'%m/%d/%Y')) as year,
			COUNT(DISTINCT order_id) AS Total_orders           
FROM pizza_sales_csv
GROUP BY WEEK(str_to_date(order_date,'%m/%d/%Y'),1),YEAR (str_to_date(order_date,'%m/%d/%Y'))
ORDER BY WEEK(str_to_date(order_date,'%m/%d/%Y'),1), YEAR (str_to_date(order_date,'%m/%d/%Y'));            
    

--Percent Sales by Pizza Category:

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_sales, CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales_csv) as DECIMAL(10,2)) AS PCT 
FROM pizza_sales_csv 
GROUP BY pizza_category;


--Percent Sales by Pizza Size:

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as Total_sales, CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales_csv) as DECIMAL(10,2)) AS PCT 
FROM pizza_sales_csv 
GROUP BY pizza_size
ORDER BY PCT DESC;


--TOP 5 PIZZAS BY REVENUE

SELECT pizza_name, SUM(total_price) as Total_revenue
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_revenue DESC LIMIT 5;


--BOTTOM 5 PIZZAS BY REVENUE

SELECT pizza_name, SUM(total_price) as Total_revenue
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_revenue ASC LIMIT 5;


--TOP 5 PIZZAS BY QUANTITY

SELECT pizza_name, SUM(quantity) as Total_quantity
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_quantity DESC LIMIT 5;


--BOTTOM 5 PIZZAS BY QUANTITY

SELECT pizza_name, SUM(quantity) as Total_quantity
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_quantity ASC LIMIT 5;


--TOP 5 PIZZAS BY TOTAL ORDER

SELECT pizza_name, COUNT(DISTINCT order_id) as Total_order
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_order DESC LIMIT 5;


--BOTTOM 5 PIZZAS BY TOTAL ORDER

SELECT pizza_name, COUNT(DISTINCT order_id) as Total_order
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_order ASC LIMIT 5;


--BOTTOM 5 PIZZAS BY TOTAL ORDER

SELECT pizza_name, COUNT(DISTINCT order_id) as Total_order
FROM pizza_sales_csv
GROUP BY pizza_name
ORDER BY Total_order ASC LIMIT 5;
