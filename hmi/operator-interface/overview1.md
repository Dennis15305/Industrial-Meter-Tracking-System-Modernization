# Operator Interface Overview

## Purpose

The HMI is used as the local operator interface for the production line.

It allows operators to monitor the current line state, production counters, shift information, speed, alarms and communication status.

It also allows operators to send commands to the PLC, such as selecting stop reasons or confirming maintenance-related actions.

---

## Role in the System

The HMI does not act as the main data processing unit.

Its main role is to:

- display PLC data to the operator
- convert operator actions into PLC command words
- allow the operator to classify line stops
- support maintenance and authorization workflows

The PLC remains responsible for:

- decoding HMI commands
- updating line status
- storing history records
- preparing data for SCADA / SQL transfer

---

## Simplified Data Flow

    Operator
        ↓
    HMI buttons / input fields
        ↓
    PLC command words
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
- speed display
- stop reason selection
- alarm and communication status display
- authorization popups for specific actions

---

## Engineering Value

Understanding this HMI was important because it explains how operator actions affect PLC logic and production history.

The interface is directly connected to line state tracking, downtime classification and database records.
