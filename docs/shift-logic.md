# Shift Logic

## Overview

The system operates in two shifts:

- Day shift: 08:00 – 20:00
- Night shift: 20:00 – 08:00

## Logic

- Current shift is determined based on PLC time
- On shift change:
  - Current production state is saved
  - Counters are reset
  - New shift begins with clean data

## Purpose

This ensures:
- correct production statistics per shift
- clean separation of production data
- proper reporting to external systems
