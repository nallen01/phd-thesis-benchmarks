#include "sodium_calcium_exchanger_current.h"

// sodium_calcium_exchanger_current Initialisation function
void SodiumCalciumExchangerCurrentInit(SodiumCalciumExchangerCurrent* me) {
    // Initialise State
    me->state = SODIUM_CALCIUM_EXCHANGER_CURRENT_Q0;

    // Initialise Outputs
    me->i_naca = 0.0;
}

// sodium_calcium_exchanger_current Execution function
void SodiumCalciumExchangerCurrentRun(SodiumCalciumExchangerCurrent* me) {
    // Create intermediary variables
    enum SodiumCalciumExchangerCurrentStates state_u = me->state;
    double i_naca_u = me->i_naca;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_CALCIUM_EXCHANGER_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_naca_u = (1000.0 * (exp((0.35 * me->v * me->f) / (me->r * me->t)) * (pow(me->na_i, 3.0)) * me->ca_o - exp(((0.35 - 1.0) * me->v * me->f) / (me->r * me->t)) * (pow(me->na_o, 3.0)) * me->ca_i * 2.5)) / ((pow(87.5, 3.0) + pow(me->na_o, 3.0)) * (1.38 + me->ca_o) * (1.0 + 0.1 * exp(((0.35 - 1.0) * me->v * me->f) / (me->r * me->t))));

                // Remain in this state
                state_u = SODIUM_CALCIUM_EXCHANGER_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_naca = i_naca_u;

}