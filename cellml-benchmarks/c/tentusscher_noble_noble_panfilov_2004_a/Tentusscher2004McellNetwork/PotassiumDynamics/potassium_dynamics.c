#include "potassium_dynamics.h"

// potassium_dynamics Initialisation function
void PotassiumDynamicsInit(PotassiumDynamics* me) {
    // Initialise State
    me->state = POTASSIUM_DYNAMICS_Q0;

    // Initialise Outputs
    me->k_i = 138.3;
    me->k_o = 5.4;
}

// potassium_dynamics Execution function
void PotassiumDynamicsRun(PotassiumDynamics* me) {
    // Create intermediary variables
    enum PotassiumDynamicsStates state_u = me->state;
    double k_i_u = me->k_i;
    double k_o_u = me->k_o;


    // Run the state machine for transition logic
    switch(me->state) {
        case POTASSIUM_DYNAMICS_Q0: // Logic for state q0
            if(true) {
                k_i_u = me->k_i + ((-1.0 * ((me->i_k1 + me->i_to + me->i_kr + me->i_ks + me->i_p_k + me->i_stim) - 2.0 * me->i_nak) * me->cm) / (1.0 * me->v_c * me->f)) * STEP_SIZE;

                // Remain in this state
                state_u = POTASSIUM_DYNAMICS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->k_i = k_i_u;
    me->k_o = k_o_u;

}