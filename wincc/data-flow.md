# WinCC Data Flow

## Overview

WinCC acts as the upper-level SCADA layer between PLC data and SQL / reporting systems.

The main purpose of this layer is to read production values from PLC tags, display them on SCADA screens and store selected values in SQL Server for reporting.

---

## Simplified Data Flow

    PLC
        ↓
    WinCC Tag Management
        ↓
    WinCC Runtime / VBS Scripts
        ↓
    SQL Server Database
        ↓
    Excel Reports
        ↓
    Email / ERP / 1C

---

## PLC to WinCC

Production values are read from PLC through WinCC tags.

The system uses tag connections for:

- production counters
- line status values
- meter values
- shift data
- server communication status
- trigger flags for data transfer

---

## WinCC to SQL

WinCC VBS scripts process tag values and write selected data into SQL Server.

The scripts use SQL connection logic and insert production values into database tables.

Typical stored data includes:

- date and time
- line name
- order number
- shift number
- input counter
- output counter
- reject counter
- status values
- roll meter values

---

## SQL to Reports

Separate reporting scripts read data from SQL Server.

Reports are generated in Excel format and sent by email.

Current report types:

- daily production reports
- daily roll meter reports
- monthly production reports

---

## Engineering Value

Understanding this data flow was important because PLC logic changes directly affected WinCC scripts and SQL reports.

When PLC counter reset logic was improved, the WinCC reporting logic also had to be updated to correctly process the new clean values.
