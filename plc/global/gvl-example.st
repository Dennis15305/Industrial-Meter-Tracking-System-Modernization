(*
    Global Variables Example
    Purpose:
    Shows the main categories of global variables used in the PLC project.

    Real memory addresses, line names and internal identifiers were removed.
*)

VAR_GLOBAL RETAIN

    // Shift and time
    PreviousScanShift : WORD;
    CurrentShift      : WORD;

    CurrentYear       : WORD;
    CurrentMonth      : WORD;
    CurrentDay        : WORD;
    CurrentHour       : WORD;
    CurrentMinute     : WORD;
    CurrentSecond     : WORD;

    // Line status
    LineStatusWord    : WORD;
    LineStatusWord2   : WORD;
    PanelButtonsWord  : WORD;

    // Production counters
    CurrentOrderCounter : DWORD;
    GlobalShiftCounter  : DWORD;
    OrderNumber         : DWORD;

    // Transfer handshake
    DataNeedSendToServer1 : WORD; // 0 = ready, 1 = data prepared, 2 = server confirmed
    DataNeedSendToServer2 : WORD;

    // History transfer buffer
    HistYear          : WORD;
    HistMonth         : WORD;
    HistDay           : WORD;
    HistHour          : WORD;
    HistMinute        : WORD;
    HistSecond        : WORD;

    HistInputCounter  : DWORD;
    HistOutputCounter : DWORD;
    HistRejectCounter : DWORD;
    HistOrderNumber   : DWORD;
    HistStatusWord    : WORD;
    HistShiftNumber   : WORD;

    // Roll / meter counters
    Roll1Meters       : DWORD;
    Roll2Meters       : DWORD;
    Roll3Meters       : DWORD;
    Roll4Meters       : DWORD;
    Roll5Meters       : DWORD;
    FinalProductMeters: DWORD;

    // Values prepared for sending
    SendRoll1Meters   : DWORD;
    SendRoll2Meters   : DWORD;
    SendRoll3Meters   : DWORD;
    SendRoll4Meters   : DWORD;
    SendRoll5Meters   : DWORD;

    // Modbus diagnostics
    ModbusErrorsWord  : WORD;
    ModbusResetWord   : WORD;

END_VAR


VAR_GLOBAL
    LineHistory : ARRAY[1..20000] OF History;
END_VAR
