USE EnterpriseBI_DW;
GO

-- 1. Create Security schema

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'Security'
)
BEGIN
    EXEC('CREATE SCHEMA Security');
END;
GO


-- 2. Create SecurityUserRegionAccess

IF OBJECT_ID(
    'Security.SecurityUserRegionAccess',
    'U'
) IS NULL
BEGIN

    CREATE TABLE Security.SecurityUserRegionAccess
    (
        UserRegionAccessKey INT IDENTITY(1,1)
            PRIMARY KEY,

        UserEmail NVARCHAR(256) NOT NULL,

        RegionKey INT NOT NULL,

        IsActive BIT NOT NULL
            CONSTRAINT DF_UserRegionAccess_IsActive
            DEFAULT (1),

        CreatedAt DATETIME2 NOT NULL
            CONSTRAINT DF_UserRegionAccess_CreatedAt
            DEFAULT (SYSDATETIME()),

        CONSTRAINT UQ_UserRegionAccess_User_Region
            UNIQUE (UserEmail, RegionKey),

        CONSTRAINT FK_UserRegionAccess_SalesTerritory
            FOREIGN KEY (RegionKey)
            REFERENCES Dim.DimSalesTerritory(SalesTerritoryKey)
    );

END;
GO


-- 3. Verify the table

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Security'
  AND TABLE_NAME = 'SecurityUserRegionAccess'
ORDER BY ORDINAL_POSITION;
GO