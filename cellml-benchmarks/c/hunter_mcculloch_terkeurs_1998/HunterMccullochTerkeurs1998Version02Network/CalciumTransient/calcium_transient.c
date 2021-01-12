#include "calcium_transient.h"

// calcium_transient Initialisation function
void CalciumTransientInit(CalciumTransient* me) {
    // Initialise State
    me->state = CALCIUM_TRANSIENT_Q0;

    // Initialise Outputs
    me->ca_i = 10.0;
}

// calcium_transient Execution function
void CalciumTransientRun(CalciumTransient* me) {
    // Create intermediary variables
    enum CalciumTransientStates state_u = me->state;
    double ca_i_u = me->ca_i;


    // Run the state machine for transition logic
    switch(me->state) {
        case CALCIUM_TRANSIENT_Q0: // Logic for state q0
            if(true) {
                ca_i_u = me->ca_i + 1.0 * (0.01 + (1.0 - 0.01) * (me->time / 0.06) * exp((1.0 - me->time) / 0.06)) * STEP_SIZE;

                // Remain in this state
                state_u = CALCIUM_TRANSIENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->ca_i = ca_i_u;

}