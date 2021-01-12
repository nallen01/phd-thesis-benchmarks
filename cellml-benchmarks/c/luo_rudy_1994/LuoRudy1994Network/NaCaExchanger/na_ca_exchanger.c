#include "na_ca_exchanger.h"

// Na_Ca_exchanger Initialisation function
void NaCaExchangerInit(NaCaExchanger* me) {
    // Initialise State
    me->state = NA_CA_EXCHANGER_Q0;

    // Initialise Outputs
    me->i_naca = 0.0;
}

// Na_Ca_exchanger Execution function
void NaCaExchangerRun(NaCaExchanger* me) {
    // Create intermediary variables
    enum NaCaExchangerStates state_u = me->state;
    double i_naca_u = me->i_naca;


    // Run the state machine for transition logic
    switch(me->state) {
        case NA_CA_EXCHANGER_Q0: // Logic for state q0
            if(true) {
                i_naca_u = 20.0 * (1.0 / (pow(87.5, 3.0) + pow(me->nao, 3.0))) * (1.0 / (1.38 + me->cao)) * (1.0 / (1.0 + 0.1 * exp((0.35 - 1.0) * me->v * (me->f / (me->r * me->t))))) * (exp(0.35 * me->v * (me->f / (me->r * me->t))) * (pow(me->nai, 3.0)) * me->cao - exp((0.35 - 1.0) * me->v * (me->f / (me->r * me->t))) * (pow(me->nao, 3.0)) * me->cai);

                // Remain in this state
                state_u = NA_CA_EXCHANGER_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_naca = i_naca_u;

}