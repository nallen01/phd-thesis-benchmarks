#include "environment.h"

// environment Initialisation function
void EnvironmentInit(Environment* me) {
    // Initialise State
    me->state = ENVIRONMENT_Q0;

    // Initialise Outputs
    me->time = 0.0;
}

// environment Execution function
void EnvironmentRun(Environment* me) {
    // Create intermediary variables
    enum EnvironmentStates state_u = me->state;
    double time_u = me->time;


    // Run the state machine for transition logic
    switch(me->state) {
        case ENVIRONMENT_Q0: // Logic for state q0
            if(true) {
                time_u = me->time + 1000.0 * STEP_SIZE;

                // Remain in this state
                state_u = ENVIRONMENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->time = time_u;

}