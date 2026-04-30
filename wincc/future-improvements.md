# Future WinCC / SQL Improvements

## Overview

Several improvements are planned for the WinCC / SQL and reporting layer.

The main goal is to make reports more reliable, more useful and better connected to ERP / 1C.

---

## Reporting Improvements

Planned work:

- redesign daily production reports
- redesign daily roll meter reports
- redesign monthly reports
- improve Excel formatting
- improve report structure by line and shift
- improve error handling in report scripts

---

## Meter Loss Analysis

Planned improvement for roll meter reports:

- add total output meter value
- compare roll input meters with output meters
- calculate production losses
- make roll consumption analysis more useful for production control

---

## ERP / 1C Integration

Current ERP / 1C integration exists, but many functions are incomplete or unreliable.

Planned work:

- improve synchronization logic
- use record ID to track processed rows
- prevent duplicate data transfer
- coordinate changes with 1C developer
- prepare cleaner SQL queries for external systems

---

## Database Improvements

Planned work:

- improve table structure where possible
- document important tables
- add clear record identifiers
- improve query reliability
- reduce dependency on unclear legacy logic

---

## Engineering Goal

The goal is to make the upper-level system easier to maintain and more reliable for reporting, production analysis and ERP integration.
