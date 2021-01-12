#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "config.h"

#include "TrainGateNetwork/train_gate.h"

TrainGate train_gate_data;

int main(void) {
    TrainGateInit(&train_gate_data);

#if ENABLE_LOGGING
    FILE* fp = fopen(LOGGING_FILE, "w");
    fprintf(fp, "Time,train_gate.train_pos,train_gate.gate_pos\n");
    fprintf(fp, "%f,%f,%f\n", 0.0, train_gate_data.train_pos, train_gate_data.gate_pos);
    unsigned int last_log = 0;
#endif

    unsigned int i = 0;
    for(i=1; i <= (SIMULATION_TIME / STEP_SIZE); i++) {
        TrainGateRun(&train_gate_data);

        /* Logging */
#if ENABLE_LOGGING
        if((i - last_log) >= LOGGING_INTERVAL / STEP_SIZE) {
            fprintf(fp, "%f,%f,%f\n", i*STEP_SIZE, train_gate_data.train_pos, train_gate_data.gate_pos);
            last_log = i;
        }
#endif
    }

    return 0;
}