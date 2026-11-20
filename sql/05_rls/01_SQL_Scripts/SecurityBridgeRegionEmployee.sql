USE EnterpriseBI_DW;
GO

IF OBJECT_ID(
    'Security.BridgeRegionEmployee',
    'U'
) IS NULL
BEGIN

    CREATE TABLE Security.BridgeRegionEmployee
    (
        BridgeRegionEmployeeKey INT IDENTITY(1,1)
            PRIMARY KEY,

        EmployeeKey INT NOT NULL,

        RegionKey INT NOT NULL,

        IsActive BIT NOT NULL
            CONSTRAINT DF_BridgeRegionEmployee_IsActive
            DEFAULT (1),

        AssignmentSource NVARCHAR(100) NOT NULL,

        EffectiveFrom DATE NOT NULL,

        EffectiveTo DATE NULL,

        CreatedAt DATETIME2 NOT NULL
            CONSTRAINT DF_BridgeRegionEmployee_CreatedAt
            DEFAULT (SYSDATETIME()),

        CONSTRAINT FK_BridgeRegionEmployee_Employee
            FOREIGN KEY (EmployeeKey)
            REFERENCES Dim.DimEmployee(EmployeeKey),

        CONSTRAINT FK_BridgeRegionEmployee_Region
            FOREIGN KEY (RegionKey)
            REFERENCES Dim.DimSalesTerritory(SalesTerritoryKey),

        CONSTRAINT UQ_BridgeRegionEmployee
            UNIQUE (EmployeeKey)
    );

END;
GO