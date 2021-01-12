#include "time_independent_potassium_current.h"

// time_independent_potassium_current Initialisation function
void TimeIndependentPotassiumCurrentInit(TimeIndependentPotassiumCurrent* me) {
    // Initialise State
    me->state = TIME_INDEPENDENT_POTASSIUM_CURRENT_Q0;

    // Initialise Outputs
    me->i_k1 = 0.0;
    me->e_k1 = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;

    // Initialise Internal Variables
    me->g_k1 = 0.0;
    me->k1_infinity = 0.0;
}

// time_independent_potassium_current Execution function
void TimeIndependentPotassiumCurrentRun(TimeIndependentPotassiumCurrent* me) {
    // Create intermediary variables
    enum TimeIndependentPotassiumCurrentStates state_u = me->state;
    double i_k1_u = me->i_k1;
    double e_k1_u = me->e_k1;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;

    double g_k1_u = me->g_k1;
    double k1_infinity_u = me->k1_infinity;


    // Run the state machine for transition logic
    switch(me->state) {
        case TIME_INDEPENDENT_POTASSIUM_CURRENT_Q0: // Logic for state q0
            if(true) {
                g_k1_u = 0.0075 * sqrt(me->ko / 5.4);
                e_k1_u = ((me->r * me->t) / me->f) * log(me->ko / me->ki) * 0.9999999999999998;
                i_k1_u = me->g_k1 * me->k1_infinity * (me->v - me->e_k1);
                time_private_u = me->time;
                v_private_u = me->v;
                k1_infinity_u = me->k1_infinity_private;

                // Remain in this state
                state_u = TIME_INDEPENDENT_POTASSIUM_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_k1 = i_k1_u;
    me->e_k1 = e_k1_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;

    me->g_k1 = g_k1_u;
    me->k1_infinity = k1_infinity_u;

}