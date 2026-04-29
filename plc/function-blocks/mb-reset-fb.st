(*
    Function Block: MB_Reset
    Purpose:
    Handles automatic recovery of Modbus communication.

    Description:
    This block monitors communication errors and attempts to reset
    the Modbus channel when repeated failures occur.

    Logic:
    - If error persists → trigger reset periodically
    - Count number of reset attempts
    - If too many attempts → mark device as disconnected

    Notes:
    - Designed for industrial environment with unstable RS-485
*)

FUNCTION_BLOCK MB_Reset

VAR_INPUT
    Error        : BOOL; // communication error
    Done         : BOOL; // operation completed
    OutDone      : BOOL; // external completion signal
    ResetCommand : BOOL; // manual reset command
END_VAR

VAR_OUTPUT
    Reset            : BOOL; // reset signal to device
    DeviceLost       : BOOL; // device considered disconnected
END_VAR

VAR
    DoneInternal     : BOOL;
    ResetAttempts    : WORD;

    ErrorTimer       : TON;
    NoErrorTimer     : TON;

    RisingEdge       : R_TRIG;
END_VAR


// --- Determine internal "Done" state ---
IF (NOT OutDone) THEN
    DoneInternal := Done;
ELSE
    // wait until no error for 1 minute
    NoErrorTimer(IN := NOT Error, PT := T#1M, Q => DoneInternal);
END_IF;


// --- Reset state if communication restored or manual reset ---
IF ((DoneInternal AND (NOT Error)) OR ResetCommand) THEN
    ResetAttempts := 0;
    DeviceLost := FALSE;
    Reset := FALSE;
END_IF;


// --- If error present, keep reset off until timer triggers ---
IF Error THEN
    Reset := FALSE;
END_IF;


// --- Trigger reset every 3 seconds while error persists ---
ErrorTimer(IN := Error AND NOT ErrorTimer.Q, PT := T#3S);

RisingEdge(CLK := ErrorTimer.Q);

IF RisingEdge.Q THEN
    ResetAttempts := ResetAttempts + 1;
    Reset := TRUE;
END_IF;


// --- If too many attempts → mark device as lost ---
IF (ResetAttempts > 120) THEN
    Reset := FALSE;
    DeviceLost := TRUE;
END_IF;
