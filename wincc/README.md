# WinCC / SCADA Layer

## Overview

This folder documents the WinCC layer of the industrial meter tracking system.

WinCC is used as the upper-level SCADA system for production visualization, tag processing, VBS scripting and interaction with the SQL database layer.

The system is based on WinCC V7.5.0.0.

---

## Important Note

The original WinCC project already existed before my work.

My role was focused on analyzing, maintaining and improving parts of the existing system, especially tag flow, VBS scripts and interaction with SQL-based reporting.

This documentation explains the WinCC role in the full PLC / SCADA / SQL architecture without exposing the complete industrial project.

---

## WinCC Responsibilities

WinCC is used to:

- display production statistics for multiple production lines
- read production values from PLC tags
- show current counters, shift values and line status
- process runtime values using Global Script VBS
- execute WinCC Actions
- transfer selected values to SQL Server
- support Excel and email reporting through scripts

---

## What Belongs to This Folder

This folder focuses on the SCADA/application side:

- WinCC Runtime screens
- Tag Management
- Global Script VBS modules
- WinCC Actions
- PLC-to-WinCC data flow
- WinCC-to-SQL transfer logic at a high level

Detailed SQL tables, reports and database logic are documented separately:

[SQL / Reporting Layer](../sql/README.md)

---

## Documentation

- [WinCC Data Flow](data-flow.md)
- [Tag Management](tag-management.md)
- [VBS Scripts](vbs-scripts.md)
- [WinCC Actions](actions.md)
- [Contribution Scope](contribution-scope.md)
- [Screenshots](screenshots/README.md)

---

## Notes

Screenshots and names are anonymized where necessary.

Real server names, IP addresses, credentials, production identifiers and internal network details are not included.
