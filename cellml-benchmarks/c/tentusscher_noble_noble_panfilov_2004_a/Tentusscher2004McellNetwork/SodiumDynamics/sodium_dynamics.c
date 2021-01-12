#include "sodium_dynamics.h"

// sodium_dynamics Initialisation function
void SodiumDynamicsInit(SodiumDynamics* me) {
    // Initialise State
    me->state = SODIUM_DYNAMICS_Q0;

    // Initialise Outputs
    me->na_i = 11.6;
    me->na_o = 140.0;
}

// sodium_dynamics Execution function
void SodiumDynamicsRun(SodiumDynamics* me) {
    // Create intermediary variables
    enum SodiumDynamicsStates state_u = me->state;
    double na_i_u = me->na_i;
    double na_o_u = me->na_o;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_DYNAMICS_Q0: // Logic for state q0
            if(true) {
                na_i_u = me->na_i + ((-1.0 * (me->i_na + me->i_b_na + 3.0 * me->i_nak + 3.0 * me->i_naca) * me->cm) / (1.0 * me->v_c * me->f)) * STEP_SIZE;

                // Remain in this state
                state_u = SODIUM_DYNAMICS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->na_i = na_i_u;
    me->na_o = na_o_u;

}