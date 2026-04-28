# RS-485 Diagnostics and Improvements

## Overview

One of the main issues in the system was instability of RS-485 communication between the PLC and the counters.

The goal was to identify the root cause of failures and improve long-term reliability of the communication network.

---

## Symptoms

- Counters stopped working after less than one day
- One counter failure could affect other devices on the same bus
- Devices could freeze or stop responding
- System behavior degraded over time

---

## Key Observation

A duplicate counter installed near the main one, but not connected to the RS-485 network, worked correctly.

This indicated that:
- the measurement system itself was working
- the issue was related to RS-485 communication

---

## Root Cause Analysis

After inspecting the system, several problems were identified:

### 1. Cable Quality

- Different types of cables were used
- Some parts were not twisted pair
- Shielding was inconsistent

### 2. Incorrect Differential Pair Routing

RS-485 uses differential signaling (A and B lines).

In the original installation:
- A and B were not always routed as a single twisted pair

This increases susceptibility to electromagnetic interference.

### 3. Lack of Reference Conductor

- No dedicated reference (GND) between devices
- Potential voltage differences between devices

### 4. Shielding Issues

- Shield was not properly connected or consistent along the line

### 5. Termination Problems

- 120 Ohm resistor was not always located at the actual end of the active bus
- Bus topology changed depending on production mode

---

## Implemented Solution

### Cable Replacement

- Replaced the old cable with a shielded twisted-pair RS-485 cable
- Ensured A and B signals were routed through the same twisted pair

### Engineering Decision

I insisted on correct twisted-pair routing for A/B signals according to RS-485 best practices, despite initial disagreement.

---

## Result

- Communication became significantly more stable
- Counters no longer failed as frequently
- System reliability improved during production

---

## Planned Improvements

### 1. Reference Point (GND)

- Investigate safe implementation of a common reference point for RS-485 devices

### 2. Hardware Modification

- Analyze counter hardware to identify RS-485 transceiver ground reference
- Implement only after electrical validation

### 3. Protective Grounding

- Evaluate grounding of counter enclosures to reduce interference from motors

### 4. Dynamic Bus Topology

- Implement relay-based switching for:
  - 3-layer production (short bus, termination near counter 3)
  - 5-layer production (full bus, termination near counter 5)

---

## Conclusion

RS-485 instability was caused by a combination of wiring, shielding and topology issues.

System stability improved significantly after applying proper industrial communication practices.
