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
