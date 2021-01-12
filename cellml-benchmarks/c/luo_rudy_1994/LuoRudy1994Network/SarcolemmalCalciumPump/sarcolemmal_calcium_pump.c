#include "sarcolemmal_calcium_pump.h"

// sarcolemmal_calcium_pump Initialisation function
void SarcolemmalCalciumPumpInit(SarcolemmalCalciumPump* me) {
    // Initialise State
    me->state = SARCOLEMMAL_CALCIUM_PUMP_Q0;

    // Initialise Outputs
    me->i_p_ca = 0.0;
}

// sarcolemmal_calcium_pump Execution function
void SarcolemmalCalciumPumpRun(SarcolemmalCalciumPump* me) {
    // Create intermediary variables
    enum SarcolemmalCalciumPumpStates state_u = me->state;
    double i_p_ca_u = me->i_p_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case SARCOLEMMAL_CALCIUM_PUMP_Q0: // Logic for state q0
            if(true) {
                i_p_ca_u = 0.0115 * (me->cai / (5.0E-4 + me->cai)) * 0.9999999999999999;

                // Remain in this state
                state_u = SARCOLEMMAL_CALCIUM_PUMP_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_p_ca = i_p_ca_u;

}