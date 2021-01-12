#ifndef NIEDERER_2006_H_
#define NIEDERER_2006_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Environment/environment.h"
#include "IntracellularIonConcentrations/intracellular_ion_concentrations.h"
#include "Thinfilaments/thinfilaments.h"
#include "Tropomyosin/tropomyosin.h"
#include "Troponin/troponin.h"
#include "Myofilaments/myofilaments.h"
#include "FilamentOverlap/filament_overlap.h"
#include "LengthIndependentTension/length_independent_tension.h"
#include "IsometricTension/isometric_tension.h"
#include "CrossBridges/cross_bridges.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// niederer_2006 Data Struct
typedef struct {
    
    // Declare Outputs
    double environment_time;
    double intracellular_ion_concentrations_ca_i;
    double intracellular_ion_concentrations_ca_b;
    double intracellular_ion_concentrations_trpn;
    double tropomyosin_z;
    double tropomyosin_z_max;
    double troponin_j_trpn;
    double troponin_ca_trpn_max;
    double troponin_k_on;
    double troponin_k_ref_off;
    double troponin_gamma_trpn;
    double myofilaments_lambda;
    double myofilaments_extensionratio;
    double myofilaments_dextensionratiodt;
    double myofilaments_lambda_prev;
    double filament_overlap_overlap;
    double filament_overlap_beta_0;
    double length_independent_tension_t_ref;
    double length_independent_tension_t_base;
    double isometric_tension_t_0;
    double cross_bridges_tension;

    // Declare Daughter Automata
    Environment environment_data;
    IntracellularIonConcentrations intracellular_ion_concentrations_data;
    Thinfilaments thinfilaments_data;
    Tropomyosin tropomyosin_data;
    Troponin troponin_data;
    Myofilaments myofilaments_data;
    FilamentOverlap filament_overlap_data;
    LengthIndependentTension length_independent_tension_data;
    IsometricTension isometric_tension_data;
    CrossBridges cross_bridges_data;
} Niederer2006;

// niederer_2006 Initialisation function
void Niederer2006Init(Niederer2006* me);

// niederer_2006 Execution function
void Niederer2006Run(Niederer2006* me);

#endif // NIEDERER_2006_H_