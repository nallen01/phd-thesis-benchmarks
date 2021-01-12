#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "HunterMccullochTerkeurs1998Version02Network/hunter_mcculloch_terkeurs_1998_version02.h"

HunterMccullochTerkeurs1998Version02 hunter_mcculloch_terkeurs_1998_version02_data;

int main(void) {
    HunterMccullochTerkeurs1998Version02Init(&hunter_mcculloch_terkeurs_1998_version02_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,hunter_mcculloch_terkeurs_1998_version02.environment_time,hunter_mcculloch_terkeurs_1998_version02.calcium_transient_Ca_i,hunter_mcculloch_terkeurs_1998_version02.TnC_Ca_binding_kinetics_Ca_b,hunter_mcculloch_terkeurs_1998_version02.TnC_Ca_binding_kinetics_lambda,hunter_mcculloch_terkeurs_1998_version02.thin_filament_kinetics_To,hunter_mcculloch_terkeurs_1998_version02.crossbridge_kinetics_T\n");
    fprintf(fp, "%f,%f,%f,%f,%f,%f,%f\n", 0.0, hunter_mcculloch_terkeurs_1998_version02_data.environment_time, hunter_mcculloch_terkeurs_1998_version02_data.calcium_transient_ca_i, hunter_mcculloch_terkeurs_1998_version02_data.tnc_ca_binding_kinetics_ca_b, hunter_mcculloch_terkeurs_1998_version02_data.tnc_ca_binding_kinetics_lambda, hunter_mcculloch_terkeurs_1998_version02_data.thin_filament_kinetics_to, hunter_mcculloch_terkeurs_1998_version02_data.crossbridge_kinetics_t);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        HunterMccullochTerkeurs1998Version02Run(&hunter_mcculloch_terkeurs_1998_version02_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f,%f,%f,%f,%f,%f\n", i*STEP_SIZE, hunter_mcculloch_terkeurs_1998_version02_data.environment_time, hunter_mcculloch_terkeurs_1998_version02_data.calcium_transient_ca_i, hunter_mcculloch_terkeurs_1998_version02_data.tnc_ca_binding_kinetics_ca_b, hunter_mcculloch_terkeurs_1998_version02_data.tnc_ca_binding_kinetics_lambda, hunter_mcculloch_terkeurs_1998_version02_data.thin_filament_kinetics_to, hunter_mcculloch_terkeurs_1998_version02_data.crossbridge_kinetics_t);
            last_log = i;
        }
#endif
    }

    return 0;
}