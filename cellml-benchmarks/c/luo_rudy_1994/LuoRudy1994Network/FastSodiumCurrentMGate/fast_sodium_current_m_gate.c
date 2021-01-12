#include "fast_sodium_current_m_gate.h"

// fast_sodium_current_m_gate Initialisation function
void FastSodiumCurrentMGateInit(FastSodiumCurrentMGate* me) {
    // Initialise State
    me->state = FAST_SODIUM_CURRENT_M_GATE_Q0;

    // Initialise Outputs
    me->m = 0.0;

    // Initialise Internal Variables
    me->alpha_m = 0.0;
    me->beta_m = 0.0;
}

// fast_sodium_current_m_gate Execution function
void FastSodiumCurrentMGateRun(FastSodiumCurrentMGate* me) {
    // Create intermediary variables
    enum FastSodiumCurrentMGateStates state_u = me->state;
    double m_u = me->m;

    double alpha_m_u = me->alpha_m;
    double beta_m_u = me->beta_m;


    // Run the state machine for transition logic
    switch(me->state) {
        case FAST_SODIUM_CURRENT_M_GATE_Q0: // Logic for state q0
            if(true) {
                m_u = me->m + (me->alpha_m * (1.0 - me->m) - me->beta_m * me->m) * STEP_SIZE;

                alpha_m_u = (0.32 * (me->v + 47.13)) / (1.0 - exp(-0.1 * (me->v + 47.13)));
                beta_m_u = 0.08 * exp(-me->v / 11.0);

                // Remain in this state
                state_u = FAST_SODIUM_CURRENT_M_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->m = m_u;

    me->alpha_m = alpha_m_u;
    me->beta_m = beta_m_u;

}