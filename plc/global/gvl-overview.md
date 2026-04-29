# Global Variables Overview

## Purpose

The PLC project uses global variables to exchange data between:

- PLC programs
- function blocks
- HMI
- WinCC / SCADA
- database transfer logic

## Main Variable Groups

### Time and Shift

Stores current date, time and active work shift.

Used for:

- shift detection
- history records
- report timestamps

### Line Status

Stores current line state and operator command words.

Used for:

- HMI buttons
- downtime reasons
- alarm states
- status history

### Production Counters

Stores production counters for:

- current order
- current shift
- day shift
- night shift
- roll meters
- final product meters

### Transfer Buffer

Contains prepared values that upper-level systems read before writing to SQL.

The system uses handshake flags:

```text
0 = PLC ready to prepare data
1 = PLC prepared data, server can read it
2 = server confirmed that data was read
```

