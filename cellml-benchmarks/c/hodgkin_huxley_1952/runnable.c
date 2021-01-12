#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "HodgkinHuxleySquidAxon1952Network/hodgkin_huxley_squid_axon_1952.h"

HodgkinHuxleySquidAxon1952 hodgkin_huxley_squid_axon_1952_data;

int main(void) {
    HodgkinHuxleySquidAxon1952Init(&hodgkin_huxley_squid_axon_1952_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,hodgkin_huxley_squid_axon_1952.environment_time,hodgkin_huxley_squid_axon_1952.membrane_V,hodgkin_huxley_squid_axon_1952.membrane_E_R,hodgkin_huxley_squid_axon_1952.sodium_channel_i_Na,hodgkin_huxley_squid_axon_1952.sodium_channel_time_private,hodgkin_huxley_squid_axon_1952.sodium_channel_V_private,hodgkin_huxley_squid_axon_1952.sodium_channel_m_gate_m,hodgkin_huxley_squid_axon_1952.sodium_channel_h_gate_h,hodgkin_huxley_squid_axon_1952.potassium_channel_i_K,hodgkin_huxley_squid_axon_1952.potassium_channel_time_private,hodgkin_huxley_squid_axon_1952.potassium_channel_V_private,hodgkin_huxley_squid_axon_1952.potassium_channel_n_gate_n,hodgkin_huxley_squid_axon_1952.leakage_current_i_L\n");
    fprintf(fp, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", 0.0, hodgkin_huxley_squid_axon_1952_data.environment_time, hodgkin_huxley_squid_axon_1952_data.membrane_v, hodgkin_huxley_squid_axon_1952_data.membrane_e_r, hodgkin_huxley_squid_axon_1952_data.sodium_channel_i_na, hodgkin_huxley_squid_axon_1952_data.sodium_channel_time_private, hodgkin_huxley_squid_axon_1952_data.sodium_channel_v_private, hodgkin_huxley_squid_axon_1952_data.sodium_channel_m_gate_m, hodgkin_huxley_squid_axon_1952_data.sodium_channel_h_gate_h, hodgkin_huxley_squid_axon_1952_data.potassium_channel_i_k, hodgkin_huxley_squid_axon_1952_data.potassium_channel_time_private, hodgkin_huxley_squid_axon_1952_data.potassium_channel_v_private, hodgkin_huxley_squid_axon_1952_data.potassium_channel_n_gate_n, hodgkin_huxley_squid_axon_1952_data.leakage_current_i_l);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        HodgkinHuxleySquidAxon1952Run(&hodgkin_huxley_squid_axon_1952_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n", i*STEP_SIZE, hodgkin_huxley_squid_axon_1952_data.environment_time, hodgkin_huxley_squid_axon_1952_data.membrane_v, hodgkin_huxley_squid_axon_1952_data.membrane_e_r, hodgkin_huxley_squid_axon_1952_data.sodium_channel_i_na, hodgkin_huxley_squid_axon_1952_data.sodium_channel_time_private, hodgkin_huxley_squid_axon_1952_data.sodium_channel_v_private, hodgkin_huxley_squid_axon_1952_data.sodium_channel_m_gate_m, hodgkin_huxley_squid_axon_1952_data.sodium_channel_h_gate_h, hodgkin_huxley_squid_axon_1952_data.potassium_channel_i_k, hodgkin_huxley_squid_axon_1952_data.potassium_channel_time_private, hodgkin_huxley_squid_axon_1952_data.potassium_channel_v_private, hodgkin_huxley_squid_axon_1952_data.potassium_channel_n_gate_n, hodgkin_huxley_squid_axon_1952_data.leakage_current_i_l);
            last_log = i;
        }
#endif
    }

    return 0;
}