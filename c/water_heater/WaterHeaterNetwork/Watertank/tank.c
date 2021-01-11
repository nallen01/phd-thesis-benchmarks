#include "tank.h"

// Tank Initialisation function
void TankInit(Tank* me) {
    // Initialise State
    me->state = TANK_T1;

    // Initialise Outputs
    me->temperature = 20;
}

// Tank Execution function
void TankRun(Tank* me) {
    // Create intermediary variables
    enum TankStates state_u = me->state;
    double temperature_u = me->temperature;


    // Run the state machine for transition logic
    switch(me->state) {
        case TANK_T1: // Logic for state t1
            if(me->temperature == 100 && !me->burner_off) {
                // Next state is t2
                state_u = TANK_T2;
            }
            else if(me->burner_off) {
                // Next state is t3
                state_u = TANK_T3;
            }
            else if(me->temperature >= 20 && me->temperature < 100 && !me->burner_off) {
                temperature_u = me->temperature + 0.075 * (150 - me->temperature) * STEP_SIZE;

                if((temperature_u > 100 && me->temperature < 100) || (temperature_u < 100 && me->temperature > 100)) {
                    // Need to saturate temperature to 100
                    temperature_u = 100;
                }

                // Remain in this state
                state_u = TANK_T1;
            }
            break;
        case TANK_T2: // Logic for state t2
            if(me->burner_off) {
                // Next state is t3
                state_u = TANK_T3;
            }
            else if(!me->burner_off) {
                // Remain in this state
                state_u = TANK_T2;
            }
            break;
        case TANK_T3: // Logic for state t3
            if(me->temperature == 20 && !me->burner_on) {
                // Next state is t4
                state_u = TANK_T4;
            }
            else if(me->burner_on) {
                // Next state is t1
                state_u = TANK_T1;
            }
            else if(me->temperature > 20 && me->temperature <= 100 && !me->burner_on) {
                temperature_u = me->temperature + -0.075 * me->temperature * STEP_SIZE;

                if((temperature_u > 20 && me->temperature < 20) || (temperature_u < 20 && me->temperature > 20)) {
                    // Need to saturate temperature to 20
                    temperature_u = 20;
                }

                // Remain in this state
                state_u = TANK_T3;
            }
            break;
        case TANK_T4: // Logic for state t4
            if(me->burner_on) {
                // Next state is t1
                state_u = TANK_T1;
            }
            else if(!me->burner_on) {
                // Remain in this state
                state_u = TANK_T4;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->temperature = temperature_u;

}