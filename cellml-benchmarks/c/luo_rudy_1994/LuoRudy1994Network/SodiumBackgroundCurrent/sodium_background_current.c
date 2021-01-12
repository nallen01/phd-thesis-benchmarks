#include "sodium_background_current.h"

// sodium_background_current Initialisation function
void SodiumBackgroundCurrentInit(SodiumBackgroundCurrent* me) {
    // Initialise State
    me->state = SODIUM_BACKGROUND_CURRENT_Q0;

    // Initialise Outputs
    me->i_na_b = 0.0;

    // Initialise Internal Variables
    me->e_nan = 0.0;
}

// sodium_background_current Execution function
void SodiumBackgroundCurrentRun(SodiumBackgroundCurrent* me) {
    // Create intermediary variables
    enum SodiumBackgroundCurrentStates state_u = me->state;
    double i_na_b_u = me->i_na_b;

    double e_nan_u = me->e_nan;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_BACKGROUND_CURRENT_Q0: // Logic for state q0
            if(true) {
                e_nan_u = me->e_na;
                i_na_b_u = 1.41E-5 * (me->v - me->e_nan);

                // Remain in this state
                state_u = SODIUM_BACKGROUND_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_na_b = i_na_b_u;

    me->e_nan = e_nan_u;

}