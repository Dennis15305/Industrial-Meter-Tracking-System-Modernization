# PLC Tag Interaction

## Overview

The HMI exchanges data with the PLC using tags, command variables, status variables and macros.

This document describes the logical interaction between HMI and PLC.

Real memory addresses are not included.

---

## Communication

The HMI communicates with the PLC over Ethernet TCP/IP.

The HMI is also connected to the common industrial network and can be accessed by IP address.

---

## Operator Commands

Operator actions are sent to the PLC in two main ways:

- direct variable write
- HMI macro execution

Some buttons directly modify PLC variables.

Other buttons execute macros, which then write commands or values to the PLC.

---

## Stop Button

The STOP button does not only stop the line.

It opens the stop reason selection workflow.

After the operator selects a reason, the HMI sends the corresponding command to the PLC.

---

## Status Display

The PLC sends current line state back to the HMI.

The HMI uses this data to display:

- running state
- stop state
- setup state
- alarm state
- maintenance state
- technology stop state
- web break state
- communication warnings

---

## Counters

The HMI displays production counters received from the PLC.

Typical displayed values:

- current order meters
- current order square meters
- shift meters
- shift square meters
- real-time line speed

Roll-specific meter values are processed in the PLC and can be used for deeper diagnostics or future HMI improvements.

---

## User Authorization

The HMI has its own user security system.

User authorization is used for protected actions such as settings access.

The exact transfer of user number into PLC / SQL history requires further investigation.

---

## Communication Warnings

The HMI displays warnings related to:

- equipment communication loss
- server communication loss

Equipment communication loss is related to the PLC and counter communication chain.

Server communication loss is related to the WinCC server or upper-level system.

---

## Engineering Note

The HMI is tightly connected to PLC state logic.

Any change in HMI buttons, macros, command variables or status variables must be synchronized with the PLC program.
