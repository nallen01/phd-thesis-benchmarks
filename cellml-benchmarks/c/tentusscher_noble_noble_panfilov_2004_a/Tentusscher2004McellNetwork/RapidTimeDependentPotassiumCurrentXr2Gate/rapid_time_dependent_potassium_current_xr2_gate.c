#include "rapid_time_dependent_potassium_current_xr2_gate.h"

// rapid_time_dependent_potassium_current_Xr2_gate Initialisation function
void RapidTimeDependentPotassiumCurrentXr2GateInit(RapidTimeDependentPotassiumCurrentXr2Gate* me) {
    // Initialise State
    me->state = RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR2_GATE_Q0;

    // Initialise Outputs
    me->xr2 = 1.0;

    // Initialise Internal Variables
    me->xr2_inf = 0.0;
    me->alpha_xr2 = 0.0;
    me->beta_xr2 = 0.0;
    me->tau_xr2 = 0.0;
}

// rapid_time_dependent_potassium_current_Xr2_gate Execution function
void RapidTimeDependentPotassiumCurrentXr2GateRun(RapidTimeDependentPotassiumCurrentXr2Gate* me) {
    // Create intermediary variables
    enum RapidTimeDependentPotassiumCurrentXr2GateStates state_u = me->state;
    double xr2_u = me->xr2;

    double xr2_inf_u = me->xr2_inf;
    double alpha_xr2_u = me->alpha_xr2;
    double beta_xr2_u = me->beta_xr2;
    double tau_xr2_u = me->tau_xr2;


    // Run the state machine for transition logic
    switch(me->state) {
        case RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR2_GATE_Q0: // Logic for state q0
            if(true) {
                xr2_u = me->xr2 + ((me->xr2_inf - me->xr2) / me->tau_xr2) * STEP_SIZE;

                xr2_inf_u = 1.0 / (1.0 + exp((me->v + 88.0) / 24.0));
                alpha_xr2_u = 3.0 / (1.0 + exp((-60.0 - me->v) / 20.0));
                beta_xr2_u = 1.12 / (1.0 + exp((me->v - 60.0) / 20.0));
                tau_xr2_u = 1.0 * me->alpha_xr2 * me->beta_xr2;

                // Remain in this state
                state_u = RAPID_TIME_DEPENDENT_POTASSIUM_CURRENT_XR2_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->xr2 = xr2_u;

    me->xr2_inf = xr2_inf_u;
    me->alpha_xr2 = alpha_xr2_u;
    me->beta_xr2 = beta_xr2_u;
    me->tau_xr2 = tau_xr2_u;

}