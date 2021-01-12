#include "sodium_channel.h"

// sodium_channel Initialisation function
void SodiumChannelInit(SodiumChannel* me) {
    // Initialise State
    me->state = SODIUM_CHANNEL_Q0;

    // Initialise Outputs
    me->i_na = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;

    // Initialise Internal Variables
    me->e_na = 0.0;
    me->m = 0.0;
    me->h = 0.0;
}

// sodium_channel Execution function
void SodiumChannelRun(SodiumChannel* me) {
    // Create intermediary variables
    enum SodiumChannelStates state_u = me->state;
    double i_na_u = me->i_na;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;

    double e_na_u = me->e_na;
    double m_u = me->m;
    double h_u = me->h;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_CHANNEL_Q0: // Logic for state q0
            if(true) {
                e_na_u = me->e_r + 115.0;
                i_na_u = 120.0 * (pow(me->m, 3.0)) * me->h * (me->v - me->e_na);
                time_private_u = me->time;
                v_private_u = me->v;
                m_u = me->m_private;
                h_u = me->h_private;

                // Remain in this state
                state_u = SODIUM_CHANNEL_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_na = i_na_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;

    me->e_na = e_na_u;
    me->m = m_u;
    me->h = h_u;

}