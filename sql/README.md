# SQL / Reporting Layer

## Overview

This folder documents the SQL Server and reporting layer of the industrial meter tracking system.

SQL Server stores production counters, roll meter values, line states and data used for Excel/email reports and future ERP / 1C integration.

This layer is connected to WinCC, but documented separately because it represents the database and reporting part of the system.

---

## Relationship with WinCC

WinCC reads PLC tags and uses scripts to write selected production values into SQL Server.

SQL Server then acts as the storage and reporting layer.

WinCC documentation:

[WinCC / SCADA Layer](../wincc/README.md)

---

## SQL Layer Responsibilities

The SQL layer is used to:

- store production counters
- store roll meter values
- store line status events
- provide data for Excel reports
- support email reporting
- support future ERP / 1C synchronization

---

## Main Database

The main database used by the system is WinCC_SQL.

It contains tables for:

- roll meter data
- production reports
- line events
- order information
- efficiency-related data
- future synchronization logic

---

## Documentation

- [Database Structure](database-structure.md)
- [Important Tables](important-tables.md)
- [Reporting System](reporting-system.md)
- [ERP / 1C Integration](erp-1c-integration.md)
- [Future Improvements](future-improvements.md)
- [Screenshots](screenshots/README.md)

---

## Notes

This documentation does not include credentials, server names, internal network details or confidential production data.
