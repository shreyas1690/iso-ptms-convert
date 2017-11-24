# iso-ptms-convert
SQL Server UDF - Convert YouTube API duration (ISO 8601 duration in the format PT#H#M#S) to seconds

Examples :

select dbo.udf_convertPTHMS_2_Sec('PT1H53M40S');

Output:
6820

select dbo.udf_convertPTHMS_2_Sec('PT1H40S');

Output:
3640
