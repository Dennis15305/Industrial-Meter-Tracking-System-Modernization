# ERP / 1C Integration

## Overview

The production system has an existing connection or planned connection with ERP / 1C.

Current integration is incomplete and requires further improvement.

---

## Current State

Some ERP / 1C-related logic exists, but many functions are incomplete or unreliable.

The system requires better synchronization between SQL Server and 1C.

---

## Main Goal

The goal is to allow 1C to receive only new production records that have not been processed before.

This requires reliable record identification and synchronization logic.

---

## Record ID Concept

A record ID can be used to track which rows were already processed by 1C.

Example logic:

- SQL table stores production records with unique ID
- 1C stores last processed ID
- next synchronization reads only records with ID greater than last processed ID
- after successful transfer, last processed ID is updated

---

## Benefits

This approach helps:

- avoid duplicate data transfer
- simplify synchronization
- reduce query size
- make integration more reliable
- support future automation

---

## Planned Work

Planned tasks:

- coordinate synchronization logic with 1C developer
- define required SQL fields
- implement reliable record selection by ID
- prevent duplicate processing
- document data exchange format

---

## Engineering Note

ERP / 1C integration should be treated as a separate system layer.

It depends on reliable SQL data, clear record identifiers and stable reporting logic.
