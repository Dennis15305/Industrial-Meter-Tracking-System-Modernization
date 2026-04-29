# CalcDeltaT Function Block

## Purpose

Measures the duration of digital sensor pulses.

## How It Works

The block detects:

- rising edge of the sensor signal
- falling edge of the sensor signal

On rising edge, the current PLC time in milliseconds is saved.

On falling edge, the pulse duration is calculated.

## Outputs

- `MinTime` — shortest valid pulse duration
- `MaxTime` — longest valid pulse duration

## Use Case

This block is used to monitor sensor behavior and detect abnormal pulse timing.

## Filtering

Only pulse durations inside configured limits are accepted:

- below `MIN_T_ms` — ignored
- above `MAX_T_ms` — ignored

## Engineering Value

This function block helps diagnose sensor stability and production line behavior.
