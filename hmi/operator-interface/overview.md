# Operator Interface Overview

## Purpose

The HMI is used as the local operator interface for the production line.

It allows operators to monitor the current line state, production counters, shift information, speed, alarms and communication status.

It also allows operators to send commands to the PLC, such as selecting stop reasons, confirming maintenance-related actions and accessing protected settings.

---

## Hardware and Software

- HMI panel: Weintek MT8071iE
- Engineering software: EBPro V6.09.02.651
- Communication: Ethernet TCP/IP
- PLC interaction: direct tag writes and HMI macros

The original project was likely created in an earlier version of EBPro and later opened/updated in EBPro V6.09.02.651.

---

## Role in the System

The HMI does not act as the main data processing unit.

Its main role is to:

- display PLC data to the operator
- convert operator actions into PLC commands
- allow the operator to classify line stops
- provide access to settings
- support user authorization workflows

The PLC remains responsible for:

- decoding HMI commands
- updating line status
- processing counters
- storing history records
- preparing data for WinCC / SQL transfer

---

## Simplified Data Flow

    Operator
        ↓
    HMI buttons / input fields / macros
        ↓
    PLC tags and command variables
        ↓
    PLC line state logic
        ↓
    History buffer
        ↓
    WinCC / SQL

---

## Main Functions

The HMI provides:

- production line status visualization
- current order data
- shift counters
- real-time speed display
- stop reason selection
- alarm and communication status display
- authorization popups
- settings access for protected parameters

---

## Engineering Value

Understanding this HMI was important because it explains how operator actions affect PLC logic and production history.

The interface is directly connected to line state tracking, downtime classification, counter display and database records.
