(*
    Program: Shift and State Analysis
    Purpose:
    - Determines current work shift (day/night)
    - Detects shift change
    - Saves production state into history
    - Resets counters at shift boundary
    - Tracks line state changes and alarms

    Note:
    This is an anonymized and simplified version of the original logic.
*)

PROGRAM ShiftAnalysis

VAR
    PrevShift : INT;
    CurrentShift : INT;

    CurrentHour : INT;

    ResetCounters : BOOL;
    BreakDetected : BOOL;
END_VAR


// Store previous shift
PrevShift := CurrentShift;


// Determine current shift
IF (CurrentHour >= 8 AND CurrentHour < 20) THEN
    CurrentShift := 1; // Day shift
ELSE
    CurrentShift := 2; // Night shift
END_IF;


// Detect shift change
IF (PrevShift <> CurrentShift) THEN

    // Save current state to history (simplified)
    SaveToHistory(
        Shift := PrevShift,
        Timestamp := CurrentTime,
        Status := LineStatus
    );

    // Reset production counters
    ResetCounters := TRUE;

END_IF;


// Time validation (simplified)
IF (MaterialAnalysisTime < 1) THEN
    MaterialAnalysisTime := 1;
END_IF;

IF (WorkAnalysisTime <= MaterialAnalysisTime) THEN
    WorkAnalysisTime := MaterialAnalysisTime + 1;
END_IF;


// Decode status word
DecodeStatusWord(
    StatusWord := LineStatus,
    BreakSignal => BreakDetected
);


// If break event detected — log it
IF (BreakDetected) THEN
    SaveBreakEvent(
        AlarmCode := AlarmCodeValue,
        Timestamp := CurrentTime
    );
END_IF;
