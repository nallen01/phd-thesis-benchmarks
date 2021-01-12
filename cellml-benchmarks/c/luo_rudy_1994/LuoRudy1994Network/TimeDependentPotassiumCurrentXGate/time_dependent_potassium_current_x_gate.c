#include "time_dependent_potassium_current_x_gate.h"

// time_dependent_potassium_current_X_gate Initialisation function
void TimeDependentPotassiumCurrentXGateInit(TimeDependentPotassiumCurrentXGate* me) {
    // Initialise State
    me->state = TIME_DEPENDENT_POTASSIUM_CURRENT_X_GATE_Q0;

    // Initialise Outputs
    me->x = 0.0;

    // Initialise Internal Variables
    me->alpha_x = 0.0;
    me->beta_x = 0.0;
}

// time_dependent_potassium_current_X_gate Execution function
void TimeDependentPotassiumCurrentXGateRun(TimeDependentPotassiumCurrentXGate* me) {
    // Create intermediary variables
    enum TimeDependentPotassiumCurrentXGateStates state_u = me->state;
    double x_u = me->x;

    double alpha_x_u = me->alpha_x;
    double beta_x_u = me->beta_x;


    // Run the state machine for transition logic
    switch(me->state) {
        case TIME_DEPENDENT_POTASSIUM_CURRENT_X_GATE_Q0: // Logic for state q0
            if(true) {
                x_u = me->x + (me->alpha_x * (1.0 - me->x) - me->beta_x * me->x) * STEP_SIZE;

                alpha_x_u = (7.19E-5 * (me->v + 30.0)) / (1.0 - exp(-0.148 * (me->v + 30.0)));
                beta_x_u = (1.31E-4 * (me->v + 30.0)) / (-1.0 + exp(0.0687 * (me->v + 30.0)));

                // Remain in this state
                state_u = TIME_DEPENDENT_POTASSIUM_CURRENT_X_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->x = x_u;

    me->alpha_x = alpha_x_u;
    me->beta_x = beta_x_u;

}