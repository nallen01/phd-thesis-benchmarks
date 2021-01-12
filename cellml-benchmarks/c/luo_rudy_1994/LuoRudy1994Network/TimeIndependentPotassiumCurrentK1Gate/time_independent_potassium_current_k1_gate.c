#include "time_independent_potassium_current_k1_gate.h"

// time_independent_potassium_current_K1_gate Initialisation function
void TimeIndependentPotassiumCurrentK1GateInit(TimeIndependentPotassiumCurrentK1Gate* me) {
    // Initialise State
    me->state = TIME_INDEPENDENT_POTASSIUM_CURRENT_K1_GATE_Q0;

    // Initialise Outputs
    me->k1_infinity = 0.0;

    // Initialise Internal Variables
    me->alpha_k1 = 0.0;
    me->beta_k1 = 0.0;
}

// time_independent_potassium_current_K1_gate Execution function
void TimeIndependentPotassiumCurrentK1GateRun(TimeIndependentPotassiumCurrentK1Gate* me) {
    // Create intermediary variables
    enum TimeIndependentPotassiumCurrentK1GateStates state_u = me->state;
    double k1_infinity_u = me->k1_infinity;

    double alpha_k1_u = me->alpha_k1;
    double beta_k1_u = me->beta_k1;


    // Run the state machine for transition logic
    switch(me->state) {
        case TIME_INDEPENDENT_POTASSIUM_CURRENT_K1_GATE_Q0: // Logic for state q0
            if(true) {
                alpha_k1_u = 1.02 / (1.0 + exp(0.2385 * ((me->v - me->e_k1) - 59.215)));
                beta_k1_u = (0.49124 * exp(0.08032 * ((me->v + 5.476) - me->e_k1)) + 1.0 * exp(0.06175 * (me->v - (me->e_k1 + 594.31)))) / (1.0 + exp(-0.5143 * ((me->v - me->e_k1) + 4.753)));
                k1_infinity_u = me->alpha_k1 / (me->alpha_k1 + me->beta_k1);

                // Remain in this state
                state_u = TIME_INDEPENDENT_POTASSIUM_CURRENT_K1_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->k1_infinity = k1_infinity_u;

    me->alpha_k1 = alpha_k1_u;
    me->beta_k1 = beta_k1_u;

}