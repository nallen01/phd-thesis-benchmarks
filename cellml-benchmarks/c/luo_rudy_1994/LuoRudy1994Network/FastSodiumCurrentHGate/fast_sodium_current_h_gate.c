#include "fast_sodium_current_h_gate.h"

static double AlphaHPw(double v) {
    if(v < -40.0) {
        return 0.135 * exp((80.0 + v) / -6.8);
    }
    else {
        return 0.0;
    }
}

static double BetaHPw(double v) {
    if(v < -40.0) {
        return 3.56 * exp(0.079 * v) + 310000.0 * exp(0.35 * v);
    }
    else {
        return 1.0 / (0.13 * (1.0 + exp((v + 10.66) / -11.1)));
    }
}


// fast_sodium_current_h_gate Initialisation function
void FastSodiumCurrentHGateInit(FastSodiumCurrentHGate* me) {
    // Initialise State
    me->state = FAST_SODIUM_CURRENT_H_GATE_Q0;

    // Initialise Outputs
    me->h = 1.0;

    // Initialise Internal Variables
    me->alpha_h = 0.0;
    me->beta_h = 0.0;
}

// fast_sodium_current_h_gate Execution function
void FastSodiumCurrentHGateRun(FastSodiumCurrentHGate* me) {
    // Create intermediary variables
    enum FastSodiumCurrentHGateStates state_u = me->state;
    double h_u = me->h;

    double alpha_h_u = me->alpha_h;
    double beta_h_u = me->beta_h;


    // Run the state machine for transition logic
    switch(me->state) {
        case FAST_SODIUM_CURRENT_H_GATE_Q0: // Logic for state q0
            if(true) {
                h_u = me->h + (me->alpha_h * (1.0 - me->h) - me->beta_h * me->h) * STEP_SIZE;

                alpha_h_u = AlphaHPw(me->v);
                beta_h_u = BetaHPw(me->v);

                // Remain in this state
                state_u = FAST_SODIUM_CURRENT_H_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->h = h_u;

    me->alpha_h = alpha_h_u;
    me->beta_h = beta_h_u;

}