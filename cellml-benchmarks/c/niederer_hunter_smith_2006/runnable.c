#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "Niederer2006Network/niederer_2006.h"

Niederer2006 niederer_2006_data;

int main(void) {
    Niederer2006Init(&niederer_2006_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,niederer_2006.environment_time,niederer_2006.intracellular_ion_concentrations_Ca_i,niederer_2006.intracellular_ion_concentrations_Ca_b,niederer_2006.intracellular_ion_concentrations_TRPN,niederer_2006.tropomyosin_z,niederer_2006.tropomyosin_z_max,niederer_2006.troponin_J_TRPN,niederer_2006.troponin_Ca_TRPN_Max,niederer_2006.troponin_k_on,niederer_2006.troponin_k_Ref_off,niederer_2006.troponin_gamma_trpn,niederer_2006.Myofilaments_lambda,niederer_2006.Myofilaments_ExtensionRatio,niederer_2006.Myofilaments_dExtensionRatiodt,niederer_2006.Myofilaments_lambda_prev,niederer_2006.filament_overlap_overlap,niederer_2006.filament_overlap_beta_0,niederer_2006.length_independent_tension_T_ref,niederer_2006.length_independent_tension_T_Base,niederer_2006.isometric_tension_T_0,niederer_2006.Cross_Bridges_Tension\n");
    fprintf(fp, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", 0.0, niederer_2006_data.environment_time, niederer_2006_data.intracellular_ion_concentrations_ca_i, niederer_2006_data.intracellular_ion_concentrations_ca_b, niederer_2006_data.intracellular_ion_concentrations_trpn, niederer_2006_data.tropomyosin_z, niederer_2006_data.tropomyosin_z_max, niederer_2006_data.troponin_j_trpn, niederer_2006_data.troponin_ca_trpn_max, niederer_2006_data.troponin_k_on, niederer_2006_data.troponin_k_ref_off, niederer_2006_data.troponin_gamma_trpn, niederer_2006_data.myofilaments_lambda, niederer_2006_data.myofilaments_extensionratio, niederer_2006_data.myofilaments_dextensionratiodt, niederer_2006_data.myofilaments_lambda_prev, niederer_2006_data.filament_overlap_overlap, niederer_2006_data.filament_overlap_beta_0, niederer_2006_data.length_independent_tension_t_ref, niederer_2006_data.length_independent_tension_t_base, niederer_2006_data.isometric_tension_t_0, niederer_2006_data.cross_bridges_tension);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        Niederer2006Run(&niederer_2006_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", i*STEP_SIZE, niederer_2006_data.environment_time, niederer_2006_data.intracellular_ion_concentrations_ca_i, niederer_2006_data.intracellular_ion_concentrations_ca_b, niederer_2006_data.intracellular_ion_concentrations_trpn, niederer_2006_data.tropomyosin_z, niederer_2006_data.tropomyosin_z_max, niederer_2006_data.troponin_j_trpn, niederer_2006_data.troponin_ca_trpn_max, niederer_2006_data.troponin_k_on, niederer_2006_data.troponin_k_ref_off, niederer_2006_data.troponin_gamma_trpn, niederer_2006_data.myofilaments_lambda, niederer_2006_data.myofilaments_extensionratio, niederer_2006_data.myofilaments_dextensionratiodt, niederer_2006_data.myofilaments_lambda_prev, niederer_2006_data.filament_overlap_overlap, niederer_2006_data.filament_overlap_beta_0, niederer_2006_data.length_independent_tension_t_ref, niederer_2006_data.length_independent_tension_t_base, niederer_2006_data.isometric_tension_t_0, niederer_2006_data.cross_bridges_tension);
            last_log = i;
        }
#endif
    }

    return 0;
}