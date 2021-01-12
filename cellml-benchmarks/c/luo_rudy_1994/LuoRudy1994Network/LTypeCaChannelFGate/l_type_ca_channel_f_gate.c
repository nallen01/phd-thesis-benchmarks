#include "l_type_ca_channel_f_gate.h"

// L_type_Ca_channel_f_gate Initialisation function
void LTypeCaChannelFGateInit(LTypeCaChannelFGate* me) {
    // Initialise State
    me->state = L_TYPE_CA_CHANNEL_F_GATE_Q0;

    // Initialise Outputs
    me->f = 1.0;

    // Initialise Internal Variables
    me->alpha_f = 0.0;
    me->beta_f = 0.0;
    me->f_infinity = 0.0;
    me->tau_f = 0.0;
}

// L_type_Ca_channel_f_gate Execution function
void LTypeCaChannelFGateRun(LTypeCaChannelFGate* me) {
    // Create intermediary variables
    enum LTypeCaChannelFGateStates state_u = me->state;
    double f_u = me->f;

    double alpha_f_u = me->alpha_f;
    double beta_f_u = me->beta_f;
    double f_infinity_u = me->f_infinity;
    double tau_f_u = me->tau_f;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CHANNEL_F_GATE_Q0: // Logic for state q0
            if(true) {
                f_u = me->f + (me->alpha_f * (1.0 - me->f) - me->beta_f * me->f) * STEP_SIZE;

                alpha_f_u = me->f_infinity / me->tau_f;
                f_infinity_u = 1.0 / (1.0 + exp((me->v + 35.06) / 8.6)) + 0.6 / (1.0 + exp((50.0 - me->v) / 20.0));
                tau_f_u = 1.0 / (0.0197 * exp(-(pow(0.0337 * (me->v + 10.0), 2.0))) + 0.02);
                beta_f_u = (1.0 - me->f_infinity) / me->tau_f;

                // Remain in this state
                state_u = L_TYPE_CA_CHANNEL_F_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->f = f_u;

    me->alpha_f = alpha_f_u;
    me->beta_f = beta_f_u;
    me->f_infinity = f_infinity_u;
    me->tau_f = tau_f_u;

}