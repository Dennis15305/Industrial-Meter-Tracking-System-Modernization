(*
    Program: CalcDelta
    Purpose:
    Analyzes pulse duration from two line sensors.

    This program calls two instances of the CalcDeltaT function block:
    - one for the input sensor
    - one for the output sensor

    The function block measures minimum and maximum pulse duration
    within configured limits.

    Note:
    This is an anonymized version of the original industrial PLC logic.
*)

PROGRAM CalcDelta
VAR
    InputSensorPulseAnalyzer  : CalcDeltaT;
    OutputSensorPulseAnalyzer : CalcDeltaT;
END_VAR

// Input sensor pulse duration analysis
InputSensorPulseAnalyzer(
    Reset    := ResetMinMax,
    Sensor   := Line_Input_Sensor,
    MIN_T_ms := 1,
    MAX_T_ms := 5000,
    MinTime  => Input_Min_Pulse_Time_ms,
    MaxTime  => Input_Max_Pulse_Time_ms
);

// Output sensor pulse duration analysis
OutputSensorPulseAnalyzer(
    Reset    := ResetMinMax,
    Sensor   := Line_Output_Sensor,
    MIN_T_ms := 1,
    MAX_T_ms := 5000,
    MinTime  => Output_Min_Pulse_Time_ms,
    MaxTime  => Output_Max_Pulse_Time_ms
);
