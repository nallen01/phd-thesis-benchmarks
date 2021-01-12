#include "reversal_potentials.h"

// reversal_potentials Initialisation function
void ReversalPotentialsInit(ReversalPotentials* me) {
    // Initialise State
    me->state = REVERSAL_POTENTIALS_Q0;

    // Initialise Outputs
    me->e_na = 0.0;
    me->e_k = 0.0;
    me->e_ks = 0.0;
    me->e_ca = 0.0;
}

// reversal_potentials Execution function
void ReversalPotentialsRun(ReversalPotentials* me) {
    // Create intermediary variables
    enum ReversalPotentialsStates state_u = me->state;
    double e_na_u = me->e_na;
    double e_k_u = me->e_k;
    double e_ks_u = me->e_ks;
    double e_ca_u = me->e_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case REVERSAL_POTENTIALS_Q0: // Logic for state q0
            if(true) {
                e_na_u = ((me->r * me->t) / me->f) * log(me->na_o / me->na_i);
                e_k_u = ((me->r * me->t) / me->f) * log(me->k_o / me->k_i);
                e_ks_u = ((me->r * me->t) / me->f) * log((me->k_o + 0.03 * me->na_o) / (me->k_i + 0.03 * me->na_i));
                e_ca_u = ((0.5 * me->r * me->t) / me->f) * log(me->ca_o / me->ca_i);

                // Remain in this state
                state_u = REVERSAL_POTENTIALS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->e_na = e_na_u;
    me->e_k = e_k_u;
    me->e_ks = e_ks_u;
    me->e_ca = e_ca_u;

}