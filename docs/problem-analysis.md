# Problem Analysis

## Overview

When I joined the project, the industrial meter tracking system was already installed, but it worked unreliably and required constant maintenance.

The goal was to understand the system, identify root causes of failures, and improve stability and data quality.

---

## Main Symptoms

- Counters stopped responding or froze after less than one day of operation
- One failing counter could affect the entire RS-485 network
- Database contained noisy and duplicated values
- Reset events produced incorrect data (zeros and spikes)
- System behavior was inconsistent during different production modes

---

## Data Quality Issues

During analysis of the PLC logic and database behavior, I found that:

- Multiple values were written during counter reset events
- Zero values and sudden drops were interpreted as valid data
- Several variables were written instead of one confirmed production value

### Result

This produced:
- noisy data
- duplicated records
- incorrect production statistics

---

## Communication Issues (RS-485)

A major issue was instability of the RS-485 network.

### Observations

- Counters connected via RS-485 failed after extended operation
- A duplicate standalone counter (not connected to RS-485) worked correctly
- Failures often propagated across multiple devices

### Possible Causes

- Inconsistent cable types (twisted pair and non-twisted wiring)
- Lack of proper shielding
- No reference conductor (GND)
- Incorrect routing of A/B differential signals
- Termination resistor not located at the active end of the bus

---

## System Design Issues

- RS-485 topology was not adapted for different production modes
- During 3-layer production, unused counters affected system behavior
- Termination was placed incorrectly when part of the bus was inactive

---

## Engineering Approach

To solve these issues, I:

1. Studied the existing PLC, HMI and database logic
2. Analyzed how counter values are processed and stored
3. Identified incorrect data handling during reset events
4. Investigated RS-485 network behavior and hardware setup
5. Formed hypotheses and validated them through testing

---

## Summary

The system issues were not caused by a single failure, but by a combination of:

- communication problems (RS-485)
- incorrect data processing logic
- inconsistent wiring practices
- lack of proper system design for different production modes

These findings defined the direction for further improvements.
