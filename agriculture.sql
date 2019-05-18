-- Rafael Santos and James Dietz
-- ETL project, May 18, 2019
-- agriculture data

-- CREATE DATABASE
-- create and use database to store data 
CREATE DATABASE agriculture_db;
USE agriculture_db;

-- CREATE TABLES
-- create a table to hold df on cereal yield, World Bank data  
CREATE TABLE cereal_yield (
  country_code VARCHAR(3),
  country_name TEXT,
  yield INT,
  PRIMARY KEY (country_code)
  );
 
 -- create a table to hold df on agriculture land, World Bank data.  Had to drop table and recreate to deal
 -- with problem of SQL not accepting decimal with 6 decimal levels.
  CREATE TABLE agriculture_land (
  country_code VARCHAR(3),
  country_name TEXT,
  percent_land DECIMAL(8,6),
  PRIMARY KEY (country_code)
  );
  
  -- Examination of tables, drops and alters were used to resolve problems with decimal places in cereal_yield
DROP TABLE agriculture_land;  
ALTER TABLE agriculture_land
	MODIFY COLUMN percent_land DECIMAL(20,16);
  
  SELECT * FROM cereal_yield;
  SELECT * FROM agriculture_land;
  
  DESCRIBE cereal_yield;
  DESCRIBE agriculture_land;
  
  
  -- This table was created to store the data having to do with specific commodity yields and prices related to cereal crops.     
  CREATE TABLE table_food (
  country_code VARCHAR(3),
  country TEXT,
  currency_ID TEXT,
  commodity_purchased_bread TEXT,
  unit_of_goods_measurement_bread TEXT,
  monthly_average_price_paid_bread DECIMAL(10,2),
  commodity_purchased_rice TEXT,
  unit_of_goods_measurement_rice TEXT,
  monthly_average_price_paid_rice DECIMAL(10,2),
  commodity_purchased_wheat TEXT,
  unit_of_goods_measurement_wheat TEXT,
  monthly_average_price_paid_wheat DECIMAL(10,2),
  PRIMARY KEY (country_code)
  );
  
  SELECT * FROM table_food;
  
  -- TABLE JOINS
  
  -- A left join and inner join (depends on the analyses desired) yields 215 rows of data
  SELECT cereal_yield.country_name, cereal_yield.country_code, cereal_yield.yield, agriculture_land.percent_land, 
	  table_food.currency_ID, commodity_purchased_bread, table_food.unit_of_goods_measurement_bread, 
	  table_food.monthly_average_price_paid_bread, table_food.commodity_purchased_rice, 
	  table_food.unit_of_goods_measurement_rice, table_food.monthly_average_price_paid_rice, 
	  table_food.commodity_purchased_wheat, table_food.unit_of_goods_measurement_wheat, 
      table_food.monthly_average_price_paid_wheat
	FROM cereal_yield
	LEFT JOIN agriculture_land 
    ON cereal_yield.country_code = agriculture_land.country_code
    JOIN table_food
    ON agriculture_land.country_code = table_food.country_code;
    
    -- Joining just two tables from World Bank Data, tables with the most available data (264 rows), may be 
    -- desirable depending on the data analyses to be performed.
	SELECT cereal_yield.country_name, cereal_yield.country_code, cereal_yield.yield, agriculture_land.percent_land 
	FROM cereal_yield
	JOIN agriculture_land 
    ON cereal_yield.country_code = agriculture_land.country_code;
    
    -- Inner join on all three tables.
    SELECT cereal_yield.country_name, cereal_yield.country_code, cereal_yield.yield, agriculture_land.percent_land, 
	  table_food.currency_ID, commodity_purchased_bread, table_food.unit_of_goods_measurement_bread, 
	  table_food.monthly_average_price_paid_bread, table_food.commodity_purchased_rice, 
	  table_food.unit_of_goods_measurement_rice, table_food.monthly_average_price_paid_rice, 
	  table_food.commodity_purchased_wheat, table_food.unit_of_goods_measurement_wheat, 
      table_food.monthly_average_price_paid_wheat
	FROM table_food
    JOIN cereal_yield
    ON table_food.country_code = cereal_yield.country_code
    JOIN agriculture_land
    ON cereal_yield.country_code = agriculture_land.country_code;