Stored procedure
-No parameters, and does not return any values 

  =======

CREATE OR ALTER PROCEDURE broze.load_broze 
AS
BEGIN
	--declare variables to figure out load time
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
			-- Load CRM data

		Print '=========================================';
		Print 'Loading Bronze Layer' ;
		Print '=========================================';

		Print '-----------------------------------------';
		Print 'Loading CRM Tables' 
		Print '-----------------------------------------' ;

		SET @start_time = GETDATE();

		Print 'Truncating Table: bronze.crm_cust_info';
			TRUNCATE TABLE broze.crm_cust_info;
			BULK INSERT broze.crm_cust_info
			FROM 'C:\Users\benrd\OneDrive\Desktop\Data Sets\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);

			SET @end_time = GETDATE();
			print '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds' 

			TRUNCATE TABLE broze.crm_prd_info;
			BULK INSERT broze.crm_prd_info
			FROM 'C:\Users\benrd\OneDrive\Desktop\Data Sets\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);

			TRUNCATE TABLE broze.crm_sales_detail;
			BULK INSERT broze.crm_sales_detail
			FROM 'C:\Users\benrd\OneDrive\Desktop\Data Sets\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);

			-- Load ERP data

		Print '-----------------------------------------';
		Print 'Loading ERP Tables' 
		Print '-----------------------------------------' ;
			TRUNCATE TABLE broze.erp_cust_az12;
			BULK INSERT broze.erp_cust_az12
			FROM 'C:\Users\benrd\OneDrive\Desktop\Data Sets\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);

			TRUNCATE TABLE DataWarehouse.broze.erp_LOC_A101;
			BULK INSERT DataWarehouse.broze.erp_LOC_A101
			FROM 'C:\Users\benrd\OneDrive\Desktop\Data Sets\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);

			TRUNCATE TABLE DataWarehouse.broze.erp_px_cat_g1v2;
			BULK INSERT DataWarehouse.broze.erp_px_cat_g1v2
			FROM 'C:\Users\benrd\OneDrive\Desktop\Data Sets\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
	END TRY
	BEGIN CATCH
		print '======================';
		print 'error occured during loading bronze layer';
		print 'error message' + ERROR_MESSAGE();
		print 'Error message' + CAST(error_number() AS NVARCHAR);
		print '======================';
	END CATCH
END;
--select * from broze.erp_px_cat_g1v2

--select count(*) from broze.crm_cust_info

--Execute Stored proc

Exec broze.load_broze
