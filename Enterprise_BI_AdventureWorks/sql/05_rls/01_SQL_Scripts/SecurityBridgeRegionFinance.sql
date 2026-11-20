USE EnterpriseBI_DW;
GO

-- Create Security schema

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'Security'
)
BEGIN
    EXEC('CREATE SCHEMA Security');
END;
GO


-- Create Finance regional bridge

IF OBJECT_ID(
    'Security.BridgeRegionFinance',
    'U'
) IS NULL
BEGIN

    CREATE TABLE Security.BridgeRegionFinance
    (
        BridgeRegionFinanceKey INT IDENTITY(1,1)
            PRIMARY KEY,

        RegionKey INT NOT NULL,

        VendorKey INT NOT NULL,

        SourceTerritoryID INT NOT NULL,

        AddressTypeID INT NOT NULL,

        IsActive BIT NOT NULL
            CONSTRAINT DF_BridgeRegionFinance_IsActive
            DEFAULT (1),

        CreatedAt DATETIME2 NOT NULL
            CONSTRAINT DF_BridgeRegionFinance_CreatedAt
            DEFAULT (SYSDATETIME()),

        CONSTRAINT UQ_BridgeRegionFinance
            UNIQUE (RegionKey, VendorKey),

        CONSTRAINT FK_BridgeRegionFinance_Region
            FOREIGN KEY (RegionKey)
            REFERENCES Dim.DimSalesTerritory
                (SalesTerritoryKey),

        CONSTRAINT FK_BridgeRegionFinance_Vendor
            FOREIGN KEY (VendorKey)
            REFERENCES Dim.DimVendor
                (VendorKey)
    );

END;
GO