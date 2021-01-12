# PhD Thesis Benchmarks

This repository contains the benchmarks used in my PhD thesis.

These benchmarks are used for two aspects - evaluating the efficacy of [HAML](https://github.com/PRETgroup/modular-code-generation/blob/master/specs/HAML.md) for the generation of software and hardware, and a comparison between HAML and the biological modelling framework CellML.
In both cases, the software and hardware implementations are pre-generated from the associated HAML files using the [Modular Code Generation](https://github.com/PRETgroup/modular-code-generation) compiler.

## HAML Benchmarks
These benchmarks are found in the [haml-benchmarks](haml-benchmarks) directory.
They are used for quantitative comparisons in Chapter 5 of the thesis and cover a range of Hybrid Automata with varying levels of complexity.

## CellML Benchmarks
These benchmarks are found in the [cellml-benchmarks](cellml-benchmarks) directory.
They are used for quantitative comparisons in Chapter 7 of the thesis and cover a range of cardiac cell models at various levels of fidelity using both CellML and HAML.