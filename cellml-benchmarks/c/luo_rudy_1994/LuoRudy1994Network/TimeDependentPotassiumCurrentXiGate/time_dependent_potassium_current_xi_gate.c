#include "time_dependent_potassium_current_xi_gate.h"

// time_dependent_potassium_current_Xi_gate Initialisation function
void TimeDependentPotassiumCurrentXiGateInit(TimeDependentPotassiumCurrentXiGate* me) {
    // Initialise State
    me->state = TIME_DEPENDENT_POTASSIUM_CURRENT_XI_GATE_Q0;

    // Initialise Outputs
    me->xi = 0.0;
}

// time_dependent_potassium_current_Xi_gate Execution function
void TimeDependentPotassiumCurrentXiGateRun(TimeDependentPotassiumCurrentXiGate* me) {
    // Create intermediary variables
    enum TimeDependentPotassiumCurrentXiGateStates state_u = me->state;
    double xi_u = me->xi;


    // Run the state machine for transition logic
    switch(me->state) {
        case TIME_DEPENDENT_POTASSIUM_CURRENT_XI_GATE_Q0: // Logic for state q0
            if(true) {
                xi_u = 1.0 / (1.0 + exp((me->v - 56.26) / 32.1));

                // Remain in this state
                state_u = TIME_DEPENDENT_POTASSIUM_CURRENT_XI_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->xi = xi_u;

}