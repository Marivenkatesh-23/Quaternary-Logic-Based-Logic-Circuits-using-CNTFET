# CNFET-Based Quaternary Logic Circuits

**Author:** Mari Venkatesh M

## Project Overview
This repository contains the design and simulation of Multi-Valued Logic (MVL) circuits, specifically Quaternary (4-valued) logic, implemented using Carbon Nanotube Field Effect Transistor (CNFET) technology. 

Quaternary logic utilizes four distinct voltage levels (representing logic states 0, 1, 2, and 3) to process two bits of information per wire. This approach significantly reduces interconnect complexity, footprint area, and overall power dissipation compared to traditional binary CMOS logic.

---

## Understanding Carbon Nanotube Transistors (CNFETs)
A CNFET operates similarly to a traditional silicon MOSFET, but instead of using bulk silicon for the transistor's channel, it uses tiny, hollow cylinders of carbon atoms known as Single-Walled Carbon Nanotubes (SWCNTs). 

The electrical properties of these nanotubes are dictated by how the flat sheet of carbon (graphene) is "rolled up." This is known as **Chirality**, which categorizes nanotubes into three main types:

1.  **Armchair:** The carbon hexagons line up straight along the tube. Armchair nanotubes are always highly conductive (**metallic**) and act like wires rather than switches.
2.  **Zigzag:** The hexagons form a jagged, zigzag pattern along the edge. These are predominantly **semiconducting**, making them perfect for acting as the "on/off" switches in transistors.
3.  **Chiral:** The hexagons are rolled at an angle (a spiral). Like zigzag tubes, chiral nanotubes are mostly **semiconducting** and are heavily utilized in CNFET design.

In this project, semiconducting SWCNTs (Zigzag/Chiral) are used as the active channel material to build high-performance logic gates.

---

## How CNFETs Power Quaternary Logic (In Layman's Terms)
**Why not just use standard Silicon for 4-level logic?**
In traditional binary (0 and 1) silicon circuits, transistors only need to recognize two states: "Off" or "On." If you want to build a circuit that recognizes four distinct steps (0, 1, 2, and 3), you need transistors that turn on at very specific, different voltage levels. In standard silicon, changing a transistor's turn-on point (threshold voltage) requires complex, messy chemical doping processes that eat up power and space.

**The CNFET Advantage:**
CNFETs solve this problem elegantly through geometry. The turn-on voltage of a CNFET is directly tied to the physical **diameter** of the carbon nanotube. 

Think of it like tuning a guitar:
*   A thick string (large nanotube diameter) turns on easily with very little voltage (low threshold).
*   A thin string (small nanotube diameter) requires a harder pluck, or more voltage, to turn on (high threshold).

Instead of messing with complex silicon chemistry, we can simply build a single circuit using nanotubes of **different diameters**. By mixing and matching "thick" and "thin" nanotubes, we easily create a system that elegantly steps through 4 precise voltage levels. This makes CNFETs the absolute perfect match for designing efficient, low-power Multi-Valued Logic (MVL).

---

## EDA Tools & Technologies
*   **Simulation Engine:** Synopsys HSPICE
*   **Waveform Viewer:** Synopsys CosmosScope
*   **Technology Node:** CNFET standard models (`CNFET.lib`, `technology.lib`)
*   **Design Methodology:** Multi-Valued Logic (MVL)

## Implemented Circuits
The repository contains SPICE netlists (`.sp`) for a comprehensive library of quaternary logic gates and combinational blocks:

### 1. Quaternary Inverters
*   **Standard Quaternary Inverter (SQI):** Maps inputs (0,1,2,3) to (3,2,1,0).
*   **Positive Quaternary Inverter (PQI):** Maps inputs (0,1,2,3) to (3,3,3,0).
*   **Intermediate Quaternary Inverter (IQI):** Maps inputs (0,1,2,3) to (3,3,0,0).
*   **Negative Quaternary Inverter (NQI):** Maps inputs (0,1,2,3) to (3,0,0,0).
*   *Note: Both static and dynamic implementations of these inverters are included.*

### 2. Universal & Basic Logic Gates
*   **QNAND / QNOR:** Quaternary implementations of universal gates.
*   **QAND / QOR:** Standard quaternary MIN/MAX logic gates.

### 3. Combinational Logic Blocks
*   **Quaternary 4:1 Multiplexer (QMUX):** Designed using quaternary transmission gates/pass logic driven by the specific inverter variants.
*   **Quaternary Half Adder (Carry Generation):** Demonstrates arithmetic logic capability within the MVL domain.

## Repository File Structure
*   `*.sp` - HSPICE netlist files containing the circuit topology and transient analysis directives.
*   `*.lib` - CNFET parameter and technology library files required for simulation.
*   `report.pdf` - Comprehensive project report containing theoretical background, truth tables, and CosmosScope output waveforms.