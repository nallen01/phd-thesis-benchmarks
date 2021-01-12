#include "transient_outward_current_s_gate.h"

// transient_outward_current_s_gate Initialisation function
void TransientOutwardCurrentSGateInit(TransientOutwardCurrentSGate* me) {
    // Initialise State
    me->state = TRANSIENT_OUTWARD_CURRENT_S_GATE_Q0;

    // Initialise Outputs
    me->s = 1.0;

    // Initialise Internal Variables
    me->s_inf = 0.0;
    me->tau_s = 0.0;
}

// transient_outward_current_s_gate Execution function
void TransientOutwardCurrentSGateRun(TransientOutwardCurrentSGate* me) {
    // Create intermediary variables
    enum TransientOutwardCurrentSGateStates state_u = me->state;
    double s_u = me->s;

    double s_inf_u = me->s_inf;
    double tau_s_u = me->tau_s;


    // Run the state machine for transition logic
    switch(me->state) {
        case TRANSIENT_OUTWARD_CURRENT_S_GATE_Q0: // Logic for state q0
            if(true) {
                s_u = me->s + ((me->s_inf - me->s) / me->tau_s) * STEP_SIZE;

                s_inf_u = 1.0 / (1.0 + exp((me->v + 20.0) / 5.0));
                tau_s_u = 85.0 * exp(-(pow(me->v + 45.0, 2.0)) / 320.0) + 5.0 / (1.0 + exp((me->v - 20.0) / 5.0)) + 3.0;

                // Remain in this state
                state_u = TRANSIENT_OUTWARD_CURRENT_S_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->s = s_u;

    me->s_inf = s_inf_u;
    me->tau_s = tau_s_u;

}