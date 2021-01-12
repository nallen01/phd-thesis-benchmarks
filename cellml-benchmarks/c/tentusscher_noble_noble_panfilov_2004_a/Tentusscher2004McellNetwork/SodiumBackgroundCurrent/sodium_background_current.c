#include "sodium_background_current.h"

// sodium_background_current Initialisation function
void SodiumBackgroundCurrentInit(SodiumBackgroundCurrent* me) {
    // Initialise State
    me->state = SODIUM_BACKGROUND_CURRENT_Q0;

    // Initialise Outputs
    me->i_b_na = 0.0;
}

// sodium_background_current Execution function
void SodiumBackgroundCurrentRun(SodiumBackgroundCurrent* me) {
    // Create intermediary variables
    enum SodiumBackgroundCurrentStates state_u = me->state;
    double i_b_na_u = me->i_b_na;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_BACKGROUND_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_b_na_u = 2.9E-4 * (me->v - me->e_na) * 1.0000000000000002;

                // Remain in this state
                state_u = SODIUM_BACKGROUND_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_b_na = i_b_na_u;

}