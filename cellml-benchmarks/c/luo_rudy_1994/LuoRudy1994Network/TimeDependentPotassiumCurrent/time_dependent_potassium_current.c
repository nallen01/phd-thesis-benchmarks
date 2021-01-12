#include "time_dependent_potassium_current.h"

// time_dependent_potassium_current Initialisation function
void TimeDependentPotassiumCurrentInit(TimeDependentPotassiumCurrent* me) {
    // Initialise State
    me->state = TIME_DEPENDENT_POTASSIUM_CURRENT_Q0;

    // Initialise Outputs
    me->i_k = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;

    // Initialise Internal Variables
    me->g_k = 0.0;
    me->e_k = 0.0;
    me->x = 0.0;
    me->xi = 0.0;
}

// time_dependent_potassium_current Execution function
void TimeDependentPotassiumCurrentRun(TimeDependentPotassiumCurrent* me) {
    // Create intermediary variables
    enum TimeDependentPotassiumCurrentStates state_u = me->state;
    double i_k_u = me->i_k;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;

    double g_k_u = me->g_k;
    double e_k_u = me->e_k;
    double x_u = me->x;
    double xi_u = me->xi;


    // Run the state machine for transition logic
    switch(me->state) {
        case TIME_DEPENDENT_POTASSIUM_CURRENT_Q0: // Logic for state q0
            if(true) {
                g_k_u = 0.00282 * sqrt(me->ko / 5.4);
                e_k_u = ((me->r * me->t) / me->f) * log((me->ko + 0.01833 * me->nao) / (me->ki + 0.01833 * me->nai)) * 0.9999999999999998;
                i_k_u = me->g_k * (pow(me->x, 2.0)) * me->xi * (me->v - me->e_k);
                time_private_u = me->time;
                v_private_u = me->v;
                x_u = me->x_private;
                xi_u = me->xi_private;

                // Remain in this state
                state_u = TIME_DEPENDENT_POTASSIUM_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_k = i_k_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;

    me->g_k = g_k_u;
    me->e_k = e_k_u;
    me->x = x_u;
    me->xi = xi_u;

}