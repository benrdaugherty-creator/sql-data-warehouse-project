--column names in bronze layer 1 to 1, exactly like source system

CREATE TABLE broze.crm_cust_info (
cst_id INT, 
cst_key NVARCHAR(50), 
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);

CREATE TABLE broze.crm_prd_info (
prd_id INT, 
prd_key NVARCHAR(50), 
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
);

CREATE TABLE broze.crm_sales_detail (
sls_ord_num NVARCHAR(50), 
sls_prd_num NVARCHAR(50), 
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT,
);

DROP TABLE broze.sales_detail

CREATE TABLE broze.erp_loc_a101 (
cid NVARCHAR(50), 
cntry NVARCHAR(50));

CREATE TABLE broze.erp_cust_az12 (
cid NVARCHAR(50), 
bdate DATE,
gen NVARCHAR(50)
);

CREATE TABLE broze.erp_px_cat_g1v2 (
id NVARCHAR(50), 
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
);

--in SSMS you need tsql logic to change a table
--U = user defined table
-- ex: IF Object_ID ('Table name', 'U') IS NOT NULL DROP TABLE TAble name... then create it from scratch

--Bulk insert: loads mass amount of data quickly from same a txt file
--Does go row by row, but one operation that loads all data in one go into the DB

--Load from 1st table to seed the DB from csv file

--(not normal insert)
--Truncate (quickly delete all rows from a table, setting it to an empty state), then load

--Quality check, make sure data is correct, hasn't shifted, etc

--Create stored procedure

USE DataWarehouse
GO
