CREATE FUNCTION dbo.udf_convertPTHMS_2_Sec(@duration nvarchar(11))  
RETURNS int   
AS   
-- Returns the seconds for ISO PTMS format.  
BEGIN  
    DECLARE @sec int;  
    SELECT @sec = cast((case
when REPLACE(@duration,'PT','') like '%S%' 
then 
substring
(REPLACE(@duration,'PT','')
,(case when REPLACE(@duration,'PT','') like '%M%' 
then charindex('M',REPLACE(@duration,'PT',''))+1
else
(case when REPLACE(@duration,'PT','') like '%H%' 
then charindex('H',REPLACE(@duration,'PT',''))+1
else 1
end)
end)
,len(REPLACE(@duration,'PT',''))-1
-(case when REPLACE(@duration,'PT','') like '%M%' 
then charindex('M',REPLACE(@duration,'PT',''))
else
(case when REPLACE(@duration,'PT','') like '%H%' 
then charindex('H',REPLACE(@duration,'PT',''))
else 0
end)
end)
)else 0
end ) as int)
+ 
cast((case
when REPLACE(@duration,'PT','') like '%M%' 
then 
substring
(REPLACE(@duration,'PT','')
,(case when REPLACE(@duration,'PT','') like '%H%' 
then charindex('H',REPLACE(@duration,'PT',''))+1
else 1
end)
,charindex('M',REPLACE(@duration,'PT',''))-1
-(case when REPLACE(@duration,'PT','') like '%H%' 
then charindex('H',REPLACE(@duration,'PT',''))
else 0
end)
)else 0
end) as int)* 60
+
cast((case
when REPLACE(@duration,'PT','') like '%H%' 
then 
substring
(REPLACE(@duration,'PT','')
,1
,charindex('H',REPLACE(@duration,'PT',''))-1
)else 0
end) as int) * 60 * 60; 
    
     IF (@sec IS NULL)   
        SET @sec = 0;  
    RETURN @sec;  
END;  
GO  
  