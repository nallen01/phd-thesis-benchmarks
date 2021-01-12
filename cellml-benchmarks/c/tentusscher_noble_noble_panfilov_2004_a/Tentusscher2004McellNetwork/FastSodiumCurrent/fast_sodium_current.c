#include "fast_sodium_current.h"

// fast_sodium_current Initialisation function
void FastSodiumCurrentInit(FastSodiumCurrent* me) {
    // Initialise State
    me->state = FAST_SODIUM_CURRENT_Q0;

    // Initialise Outputs
    me->i_na = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;

    // Initialise Internal Variables
    me->m = 0.0;
    me->h = 0.0;
    me->j = 0.0;
}

// fast_sodium_current Execution function
void FastSodiumCurrentRun(FastSodiumCurrent* me) {
    // Create intermediary variables
    enum FastSodiumCurrentStates state_u = me->state;
    double i_na_u = me->i_na;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;

    double m_u = me->m;
    double h_u = me->h;
    double j_u = me->j;


    // Run the state machine for transition logic
    switch(me->state) {
        case FAST_SODIUM_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_na_u = 14.838 * (pow(me->m, 3.0)) * me->h * me->j * (me->v - me->e_na) * 1.0000000000000002;
                time_private_u = me->time;
                v_private_u = me->v;
                m_u = me->m_private;
                h_u = me->h_private;
                j_u = me->j_private;

                // Remain in this state
                state_u = FAST_SODIUM_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_na = i_na_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;

    me->m = m_u;
    me->h = h_u;
    me->j = j_u;

}