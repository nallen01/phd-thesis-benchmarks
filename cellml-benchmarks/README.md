# CellML Benchmarks

This directory stores the benchmarks for Chapter 7 of the thesis.

For each of the benchmarks, we provide a series of files:
- The original CellML definition for the benchmark can be found in the [cellml](cellml) folder.
- An automatically converted [HAML](https://github.com/PRETgroup/modular-code-generation/blob/master/specs/HAML.md) file can be found in the [haml](haml) folder.
- Pre-generated C code for software execution can be found in the [c](c) folder.
- Pre-generated VHDL code for hardware execution can be found in the [vhdl](vhdl) folder.

*The pre-generated code is created using the [Modular Code Generation](https://github.com/PRETgroup/modular-code-generation) compiler.*

### Hodgkin-Huxley Model
[CellML file](cellml/hodgkin_huxley_1952.cellml) | [HAML file](haml/hodgkin_huxley_1952.yaml) | [C Code](c/hodgkin_huxley_1952) | [VHDL Code](vhdl/hodgkin_huxley_1952)



### Smith-Crampin Model
[CellML file](cellml/smith_crampin_2004.cellml) | [HAML file](haml/smith_crampin_2004.yaml) | [C Code](c/smith_crampin_2004) | [VHDL Code](vhdl/smith_crampin_2004)



### Luo-Rudy Model
[CellML file](cellml/luo_rudy_1994.cellml) | [HAML file](haml/luo_rudy_1994.yaml) | [C Code](c/luo_rudy_1994) | [VHDL Code](vhdl/luo_rudy_1994)



### Ten Tusscher Model
[CellML file](cellml/tentusscher_noble_noble_panfilov_2004_a.cellml) | [HAML file](haml/tentusscher_noble_noble_panfilov_2004_a.yaml) | [C Code](c/tentusscher_noble_noble_panfilov_2004_a) | [VHDL Code](vhdl/tentusscher_noble_noble_panfilov_2004_a)



### Hunter-McCulloch-ter Keurs Model
[CellML file](cellml/hunter_mcculloch_terkeurs_1998.cellml) | [HAML file](haml/hunter_mcculloch_terkeurs_1998.yaml) | [C Code](c/hunter_mcculloch_terkeurs_1998) | [VHDL Code](vhdl/hunter_mcculloch_terkeurs_1998)



### Niederer-Hunter-Smith Model
[CellML file](cellml/niederer_hunter_smith_2006.cellml) | [HAML file](haml/niederer_hunter_smith_2006.yaml) | [C Code](c/niederer_hunter_smith_2006) | [VHDL Code](vhdl/niederer_hunter_smith_2006)



### UoA Cardiomyocyte Model
[HAML file](haml/uoa-myocite.yaml) | [C Code](c/uoa-myocite) | [VHDL Code](vhdl/uoa-myocite)

*Note: This model is an abstract model captured using HAML. As such there is no matching CellML description from which it is generated.*



### UoA Semilinear Model
[HAML file](haml/uoa-semilinear.yaml) | [C Code](c/uoa-semilinear) | [VHDL Code](vhdl/uoa-semilinear)

*Note: This model is an abstract model captured using HAML. As such there is no matching CellML description from which it is generated.*


