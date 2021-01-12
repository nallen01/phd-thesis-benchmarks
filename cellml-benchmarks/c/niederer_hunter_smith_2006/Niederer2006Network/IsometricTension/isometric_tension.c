#include "isometric_tension.h"

// isometric_tension Initialisation function
void IsometricTensionInit(IsometricTension* me) {
    // Initialise State
    me->state = ISOMETRIC_TENSION_Q0;

    // Initialise Outputs
    me->t_0 = 0.0;
}

// isometric_tension Execution function
void IsometricTensionRun(IsometricTension* me) {
    // Create intermediary variables
    enum IsometricTensionStates state_u = me->state;
    double t_0_u = me->t_0;


    // Run the state machine for transition logic
    switch(me->state) {
        case ISOMETRIC_TENSION_Q0: // Logic for state q0
            if(true) {
                t_0_u = me->t_base * me->overlap;

                // Remain in this state
                state_u = ISOMETRIC_TENSION_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->t_0 = t_0_u;

}