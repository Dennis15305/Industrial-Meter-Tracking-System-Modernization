# MB_Reset Function Block

## Purpose

Provides automatic recovery mechanism for Modbus communication.

## Problem

In industrial RS-485 networks:

- devices may stop responding
- communication errors may persist
- manual reset is not always possible

## Solution

This block:

- monitors communication errors
- triggers reset periodically
- limits number of reset attempts
- detects permanently lost devices

## Logic

### Normal operation

- If communication is stable → no reset needed
- Reset counter is cleared

### Error handling

- If error persists:
  - every 3 seconds a reset is triggered
  - reset attempts are counted

### Recovery

- If communication is restored:
  - reset counter is cleared
  - device is considered operational

### Failure detection

- If too many reset attempts:
  - device is marked as disconnected

## Engineering Value

This block improves:

- system reliability
- fault tolerance
- automatic recovery without operator intervention
