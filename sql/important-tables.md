# Important SQL Tables

## Overview

This document describes the most important SQL tables used by the industrial meter tracking and reporting system.

The descriptions are based on system analysis and may be extended as the project is further investigated.

---

## Pogon

Purpose:

Stores roll meter values.

Used for:

- daily roll meter reports
- roll consumption analysis
- future comparison between roll input meters and output meters

Notes:

This table became important after PLC counter reset logic was improved.

WinCC report logic was updated to read valid values from this table for the production day.

---

## PIE_Send_EMail

Purpose:

Stores line events, status values and production counters used for email reports.

Typical data:

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

Used for:

- daily production reports
- shift statistics
- line event history
- downtime classification

---

## OptiSoftData

Purpose:

Stores production order and efficiency-related data.

Typical data:

- line
- order number
- technical card
- nominal efficiency
- start date
- setup / reconfiguration time

Notes:

Some fields exist but are not fully implemented in the current system.

---

## Production

Purpose:

Stores production-related data used by the WinCC / reporting layer.

Notes:

The exact role of this table requires further investigation.

---

## Send_Email

Purpose:

Used by email reporting logic.

Notes:

This table is connected to report generation and email sending scripts.

---

## SyncStatus

Purpose:

This table may be related to synchronization logic.

Current status:

- exists in the database
- currently unclear or unused
- requires further investigation

Possible future use:

- track records already processed by ERP / 1C
- prevent duplicate synchronization
- store last sent record ID
