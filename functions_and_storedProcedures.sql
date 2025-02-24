use jibe_main_training;

CREATE TABLE SampleTable_tbl (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50),
    Age INT
);

DECLARE @counter INT = 1;
DECLARE @name NVARCHAR(50);
DECLARE @age INT;

WHILE @counter <= 600
BEGIN
    SET @name = 'DemoName' + CAST(@counter AS NVARCHAR(50));
    SET @age = 20 + @counter % 50;  -- Age will range from 20 to 69

    INSERT INTO SampleTable_tbl (ID, Name, Age)
    VALUES (@counter, @name, @age);
    
    SET @counter = @counter + 1;
END;

select * from SampleTable_tbl;

set statistics io on;

set statistics time on;


ALTER TABLE SampleTable_tbl
DROP CONSTRAINT PK__SampleTa__3214EC278CBD754D;

SELECT constraint_name
FROM information_schema.table_constraints
WHERE table_name = 'SampleTable_tbl'
AND constraint_type = 'PRIMARY KEY';


select * from SampleTable_tbl;

WITH Ranked AS (
    SELECT
        ID,
        Name,
        Age,
        AVG(Age) OVER () AS AvgAge,
        RANK() OVER (ORDER BY Age DESC) AS AgeRank
    FROM
        SampleTable_tbl
)
SELECT
    ID,
    Name,
    Age,
    AgeRank
FROM
    Ranked
WHERE
    Age >= AvgAge
ORDER BY
    AgeRank;


create clustered index idx_id on SampleTable_tbl(id);


-- Before Optimization

/* SQL Server parse and compile time: 
   CPU time = 13 ms, elapsed time = 13 ms.

(312 rows affected)
Table 'Worktable'. Scan count 3, logical reads 1225, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table 'SampleTable_tbl'. Scan count 1, logical reads 4, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 12 ms.

Completion time: 2025-02-24T10:55:52.9335521+05:30 */




--After Optimization
/* SQL Server parse and compile time: 
   CPU time = 0 ms, elapsed time = 1 ms.

(312 rows affected)
Table 'Worktable'. Scan count 3, logical reads 1225, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
Table 'SampleTable_tbl'. Scan count 1, logical reads 6, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.

 SQL Server Execution Times:
   CPU time = 0 ms,  elapsed time = 20 ms.

Completion time: 2025-02-24T10:57:43.3066449+05:30 */


--Composite Index



create index idx_id_age on sampletable_tbl(id, age);


--To drop index
drop index idx_id_age on sampletable_tbl;

select * from sampletable_tbl where age between 24 and 68;


--Functions 

CREATE FUNCTION CalculateSquare (@Number INT)
RETURNS INT
AS
BEGIN
    RETURN @Number * @Number;
END;

select dbo.calculatesquare (2);