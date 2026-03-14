# Stepped-Impedance Low-Pass Filter Design

This repository contains the design, simulation, and analysis of a 7th-order stepped-impedance low-pass filter (LPF). The project progresses from theoretical lumped-element design to a physical microstrip implementation using Rogers Duroid 6010 substrate.

## Project Overview

The goal was to design an LPF that meets high-performance microwave specifications, suitable for applications requiring sharp cutoff frequencies and high stopband rejection.

### Technical Specifications

* **Filter Type:** 7th-Order Chebyshev Low-Pass Filter.
* **Passband Edge ($f_p$):** 8 GHz.
* **Stopband Edge ($f_s$):** 12 GHz.
* **Return Loss ($RL$):** $\ge 22$ dB for $f \le 8$ GHz.
* **Insertion Loss ($IL$):** $\le 0.2$ dB for $f \le 8$ GHz.
* **Stopband Rejection:** $\ge 25$ dB for $f \ge 12$ GHz.
* **System Impedance:** 50 $\Omega$.

## Project Structure
**code**          → MATLAB scripts for design calculations. 

**ads**           → ADS simulation files and schematics.

**output**        → Performance plots and S-parameter results.

**documentation** → Final project report and design specs.


## Design Workflow

1. **Lumped-Element Design:** Calculated ideal $L$ and $C$ values for a 7th-order prototype.

2. **Ideal Transmission Line Model:** Converted lumped elements into stepped-impedance lines with $Z_{0L} = 25\ \Omega$ and $Z_{0H} = 100\ \Omega$.

3. **Microstrip Conversion:** Realized the design on a **Duroid 6010 substrate** ($\epsilon_r = 10.7$, thickness = 0.635 mm).

4. **Optimization & Tuning:** Refined the microstrip model by adding MSTEP elements and tuning line lengths to meet original specifications.

## Tools Used

* **MATLAB:** Used for initial mathematical modeling and ideal lumped-element simulations.

* **Advanced Design System (ADS):** Used for microstrip layout, S-parameter simulation, and optimization.

## Results Summary

* Successfully achieved a return loss better than 22 dB in the passband.
* The final microstrip version (V3) maintained the 8 GHz cutoff while ensuring $>25$ dB rejection at 12 GHz.


---

Developed as part of the Microwave Engineering (EE 514/414) curriculum at Western New England University.
