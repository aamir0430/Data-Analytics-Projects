USE EnterpriseBI_DW;
GO

IF OBJECT_ID(
    'Security.BridgeRegionLocation',
    'U'
) IS NULL
BEGIN

    CREATE TABLE Security.BridgeRegionLocation
    (
        BridgeRegionLocationKey INT IDENTITY(1,1) PRIMARY KEY,

        LocationKey INT NOT NULL,

        RegionKey INT NOT NULL,

        IsActive BIT NOT NULL
            CONSTRAINT DF_BridgeRegionLocation_IsActive
            DEFAULT (1),

        AssignmentSource NVARCHAR(200) NOT NULL,

        EffectiveFrom DATE NOT NULL,

        EffectiveTo DATE NULL,

        CreatedAt DATETIME2 NOT NULL
            CONSTRAINT DF_BridgeRegionLocation_CreatedAt
            DEFAULT (SYSDATETIME()),

        CONSTRAINT FK_BridgeRegionLocation_Location
            FOREIGN KEY (LocationKey)
            REFERENCES Dim.DimLocation(LocationKey),

        CONSTRAINT FK_BridgeRegionLocation_Region
            FOREIGN KEY (RegionKey)
            REFERENCES Dim.DimSalesTerritory(SalesTerritoryKey),

        CONSTRAINT UQ_BridgeRegionLocation
            UNIQUE (LocationKey)
    );

END;
GO