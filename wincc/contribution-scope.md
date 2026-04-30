# Contribution Scope

## Original State

The WinCC system already existed before my work.

It included:

- WinCC visualization screens
- Tag Management
- Global Script VBS modules
- WinCC Actions
- SQL Server interaction
- Excel report generation
- email reporting

---

## My Role

My role was not to create the WinCC system from scratch.

My work focused on:

- understanding the existing WinCC project
- analyzing the tag structure
- studying Global Script VBS modules
- understanding how PLC values are transferred to SQL
- modifying parts of the reporting logic
- improving compatibility between PLC logic and reports
- preparing future improvements for reports and ERP / 1C integration

---

## Implemented Changes

I modified logic related to roll meter data processing.

After improving PLC counter reset handling, the PLC started preparing one clean value for each roll reset event.

WinCC scripts were adjusted so they no longer relied on the old noisy data behavior.

This made the WinCC / SQL reporting layer compatible with the improved PLC data logic.

---

## Skills Demonstrated

This work demonstrates:

- WinCC project analysis
- VBS script understanding
- PLC-to-SCADA data flow analysis
- SCADA-to-SQL transfer logic
- industrial reporting workflow understanding
- working with existing undocumented systems

---

## Engineering Note

At the beginning, I had very little experience with WinCC.

Over time, I studied the project structure, tag flow, scripts and database interaction until I could safely modify and improve parts of the system.
