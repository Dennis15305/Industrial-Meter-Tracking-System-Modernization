# Industrial Meter Tracking System Modernization

## Overview

This project describes the modernization of an industrial meter tracking system used on a corrugated cardboard production line.

The system uses RS-485 / Modbus RTU counters, a Schneider Electric PLC, HMI, WinCC SCADA and SQL Server database to collect and store paper consumption and production length data.

## Initial State

When I joined the project, the system was already installed but worked unreliably. The counters often froze or stopped responding, the database contained noisy and duplicated values, and the RS-485 network was unstable.

At the beginning, my experience was mainly limited to CoDeSys and Structured Text. I had to learn Schneider EcoStruxure Machine Expert, the existing PLC code, the HMI logic, WinCC data flow and SQL database integration.

## Problems Found

- Unstable RS-485 communication.
- No common reference wire for Modbus devices.
- Poor cable quality and inconsistent twisted-pair usage.
- Shielding and grounding were not implemented correctly.
- Counter reset events produced noisy database records.
- Several values were written to the database even when only one clean production value was needed.
- In 3-layer production mode, counters 4 and 5 were disconnected, which caused HMI errors and could affect RS-485 termination.

## What I Improved

- Studied the existing PLC, HMI, WinCC and SQL system.
- Changed the database write logic to store one clean meter value instead of multiple noisy values.
- Improved PLC logic around counter reset detection.
- Diagnosed RS-485 as the main cause of long-term counter failures.
- Replaced the communication cable with a shielded twisted-pair RS-485 cable.
- Defended the requirement that A/B signals must be routed through the same twisted pair.
- Improved system stability after rewiring.
- Started hardware investigation of the counters to add a proper reference point for RS-485.
- Planned relay-based switching between 3-layer and 5-layer production modes.

## System Architecture

Encoder / Measuring Wheel  
→ Counter  
→ RS-485 / Modbus RTU  
→ Schneider PLC  
→ HMI / WinCC  
→ SQL Server  
→ Production reports / 1C integration

## Current Status

The line is currently working more reliably after cable replacement. Further work is planned on RS-485 reference wiring, grounding, counter verification and automatic 3-layer / 5-layer bus switching.

## Technologies

- Schneider Electric M241 PLC
- EcoStruxure Machine Expert
- Structured Text
- Modbus RTU
- RS-485
- Weintek HMI / EBPro
- Siemens WinCC
- SQL Server
- Industrial diagnostics
