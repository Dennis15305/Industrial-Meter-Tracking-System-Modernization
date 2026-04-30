# Global Script VBS

## Overview

WinCC uses Global Script VBS modules to process runtime values, interact with SQL Server and support report generation.

These scripts are part of the upper-level automation logic.

---

## Script Responsibilities

VBS scripts are used to:

- read WinCC runtime tags
- prepare values for SQL insertion
- connect to SQL Server
- write production data into database tables
- generate Excel reports
- send reports by email
- support synchronization and scheduled actions

---

## Main Script Groups

The project contains scripts related to:

- PLC data synchronization
- report generation
- email sending
- shift handling
- production line calculations
- meter report creation
- monthly reports

---

## PLC Data Synchronization

Some scripts read prepared values from WinCC tags and write them into SQL Server.

This logic is used to transfer production counters, statuses and meter values from PLC / WinCC into the database layer.

---

## Reporting Scripts

Reporting scripts read data from SQL Server and generate Excel files.

These reports are later sent by email.

Detailed report and SQL logic is documented in:

[SQL Reporting System](../sql/reporting-system.md)

---

## Engineering Note

The VBS layer is tightly connected to:

- WinCC tags
- PLC transfer flags
- SQL table structure
- Excel report format

Changes in one layer may require changes in the others.
