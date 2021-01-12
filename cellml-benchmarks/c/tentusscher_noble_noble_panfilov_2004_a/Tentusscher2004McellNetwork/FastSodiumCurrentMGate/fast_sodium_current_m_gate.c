#include "fast_sodium_current_m_gate.h"

// fast_sodium_current_m_gate Initialisation function
void FastSodiumCurrentMGateInit(FastSodiumCurrentMGate* me) {
    // Initialise State
    me->state = FAST_SODIUM_CURRENT_M_GATE_Q0;

    // Initialise Outputs
    me->m = 0.0;

    // Initialise Internal Variables
    me->m_inf = 0.0;
    me->alpha_m = 0.0;
    me->beta_m = 0.0;
    me->tau_m = 0.0;
}

// fast_sodium_current_m_gate Execution function
void FastSodiumCurrentMGateRun(FastSodiumCurrentMGate* me) {
    // Create intermediary variables
    enum FastSodiumCurrentMGateStates state_u = me->state;
    double m_u = me->m;

    double m_inf_u = me->m_inf;
    double alpha_m_u = me->alpha_m;
    double beta_m_u = me->beta_m;
    double tau_m_u = me->tau_m;


    // Run the state machine for transition logic
    switch(me->state) {
        case FAST_SODIUM_CURRENT_M_GATE_Q0: // Logic for state q0
            if(true) {
                m_u = me->m + ((me->m_inf - me->m) / me->tau_m) * STEP_SIZE;

                m_inf_u = 1.0 / (pow(1.0 + exp((-56.86 - me->v) / 9.03), 2.0));
                alpha_m_u = 1.0 / (1.0 + exp((-60.0 - me->v) / 5.0));
                beta_m_u = 0.1 / (1.0 + exp((me->v + 35.0) / 5.0)) + 0.1 / (1.0 + exp((me->v - 50.0) / 200.0));
                tau_m_u = 1.0 * me->alpha_m * me->beta_m;

                // Remain in this state
                state_u = FAST_SODIUM_CURRENT_M_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->m = m_u;

    me->m_inf = m_inf_u;
    me->alpha_m = alpha_m_u;
    me->beta_m = beta_m_u;
    me->tau_m = tau_m_u;

}