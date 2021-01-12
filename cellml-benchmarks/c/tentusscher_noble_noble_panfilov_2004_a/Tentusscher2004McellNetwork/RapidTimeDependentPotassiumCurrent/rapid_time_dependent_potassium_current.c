#include "rapid_time_dependent_potassium_current.h"

// rapid_time_dependent_potassium_current Initialisation function
void RapidTimeDependentPotassiumCurrentInit(RapidTimeDependentPotassiumCurrent* me) {
    // Initialise State
    me->state = RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0;

    // Initialise Outputs
    me->i_kr = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;

    // Initialise Internal Variables
    me->xr1 = 0.0;
    me->xr2 = 0.0;
}

// rapid_time_dependent_potassium_current Execution function
void RapidTimeDependentPotassiumCurrentRun(RapidTimeDependentPotassiumCurrent* me) {
    // Create intermediary variables
    enum RapidTimeDependentPotassiumCurrentStates state_u = me->state;
    double i_kr_u = me->i_kr;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;

    double xr1_u = me->xr1;
    double xr2_u = me->xr2;


    // Run the state machine for transition logic
    switch(me->state) {
        case RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_kr_u = 0.096 * sqrt(me->k_o / 5.4) * me->xr1 * me->xr2 * (me->v - me->e_k) * 1.0000000000000002;
                time_private_u = me->time;
                v_private_u = me->v;
                xr1_u = me->xr1_private;
                xr2_u = me->xr2_private;

                // Remain in this state
                state_u = RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_kr = i_kr_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;

    me->xr1 = xr1_u;
    me->xr2 = xr2_u;

}