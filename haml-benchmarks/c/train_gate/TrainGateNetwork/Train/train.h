#ifndef TRAIN_H_
#define TRAIN_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Train States
enum TrainStates {
    TRAIN_T1,
    TRAIN_T2,
    TRAIN_T3,
};

// Train Data Struct
typedef struct {
    
    // Declare Outputs
    bool gate_request_up;
    bool gate_request_down;
    double position;

    // State
    enum TrainStates state;
} Train;

// Train Initialisation function
void TrainInit(Train* me);

// Train Execution function
void TrainRun(Train* me);

#endif // TRAIN_H_