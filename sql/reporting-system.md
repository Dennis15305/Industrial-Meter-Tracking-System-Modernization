# SQL Reporting System

## Overview

The system uses SQL Server data to generate production reports.

Reports are created in Excel format and sent by email.

Report generation is controlled by WinCC scripts and actions.

Related WinCC documentation:

[WinCC VBS Scripts](../wincc/vbs-scripts.md)

---

## Report Types

Current report types include:

- daily production reports for all lines
- daily roll meter reports
- monthly production reports

---

## Report Data Sources

Reports use data from SQL Server tables.

Important data sources:

- Pogon — roll meter values
- PIE_Send_EMail — line events, counters and statuses
- OptiSoftData — order and efficiency information
- Production — production-related data

---

## Daily Roll Meter Report

This report reads meter values from the Pogon table.

The report covers a production day from 08:00 to 08:00 of the next day.

Data is grouped by roll number and exported to Excel.

---

## Problem Found

After PLC counter reset logic was improved, WinCC began receiving one clean prepared value instead of several noisy values.

However, the old report logic expected three neighboring values and tried to detect the valid value by comparing them.

The old logic worked with noisy data, but failed when the PLC started sending clean values.

As a result, many correct meter values were not included in the report.

---

## Implemented Improvement

The roll meter report logic was modified.

Instead of searching for one valid value among several neighboring values, the report now reads valid meter values from the Pogon table for the selected production day.

The report groups data by roll number and generates the Excel file.

---

## Result

The reporting logic became compatible with the improved PLC counter reset logic.

Correct meter values are now included in the daily roll meter report.

---

## Engineering Value

This improvement required understanding the full chain:

- PLC counter reset logic
- WinCC tag processing
- SQL data storage
- Excel report generation
- email reporting workflow
