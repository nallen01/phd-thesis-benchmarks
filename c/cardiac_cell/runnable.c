#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "CardiacCellNetwork/cardiac_cell.h"

CardiacCell cardiac_cell_data;

int main(void) {
    CardiacCellInit(&cardiac_cell_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,cardiac_cell.cell_v\n");
    fprintf(fp, "%f,%f\n", 0.0, cardiac_cell_data.cell_v);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        CardiacCellRun(&cardiac_cell_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f\n", i*STEP_SIZE, cardiac_cell_data.cell_v);
            last_log = i;
        }
#endif
    }

    return 0;
}