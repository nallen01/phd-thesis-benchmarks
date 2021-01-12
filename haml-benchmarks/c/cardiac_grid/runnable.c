#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "CardiacGridNetwork/cardiac_grid.h"

CardiacGrid cardiac_grid_data;

int main(void) {
    CardiacGridInit(&cardiac_grid_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,cardiac_grid.cell_v\n");
    fprintf(fp, "%f,%f\n", 0.0, cardiac_grid_data.cell_v);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        CardiacGridRun(&cardiac_grid_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f\n", i*STEP_SIZE, cardiac_grid_data.cell_v);
            last_log = i;
        }
#endif
    }

    return 0;
}