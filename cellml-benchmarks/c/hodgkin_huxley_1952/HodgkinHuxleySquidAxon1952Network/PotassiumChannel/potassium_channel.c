#include "potassium_channel.h"

// potassium_channel Initialisation function
void PotassiumChannelInit(PotassiumChannel* me) {
    // Initialise State
    me->state = POTASSIUM_CHANNEL_Q0;

    // Initialise Outputs
    me->i_k = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;

    // Initialise Internal Variables
    me->e_k = 0.0;
    me->n = 0.0;
}

// potassium_channel Execution function
void PotassiumChannelRun(PotassiumChannel* me) {
    // Create intermediary variables
    enum PotassiumChannelStates state_u = me->state;
    double i_k_u = me->i_k;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;

    double e_k_u = me->e_k;
    double n_u = me->n;


    // Run the state machine for transition logic
    switch(me->state) {
        case POTASSIUM_CHANNEL_Q0: // Logic for state q0
            if(true) {
                e_k_u = me->e_r - 12.0;
                i_k_u = 36.0 * (pow(me->n, 4.0)) * (me->v - me->e_k);
                time_private_u = me->time;
                v_private_u = me->v;
                n_u = me->n_private;

                // Remain in this state
                state_u = POTASSIUM_CHANNEL_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_k = i_k_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;

    me->e_k = e_k_u;
    me->n = n_u;

}