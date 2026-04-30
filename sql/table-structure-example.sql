/*
    Example: simplified SQL table structure for production meter events.

    This is an anonymized example.
    Real table names, server names and production identifiers were removed.
*/

CREATE TABLE dbo.MeterEvents_Example
(
    ID              INT IDENTITY(1,1) PRIMARY KEY,
    EventDateTime   DATETIME NOT NULL,
    LineName        NVARCHAR(50) NOT NULL,
    RollNumber      INT NOT NULL,
    MeterValue      DECIMAL(18,2) NOT NULL,
    ShiftNumber     INT NULL,
    OrderNumber     NVARCHAR(50) NULL,
    Source          NVARCHAR(50) NULL,
    CreatedAt       DATETIME NOT NULL DEFAULT GETDATE()
);
