# UVM Verification Environment for 4-bit D Flip-Flop

This repository contains a Universal Verification Methodology (UVM) verification environment for a 4-bit D Flip-Flop (DFF).  
It includes the RTL design and a UVM testbench to verify the correct behavior of the flip-flop under various input sequences.

---

## Project Overview

A 4-bit D Flip-Flop is a basic sequential circuit that captures the input data on clock edges and outputs it until the next clock.  
This project verifies:

- Functional correctness of the 4-bit DFF outputs  
- Clock and reset behavior  
- Random stimulus handling using UVM  
- Reporting of mismatches through scoreboards

The UVM environment includes:
- DUT (Design Under Test): 4-bit DFF RTL
- UVM testbench components: sequence, driver, monitor, scoreboard, environment, and test
- UVM configuration for running simulations