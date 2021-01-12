#ifndef TRAIN_GATE_H_
#define TRAIN_GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Train/train.h"
#include "Gate/gate.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// train_gate Data Struct
typedef struct {
    
    // Declare Outputs
    double train_pos;
    double gate_pos;

    // Declare Daughter Automata
    Train train_data;
    Gate gate_data;
} TrainGate;

// train_gate Initialisation function
void TrainGateInit(TrainGate* me);

// train_gate Execution function
void TrainGateRun(TrainGate* me);

#endif // TRAIN_GATE_H_