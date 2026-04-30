# HMI Overview

## Overview

This folder documents the HMI operator interface used in the industrial meter tracking system.

The HMI is based on a Weintek MT8071iE panel and is edited using EasyBuilder Pro / EBPro V6.09.02.651.

The HMI communicates with the PLC over Ethernet TCP/IP and provides the operator with access to production status, counters, stop reasons, alarms, communication warnings and basic line control commands.

---

## Important Note

The original HMI project already existed before my work.

My role was focused on analyzing how the HMI interacts with PLC logic, operator commands, status words, counters, user authorization and production history.

This documentation explains the HMI role in the full system architecture without exposing the complete industrial project.

---

## HMI Responsibilities

The HMI is used to:

- display current production status
- display current shift and PLC time
- show current order counters
- show total production counters for the shift
- display real-time line speed
- show equipment and server communication status
- allow the operator to select stop reasons
- send operator commands to the PLC
- provide user authorization for protected actions
- provide access to settings, including production width for square meter calculation

---

## Communication

The HMI is connected to the industrial network and communicates with the PLC over Ethernet TCP/IP.

It displays PLC data and sends operator commands back to the PLC using tags, direct variable writes and macros.

---

## Documentation

- [Operator Interface Overview](operator-interface/overview.md)
- [Screen Structure](operator-interface/screen-structure.md)
- [Operator Workflow](operator-interface/operator-workflow.md)
- [PLC Tag Interaction](operator-interface/plc-tag-interaction.md)
- [Future Improvements](operator-interface/future-improvements.md)
- [Contribution Scope](operator-interface/contribution-scope.md)

---

## Notes

Screenshots and tag names are anonymized where necessary.

Real plant-specific identifiers, addresses, credentials and internal network details are not included.
