## Overview

This project describes the modernization of an industrial meter tracking system used on a corrugated cardboard production line.

The system integrates:

- RS-485 / Modbus RTU counters
- Schneider Electric PLC (M241)
- WinCC SCADA
- SQL Server database
- ERP system (1C)

---

## Repository Structure

- [PLC logic overview](plc/README.md)
- [System documentation](docs/system-overview.md)
- [Problem analysis](docs/problem-analysis.md)
- [RS-485 diagnostics](docs/rs485-diagnostics.md)
- [Modernization plan](docs/modernization-plan.md)
- [Engineering lessons](docs/engineering-lessons.md)

---

## My Role

When I joined the project, the system was unstable and unreliable:

- counters frequently froze
- RS-485 communication failed daily
- database contained noisy and incorrect data

I independently:

- analyzed the entire system from PLC to database
- fixed communication issues
- redesigned data processing logic
- improved system reliability and stability

---

## System Architecture

![System Architecture](diagrams/system-architecture.png)

---

## RS-485 Network Improvement

![RS-485 Improvement](diagrams/rs485-before-after.png)

### Result

The RS-485 network was transformed from unstable to industrial-grade reliable communication.

- stable operation without failures
- no counter freezes
- continuous operation > 7 days

---

## Key Improvements

### 1. Data Processing

- removed noisy and duplicate values
- implemented reset detection logic (CutPoint)
- filtered invalid counter values
- ensured clean data for database

### 2. PLC Logic

- implemented modular function blocks:
  - CutPoint
  - CalcDeltaT
  - MB_Reset
- improved shift and state tracking
- stabilized data transfer to SCADA

### 3. Communication (RS-485)

- implemented proper twisted pair wiring
- added shielding with correct grounding strategy
- installed termination resistors (120 Ω)
- diagnosed and fixed Modbus issues

---

## Technologies Used

- PLC: Schneider Electric M241
- Programming: Structured Text (ST), FBD
- Protocol: Modbus RTU (RS-485)
- SCADA: WinCC
- Database: Microsoft SQL Server
- Integration: ERP (1C)

---

## Engineering Highlights

- full system analysis from hardware to database
- real industrial troubleshooting (RS-485 instability)
- implementation of fault-tolerant communication logic
- development of reliable data processing pipeline

---

## Contribution Scope

Some PLC logic already existed before my work.  
My contribution focused on:

- understanding and documenting the existing system
- improving data quality during counter reset events
- adding invalid value filtering
- stabilizing RS-485 communication
- improving system reliability
- preparing the system for ERP / 1C integration

---

## Notes

This repository contains an anonymized version of the original system.

Sensitive production details, addresses and identifiers have been removed.
