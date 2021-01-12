#include "calcium_background_current.h"

// calcium_background_current Initialisation function
void CalciumBackgroundCurrentInit(CalciumBackgroundCurrent* me) {
    // Initialise State
    me->state = CALCIUM_BACKGROUND_CURRENT_Q0;

    // Initialise Outputs
    me->i_ca_b = 0.0;

    // Initialise Internal Variables
    me->e_can = 0.0;
}

// calcium_background_current Execution function
void CalciumBackgroundCurrentRun(CalciumBackgroundCurrent* me) {
    // Create intermediary variables
    enum CalciumBackgroundCurrentStates state_u = me->state;
    double i_ca_b_u = me->i_ca_b;

    double e_can_u = me->e_can;


    // Run the state machine for transition logic
    switch(me->state) {
        case CALCIUM_BACKGROUND_CURRENT_Q0: // Logic for state q0
            if(true) {
                e_can_u = ((me->r * me->t) / (2.0 * me->f)) * log(me->cao / me->cai) * 0.9999999999999998;
                i_ca_b_u = 3.016E-5 * (me->v - me->e_can);

                // Remain in this state
                state_u = CALCIUM_BACKGROUND_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_ca_b = i_ca_b_u;

    me->e_can = e_can_u;

}