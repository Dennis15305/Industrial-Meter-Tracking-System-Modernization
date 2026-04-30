/*
    Example: insert one clean meter value into SQL.

    This represents the improved logic:
    one confirmed value is stored instead of several noisy values.
*/

INSERT INTO dbo.MeterEvents_Example
(
    EventDateTime,
    LineName,
    RollNumber,
    MeterValue,
    ShiftNumber,
    OrderNumber,
    Source
)
VALUES
(
    GETDATE(),
    'Line_4',
    1,
    1250.50,
    1,
    'Order_Example',
    'PLC_WinCC'
);
