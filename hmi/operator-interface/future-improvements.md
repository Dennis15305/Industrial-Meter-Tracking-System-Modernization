# Future HMI Improvements

## Overview

Future HMI improvements are planned to support different production modes and improve operator control over active roll counters.

This is connected to planned RS-485 relay switching and 3-layer / 5-layer production mode logic.

---

## Production Mode Selection

The production line can work in different configurations.

Planned HMI mode selection:

- 3-layer production
- 5-layer production
- alternative 3-layer mode using backup roll pair

---

## Roll Counter Groups

Roll counter groups:

- Roll 1: always active
- Rolls 2–3: work as a pair
- Rolls 4–5: work as a pair

Planned logic:

- 3-layer production: Roll 1 + Rolls 2–3
- 3-layer alternative mode: Roll 1 + Rolls 4–5
- 5-layer production: Roll 1 + Rolls 2–3 + Rolls 4–5

---

## Relay-Based RS-485 Switching

Relay switching is planned to disconnect unused counters from the active RS-485 bus.

Purpose:

- reduce unnecessary devices on the bus
- improve communication stability
- place termination at the actual active end of the bus
- prevent unused counters from causing communication issues

---

## HMI Role

The HMI will allow the operator or authorized user to select the active production mode.

The selected mode will be sent to the PLC.

The PLC will:

- switch relays
- enable required counters
- disable unused counters
- update HMI status
- apply correct alarm logic

---

## Required Changes

Planned changes include:

- new HMI mode selection screen
- PLC logic for production mode selection
- relay output control
- updated RS-485 termination strategy
- updated HMI alarms for inactive counters
- testing procedure for each mode

---

## Engineering Goal

The goal is to make the system more flexible and reliable for both 3-layer and 5-layer production modes.
