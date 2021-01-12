#include "sodium_channel_m_gate.h"

// sodium_channel_m_gate Initialisation function
void SodiumChannelMGateInit(SodiumChannelMGate* me) {
    // Initialise State
    me->state = SODIUM_CHANNEL_M_GATE_Q0;

    // Initialise Outputs
    me->m = 0.05;

    // Initialise Internal Variables
    me->alpha_m = 0.0;
    me->beta_m = 0.0;
}

// sodium_channel_m_gate Execution function
void SodiumChannelMGateRun(SodiumChannelMGate* me) {
    // Create intermediary variables
    enum SodiumChannelMGateStates state_u = me->state;
    double m_u = me->m;

    double alpha_m_u = me->alpha_m;
    double beta_m_u = me->beta_m;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_CHANNEL_M_GATE_Q0: // Logic for state q0
            if(true) {
                m_u = me->m + (me->alpha_m * (1.0 - me->m) - me->beta_m * me->m) * STEP_SIZE;

                alpha_m_u = (-0.1 * (me->v + 50.0)) / (exp(-(me->v + 50.0) / 10.0) - 1.0);
                beta_m_u = 4.0 * exp(-(me->v + 75.0) / 18.0);

                // Remain in this state
                state_u = SODIUM_CHANNEL_M_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->m = m_u;

    me->alpha_m = alpha_m_u;
    me->beta_m = beta_m_u;

}