(*
    Function Block: CutPoint
    Purpose:
    Detects counter reset event and captures last valid meter value.

    Description:
    This block processes incoming meter values from a counter.
    When a reset event is detected (sudden drop), it stores the last
    valid value before reset and signals that data is ready for transfer.

    Outputs:
    - AllMeters  : current valid value
    - AllMeters2 : value prepared for sending (buffer)
    - AllMeters3 : previous sent value (history)

    Notes:
    - Uses filtering to ignore invalid/overflow values
    - Designed for industrial environment with noisy signals
*)

FUNCTION_BLOCK CutPoint

VAR_INPUT
    Meters : DWORD;
END_VAR

VAR_IN_OUT
    Set : WORD; // signal for SCADA / WinCC
END_VAR

VAR_OUTPUT
    AllMeters  : DWORD; // current valid value
    AllMeters2 : DWORD; // buffer for transfer
    AllMeters3 : DWORD; // previous transferred value
END_VAR

VAR
    PrevMeters    : DWORD := 0;
    CurrMeters    : DWORD := 0;
    InitDone      : BOOL := FALSE;
    ResetDetected : BOOL := FALSE;

    MinDrop    : DWORD := 300;     // reset detection threshold (~30 m)
    ResetLevel : DWORD := 100;     // value after reset (~10 m)
    MaxValid   : DWORD := 1000000; // overflow filter

    ValidValue : BOOL := FALSE;
END_VAR


// --- Validate incoming value ---
IF Meters <= MaxValid THEN
    CurrMeters := Meters;
    ValidValue := TRUE;
ELSE
    ValidValue := FALSE;
END_IF;


// --- Initialization ---
IF (NOT InitDone) AND ValidValue THEN
    PrevMeters := CurrMeters;
    AllMeters := CurrMeters;
    InitDone := TRUE;
END_IF;


// --- Main logic ---
IF InitDone AND ValidValue THEN

    // Update current value
    AllMeters := CurrMeters;

    // Detect reset event
    IF (NOT ResetDetected)
       AND (PrevMeters > CurrMeters)
       AND ((PrevMeters - CurrMeters) > MinDrop)
       AND (CurrMeters < ResetLevel) THEN

        // Shift history
        AllMeters3 := AllMeters2;

        // Store last valid value before reset
        AllMeters2 := PrevMeters;

        // Signal SCADA
        Set := 1;

        ResetDetected := TRUE;
    END_IF;

    // Allow next reset detection when value increases
    IF CurrMeters > PrevMeters THEN
        ResetDetected := FALSE;
    END_IF;

    // Update previous value
    PrevMeters := CurrMeters;

END_IF;
