#include "sodium_channel_h_gate.h"

// sodium_channel_h_gate Initialisation function
void SodiumChannelHGateInit(SodiumChannelHGate* me) {
    // Initialise State
    me->state = SODIUM_CHANNEL_H_GATE_Q0;

    // Initialise Outputs
    me->h = 0.6;

    // Initialise Internal Variables
    me->alpha_h = 0.0;
    me->beta_h = 0.0;
}

// sodium_channel_h_gate Execution function
void SodiumChannelHGateRun(SodiumChannelHGate* me) {
    // Create intermediary variables
    enum SodiumChannelHGateStates state_u = me->state;
    double h_u = me->h;

    double alpha_h_u = me->alpha_h;
    double beta_h_u = me->beta_h;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_CHANNEL_H_GATE_Q0: // Logic for state q0
            if(true) {
                h_u = me->h + (me->alpha_h * (1.0 - me->h) - me->beta_h * me->h) * STEP_SIZE;

                alpha_h_u = 0.07 * exp(-(me->v + 75.0) / 20.0);
                beta_h_u = 1.0 / (exp(-(me->v + 45.0) / 10.0) + 1.0);

                // Remain in this state
                state_u = SODIUM_CHANNEL_H_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->h = h_u;

    me->alpha_h = alpha_h_u;
    me->beta_h = beta_h_u;

}