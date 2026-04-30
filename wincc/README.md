# WinCC / SQL Layer Overview

## Overview

This folder documents the WinCC / SQL layer of the industrial meter tracking system.

WinCC is used as the upper-level SCADA system for production visualization, tag processing, SQL data storage and reporting.

The system is based on WinCC V7.5.0.0 and Microsoft SQL Server.

---

## Important Note

The original WinCC / SQL system already existed before my work.

My role was focused on analyzing, maintaining and improving parts of the existing system, especially database logic, VBS scripts and production reporting.

This documentation explains the WinCC role in the full PLC / SCADA / SQL architecture without exposing the complete industrial project.

---

## WinCC Responsibilities

WinCC is used to:

- display production statistics for multiple lines
- read production values from PLC tags
- process tag values using VBS scripts
- store production data in SQL Server
- generate Excel reports
- send reports by email
- support future ERP / 1C integration

---

## Main Components

- WinCC Runtime visualization screens
- Tag Management
- Global Script VBS modules
- WinCC Actions
- SQL Server database
- Excel report generation scripts
- Email reporting logic

---

## Documentation

- [Data Flow](data-flow.md)
- [Tag Management](tag-management.md)
- [Database Structure](database-structure.md)
- [Reporting System](reporting-system.md)
- [Contribution Scope](contribution-scope.md)
- [Future Improvements](future-improvements.md)

---

## Notes

Screenshots and names are anonymized where necessary.

Real server names, IP addresses, credentials, production identifiers and internal network details are not included.
