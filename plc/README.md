# Files

## Structured Text Programs

- `calc-delta-prg.st` — calls pulse duration analysis function blocks for input and output sensors.
- `get-date-time-prg.st` — reads PLC system time, applies timezone offset and prepares date/time values.
- `transfer-to-db-prg.st` — prepares historical records for SCADA / SQL transfer using a handshake flag.

## FBD Logic

Some PLC logic is implemented in Function Block Diagram (FBD).

- [AnalizLine FBD Program](fbd/analizline-fbd.md)
- 
## Global Variables

- [GVL Overview](global/gvl-overview.md)
- [`History` structure](global/history-struct.st)
- [GVL example](global/gvl-example.st)
