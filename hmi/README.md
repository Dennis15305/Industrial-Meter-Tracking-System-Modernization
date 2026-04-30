
# HMI Overview

## Overview

This folder documents the HMI operator interface used in the industrial meter tracking system.

The HMI provides the operator with access to production status, counters, alarms, stop reasons and basic line control commands.

The interface is part of the operator-to-PLC command layer. Operator actions are converted into PLC command words, while PLC status words and counters are displayed back on the HMI.

---

## Important Note

The original HMI project already existed before my work.

My role was focused on analyzing how the HMI interacts with PLC logic, operator commands, status words, counters and production history.

This documentation explains the HMI role in the full system architecture without exposing the complete industrial project.

---

## HMI Responsibilities

The HMI is used to:

- display current production status
- display current shift and PLC time
- show current order counters
- show total production counters for the shift
- display line speed
- show connection and alarm states
- allow the operator to select stop reasons
- send operator commands to the PLC
- provide basic authorization for maintenance-related actions

---

## Documentation

- [Operator Interface Overview](operator-interface/overview.md)
- [Screen Structure](operator-interface/screen-structure.md)
- [Operator Workflow](operator-interface/operator-workflow.md)
- [PLC Tag Interaction](operator-interface/plc-tag-interaction.md)
- [Contribution Scope](operator-interface/contribution-scope.md)

---

## Notes

Screenshots and tag names are anonymized where necessary.

Real plant-specific identifiers, addresses, credentials and internal network details are not included.
