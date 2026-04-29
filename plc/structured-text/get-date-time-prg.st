(*
    Program: GetDateTime
    Purpose:
    Reads PLC real-time clock, applies local time zone offset
    and splits date/time into separate variables for HMI, SCADA
    and database logic.

    Note:
    This is an anonymized representation of the original PLC logic.
*)

PROGRAM GetDateTime
VAR
    CurrentTimestampUtc : DWORD;
    CurrentDateTime     : DATE_AND_TIME;

    TimeZoneOffsetHours : DINT := 3;
    TimeZoneOffsetSec   : DINT;

    CurrentYear         : UINT;
    CurrentMonth        : UINT;
    CurrentDay          : UINT;
    CurrentHour         : UINT;
    CurrentMinute       : UINT;
    CurrentSecond       : UINT;
END_VAR

// Read PLC system time in UTC
CurrentTimestampUtc := SysTimeRtc.SysTimeRtcGet();

// Convert time zone offset from hours to seconds
TimeZoneOffsetSec := TimeZoneOffsetHours * 3600;

// Apply local time zone offset and convert timestamp to date/time
CurrentDateTime := SysTimeRtc.SysTimeRtcConvertUtcToDate(
    dwTimestampUtc := CurrentTimestampUtc + DINT_TO_DWORD(TimeZoneOffsetSec)
);

// Split date/time into separate values
CurrentYear   := CurrentDateTime.Year;
CurrentMonth  := CurrentDateTime.Month;
CurrentDay    := CurrentDateTime.Day;
CurrentHour   := CurrentDateTime.Hour;
CurrentMinute := CurrentDateTime.Minute;
CurrentSecond := CurrentDateTime.Second;
