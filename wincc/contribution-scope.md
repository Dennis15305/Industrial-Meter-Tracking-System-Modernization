# Contribution Scope

## Original State

The WinCC / SQL system already existed before my work.

It included:

- WinCC visualization screens
- tag configuration
- Global Script VBS modules
- WinCC Actions
- SQL Server database
- Excel report generation
- email reporting

---

## My Role

My role was not to create the WinCC system from scratch.

My work focused on:

- understanding the existing WinCC project
- analyzing the tag structure
- studying VBS scripts
- understanding SQL data storage
- modifying report logic
- improving compatibility between PLC logic and reports
- preparing future improvements for reports and ERP / 1C integration

---

## Implemented Changes

I modified the logic related to roll meter data.

After improving PLC counter reset handling, the PLC started preparing one clean value for each roll reset event.

WinCC scripts were updated so they no longer processed three mixed variables, but instead used the prepared value.

The roll meter report was also updated to read valid values from the Pogon table for the full production day.

---

## Skills Demonstrated

This work demonstrates:

- WinCC project analysis
- SQL Server data understanding
- VBS script modification
- industrial reporting logic
- PLC to SCADA to SQL data flow understanding
- working with existing undocumented systems

---

## Engineering Note

At the beginning, I had very little experience with WinCC.

Over time, I studied the project structure, tag flow, SQL tables and reporting scripts until I could safely modify and improve parts of the system.
