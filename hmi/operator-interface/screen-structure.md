# HMI Screen Structure

## Overview

The HMI consists of several operator screens and popups.

The main screens are used for:

- monitoring production state
- viewing counters
- selecting stop reasons
- entering user number for maintenance actions

---

## Main Screen

The main screen displays the current state of the production line.

Main elements:

- current shift
- PLC date and time
- line name / production line identifier
- current order
- current order meters
- current order square meters
- total production for the shift
- production speed
- line status indicators
- STOP button
- stop reason buttons
- communication status messages

---

## Stop Reason Selection

When the operator stops the line or needs to classify downtime, the HMI provides stop reason buttons.

Typical stop reasons:

- alarm
- lunch
- planned maintenance
- no production load
- web break
- technology reason

Each button sends a command to the PLC through the HMI command word.

The PLC then updates the line status and stores the event in the production history.

---

## Counter Screen

The counter screen displays production counters for the current order and current shift.

Typical displayed values:

- current order number
- input counter
- output counter
- total counter for the shift

This screen is mainly used for operator monitoring and diagnostics.

---

## Authorization Popup

Some actions require user number input.

The authorization popup contains:

- user number input field
- confirm button
- cancel button

This is used to associate specific actions with a responsible user or maintenance role.

---

## Communication Status

The HMI displays communication-related warnings such as:

- connection loss with equipment
- connection loss with server

These messages help the operator identify whether the problem is related to field devices, PLC communication or upper-level systems.
