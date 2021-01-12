#include "length_independent_tension.h"

// length_independent_tension Initialisation function
void LengthIndependentTensionInit(LengthIndependentTension* me) {
    // Initialise State
    me->state = LENGTH_INDEPENDENT_TENSION_Q0;

    // Initialise Outputs
    me->t_ref = 56.2;
    me->t_base = 0.0;
}

// length_independent_tension Execution function
void LengthIndependentTensionRun(LengthIndependentTension* me) {
    // Create intermediary variables
    enum LengthIndependentTensionStates state_u = me->state;
    double t_ref_u = me->t_ref;
    double t_base_u = me->t_base;


    // Run the state machine for transition logic
    switch(me->state) {
        case LENGTH_INDEPENDENT_TENSION_Q0: // Logic for state q0
            if(true) {
                t_base_u = (me->t_ref * me->z) / me->z_max;

                // Remain in this state
                state_u = LENGTH_INDEPENDENT_TENSION_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->t_ref = t_ref_u;
    me->t_base = t_base_u;

}