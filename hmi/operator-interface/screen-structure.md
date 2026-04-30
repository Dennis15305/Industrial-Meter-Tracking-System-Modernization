# HMI Screen Structure

## Overview

The HMI consists of several operator screens and popups.

The main screens are used for:

- monitoring production state
- viewing current order and shift counters
- selecting stop reasons
- entering user number for protected actions
- accessing settings

---

## Main Screen

The main screen displays the current state of the production line.

Main elements:

- current shift
- PLC date and time
- line identifier
- current order
- current order meters
- current order square meters
- total meters for the shift
- total square meters for the shift
- real-time production speed
- line status indicators
- STOP button
- stop reason buttons
- equipment communication warning
- server communication warning

---

## Line Status Indicators

The main screen contains colored indicators that represent the current line mode or state.

The exact meaning of each indicator still needs to be verified in the HMI project and PLC status logic.

Possible meanings:

- line stopped
- line in setup / waiting state
- line running

---

## Stop Reason Selection

When the operator presses the STOP button, the HMI opens a stop reason selection area or popup.

Stop reasons include:

- alarm
- lunch
- planned maintenance
- no production load
- web break
- technology reason
- setup / reconfiguration
- unknown stop reason

Some stop reasons are selected directly by the operator.

Setup / reconfiguration may come from the production order system instead of being selected manually on the HMI.

Unknown stop reason is used when the line stops but the operator does not classify the reason.

---

## Counter Screen

The counter screen displays production counters for the current order and current shift.

Typical displayed values:

- current order number
- current order meters
- current order square meters
- total meters for the shift
- total square meters for the shift
- line speed

Roll-specific values are processed in the PLC, while the HMI mainly displays general order and shift values.

---

## Authorization Popup

Some actions require user authorization.

The authorization popup contains:

- user number input field
- confirm button
- cancel button

This is used for protected actions such as settings access or maintenance-related actions.

The exact mapping between HMI user number and PLC / database fields requires further investigation.

---

## Settings Screen

The HMI contains protected settings.

One important setting is cardboard width, which is used to calculate square meters from linear meters.

Access to settings requires user authorization.

---

## Communication Status

The HMI displays communication-related warnings:

- connection loss with equipment
- connection loss with server

Equipment communication warning is related to communication with the PLC and counters.

Server communication warning is related to communication with the WinCC server or upper-level system.
