#include "transient_outward_current_r_gate.h"

// transient_outward_current_r_gate Initialisation function
void TransientOutwardCurrentRGateInit(TransientOutwardCurrentRGate* me) {
    // Initialise State
    me->state = TRANSIENT_OUTWARD_CURRENT_R_GATE_Q0;

    // Initialise Outputs
    me->r = 0.0;

    // Initialise Internal Variables
    me->r_inf = 0.0;
    me->tau_r = 0.0;
}

// transient_outward_current_r_gate Execution function
void TransientOutwardCurrentRGateRun(TransientOutwardCurrentRGate* me) {
    // Create intermediary variables
    enum TransientOutwardCurrentRGateStates state_u = me->state;
    double r_u = me->r;

    double r_inf_u = me->r_inf;
    double tau_r_u = me->tau_r;


    // Run the state machine for transition logic
    switch(me->state) {
        case TRANSIENT_OUTWARD_CURRENT_R_GATE_Q0: // Logic for state q0
            if(true) {
                r_u = me->r + ((me->r_inf - me->r) / me->tau_r) * STEP_SIZE;

                r_inf_u = 1.0 / (1.0 + exp((20.0 - me->v) / 6.0));
                tau_r_u = 9.5 * exp(-(pow(me->v + 40.0, 2.0)) / 1800.0) + 0.8;

                // Remain in this state
                state_u = TRANSIENT_OUTWARD_CURRENT_R_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->r = r_u;

    me->r_inf = r_inf_u;
    me->tau_r = tau_r_u;

}