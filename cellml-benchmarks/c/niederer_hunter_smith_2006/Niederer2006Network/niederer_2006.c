#include "niederer_2006.h"

// niederer_2006 Initialisation function
void Niederer2006Init(Niederer2006* me) {
    // Initialise Sub-objects
    EnvironmentInit(&me->environment_data);

    IntracellularIonConcentrationsInit(&me->intracellular_ion_concentrations_data);

    ThinfilamentsInit(&me->thinfilaments_data);

    TropomyosinInit(&me->tropomyosin_data);

    TroponinInit(&me->troponin_data);

    MyofilamentsInit(&me->myofilaments_data);

    FilamentOverlapInit(&me->filament_overlap_data);

    LengthIndependentTensionInit(&me->length_independent_tension_data);

    IsometricTensionInit(&me->isometric_tension_data);

    CrossBridgesInit(&me->cross_bridges_data);

    // Initialise Outputs
    me->environment_time = me->environment_data.time;
    me->intracellular_ion_concentrations_ca_i = me->intracellular_ion_concentrations_data.ca_i;
    me->intracellular_ion_concentrations_ca_b = me->intracellular_ion_concentrations_data.ca_b;
    me->intracellular_ion_concentrations_trpn = me->intracellular_ion_concentrations_data.trpn;
    me->tropomyosin_z = me->tropomyosin_data.z;
    me->tropomyosin_z_max = me->tropomyosin_data.z_max;
    me->troponin_j_trpn = me->troponin_data.j_trpn;
    me->troponin_ca_trpn_max = me->troponin_data.ca_trpn_max;
    me->troponin_k_on = me->troponin_data.k_on;
    me->troponin_k_ref_off = me->troponin_data.k_ref_off;
    me->troponin_gamma_trpn = me->troponin_data.gamma_trpn;
    me->myofilaments_lambda = me->myofilaments_data.lambda;
    me->myofilaments_extensionratio = me->myofilaments_data.extension_ratio;
    me->myofilaments_dextensionratiodt = me->myofilaments_data.d_extension_ratiodt;
    me->myofilaments_lambda_prev = me->myofilaments_data.lambda_prev;
    me->filament_overlap_overlap = me->filament_overlap_data.overlap;
    me->filament_overlap_beta_0 = me->filament_overlap_data.beta_0;
    me->length_independent_tension_t_ref = me->length_independent_tension_data.t_ref;
    me->length_independent_tension_t_base = me->length_independent_tension_data.t_base;
    me->isometric_tension_t_0 = me->isometric_tension_data.t_0;
    me->cross_bridges_tension = me->cross_bridges_data.tension;
}

// niederer_2006 Execution function
void Niederer2006Run(Niederer2006* me) {
    // Mappings
    me->cross_bridges_data.t_0 = me->isometric_tension_data.t_0;
    me->cross_bridges_data.d_extension_ratiodt = me->myofilaments_data.d_extension_ratiodt;
    me->cross_bridges_data.time = me->environment_data.time;
    me->myofilaments_data.time = me->environment_data.time;
    me->filament_overlap_data.lambda = me->myofilaments_data.lambda;
    me->intracellular_ion_concentrations_data.ca_trpn_max = me->troponin_data.ca_trpn_max;
    me->intracellular_ion_concentrations_data.j_trpn = me->troponin_data.j_trpn;
    me->intracellular_ion_concentrations_data.time = me->environment_data.time;
    me->isometric_tension_data.t_base = me->length_independent_tension_data.t_base;
    me->isometric_tension_data.overlap = me->filament_overlap_data.overlap;
    me->length_independent_tension_data.z = me->tropomyosin_data.z;
    me->length_independent_tension_data.z_max = me->tropomyosin_data.z_max;
    me->tropomyosin_data.ca_trpn_max = me->troponin_data.ca_trpn_max;
    me->tropomyosin_data.ca_b = me->intracellular_ion_concentrations_data.ca_b;
    me->tropomyosin_data.beta_0 = me->filament_overlap_data.beta_0;
    me->tropomyosin_data.gamma_trpn = me->troponin_data.gamma_trpn;
    me->tropomyosin_data.k_ref_off = me->troponin_data.k_ref_off;
    me->tropomyosin_data.k_on = me->troponin_data.k_on;
    me->tropomyosin_data.lambda = me->myofilaments_data.lambda;
    me->tropomyosin_data.time = me->environment_data.time;
    me->troponin_data.ca_i = me->intracellular_ion_concentrations_data.ca_i;
    me->troponin_data.trpn = me->intracellular_ion_concentrations_data.trpn;
    me->troponin_data.t_ref = me->length_independent_tension_data.t_ref;
    me->troponin_data.tension = me->cross_bridges_data.tension;

    // Run Automata
    EnvironmentRun(&me->environment_data);

    IntracellularIonConcentrationsRun(&me->intracellular_ion_concentrations_data);

    ThinfilamentsRun(&me->thinfilaments_data);

    TropomyosinRun(&me->tropomyosin_data);

    TroponinRun(&me->troponin_data);

    MyofilamentsRun(&me->myofilaments_data);

    FilamentOverlapRun(&me->filament_overlap_data);

    LengthIndependentTensionRun(&me->length_independent_tension_data);

    IsometricTensionRun(&me->isometric_tension_data);

    CrossBridgesRun(&me->cross_bridges_data);

    // Output Mapping
    me->cross_bridges_tension = me->cross_bridges_data.tension;
    me->myofilaments_extensionratio = me->myofilaments_data.extension_ratio;
    me->myofilaments_dextensionratiodt = me->myofilaments_data.d_extension_ratiodt;
    me->myofilaments_lambda = me->myofilaments_data.lambda;
    me->myofilaments_lambda_prev = me->myofilaments_data.lambda_prev;
    me->environment_time = me->environment_data.time;
    me->filament_overlap_beta_0 = me->filament_overlap_data.beta_0;
    me->filament_overlap_overlap = me->filament_overlap_data.overlap;
    me->intracellular_ion_concentrations_ca_b = me->intracellular_ion_concentrations_data.ca_b;
    me->intracellular_ion_concentrations_ca_i = me->intracellular_ion_concentrations_data.ca_i;
    me->intracellular_ion_concentrations_trpn = me->intracellular_ion_concentrations_data.trpn;
    me->isometric_tension_t_0 = me->isometric_tension_data.t_0;
    me->length_independent_tension_t_base = me->length_independent_tension_data.t_base;
    me->length_independent_tension_t_ref = me->length_independent_tension_data.t_ref;
    me->tropomyosin_z = me->tropomyosin_data.z;
    me->tropomyosin_z_max = me->tropomyosin_data.z_max;
    me->troponin_ca_trpn_max = me->troponin_data.ca_trpn_max;
    me->troponin_j_trpn = me->troponin_data.j_trpn;
    me->troponin_gamma_trpn = me->troponin_data.gamma_trpn;
    me->troponin_k_ref_off = me->troponin_data.k_ref_off;
    me->troponin_k_on = me->troponin_data.k_on;
}