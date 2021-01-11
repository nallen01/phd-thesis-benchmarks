#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "NuclearPlantNetwork/nuclear_plant.h"

NuclearPlant nuclear_plant_data;

int main(void) {
    NuclearPlantInit(&nuclear_plant_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,nuclear_plant.plant_x\n");
    fprintf(fp, "%f,%f\n", 0.0, nuclear_plant_data.plant_x);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        NuclearPlantRun(&nuclear_plant_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f\n", i*STEP_SIZE, nuclear_plant_data.plant_x);
            last_log = i;
        }
#endif
    }

    return 0;
}