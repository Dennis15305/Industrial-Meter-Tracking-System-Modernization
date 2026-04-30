# WinCC Data Flow

## Overview

WinCC acts as the SCADA layer between PLC data and the SQL / reporting layer.

Its main role is to read production values from PLC tags, display them on runtime screens and trigger scripts that transfer selected data to SQL Server.

---

## Simplified Data Flow

    PLC
        ↓
    WinCC Tag Management
        ↓
    WinCC Runtime Screens
        ↓
    Global Script VBS / Actions
        ↓
    SQL Server
        ↓
    Excel Reports / Email / ERP

---

## PLC to WinCC

Production values are read from PLC through WinCC tags.

The tag layer includes:

- production counters
- line status values
- meter values
- shift data
- server communication status
- trigger flags for data transfer
- diagnostic values

---

## WinCC Runtime

WinCC Runtime displays production statistics for several lines.

Typical displayed data:

- current production values
- current shift values
- input and output counters
- reject counters
- meter values
- square meter values
- line status and communication states

---

## WinCC to SQL

WinCC scripts process runtime tag values and write selected values into SQL Server.

SQL structure and reporting logic are documented separately:

[SQL / Reporting Layer](../sql/README.md)

---

## Engineering Value

Understanding this data flow was important because PLC logic changes directly affected WinCC scripts and SQL reports.

When PLC counter reset logic was improved, the WinCC layer also had to be adjusted to correctly process the new clean values.
