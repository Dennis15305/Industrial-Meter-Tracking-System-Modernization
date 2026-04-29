# CutPoint Function Block

## Purpose

Detects counter reset events and captures the last valid meter value before reset.

## Problem

Counters reset to zero when a new roll starts.

Without proper handling:
- incorrect values are sent to database
- data becomes noisy (zeros, spikes)
- production statistics become unreliable

## Solution

The block:
- monitors meter value
- detects sudden drop (reset event)
- captures last valid value before reset
- sends it to SCADA via flag

## Key Logic

Reset is detected when:

- previous value > current value
- drop is larger than threshold
- current value is near zero

## Additional Features

- overflow filtering (invalid large values ignored)
- initialization protection
- history buffer (previous sent value)
- signal flag for SCADA/WinCC

## Result

- clean and reliable data
- no zero/noise values in database
- correct production tracking
