# Data Warehouse and Analytics Project

Building a modern data warehouse with SQL Server

Statement: Create modern DW to consolidate sales data, enabling analytical reporting and informed decision-making

-Data Sources: import data from two source systems (erp and crm) provided as csv
-Data quality: Cleanse and resolve data quality issues prior to analysis
-Integration: Combine both sources into a single, user-friendly data model designed for analytical queries
-Documentation

Design management approach: Functional, scalable, and easy  to maintain

Data approaches or management system: Data Lakehouse, like a mix between DW and Data Lake. 
-You get flexibility of data lake, and structure of DW
Medallion:

1. Bronze (Stage, keeping original data as it is, for flexibility)
2. Silver (Data transformations, but as yet no business rules)
3 Gold (Similar to data marts. But you can build different objects for not just reporting, but for machine learning, ai, etc., other data products)

