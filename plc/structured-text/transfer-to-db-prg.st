(*
    Program: Transfer_To_DB
    Purpose:
    Prepares historical production records for transfer from PLC to SCADA / SQL database.

    Transfer handshake logic:
    0 - PLC is ready to prepare next record
    1 - PLC prepared a record, server can read it
    2 - server confirmed that the record was read

    Note:
    This is an anonymized and simplified version of the original PLC logic.
*)

PROGRAM Transfer_To_DB
VAR
    RecordReadyForTransfer : BOOL;
    TransferDelay          : TON;

    TransferState          : INT;  // 0 = ready, 1 = data prepared, 2 = server confirmed
    HistoryIndex           : INT;
    LastHistoryIndex       : INT;

    CurrentShift           : INT;
    CurrentHour            : INT;
END_VAR


// Determine current shift
IF (CurrentHour >= 8 AND CurrentHour < 20) THEN
    CurrentShift := 1; // Day shift
ELSE
    CurrentShift := 2; // Night shift
END_IF;


// If server confirmed that data was read
IF (TransferState = 2) THEN

    TransferState := 0; // Ready for next record

    History[HistoryIndex].NotTransferred := FALSE;

    HistoryIndex := HistoryIndex + 1;

    IF (HistoryIndex > LastHistoryIndex) THEN
        HistoryIndex := LastHistoryIndex;
    END_IF;

END_IF;


// Prepare next not-transferred record
IF (TransferState = 0) THEN

    IF (History[HistoryIndex].NotTransferred = TRUE) THEN

        // Copy historical data to transfer buffer
        TransferBuffer.Year          := History[HistoryIndex].Year;
        TransferBuffer.Month         := History[HistoryIndex].Month;
        TransferBuffer.Day           := History[HistoryIndex].Day;
        TransferBuffer.Hour          := History[HistoryIndex].Hour;
        TransferBuffer.Minute        := History[HistoryIndex].Minute;
        TransferBuffer.Second        := History[HistoryIndex].Second;

        TransferBuffer.InputCounter  := History[HistoryIndex].InputCounter;
        TransferBuffer.OutputCounter := History[HistoryIndex].OutputCounter;
        TransferBuffer.FalseCounter  := History[HistoryIndex].FalseCounter;

        TransferBuffer.OrderNumber   := History[HistoryIndex].OrderNumber;
        TransferBuffer.StatusWord    := History[HistoryIndex].StatusWord;
        TransferBuffer.SetupType     := History[HistoryIndex].SetupType;
        TransferBuffer.UserNumber    := History[HistoryIndex].UserNumber;
        TransferBuffer.ShiftNumber   := History[HistoryIndex].ShiftNumber;

        // Delay before setting ready flag
        TransferDelay(
            IN := History[HistoryIndex].NotTransferred,
            PT := T#2S
        );

        IF (TransferDelay.Q) THEN
            TransferState := 1; // Data prepared, server can read it
            TransferDelay(IN := FALSE);
        END_IF;

    ELSE

        // Skip already transferred records
        HistoryIndex := HistoryIndex + 1;

        IF (HistoryIndex > LastHistoryIndex) THEN
            HistoryIndex := LastHistoryIndex;
        END_IF;

    END_IF;

END_IF;


// Reset Modbus reset command after transfer cycle
ModbusResetCommand := 0;
