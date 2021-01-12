#include "potassium_channel_n_gate.h"

// potassium_channel_n_gate Initialisation function
void PotassiumChannelNGateInit(PotassiumChannelNGate* me) {
    // Initialise State
    me->state = POTASSIUM_CHANNEL_N_GATE_Q0;

    // Initialise Outputs
    me->n = 0.325;

    // Initialise Internal Variables
    me->alpha_n = 0.0;
    me->beta_n = 0.0;
}

// potassium_channel_n_gate Execution function
void PotassiumChannelNGateRun(PotassiumChannelNGate* me) {
    // Create intermediary variables
    enum PotassiumChannelNGateStates state_u = me->state;
    double n_u = me->n;

    double alpha_n_u = me->alpha_n;
    double beta_n_u = me->beta_n;


    // Run the state machine for transition logic
    switch(me->state) {
        case POTASSIUM_CHANNEL_N_GATE_Q0: // Logic for state q0
            if(true) {
                n_u = me->n + (me->alpha_n * (1.0 - me->n) - me->beta_n * me->n) * STEP_SIZE;

                alpha_n_u = (-0.01 * (me->v + 65.0)) / (exp(-(me->v + 65.0) / 10.0) - 1.0);
                beta_n_u = 0.125 * exp((me->v + 75.0) / 80.0);

                // Remain in this state
                state_u = POTASSIUM_CHANNEL_N_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->n = n_u;

    me->alpha_n = alpha_n_u;
    me->beta_n = beta_n_u;

}