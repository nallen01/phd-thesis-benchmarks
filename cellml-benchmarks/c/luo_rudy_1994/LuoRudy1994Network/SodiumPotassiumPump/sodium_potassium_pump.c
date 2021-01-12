#include "sodium_potassium_pump.h"

// sodium_potassium_pump Initialisation function
void SodiumPotassiumPumpInit(SodiumPotassiumPump* me) {
    // Initialise State
    me->state = SODIUM_POTASSIUM_PUMP_Q0;

    // Initialise Outputs
    me->i_nak = 0.0;

    // Initialise Internal Variables
    me->f_nak = 0.0;
    me->sigma = 0.0;
}

// sodium_potassium_pump Execution function
void SodiumPotassiumPumpRun(SodiumPotassiumPump* me) {
    // Create intermediary variables
    enum SodiumPotassiumPumpStates state_u = me->state;
    double i_nak_u = me->i_nak;

    double f_nak_u = me->f_nak;
    double sigma_u = me->sigma;


    // Run the state machine for transition logic
    switch(me->state) {
        case SODIUM_POTASSIUM_PUMP_Q0: // Logic for state q0
            if(true) {
                f_nak_u = 1.0 / (1.0 + 0.1245 * exp(-0.1 * ((me->v * me->f) / (me->r * me->t))) + 0.0365 * me->sigma * exp(-((me->v * me->f) / (me->r * me->t))));
                sigma_u = (1.0 / 7.0) * (exp(me->nao / 67.3) - 1.0);
                i_nak_u = 0.015 * me->f_nak * (1.0 / (1.0 + pow(10.0 / me->nai, 1.5))) * (me->ko / (me->ko + 1.5)) * 0.9999999999999999;

                // Remain in this state
                state_u = SODIUM_POTASSIUM_PUMP_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_nak = i_nak_u;

    me->f_nak = f_nak_u;
    me->sigma = sigma_u;

}