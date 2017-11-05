# iso-ptms-convert
SQL Server UDF to Convert ISO PTMS to Seconds

Examples :

select dbo.udf_convertPTHMS_2_Sec('PT1H53M40S');

Output:
6820

select dbo.udf_convertPTHMS_2_Sec('PT1H40S');

Output:
3640
