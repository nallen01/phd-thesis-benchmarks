#include "leakage_current.h"

// leakage_current Initialisation function
void LeakageCurrentInit(LeakageCurrent* me) {
    // Initialise State
    me->state = LEAKAGE_CURRENT_Q0;

    // Initialise Outputs
    me->i_l = 0.0;

    // Initialise Internal Variables
    me->e_l = 0.0;
}

// leakage_current Execution function
void LeakageCurrentRun(LeakageCurrent* me) {
    // Create intermediary variables
    enum LeakageCurrentStates state_u = me->state;
    double i_l_u = me->i_l;

    double e_l_u = me->e_l;


    // Run the state machine for transition logic
    switch(me->state) {
        case LEAKAGE_CURRENT_Q0: // Logic for state q0
            if(true) {
                e_l_u = me->e_r + 10.613;
                i_l_u = 0.3 * (me->v - me->e_l);

                // Remain in this state
                state_u = LEAKAGE_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_l = i_l_u;

    me->e_l = e_l_u;

}