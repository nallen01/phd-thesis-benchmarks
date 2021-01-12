#include "l_type_ca_current_d_gate.h"

// L_type_Ca_current_d_gate Initialisation function
void LTypeCaCurrentDGateInit(LTypeCaCurrentDGate* me) {
    // Initialise State
    me->state = L_TYPE_CA_CURRENT_D_GATE_Q0;

    // Initialise Outputs
    me->d = 0.0;

    // Initialise Internal Variables
    me->d_inf = 0.0;
    me->alpha_d = 0.0;
    me->beta_d = 0.0;
    me->gamma_d = 0.0;
    me->tau_d = 0.0;
}

// L_type_Ca_current_d_gate Execution function
void LTypeCaCurrentDGateRun(LTypeCaCurrentDGate* me) {
    // Create intermediary variables
    enum LTypeCaCurrentDGateStates state_u = me->state;
    double d_u = me->d;

    double d_inf_u = me->d_inf;
    double alpha_d_u = me->alpha_d;
    double beta_d_u = me->beta_d;
    double gamma_d_u = me->gamma_d;
    double tau_d_u = me->tau_d;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CURRENT_D_GATE_Q0: // Logic for state q0
            if(true) {
                d_u = me->d + ((me->d_inf - me->d) / me->tau_d) * STEP_SIZE;

                d_inf_u = 1.0 / (1.0 + exp((-5.0 - me->v) / 7.5));
                alpha_d_u = 1.4 / (1.0 + exp((-35.0 - me->v) / 13.0)) + 0.25;
                beta_d_u = 1.4 / (1.0 + exp((me->v + 5.0) / 5.0));
                gamma_d_u = 1.0 / (1.0 + exp((50.0 - me->v) / 20.0));
                tau_d_u = 1.0 * me->alpha_d * me->beta_d + me->gamma_d;

                // Remain in this state
                state_u = L_TYPE_CA_CURRENT_D_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->d = d_u;

    me->d_inf = d_inf_u;
    me->alpha_d = alpha_d_u;
    me->beta_d = beta_d_u;
    me->gamma_d = gamma_d_u;
    me->tau_d = tau_d_u;

}