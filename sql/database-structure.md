# SQL Database Structure

## Overview

SQL Server is used as the production data storage layer for the WinCC system.

The database stores production counters, roll meter values, line states and data used for reports.

---

## Main Database

The main database is:

    WinCC_SQL

---

## Main Table Groups

The database contains tables related to:

- production counters
- roll meter values
- line events
- email reports
- production orders
- efficiency data
- synchronization logic

---

## Important Tables

Important tables include:

- Pogon
- PIE_Send_EMail
- OptiSoftData
- Production
- Send_Email
- SyncStatus

Detailed table descriptions:

[Important Tables](important-tables.md)

---

## Connection to WinCC

WinCC VBS scripts write production data into SQL Server.

The WinCC layer is documented separately:

[WinCC / SCADA Layer](../wincc/README.md)

---

## Engineering Note

SQL structure is tightly connected to PLC and WinCC logic.

Changes in PLC values or WinCC transfer scripts can require updates in SQL queries and report generation logic.
