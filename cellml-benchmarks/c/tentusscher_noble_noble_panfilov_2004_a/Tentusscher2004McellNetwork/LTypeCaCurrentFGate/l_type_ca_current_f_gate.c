#include "l_type_ca_current_f_gate.h"

// L_type_Ca_current_f_gate Initialisation function
void LTypeCaCurrentFGateInit(LTypeCaCurrentFGate* me) {
    // Initialise State
    me->state = L_TYPE_CA_CURRENT_F_GATE_Q0;

    // Initialise Outputs
    me->f = 1.0;

    // Initialise Internal Variables
    me->f_inf = 0.0;
    me->tau_f = 0.0;
}

// L_type_Ca_current_f_gate Execution function
void LTypeCaCurrentFGateRun(LTypeCaCurrentFGate* me) {
    // Create intermediary variables
    enum LTypeCaCurrentFGateStates state_u = me->state;
    double f_u = me->f;

    double f_inf_u = me->f_inf;
    double tau_f_u = me->tau_f;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CURRENT_F_GATE_Q0: // Logic for state q0
            if(true) {
                f_u = me->f + ((me->f_inf - me->f) / me->tau_f) * STEP_SIZE;

                f_inf_u = 1.0 / (1.0 + exp((me->v + 20.0) / 7.0));
                tau_f_u = 1125.0 * exp(-(pow(me->v + 27.0, 2.0)) / 240.0) + 80.0 + 165.0 / (1.0 + exp((25.0 - me->v) / 10.0));

                // Remain in this state
                state_u = L_TYPE_CA_CURRENT_F_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->f = f_u;

    me->f_inf = f_inf_u;
    me->tau_f = tau_f_u;

}