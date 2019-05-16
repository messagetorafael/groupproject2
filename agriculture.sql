CREATE DATABASE agriculture_db;
USE agriculture_db;
  
CREATE TABLE cereal_yield (
  country_code VARCHAR(3),
  country_name TEXT,
  yield INT,
  PRIMARY KEY (country_code)
  );
 
  CREATE TABLE agriculture_land (
  country_code VARCHAR(3),
  country_name TEXT,
  percent_land DECIMAL(8,6),
  PRIMARY KEY (country_code)
  );
DROP TABLE agriculture_land;  
ALTER TABLE agriculture_land
	MODIFY COLUMN percent_land DECIMAL(20,16)
    ;
  
  SELECT * FROM cereal_yield;
  SELECT * FROM agriculture_land;
  
  
  DESCRIBE cereal_yield;
  DESCRIBE agriculture_land;
  
  
       
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
  
  SELECT * FROM table_food
  ;