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

When the operator presses the STOP button:

1. The HMI opens stop reason selection.
2. The operator selects a stop reason.
3. Depending on the selected reason, the HMI executes a macro or writes directly to a PLC variable.
4. The PLC receives the command.
5. The PLC updates the line status word.
6. The status change is saved into production history.
7. The history record is later prepared for WinCC / SQL transfer.

---

## Stop Reasons

The HMI supports several stop reasons:

- alarm
- lunch
- planned maintenance
- no production load
- web break
- technology reason
- setup / reconfiguration
- unknown stop reason

Unknown stop reason is used when the line stops but the operator does not select a reason.

Setup / reconfiguration can be linked to production order changes and may be assigned from the ERP / 1C side.

---

## Maintenance / Authorization Workflow

Some actions require user authorization.

Basic workflow:

1. Operator opens a protected action or settings screen.
2. HMI displays authorization popup.
3. User enters user number.
4. HMI confirms or rejects access according to its internal security settings.
5. The action is executed if access is allowed.

The exact connection between HMI user number and database history records requires further investigation.

---

## Settings Workflow

The HMI provides access to production settings.

One important setting is cardboard width.

This value is used to calculate square meters from linear meters.

Settings access is protected by HMI user authorization.

---

## Data Recording Logic

The HMI itself does not store production history.

It sends operator commands and settings to the PLC.

The PLC is responsible for:

- line state logic
- counter logic
- event history
- transfer flags
- data preparation for WinCC / SQL
