# Line_AnalizFul Function Block

## Purpose

Main production line analysis function block.

This block analyzes line state, counters, operator commands, downtime reasons, alarms, shift counters and history records.

## My Role

The original block already existed in the project.

My work was focused on understanding how it interacts with the rest of the system and improving related logic around data quality, counter handling and database transfer.

## Main Responsibilities

- Decode operator commands from HMI button word
- Decode current line status word
- Detect whether the line is running
- Count production items from input counter changes
- Track day and night shift counters
- Detect stop from input sensor
- Handle operator-selected downtime reasons
- Control siren signals
- Track order changes
- Store status changes into history structure
- Mark history records as not transferred
- Prepare data for SCADA / SQL transfer

## Important Inputs

- `Line_InputSensor` — production counter value
- `ConnectSrvOK` — upper-level server connection status
- `ConCountErr` — counter communication error
- `Time_AnalizStopSensor` — stop detection timeout
- `Time_Restore_Nominal` — setup/restore nominal time
- `V_Nominal` — nominal line speed
- `Buttons` — HMI operator command word

## Important Outputs

- `Line_StatusWord` — current line state
- `Line_StatusWord2` — additional line status flags
- `Line_CurrentCounter` — current order counter
- `DayCounter` / `NightCounter` — shift counters
- `SIRENA` — alarm siren
- `SIRENAEfficiency` — efficiency/setup warning
- `History_Line` — history record for SCADA / SQL transfer

## Simplified State Logic

```text
Input counter increases
        ↓
Line is detected as running
        ↓
Production counters increase
        ↓
If no pulses for configured time
        ↓
Line stop is detected
        ↓
Status word is updated
        ↓
History record is marked for transfer
```

Operator Command Handling

The block receives HMI buttons as a word and decodes individual bits.

Examples of commands:

Stop
Setup / new order
No loading
Planned maintenance
Fault clearing
Alarm
Technology reason
Lunch
Web break

Each command updates the line status and may create a new history record.

History Recording

History records are created when:

line status changes
new order/setup is selected
shift boundary is reached
special events occur

Each history record contains:

date and time
order number
shift number
line status
additional status flags
user number
production counter
transfer flags
Transfer Flags

History records use flags such as:

NotGet
NotGet2
NotGet3
NotGet4

These flags indicate that the record has not yet been transferred to upper-level systems.

Simplified Pseudocode
// Decode HMI buttons
DecodeButtonWord(Buttons);

// Decode current line status
DecodeStatusWord(Line_StatusWord);

// Detect production movement
IF InputCounter increased THEN
    Line_CurrentCounter := Line_CurrentCounter + Delta;
    Line_GlobalCounter  := Line_GlobalCounter + Delta;

    IF CurrentShift = Day THEN
        DayCounter := DayCounter + Delta;
    ELSE
        NightCounter := NightCounter + Delta;
    END_IF;
END_IF;

// Detect stop from sensor
IF NoInputPulsesForConfiguredTime THEN
    Line_StatusWord := STOP_FROM_SENSOR;
    Line_InWork := FALSE;
END_IF;

// Handle operator commands
IF StopButton THEN
    Line_StatusWord := STOP;
END_IF;

IF SetupButton THEN
    Line_StatusWord := SETUP;
    Line_ZakazNumber := Line_ZakazNumber + 1;
    Line_CurrentCounter := 0;
    CreateHistoryRecord();
END_IF;

// If status changed, create history record
IF PreviousStatus <> Line_StatusWord THEN
    CountChangesState := CountChangesState + 1;
    CreateHistoryRecord();
END_IF;
Engineering Value

This function block represents the central business logic of the production line.

It connects:

physical sensor signals
operator commands
line state machine
production counters
alarms
history recording
SCADA / SQL transfer logic
