/*
---
Stored Procedure: Load Bronze Layer (Source -> Bronze)
---
Script Purpose:
- This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Uses the `BULK INSERT` command to load data from csv files to bronze tables.

Parameters:
- None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
---
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN 
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
	    SET @batch_start_time = GETDATE();
		PRINT'===========================================================================';
		PRINT'Loading Bronze Layer';
		PRINT'===========================================================================';


		PRINT'---------------------------------------------------------------------------';
		PRINT'Loading CRM Tables';
		PRINT'---------------------------------------------------------------------------';
		 

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE  bronze.crm_cust_info;

		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\mayan\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
		  FORMAT = 'csv',
		  FIRSTROW = 2,
		  FIELDTERMINATOR  =  ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (second,@start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>  ------------' ;


		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE  bronze.crm_cust_info;
		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\mayan\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
		  FORMAT = 'csv',
		  FIRSTROW = 2,
		  FIELDTERMINATOR  =  ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (second,@start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>  ------------' ;


	    SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_detail';
		TRUNCATE TABLE  bronze.crm_sales_detail;
		PRINT '>> Inserting Data Into: bronze.crm_sales_detail';
		BULK INSERT  bronze.crm_sales_detail
		FROM 'C:\Users\mayan\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
		  FORMAT = 'csv',
		  FIRSTROW = 2,
		  FIELDTERMINATOR  =  ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (second,@start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>  ------------' ;


	

		PRINT'---------------------------------------------------------------------------';
		PRINT'Loading ERP Tables';
		PRINT'---------------------------------------------------------------------------';

		
	    SET @start_time = GETDATE();
		PRINT'--------------------------------------------------------';

	    SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE  bronze.erp_cust_az12;
		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT  bronze.erp_cust_az12
		FROM 'C:\Users\mayan\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
		  FORMAT = 'csv',
		  FIRSTROW = 2,
		  FIELDTERMINATOR  =  ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (second,@start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>  ------------' ;

