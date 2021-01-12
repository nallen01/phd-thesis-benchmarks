#include "thermostat.h"

// thermostat Initialisation function
void ThermostatInit(Thermostat* me) {
    // Initialise State
    me->state = THERMOSTAT_T1;

    // Initialise Outputs
    me->temperature = 20.0;
}

// thermostat Execution function
void ThermostatRun(Thermostat* me) {
    // Create intermediary variables
    enum ThermostatStates state_u = me->state;
    double temperature_u = me->temperature;


    // Run the state machine for transition logic
    switch(me->state) {
        case THERMOSTAT_T1: // Logic for state t1
            if(me->temperature <= 22.78) {
                // Next state is t2
                state_u = THERMOSTAT_T2;
            }
            else if(me->temperature > 22.78) {
                temperature_u = me->temperature + (10.0 - me->temperature) * STEP_SIZE;

                if(temperature_u > 22.78 && me->temperature < 22.78) {
                    // Need to saturate temperature to 22.78
                    temperature_u = 22.78;
                }

                // Remain in this state
                state_u = THERMOSTAT_T1;
            }
            break;
        case THERMOSTAT_T2: // Logic for state t2
            if(me->temperature >= 25.0) {
                // Next state is t1
                state_u = THERMOSTAT_T1;
            }
            else if(me->temperature < 25.0) {
                temperature_u = me->temperature + (37.78 - me->temperature) * STEP_SIZE;

                if(temperature_u < 25.0 && me->temperature > 25.0) {
                    // Need to saturate temperature to 25.0
                    temperature_u = 25.0;
                }

                // Remain in this state
                state_u = THERMOSTAT_T2;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->temperature = temperature_u;

}