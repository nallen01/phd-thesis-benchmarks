#include "slow_time_dependent_potassium_current.h"

// slow_time_dependent_potassium_current Initialisation function
void SlowTimeDependentPotassiumCurrentInit(SlowTimeDependentPotassiumCurrent* me) {
    // Initialise State
    me->state = SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0;

    // Initialise Outputs
    me->i_ks = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;

    // Initialise Internal Variables
    me->xs = 0.0;
}

// slow_time_dependent_potassium_current Execution function
void SlowTimeDependentPotassiumCurrentRun(SlowTimeDependentPotassiumCurrent* me) {
    // Create intermediary variables
    enum SlowTimeDependentPotassiumCurrentStates state_u = me->state;
    double i_ks_u = me->i_ks;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;

    double xs_u = me->xs;


    // Run the state machine for transition logic
    switch(me->state) {
        case SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_ks_u = 0.062 * (pow(me->xs, 2.0)) * (me->v - me->e_ks) * 1.0000000000000002;
                time_private_u = me->time;
                v_private_u = me->v;
                xs_u = me->xs_private;

                // Remain in this state
                state_u = SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_ks = i_ks_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;

    me->xs = xs_u;

}