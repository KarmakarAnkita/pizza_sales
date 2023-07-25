SELECT * FROM pizza_sales

# TOTAL REVENUE OF ALL PIZZA ORDER
SELECT SUM(total_price) AS Total_Revenue from pizza_sales

# AVERAGE ORDER VALUE
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_order_value FROM pizza_sales

# TOTAL PIZZA SOLD
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

# TOTAL ORDER PLACED
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales 


# AVERAGE PIZZAS PER ORDER
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_pizzas_per_order FROM pizza_sales


# DAILY TREND FOR TOTAL ORDERS
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


# HOURLY TREND FOR  TOTAL ORDERS
SELECT DATEPART(HOUR, order_time) AS Order_Hours, COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)


# PERCENTAGE OF SALES  BY PIZZA CATEGORY
SELECT pizza_category, sum(total_price) AS Total_Sales, sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales 
GROUP BY pizza_category


# PERCENTAGE OF SALES  BY PIZZA SIZE
SELECT pizza_size, sum(total_price) AS Total_Sales, sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC


# TOTAL PIZZA SOLD BY PIZZA CATEGORY
SELECT pizza_category, sum(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category


# TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, sum(quantity) AS Total_Pizzas_Sold
From pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity) DESC


TOP 5 BEST SELLERS BY TOTAL PIZZAS SOLD
SELECT TOP 5 pizza_name, sum(quantity) AS Total_Pizzas_Sold
From pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity) ASC

