# System Modernization and Improvements

## Overview

This document describes the improvements made to the industrial meter tracking system and outlines planned future enhancements.

The work was performed in a real production environment with minimal downtime and without full documentation of the existing system.

---

## Implemented Improvements

### 1. Data Cleaning and Filtering

The original system produced noisy and incorrect data during counter reset events.

#### Problems

- Multiple values were written to the database
- Zero and invalid values were stored
- Counter overflow produced extremely large numbers (due to negative values)

#### Solution

- Implemented detection of sudden drop in counter values (reset event)
- Captured last valid value before reset
- Stored only one clean and confirmed value in the database
- Added upper limit filter (1,000,000) to eliminate overflow/invalid values
- Introduced buffer variable for diagnostic purposes

---

### 2. Improved Data Structure

- Modified database logic to store only a single valid production value
- Reduced noise and duplication in records

#### Additional Improvement (Planned)

- Added ID field to database records
- This will allow external systems (e.g., ERP / 1C) to track which records were already processed

---

### 3. PLC Logic Improvements

- Implemented reset detection logic based on value drop
- Added flag system to indicate when data is ready for database transfer
- Separated current value, buffered value and confirmed value

---

### 4. RS-485 Communication Stabilization

#### Problem

Counters stopped working after less than one day.

#### Investigation

- Identified RS-485 network as root cause
- Verified using standalone counter (not connected to RS-485)

#### Solution

- Replaced communication cable with shielded twisted-pair RS-485 cable
- Ensured correct routing of A/B differential signals

#### Result

- System operated continuously for at least one week without failure
- Communication became stable
- Operator complaints stopped

---

### 5. System Recovery and Deployment

- Restored non-working production line (Line 4)
- Updated PLC firmware and migrated project to Machine Expert
- Reconfigured and reassigned Modbus slave addresses for counters
- Established stable communication between PLC and all counters

---

## Constraints

- Work performed on active production system
- Limited opportunity for full system testing during downtime
- No official documentation for modified counters (Modbus version)
- Required reverse engineering and experimental validation

---

## Planned Improvements

### 1. RS-485 Reference (GND)

- Identified internal GND point in counter hardware
- Verified on test unit
- Plan to implement on all counters after laboratory validation

---

### 2. Counter Verification

- Sent spare counters for calibration
- Goal: ensure measurement accuracy (e.g., 100 meters = 100 meters)

---

### 3. Protective Grounding

- Evaluate grounding strategy for counter enclosures
- Reduce electromagnetic interference from motors

---

### 4. Dynamic RS-485 Bus Topology

- Implement relay-based switching controlled by PLC

#### 3-Layer Mode

- Counters 1–3 active
- Termination at counter 3

#### 5-Layer Mode

- Counters 1–5 active
- Termination at counter 5

- HMI will allow operator to select mode
- PLC will switch relays accordingly

---

## Results

- System stability significantly improved
- Continuous operation achieved without daily failures
- Data quality improved (clean, consistent values)
- Reduced manual intervention

---

## Engineering Impact

This project demonstrates:

- Ability to work with incomplete systems and missing documentation
- Strong diagnostic skills (hardware + software)
- Understanding of industrial communication (RS-485, Modbus)
- PLC programming and data processing
- System-level thinking (from sensor to database)
- Ability to implement solutions in real production conditions
