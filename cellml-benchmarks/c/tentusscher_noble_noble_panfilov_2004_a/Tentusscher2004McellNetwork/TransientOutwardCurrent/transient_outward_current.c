#include "transient_outward_current.h"

// transient_outward_current Initialisation function
void TransientOutwardCurrentInit(TransientOutwardCurrent* me) {
    // Initialise State
    me->state = TRANSIENT_OUTWARD_CURRENT_Q0;

    // Initialise Outputs
    me->i_to = 0.0;
    me->v_private = 0.0;
    me->time_private = 0.0;

    // Initialise Internal Variables
    me->s = 0.0;
    me->r = 0.0;
}

// transient_outward_current Execution function
void TransientOutwardCurrentRun(TransientOutwardCurrent* me) {
    // Create intermediary variables
    enum TransientOutwardCurrentStates state_u = me->state;
    double i_to_u = me->i_to;
    double v_private_u = me->v_private;
    double time_private_u = me->time_private;

    double s_u = me->s;
    double r_u = me->r;


    // Run the state machine for transition logic
    switch(me->state) {
        case TRANSIENT_OUTWARD_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_to_u = 0.294 * me->r * me->s * (me->v - me->e_k) * 1.0000000000000002;
                v_private_u = me->v;
                time_private_u = me->time;
                s_u = me->s_private;
                r_u = me->r_private;

                // Remain in this state
                state_u = TRANSIENT_OUTWARD_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_to = i_to_u;
    me->v_private = v_private_u;
    me->time_private = time_private_u;

    me->s = s_u;
    me->r = r_u;

}