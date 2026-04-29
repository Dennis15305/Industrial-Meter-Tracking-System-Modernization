# PLC Logic Overview

## Overview

This folder contains an anonymized representation of the PLC logic used in the industrial meter tracking system.

The goal is to demonstrate system architecture, logic design and engineering approach without exposing sensitive production data.

---

## Structure

The PLC program is organized into:

- Structured Text programs (PRG)
- Function Blocks (FB)
- Global variables (GVL)
- Function Block Diagram (FBD) logic

---

## Structured Text Programs

Located in:
```text
plc/structured-text/
```
Main programs:

- `calc-delta-prg.st` — pulse analysis for sensors
- `get-date-time-prg.st` — system time handling
- `shift-and-state-analysis.st` — shift logic and state tracking
- `transfer-to-db-prg.st` — prepares data for SCADA / SQL transfer
- `line-analysis-prg.st` — main coordination logic

---

## Function Blocks

Located in:
```text
plc/function-blocks/
```
Main function blocks:

- `cut-point-fb.st` — detects counter reset and captures valid values
- `calc-delta-t-fb.st` — measures pulse duration
- `mb-reset-fb.st` — handles Modbus communication recovery
- `line-analysis-full-fb.md` — documentation of main line analysis block

---

## Global Variables

Located in:
```text
plc/global/
```
Includes:

- `history-struct.st` — structure for storing production history
- `gvl-example.st` — simplified global variable representation
- `gvl-overview.md` — explanation of variable groups

---

## FBD Logic

Located in:
```text
plc/fbd/
```
Some parts of the system are implemented using Function Block Diagram (FBD).

- `analizline-fbd.md` — explanation of FBD logic
- screenshots show original structure

---

## Data Flow (Simplified)

```text
Sensors / Counters
        ↓
Structured Text Programs
        ↓
Function Blocks
        ↓
Global Variables (GVL)
        ↓
Transfer Buffer
        ↓
WinCC / SCADA
        ↓
SQL Server
```
## Notes
- This is not a full industrial project dump
- All names and structures are anonymized
- Memory addresses and plant-specific details are removed

The focus is on demonstrating engineering approach, system design and reliability improvements.
