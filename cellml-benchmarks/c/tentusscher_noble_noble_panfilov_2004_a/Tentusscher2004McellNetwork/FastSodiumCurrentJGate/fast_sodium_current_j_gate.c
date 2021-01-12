#include "fast_sodium_current_j_gate.h"

static double AlphaJPw(double v) {
    if(v < -40.0) {
        return (((-25428.0 * exp(0.2444 * v) - 6.948 * exp(-0.04391 * v)) * (v + 37.78)) / 1.0) / (1.0 + exp(0.311 * (v + 79.23)));
    }
    else {
        return 0.0;
    }
}

static double BetaJPw(double v) {
    if(v < -40.0) {
        return (0.02424 * exp(-0.01052 * v)) / (1.0 + exp(-0.1378 * (v + 40.14)));
    }
    else {
        return (0.6 * exp(0.057 * v)) / (1.0 + exp(-0.1 * (v + 32.0)));
    }
}


// fast_sodium_current_j_gate Initialisation function
void FastSodiumCurrentJGateInit(FastSodiumCurrentJGate* me) {
    // Initialise State
    me->state = FAST_SODIUM_CURRENT_J_GATE_Q0;

    // Initialise Outputs
    me->j = 0.75;

    // Initialise Internal Variables
    me->j_inf = 0.0;
    me->alpha_j = 0.0;
    me->beta_j = 0.0;
    me->tau_j = 0.0;
}

// fast_sodium_current_j_gate Execution function
void FastSodiumCurrentJGateRun(FastSodiumCurrentJGate* me) {
    // Create intermediary variables
    enum FastSodiumCurrentJGateStates state_u = me->state;
    double j_u = me->j;

    double j_inf_u = me->j_inf;
    double alpha_j_u = me->alpha_j;
    double beta_j_u = me->beta_j;
    double tau_j_u = me->tau_j;


    // Run the state machine for transition logic
    switch(me->state) {
        case FAST_SODIUM_CURRENT_J_GATE_Q0: // Logic for state q0
            if(true) {
                j_u = me->j + ((me->j_inf - me->j) / me->tau_j) * STEP_SIZE;

                j_inf_u = 1.0 / (pow(1.0 + exp((me->v + 71.55) / 7.43), 2.0));
                alpha_j_u = AlphaJPw(me->v);
                beta_j_u = BetaJPw(me->v);
                tau_j_u = 1.0 / (me->alpha_j + me->beta_j);

                // Remain in this state
                state_u = FAST_SODIUM_CURRENT_J_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->j = j_u;

    me->j_inf = j_inf_u;
    me->alpha_j = alpha_j_u;
    me->beta_j = beta_j_u;
    me->tau_j = tau_j_u;

}