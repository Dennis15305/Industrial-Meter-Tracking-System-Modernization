# AnalizLine FBD Program

## Purpose

This FBD program coordinates the main logic of one production line.

It connects several function blocks responsible for:

- line state analysis
- Modbus communication error handling
- counter reset commands
- roll/counter processing
- data preparation for HMI / SCADA / SQL

## Main Function Blocks

### Line_AnalizFul

Main line analysis block.  
Processes line state, counters, work mode, alarms and historical records.

### TestConnectionOk

Checks connection between PLC and upper-level system.

### MB_Reset

Handles reset logic for each Modbus counter channel.

There are six instances:

- counter 1
- counter 2
- counter 3
- counter 4
- counter 5
- total line counter

### CutPoint

Processes counter reset/cut points for each roll.

### BIT_AS_WORD / WORD_AS_BIT

Converts between bit signals and status words.

Used for:

- reset commands
- Modbus error aggregation
- HMI/SCADA status exchange

## Simplified Execution Flow

```text
HMI / SCADA signals
        ↓
Connection check
        ↓
Line analysis block
        ↓
Counter reset processing
        ↓
Modbus error aggregation
        ↓
Cut point processing
        ↓
Prepared data for HMI / WinCC / SQL
```

// Simplified pseudocode, not exact original code

ConnectionChecker();

LineAnalyzer(
    InputSensor := LineInputSensor,
    OutputSensor := LineOutputSensor,
    StatusWord := LineStatusWord,
    History := LineHistory
);

FOR Channel := 1 TO 6 DO
    ModbusReset[Channel](
        Error := ModbusError[Channel],
        ResetCommand := ResetCommand[Channel]
    );
END_FOR;

FOR Roll := 1 TO 6 DO
    CutPoint[Roll](
        Meters := CounterValue[Roll],
        Set := ResetSignal[Roll]
    );
END_FOR;

ModbusErrorWord := PackBits(ModbusError);


## Notes

The original logic is implemented in FBD inside EcoStruxure Machine Expert.

This document provides an anonymized explanation of the structure instead of exporting the full industrial project.
