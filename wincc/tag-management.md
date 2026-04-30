# WinCC Tag Management

## Overview

WinCC Tag Management is used to connect PLC values, internal runtime tags and script logic.

Tags are the main communication layer between:

- PLC
- WinCC Runtime screens
- VBS scripts
- SQL transfer logic

---

## Tag Sources

The project contains several tag groups, including:

- internal WinCC tags
- PLC communication tags
- system information tags
- Modbus TCP/IP communication tags
- connection status tags
- performance and diagnostic tags

---

## Role of Tags

Tags are used for:

- displaying current production values
- detecting server / PLC communication state
- reading prepared PLC buffers
- triggering script actions
- transferring data into SQL Server
- supporting report generation

---

## PLC Communication

WinCC reads PLC data using configured communication connections.

The project contains tag connections to PLC and runtime values.

Some OPC-related components exist in the project, but their exact purpose requires further investigation.

---

## Engineering Note

Tag structure is critical in this system.

Any change in PLC variable layout, WinCC tags or script names can affect:

- visualization
- SQL logging
- reports
- email output
- ERP / 1C integration
