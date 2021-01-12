#include "slow_time_dependent_potassium_current_xs_gate.h"

// slow_time_dependent_potassium_current_Xs_gate Initialisation function
void SlowTimeDependentPotassiumCurrentXsGateInit(SlowTimeDependentPotassiumCurrentXsGate* me) {
    // Initialise State
    me->state = SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_XS_GATE_Q0;

    // Initialise Outputs
    me->xs = 0.0;

    // Initialise Internal Variables
    me->xs_inf = 0.0;
    me->alpha_xs = 0.0;
    me->beta_xs = 0.0;
    me->tau_xs = 0.0;
}

// slow_time_dependent_potassium_current_Xs_gate Execution function
void SlowTimeDependentPotassiumCurrentXsGateRun(SlowTimeDependentPotassiumCurrentXsGate* me) {
    // Create intermediary variables
    enum SlowTimeDependentPotassiumCurrentXsGateStates state_u = me->state;
    double xs_u = me->xs;

    double xs_inf_u = me->xs_inf;
    double alpha_xs_u = me->alpha_xs;
    double beta_xs_u = me->beta_xs;
    double tau_xs_u = me->tau_xs;


    // Run the state machine for transition logic
    switch(me->state) {
        case SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_XS_GATE_Q0: // Logic for state q0
            if(true) {
                xs_u = me->xs + ((me->xs_inf - me->xs) / me->tau_xs) * STEP_SIZE;

                xs_inf_u = 1.0 / (1.0 + exp((-5.0 - me->v) / 14.0));
                alpha_xs_u = 1100.0 / sqrt(1.0 + exp((-10.0 - me->v) / 6.0));
                beta_xs_u = 1.0 / (1.0 + exp((me->v - 60.0) / 20.0));
                tau_xs_u = 1.0 * me->alpha_xs * me->beta_xs;

                // Remain in this state
                state_u = SLOW_TIME_DEPENDENT_POTASSIUM_CURRENT_XS_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->xs = xs_u;

    me->xs_inf = xs_inf_u;
    me->alpha_xs = alpha_xs_u;
    me->beta_xs = beta_xs_u;
    me->tau_xs = tau_xs_u;

}