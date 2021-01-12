#include "calcium_pump_current.h"

// calcium_pump_current Initialisation function
void CalciumPumpCurrentInit(CalciumPumpCurrent* me) {
    // Initialise State
    me->state = CALCIUM_PUMP_CURRENT_Q0;

    // Initialise Outputs
    me->i_p_ca = 0.0;
}

// calcium_pump_current Execution function
void CalciumPumpCurrentRun(CalciumPumpCurrent* me) {
    // Create intermediary variables
    enum CalciumPumpCurrentStates state_u = me->state;
    double i_p_ca_u = me->i_p_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case CALCIUM_PUMP_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_p_ca_u = (0.825 * me->ca_i) / (me->ca_i + 5.0E-4);

                // Remain in this state
                state_u = CALCIUM_PUMP_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_p_ca = i_p_ca_u;

}