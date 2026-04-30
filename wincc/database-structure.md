# SQL Database Structure

## Overview

SQL Server is used as the production data storage layer for the WinCC system.

The database stores production counters, meter values, line states and data used for reports.

---

## Important Tables

### Pogon

Stores roll meter values.

This table is used for daily roll meter reports.

It contains meter data from roll counters and is used to generate Excel reports by roll number and time range.

---

### PIE_Send_EMail

Stores line events, status values and production counters used for email reports.

Typical data includes:

- line name
- input counter
- output counter
- reject counter
- shift number
- status
- date and time
- order number
- user number
- setup type

---

### OptiSoftData

Stores production order and efficiency-related data.

Typical data includes:

- line
- order number
- technical card
- nominal efficiency
- start date
- setup / reconfiguration time

Some fields exist but are not fully implemented in the current system.

---

### Production

Stores production-related data used by the WinCC / reporting layer.

The exact role of this table requires further investigation.

---

## Empty / Unclear Tables

Some tables exist in the database but are currently empty or not fully understood.

Example:

- SyncStatus

This table may be related to synchronization logic, but its current role is unclear.

---

## Engineering Note

Database structure is tightly connected to PLC and WinCC script logic.

Changes in PLC values or WinCC transfer logic can require updates in SQL queries and report generation scripts.
