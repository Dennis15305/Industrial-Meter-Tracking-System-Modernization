# Operator Workflow

## Normal Operation

During normal operation, the operator monitors:

- current line status
- production speed
- current order counters
- shift counters
- alarms and communication messages

The HMI receives these values from the PLC and displays them on the main screen.

---

## Stop Event Workflow

When the line stops or the operator presses the STOP button:

1. The HMI allows the operator to select a stop reason.
2. The selected reason is written to the PLC command word.
3. The PLC decodes the command bit.
4. The PLC updates the line status word.
5. The status change is stored in the history structure.
6. The history record is marked as not transferred.
7. The record is later transferred to SCADA / SQL.

---

## Example Stop Reasons

- Alarm
- Lunch
- Planned maintenance
- No production load
- Web break
- Technology reason

---

## Maintenance / Authorization Workflow

Some actions require user number input.

Basic workflow:

1. Operator selects a maintenance-related action.
2. HMI opens authorization popup.
3. User enters user number.
4. HMI sends the number to PLC.
5. PLC stores user number in the history record.

---

## Data Recording Logic

The HMI itself does not store production history.

It sends operator commands to the PLC.

The PLC is responsible for:

- line state logic
- counter logic
- event history
- transfer flags
- data preparation for SCADA / SQL
