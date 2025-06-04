--C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup
BACKUP DATABASE [OnlineShopDB] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\0604202502' 
WITH NOFORMAT, NOINIT,  
NAME = N'master-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
--------------
--To find the most long-running queries in SQL Server, you can use Dynamic Management Views (DMVs) 
--like sys.dm_exec_query_stats, sys.dm_exec_sql_text, and sys.dm_exec_query_plan.
SELECT TOP 10
qs.total_elapsed_time / qs.execution_count AS AvgElapsedTime,
qs.execution_count,
qs.total_elapsed_time,
SUBSTRING(st.text, (qs.statement_start_offset / 2) + 1,
((CASE qs.statement_end_offset 
WHEN -1 THEN DATALENGTH(st.text)
ELSE qs.statement_end_offset 
END - qs.statement_start_offset) / 2) + 1) AS QueryText,
qp.query_plan
FROM 
sys.dm_exec_query_stats AS qs
CROSS APPLY 
sys.dm_exec_sql_text(qs.sql_handle) AS st
CROSS APPLY 
sys.dm_exec_query_plan(qs.plan_handle) AS qp
ORDER BY AvgElapsedTime DESC;

----
--Identify Performance Bottlenecks

--Find long-running queries:
SELECT TOP 10 * 
FROM sys.dm_exec_query_stats
ORDER BY total_elapsed_time DESC;

----Identify missing indexes:
SELECT * 
FROM sys.dm_db_missing_index_details;
--
--Track high CPU/IO queries:
SELECT TOP 10 total_worker_time, total_logical_reads, text
FROM sys.dm_exec_query_stats 
CROSS APPLY sys.dm_exec_sql_text(sql_handle)
ORDER BY total_worker_time DESC;
---




