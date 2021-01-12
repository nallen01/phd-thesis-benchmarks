#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "UoaMyociteNetwork/uoa_myocite.h"

UoaMyocite uoa_myocite_data;

int main(void) {
    UoaMyociteInit(&uoa_myocite_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,uoa_myocite.cell_v\n");
    fprintf(fp, "%f,%f\n", 0.0, uoa_myocite_data.cell_v);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        UoaMyociteRun(&uoa_myocite_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f\n", i*STEP_SIZE, uoa_myocite_data.cell_v);
            last_log = i;
        }
#endif
    }

    return 0;
}