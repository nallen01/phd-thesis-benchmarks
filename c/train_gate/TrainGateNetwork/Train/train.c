#include "train.h"

// Train Initialisation function
void TrainInit(Train* me) {
    // Initialise State
    me->state = TRAIN_T1;

    // Initialise Outputs
    me->gate_request_up = false;
    me->gate_request_down = false;
    me->position = 0;
}

// Train Execution function
void TrainRun(Train* me) {
    // Create intermediary variables
    enum TrainStates state_u = me->state;
    bool gate_request_up_u = me->gate_request_up;
    bool gate_request_down_u = me->gate_request_down;
    double position_u = me->position;


    // Run the state machine for transition logic
    switch(me->state) {
        case TRAIN_T1: // Logic for state t1
            if(me->position == 5) {
                gate_request_up_u = true;
                gate_request_down_u = false;

                // Next state is t2
                state_u = TRAIN_T2;
            }
            else if(me->position < 5) {
                position_u = me->position + 1 * STEP_SIZE;

                if((position_u > 5 && me->position < 5) || (position_u < 5 && me->position > 5)) {
                    // Need to saturate position to 5
                    position_u = 5;
                }

                // Remain in this state
                state_u = TRAIN_T1;
            }
            break;
        case TRAIN_T2: // Logic for state t2
            if(me->position == 15) {
                gate_request_up_u = false;
                gate_request_down_u = true;

                // Next state is t3
                state_u = TRAIN_T3;
            }
            else if(me->position >= 5 && me->position < 15) {
                position_u = me->position + 1 * STEP_SIZE;

                if((position_u > 15 && me->position < 15) || (position_u < 15 && me->position > 15)) {
                    // Need to saturate position to 15
                    position_u = 15;
                }

                // Remain in this state
                state_u = TRAIN_T2;
            }
            break;
        case TRAIN_T3: // Logic for state t3
            if(me->position == 25) {
                position_u = 0;
                gate_request_up_u = false;
                gate_request_down_u = false;

                // Next state is t1
                state_u = TRAIN_T1;
            }
            else if(me->position >= 15 && me->position < 25) {
                position_u = me->position + 1 * STEP_SIZE;

                if((position_u > 25 && me->position < 25) || (position_u < 25 && me->position > 25)) {
                    // Need to saturate position to 25
                    position_u = 25;
                }

                // Remain in this state
                state_u = TRAIN_T3;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->gate_request_up = gate_request_up_u;
    me->gate_request_down = gate_request_down_u;
    me->position = position_u;

}