#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "WaterHeaterNetwork/water_heater.h"

WaterHeater water_heater_data;

int main(void) {
    WaterHeaterInit(&water_heater_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,water_heater.temperature\n");
    fprintf(fp, "%f,%f\n", 0.0, water_heater_data.temperature);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        WaterHeaterRun(&water_heater_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f\n", i*STEP_SIZE, water_heater_data.temperature);
            last_log = i;
        }
#endif
    }

    return 0;
}