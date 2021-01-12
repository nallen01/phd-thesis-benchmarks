#include "l_type_ca_channel_d_gate.h"

// L_type_Ca_channel_d_gate Initialisation function
void LTypeCaChannelDGateInit(LTypeCaChannelDGate* me) {
    // Initialise State
    me->state = L_TYPE_CA_CHANNEL_D_GATE_Q0;

    // Initialise Outputs
    me->d = 0.0;

    // Initialise Internal Variables
    me->alpha_d = 0.0;
    me->beta_d = 0.0;
    me->d_infinity = 0.0;
    me->tau_d = 0.0;
}

// L_type_Ca_channel_d_gate Execution function
void LTypeCaChannelDGateRun(LTypeCaChannelDGate* me) {
    // Create intermediary variables
    enum LTypeCaChannelDGateStates state_u = me->state;
    double d_u = me->d;

    double alpha_d_u = me->alpha_d;
    double beta_d_u = me->beta_d;
    double d_infinity_u = me->d_infinity;
    double tau_d_u = me->tau_d;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CHANNEL_D_GATE_Q0: // Logic for state q0
            if(true) {
                d_u = me->d + (me->alpha_d * (1.0 - me->d) - me->beta_d * me->d) * STEP_SIZE;

                alpha_d_u = me->d_infinity / me->tau_d;
                d_infinity_u = 1.0 / (1.0 + exp(-((me->v + 10.0) / 6.24)));
                tau_d_u = me->d_infinity * ((1.0 - exp(-((me->v + 10.0) / 6.24))) / (0.035 * (me->v + 10.0)));
                beta_d_u = (1.0 - me->d_infinity) / me->tau_d;

                // Remain in this state
                state_u = L_TYPE_CA_CHANNEL_D_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->d = d_u;

    me->alpha_d = alpha_d_u;
    me->beta_d = beta_d_u;
    me->d_infinity = d_infinity_u;
    me->tau_d = tau_d_u;

}