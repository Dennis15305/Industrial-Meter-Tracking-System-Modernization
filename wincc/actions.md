# WinCC Actions

## Overview

WinCC Actions are used to execute script logic during runtime.

Actions can be connected to triggers, tag changes or scheduled logic.

---

## Role in the System

WinCC Actions help automate:

- PLC data synchronization
- tag processing
- report generation
- email sending
- connection checking
- shift-related logic

---

## Example Logic

A typical WinCC Action can call a VBS function that reads data from PLC-related tags and writes it into SQL Server.

Simplified flow:

    WinCC Action trigger
        ↓
    VBS function call
        ↓
    Read WinCC tags
        ↓
    Prepare SQL data
        ↓
    Write to SQL Server

---

## Engineering Note

Actions are an important part of the runtime automation layer.

They connect static configuration, runtime tag values and script execution.
