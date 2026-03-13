# Microstrip Step-Impedance Low-Pass Filter

![License](https://img.shields.io/github/license/LoneOrca/Microstrip-Step-Impedance-Low-Pass-Filter)
![Repo Size](https://img.shields.io/github/repo-size/LoneOrca/Microstrip-Step-Impedance-Low-Pass-Filter)
![Last Commit](https://img.shields.io/github/last-commit/LoneOrca/Microstrip-Step-Impedance-Low-Pass-Filter)
![Issues](https://img.shields.io/github/issues/LoneOrca/Microstrip-Step-Impedance-Low-Pass-Filter)

Design and analysis of a **Stepped-Impedance Microstrip Low-Pass Filter (LPF)** used in microwave and RF systems.

This project demonstrates how lumped element filters can be implemented using **distributed microstrip transmission line sections** for high-frequency applications.

---

# Project Overview

A **Stepped-Impedance Low-Pass Filter (SILPF)** is a distributed microwave filter built using alternating **high-impedance** and **low-impedance** microstrip transmission lines.

These sections emulate the behavior of lumped elements:

| Microstrip Section           | Equivalent Lumped Element |
| ---------------------------- | ------------------------- |
| High impedance (narrow line) | Inductor                  |
| Low impedance (wide line)    | Capacitor                 |

This technique is widely used in microwave circuits because lumped components become impractical at very high frequencies.

---

# Objectives

* Design a microstrip low-pass filter using the stepped-impedance technique
* Convert lumped LC prototype values to distributed transmission line sections
* Simulate the frequency response of the filter
* Evaluate **S-parameters (S11 and S21)**
* Analyze passband and stopband characteristics

---

# Theory

Traditional low-pass filters are designed using lumped inductors and capacitors. However, at microwave frequencies, these components are replaced with transmission line sections.

### Key Design Steps

1. Start with a **normalized low-pass prototype filter**

2. Scale the prototype values for the desired **cutoff frequency**

3. Replace components with transmission line equivalents:

   * Inductor → High impedance microstrip line
   * Capacitor → Low impedance microstrip line

4. Convert electrical parameters into **physical dimensions**:

   * Width (W)
   * Length (L)

The final design is a cascade of alternating impedance microstrip sections.

---

# Repository Structure

```
Microstrip-Step-Impedance-Low-Pass-Filter
│
├── docs/                 # Design documentation
├── simulation/           # Simulation files
├── results/              # S-parameter plots and graphs
├── images/               # Layout diagrams and figures
└── README.md
```

*(Modify this section based on the files present in the repository.)*

---

# Design Parameters

| Parameter           | Value       |
| ------------------- | ----------- |
| Filter Type         | Butterworth |
| System Impedance    | 50 Ω        |
| Substrate           | FR4         |
| Dielectric Constant | 4.4         |
| Substrate Height    | 1.6 mm      |
| Conductor Material  | Copper      |

---

# Simulation Tools

The design can be simulated using various RF and microwave tools:

* MATLAB RF Toolbox
* Keysight ADS
* Ansys HFSS
* CST Microwave Studio
* QUCS

---

# Results

Typical simulation outputs include:

* Return Loss (**S11**)
* Insertion Loss (**S21**)
* Frequency Response
* Cutoff Frequency Characteristics

Example expected behavior:

* Low insertion loss in passband
* Flat frequency response
* High attenuation beyond cutoff frequency

---

# Applications

Stepped-impedance microstrip filters are commonly used in:

* RF transmitters and receivers
* Microwave communication systems
* Radar electronics
* Satellite communication hardware
* Harmonic suppression networks

---

# Future Improvements

Possible extensions to this project:

* Higher order filter design for sharper roll-off
* Optimization using EM simulation
* Fabrication and measurement of the physical filter
* Integration into RF front-end systems

---

# Contributing

Contributions are welcome.

If you'd like to improve the design, add simulations, or extend the project:

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Open a pull request

---

# License

This project is licensed under the **MIT License**.

---

# References

1. D. M. Pozar — *Microwave Engineering*
2. RF and Microwave Filter Design textbooks
3. Research papers on stepped-impedance filters

---

⭐ If you found this project useful, consider **starring the repository**.
