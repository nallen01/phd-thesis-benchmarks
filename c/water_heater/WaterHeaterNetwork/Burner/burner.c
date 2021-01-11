#include "burner.h"

// Burner Initialisation function
void BurnerInit(Burner* me) {
    // Initialise State
    me->state = BURNER_B1;

    // Initialise Outputs
    me->burner_on = false;
    me->burner_off = false;

    // Initialise Internal Variables
    me->y = 0;
}

// Burner Execution function
void BurnerRun(Burner* me) {
    // Create intermediary variables
    enum BurnerStates state_u = me->state;
    bool burner_on_u = me->burner_on;
    bool burner_off_u = me->burner_off;

    double y_u = me->y;


    // Run the state machine for transition logic
    switch(me->state) {
        case BURNER_B1: // Logic for state b1
            if(me->y == 20) {
                y_u = 0;

                // Next state is b2
                state_u = BURNER_B2;
            }
            else if(me->y < 20) {
                y_u = me->y + 1 * STEP_SIZE;

                burner_on_u = true;
                burner_off_u = false;

                if((y_u > 20 && me->y < 20) || (y_u < 20 && me->y > 20)) {
                    // Need to saturate y to 20
                    y_u = 20;
                }

                // Remain in this state
                state_u = BURNER_B1;
            }
            break;
        case BURNER_B2: // Logic for state b2
            if(me->y == 20) {
                y_u = 0;

                // Next state is b1
                state_u = BURNER_B1;
            }
            else if(me->y < 20) {
                y_u = me->y + 1 * STEP_SIZE;

                burner_on_u = false;
                burner_off_u = true;

                if((y_u > 20 && me->y < 20) || (y_u < 20 && me->y > 20)) {
                    // Need to saturate y to 20
                    y_u = 20;
                }

                // Remain in this state
                state_u = BURNER_B2;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->burner_on = burner_on_u;
    me->burner_off = burner_off_u;

    me->y = y_u;

}