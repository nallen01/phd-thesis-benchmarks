#include "train_gate.h"

// train_gate Initialisation function
void TrainGateInit(TrainGate* me) {
    // Initialise Sub-objects
    TrainInit(&me->train_data);

    GateInit(&me->gate_data);

    // Initialise Outputs
    me->train_pos = me->train_data.position;
    me->gate_pos = me->gate_data.position;
}

// train_gate Execution function
void TrainGateRun(TrainGate* me) {
    // Mappings
    me->gate_data.gate_request_down = me->train_data.gate_request_down;
    me->gate_data.gate_request_up = me->train_data.gate_request_up;

    // Run Automata
    TrainRun(&me->train_data);

    GateRun(&me->gate_data);

    // Output Mapping
    me->gate_pos = me->gate_data.position;
    me->train_pos = me->train_data.position;
}