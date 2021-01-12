#include "gate.h"

// Gate Initialisation function
void GateInit(Gate* me) {
    // Initialise State
    me->state = GATE_G1;

    // Initialise Outputs
    me->position = 0.0;
}

// Gate Execution function
void GateRun(Gate* me) {
    // Create intermediary variables
    enum GateStates state_u = me->state;
    double position_u = me->position;


    // Run the state machine for transition logic
    switch(me->state) {
        case GATE_G1: // Logic for state g1
            if(me->gate_request_up) {
                // Next state is g2
                state_u = GATE_G2;
            }
            else if(!me->gate_request_up) {
                position_u = me->position + ((0.0 - me->position) / 2.0) * STEP_SIZE;

                // Remain in this state
                state_u = GATE_G1;
            }
            break;
        case GATE_G2: // Logic for state g2
            if(me->gate_request_down) {
                // Next state is g1
                state_u = GATE_G1;
            }
            else if(!me->gate_request_down) {
                position_u = me->position + ((11.0 - me->position) / 2.0) * STEP_SIZE;

                // Remain in this state
                state_u = GATE_G2;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->position = position_u;

}