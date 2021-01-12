#include "sodium_potassium_pump_current.h"

// sodium_potassium_pump_current Initialisation function
void SodiumPotassiumPumpCurrentInit(SodiumPotassiumPumpCurrent* me) {
    // Initialise State
    me->state = SODIUM_POTASSIUM_PUMP_CURRENT_Q0;

    // Initialise Outputs
    me->i_nak = 0.0;
    me->v_private = 0.0;
}

// sodium_potassium_pump_current Execution function
void SodiumPotassiumPumpCurrentRun(SodiumPotassiumPumpCurrent* me) {
    // Create intermediary variables
    enum SodiumPotassiumPumpCurrentStates state_u = me->state;
    double i_nak_u = me->i_nak;
    double v_private_u = me->v_private;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_POTASSIUM_PUMP_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_nak_u = ((((1.362 * me->k_o) / (me->k_o + 1.0)) * me->na_i) / (me->na_i + 40.0)) / (1.0 + 0.1245 * exp((-0.1 * me->v * me->f) / (me->r * me->t)) + 0.0353 * exp((-me->v * me->f) / (me->r * me->t)));
                v_private_u = me->v;

                // Remain in this state
                state_u = SODIUM_POTASSIUM_PUMP_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_nak = i_nak_u;
    me->v_private = v_private_u;

}