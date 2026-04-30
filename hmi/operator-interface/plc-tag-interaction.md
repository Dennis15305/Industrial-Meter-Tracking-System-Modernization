# PLC Tag Interaction

## Overview

The HMI exchanges data with the PLC using command words, status words, counters and display variables.

This document describes the logical interaction between HMI and PLC.

Real memory addresses are not included.

---

## Command Word

Operator buttons are grouped into a command word.

Each bit represents a specific operator command.

Example commands:

- Stop
- Setup / new order
- No production load
- Lunch
- Planned maintenance
- Fault clearing
- Alarm
- Technology reason
- Web break

The PLC decodes this command word and updates line status accordingly.

---

## Status Word

The PLC sends current line state back to the HMI through a status word.

The HMI uses this status word to display:

- running state
- stop state
- setup state
- alarm state
- maintenance state
- technology stop state
- web break state

---

## Counters

The HMI displays production counters received from PLC.

Typical counters:

- current order counter
- input counter
- output counter
- shift total counter
- meter counter
- square meter counter

---

## User Number

For some actions, the HMI sends a user number to the PLC.

This value can be stored in the history record to identify who performed or confirmed the action.

---

## Communication Status

The HMI displays communication status flags from the PLC.

These may include:

- equipment communication error
- server communication error
- PLC status
- Modbus device error state

---

## Engineering Note

The HMI is tightly connected to PLC state logic.

Any change in HMI buttons, command words or status words must be synchronized with the PLC program.
