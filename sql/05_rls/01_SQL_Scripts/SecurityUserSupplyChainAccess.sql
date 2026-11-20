USE EnterpriseBI_DW;
GO

IF OBJECT_ID(
    'Security.SecurityUserSupplyChainAccess',
    'U'
) IS NULL
BEGIN
    CREATE TABLE Security.SecurityUserSupplyChainAccess
    (
        UserSupplyChainAccessKey INT IDENTITY(1,1)
            PRIMARY KEY,

        UserEmail NVARCHAR(256) NOT NULL,

        IsActive BIT NOT NULL DEFAULT (1),

        CreatedAt DATETIME2 NOT NULL
            DEFAULT (SYSDATETIME()),

        CONSTRAINT UQ_SecurityUserSupplyChainAccess
            UNIQUE (UserEmail)
    );
END;
GO

-- Add authorized users

INSERT INTO Security.SecurityUserSupplyChainAccess
(
    UserEmail,
    IsActive
)
SELECT
    V.UserEmail,
    1
FROM
(
    VALUES
        ('sc.manager01@example.com'),
        ('sc.manager02@example.com'),
        ('sc.manager03@example.com'),
        ('sc.manager04@example.com'),
        ('sc.manager05@example.com'),
        ('sc.analyst01@example.com'),
        ('sc.analyst02@example.com'),
        ('sc.analyst03@example.com'),
        ('sc.analyst04@example.com'),
        ('sc.analyst05@example.com'),
        ('sc.executive01@example.com'),
        ('sc.executive02@example.com'),
        ('sc.executive03@example.com'),
        ('sc.executive04@example.com'),
        ('sc.executive05@example.com'),
        ('sc.employee01@example.com'),
        ('sc.employee02@example.com'),
        ('sc.employee03@example.com'),
        ('sc.employee04@example.com'),
        ('sc.employee05@example.com')
) AS V(UserEmail)
WHERE NOT EXISTS
(
    SELECT 1
    FROM Security.SecurityUserSupplyChainAccess S
    WHERE LOWER(TRIM(S.UserEmail)) =
          LOWER(TRIM(V.UserEmail))
);
GO

-- Validate the table

SELECT
    UserSupplyChainAccessKey,
    UserEmail,
    IsActive,
    CreatedAt
FROM Security.SecurityUserSupplyChainAccess;
GO