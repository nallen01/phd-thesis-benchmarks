#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "Smith2004Network/smith_2004.h"

Smith2004 smith_2004_data;

int main(void) {
    Smith2004Init(&smith_2004_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,smith_2004.interface_time_private,smith_2004.interface_Vm_private,smith_2004.interface_cMgADP_private,smith_2004.interface_cNa_i_private,smith_2004.interface_v_cyc,smith_2004.interface_net_free_energy,smith_2004.NaK_pump_body_temp_private,smith_2004.NaK_pump_gas_const_private,smith_2004.NaK_pump_faraday_const_private,smith_2004.NaK_pump_Vm_private,smith_2004.NaK_pump_cMgADP_private,smith_2004.NaK_pump_cNa_i_private,smith_2004.NaK_pump_v_cyc,smith_2004.NaK_pump_net_free_energy\n");
    fprintf(fp, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", 0.0, smith_2004_data.interface_time_private, smith_2004_data.interface_vm_private, smith_2004_data.interface_cmgadp_private, smith_2004_data.interface_cna_i_private, smith_2004_data.interface_v_cyc, smith_2004_data.interface_net_free_energy, smith_2004_data.nak_pump_body_temp_private, smith_2004_data.nak_pump_gas_const_private, smith_2004_data.nak_pump_faraday_const_private, smith_2004_data.nak_pump_vm_private, smith_2004_data.nak_pump_cmgadp_private, smith_2004_data.nak_pump_cna_i_private, smith_2004_data.nak_pump_v_cyc, smith_2004_data.nak_pump_net_free_energy);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        Smith2004Run(&smith_2004_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", i*STEP_SIZE, smith_2004_data.interface_time_private, smith_2004_data.interface_vm_private, smith_2004_data.interface_cmgadp_private, smith_2004_data.interface_cna_i_private, smith_2004_data.interface_v_cyc, smith_2004_data.interface_net_free_energy, smith_2004_data.nak_pump_body_temp_private, smith_2004_data.nak_pump_gas_const_private, smith_2004_data.nak_pump_faraday_const_private, smith_2004_data.nak_pump_vm_private, smith_2004_data.nak_pump_cmgadp_private, smith_2004_data.nak_pump_cna_i_private, smith_2004_data.nak_pump_v_cyc, smith_2004_data.nak_pump_net_free_energy);
            last_log = i;
        }
#endif
    }

    return 0;
}