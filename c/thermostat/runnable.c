#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "thermostat.h"

Thermostat thermostat_data;

int main(void) {
    ThermostatInit(&thermostat_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,thermostat.temperature\n");
    fprintf(fp, "%f,%f\n", 0.0, thermostat_data.temperature);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        ThermostatRun(&thermostat_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f\n", i*STEP_SIZE, thermostat_data.temperature);
            last_log = i;
        }
#endif
    }

    return 0;
}