#include "fast_sodium_current_h_gate.h"

static double AlphaHPw(double v) {
    if(v < -40.0) {
        return 0.057 * exp(-(v + 80.0) / 6.8);
    }
    else {
        return 0.0;
    }
}

static double BetaHPw(double v) {
    if(v < -40.0) {
        return 2.7 * exp(0.079 * v) + 310000.0 * exp(0.3485 * v);
    }
    else {
        return 0.77 / (0.13 * (1.0 + exp((v + 10.66) / -11.1)));
    }
}


// fast_sodium_current_h_gate Initialisation function
void FastSodiumCurrentHGateInit(FastSodiumCurrentHGate* me) {
    // Initialise State
    me->state = FAST_SODIUM_CURRENT_H_GATE_Q0;

    // Initialise Outputs
    me->h = 0.75;

    // Initialise Internal Variables
    me->h_inf = 0.0;
    me->alpha_h = 0.0;
    me->beta_h = 0.0;
    me->tau_h = 0.0;
}

// fast_sodium_current_h_gate Execution function
void FastSodiumCurrentHGateRun(FastSodiumCurrentHGate* me) {
    // Create intermediary variables
    enum FastSodiumCurrentHGateStates state_u = me->state;
    double h_u = me->h;

    double h_inf_u = me->h_inf;
    double alpha_h_u = me->alpha_h;
    double beta_h_u = me->beta_h;
    double tau_h_u = me->tau_h;


    // Run the state machine for transition logic
    switch(me->state) {
        case FAST_SODIUM_CURRENT_H_GATE_Q0: // Logic for state q0
            if(true) {
                h_u = me->h + ((me->h_inf - me->h) / me->tau_h) * STEP_SIZE;

                h_inf_u = 1.0 / (pow(1.0 + exp((me->v + 71.55) / 7.43), 2.0));
                alpha_h_u = AlphaHPw(me->v);
                beta_h_u = BetaHPw(me->v);
                tau_h_u = 1.0 / (me->alpha_h + me->beta_h);

                // Remain in this state
                state_u = FAST_SODIUM_CURRENT_H_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->h = h_u;

    me->h_inf = h_inf_u;
    me->alpha_h = alpha_h_u;
    me->beta_h = beta_h_u;
    me->tau_h = tau_h_u;

}