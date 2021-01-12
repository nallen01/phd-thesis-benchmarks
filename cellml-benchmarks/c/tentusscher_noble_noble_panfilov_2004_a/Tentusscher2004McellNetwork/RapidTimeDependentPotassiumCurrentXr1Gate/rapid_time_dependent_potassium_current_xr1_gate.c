#include "rapid_time_dependent_potassium_current_xr1_gate.h"

// rapid_time_dependent_potassium_current_Xr1_gate Initialisation function
void RapidTimeDependentPotassiumCurrentXr1GateInit(RapidTimeDependentPotassiumCurrentXr1Gate* me) {
    // Initialise State
    me->state = RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR1_GATE_Q0;

    // Initialise Outputs
    me->xr1 = 0.0;

    // Initialise Internal Variables
    me->xr1_inf = 0.0;
    me->alpha_xr1 = 0.0;
    me->beta_xr1 = 0.0;
    me->tau_xr1 = 0.0;
}

// rapid_time_dependent_potassium_current_Xr1_gate Execution function
void RapidTimeDependentPotassiumCurrentXr1GateRun(RapidTimeDependentPotassiumCurrentXr1Gate* me) {
    // Create intermediary variables
    enum RapidTimeDependentPotassiumCurrentXr1GateStates state_u = me->state;
    double xr1_u = me->xr1;

    double xr1_inf_u = me->xr1_inf;
    double alpha_xr1_u = me->alpha_xr1;
    double beta_xr1_u = me->beta_xr1;
    double tau_xr1_u = me->tau_xr1;


    // Run the state machine for transition logic
    switch(me->state) {
        case RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR1_GATE_Q0: // Logic for state q0
            if(true) {
                xr1_u = me->xr1 + ((me->xr1_inf - me->xr1) / me->tau_xr1) * STEP_SIZE;

                xr1_inf_u = 1.0 / (1.0 + exp((-26.0 - me->v) / 7.0));
                alpha_xr1_u = 450.0 / (1.0 + exp((-45.0 - me->v) / 10.0));
                beta_xr1_u = 6.0 / (1.0 + exp((me->v + 30.0) / 11.5));
                tau_xr1_u = 1.0 * me->alpha_xr1 * me->beta_xr1;

                // Remain in this state
                state_u = RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR1_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->xr1 = xr1_u;

    me->xr1_inf = xr1_inf_u;
    me->alpha_xr1 = alpha_xr1_u;
    me->beta_xr1 = beta_xr1_u;
    me->tau_xr1 = tau_xr1_u;

}