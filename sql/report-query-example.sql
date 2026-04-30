/*
    Example: daily roll meter report query.

    Production day range:
    from 08:00 of selected day
    to 08:00 of the next day
*/

DECLARE @StartDateTime DATETIME = '2026-04-30 08:00:00';
DECLARE @EndDateTime   DATETIME = DATEADD(DAY, 1, @StartDateTime);

SELECT
    LineName,
    RollNumber,
    SUM(MeterValue) AS TotalMeters
FROM dbo.MeterEvents_Example
WHERE EventDateTime >= @StartDateTime
  AND EventDateTime <  @EndDateTime
GROUP BY
    LineName,
    RollNumber
ORDER BY
    LineName,
    RollNumber;
