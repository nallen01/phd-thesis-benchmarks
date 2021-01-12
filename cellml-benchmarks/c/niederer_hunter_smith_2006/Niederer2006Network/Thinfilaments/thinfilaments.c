#include "thinfilaments.h"

// thinfilaments Initialisation function
void ThinfilamentsInit(Thinfilaments* me) {
    // Initialise State
    me->state = THINFILAMENTS_Q0;
}

// thinfilaments Execution function
void ThinfilamentsRun(Thinfilaments* me) {
    // Create intermediary variables
    enum ThinfilamentsStates state_u = me->state;

    // Run the state machine for transition logic
    switch(me->state) {
        case THINFILAMENTS_Q0: // Logic for state q0
            if(true) {
                // Remain in this state
                state_u = THINFILAMENTS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
}