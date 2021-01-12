#include "l_type_ca_channel_f_ca_gate.h"

// L_type_Ca_channel_f_Ca_gate Initialisation function
void LTypeCaChannelFCaGateInit(LTypeCaChannelFCaGate* me) {
    // Initialise State
    me->state = L_TYPE_CA_CHANNEL_F_CA_GATE_Q0;

    // Initialise Outputs
    me->f_ca = 0.0;
}

// L_type_Ca_channel_f_Ca_gate Execution function
void LTypeCaChannelFCaGateRun(LTypeCaChannelFCaGate* me) {
    // Create intermediary variables
    enum LTypeCaChannelFCaGateStates state_u = me->state;
    double f_ca_u = me->f_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CHANNEL_F_CA_GATE_Q0: // Logic for state q0
            if(true) {
                f_ca_u = 1.0 / (1.0 + pow(me->cai / 6.0E-4, 2.0));

                // Remain in this state
                state_u = L_TYPE_CA_CHANNEL_F_CA_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->f_ca = f_ca_u;

}