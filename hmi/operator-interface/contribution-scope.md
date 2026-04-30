# Contribution Scope

## Original State

The HMI project already existed before my work.

It was created by a previous programmer and was already connected to the PLC logic.

---

## My Role

My role was not to redesign the HMI from scratch.

My work was focused on:

- understanding the existing HMI structure
- analyzing how HMI buttons interact with PLC variables and macros
- understanding how line status is displayed
- connecting HMI behavior with PLC history logic
- documenting the HMI role in the full system architecture
- preparing future improvements related to production modes and operator workflow

---

## Tools

- HMI panel: Weintek MT8071iE
- Software: EBPro V6.09.02.651
- Communication: Ethernet TCP/IP

---

## Future Contribution

Planned future work includes:

- adding HMI selection for 3-layer / 5-layer production modes
- adding active roll group selection
- synchronizing HMI mode selection with PLC relay switching
- improving alarm logic for inactive counters
- documenting HMI macros and tag mapping

---

## Why This Matters

In real industrial automation projects, engineers often work with existing systems created by other people.

Understanding and safely modifying such systems is an important engineering skill.

This HMI documentation shows how the operator interface fits into the PLC / SCADA / SQL data chain.
