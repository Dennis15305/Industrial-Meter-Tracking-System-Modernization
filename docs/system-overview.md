# System Overview

## Purpose

The system is designed to measure and track the length of corrugated cardboard during production.

It collects data from multiple counters installed on production lines and stores it in a database for further analysis and integration with external systems.

---

## General Architecture

The system consists of several layers:

1. Measurement Layer
2. Communication Layer
3. Control Layer
4. Visualization Layer
5. Data Storage Layer
6. Integration Layer

---

## Data Flow

Encoder / Measuring Wheel  
→ Counter  
→ RS-485 / Modbus RTU  
→ PLC (Schneider M241)  
→ HMI / WinCC SCADA  
→ SQL Server  
→ External system (e.g., ERP / 1C)

---

## System Components

### 1. Counters

- Measure material length using measuring wheels
- Communicate with PLC via RS-485 (Modbus RTU)

### 2. RS-485 Network

- Connects all counters to the PLC
- Uses differential signaling (A/B lines)
- Sensitive to wiring quality, grounding and termination

### 3. PLC (Schneider Electric M241)

- Polls counters via Modbus RTU
- Processes incoming data
- Detects reset events
- Prepares clean values for storage

### 4. HMI

- Displays system status
- Allows operator interaction
- Shows alarms and production data

### 5. WinCC SCADA

- Collects data from PLC
- Handles visualization and intermediate data processing
- Transfers data to SQL database

### 6. SQL Server

- Stores production data
- Used for reporting and analysis

### 7. External Systems

- Data is used by higher-level systems (e.g., ERP / 1C)

---

## Production Modes

The system supports multiple production modes:

### 3-Layer Production

- Only part of the counters are active
- RS-485 topology changes
- May affect termination and communication stability

### 5-Layer Production

- All counters are active
- Full RS-485 bus is used

---

## Key Engineering Challenges

- Ensuring reliable RS-485 communication in a noisy industrial environment
- Handling counter reset events without data corruption
- Maintaining stable operation across different production modes
- Providing clean and accurate data for reporting systems

---

## Summary

The system is a multi-layer industrial data acquisition and processing solution, where stability depends on both software logic and hardware communication quality.

Understanding the full data flow was critical for identifying and fixing system issues.
