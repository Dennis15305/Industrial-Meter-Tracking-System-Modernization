(*
    Function Block: CalcDeltaT
    Purpose:
    Measures pulse duration from a digital sensor.

    Description:
    This block detects rising and falling edges of a sensor signal.
    On rising edge, it stores the start time.
    On falling edge, it calculates pulse duration.

    It stores minimum and maximum pulse duration within configured limits.

    Note:
    This is an anonymized version of the original industrial PLC logic.
*)

FUNCTION_BLOCK CalcDeltaT

VAR_INPUT
    Sensor   : BOOL;
    Reset    : BOOL;
    MAX_T_ms : UDINT;
    MIN_T_ms : UDINT;
END_VAR

VAR_OUTPUT
    MinTime : UDINT;
    MaxTime : UDINT;
END_VAR

VAR
    StartTimeMs : UDINT;
    PulseTimeMs : UDINT;

    RisingEdge  : BOOL;
    FallingEdge : BOOL;

    FirstRun    : BOOL;
    SensorPrev  : BOOL;
END_VAR


// Initialization or reset
IF (NOT FirstRun) OR Reset THEN
    FirstRun := TRUE;
    MaxTime := MIN_T_ms;
    MinTime := MAX_T_ms;
END_IF;


// Rising edge detection
IF (SensorPrev = FALSE) AND (Sensor = TRUE) THEN
    RisingEdge := TRUE;
ELSE
    RisingEdge := FALSE;
END_IF;


// Falling edge detection
IF (SensorPrev = TRUE) AND (Sensor = FALSE) THEN
    FallingEdge := TRUE;
ELSE
    FallingEdge := FALSE;
END_IF;


// Save pulse start time
IF RisingEdge THEN
    StartTimeMs := SysTimeRtc.SysTimeGetMs();
END_IF;


// Calculate pulse duration
IF FallingEdge THEN
    PulseTimeMs := SysTimeRtc.SysTimeGetMs() - StartTimeMs;

    IF (PulseTimeMs > MaxTime) AND (PulseTimeMs < MAX_T_ms) THEN
        MaxTime := PulseTimeMs;
    END_IF;

    IF (PulseTimeMs < MinTime) AND (PulseTimeMs > MIN_T_ms) THEN
        MinTime := PulseTimeMs;
    END_IF;
END_IF;


// Store previous sensor state
SensorPrev := Sensor;
