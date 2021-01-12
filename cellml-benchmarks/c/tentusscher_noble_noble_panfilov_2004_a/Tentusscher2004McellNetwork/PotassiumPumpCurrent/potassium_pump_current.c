#include "potassium_pump_current.h"

// potassium_pump_current Initialisation function
void PotassiumPumpCurrentInit(PotassiumPumpCurrent* me) {
    // Initialise State
    me->state = POTASSIUM_PUMP_CURRENT_Q0;

    // Initialise Outputs
    me->i_p_k = 0.0;
}

// potassium_pump_current Execution function
void PotassiumPumpCurrentRun(PotassiumPumpCurrent* me) {
    // Create intermediary variables
    enum PotassiumPumpCurrentStates state_u = me->state;
    double i_p_k_u = me->i_p_k;


    // Run the state machine for transition logic
    switch(me->state) {
        case POTASSIUM_PUMP_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_p_k_u = ((0.0146 * (me->v - me->e_k)) / (1.0 + exp((25.0 - me->v) / 5.98))) * 1.0000000000000002;

                // Remain in this state
                state_u = POTASSIUM_PUMP_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_p_k = i_p_k_u;

}