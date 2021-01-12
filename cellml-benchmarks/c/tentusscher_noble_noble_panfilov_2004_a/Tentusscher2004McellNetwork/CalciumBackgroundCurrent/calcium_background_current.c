#include "calcium_background_current.h"

// calcium_background_current Initialisation function
void CalciumBackgroundCurrentInit(CalciumBackgroundCurrent* me) {
    // Initialise State
    me->state = CALCIUM_BACKGROUND_CURRENT_Q0;

    // Initialise Outputs
    me->i_b_ca = 0.0;
}

// calcium_background_current Execution function
void CalciumBackgroundCurrentRun(CalciumBackgroundCurrent* me) {
    // Create intermediary variables
    enum CalciumBackgroundCurrentStates state_u = me->state;
    double i_b_ca_u = me->i_b_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case CALCIUM_BACKGROUND_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_b_ca_u = 5.92E-4 * (me->v - me->e_ca) * 1.0000000000000002;

                // Remain in this state
                state_u = CALCIUM_BACKGROUND_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_b_ca = i_b_ca_u;

}