#ifndef GATE_H_
#define GATE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Gate States
enum GateStates {
    GATE_G1,
    GATE_G2,
};

// Gate Data Struct
typedef struct {
    
    // Declare Inputs
    bool gate_request_up;
    bool gate_request_down;
    
    // Declare Outputs
    double position;

    // State
    enum GateStates state;
} Gate;

// Gate Initialisation function
void GateInit(Gate* me);

// Gate Execution function
void GateRun(Gate* me);

#endif // GATE_H_