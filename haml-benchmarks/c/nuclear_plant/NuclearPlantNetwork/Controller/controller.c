#include "controller.h"

// Controller Initialisation function
void ControllerInit(Controller* me) {
    // Initialise State
    me->state = CONTROLLER_C1;

    // Initialise Outputs
    me->add1 = false;
    me->remove1 = false;
    me->add2 = false;
    me->remove2 = false;

    // Initialise Internal Variables
    me->y1 = 0.0;
    me->y2 = 0.0;
}

// Controller Execution function
void ControllerRun(Controller* me) {
    // Create intermediary variables
    enum ControllerStates state_u = me->state;
    bool add1_u = me->add1;
    bool remove1_u = me->remove1;
    bool add2_u = me->add2;
    bool remove2_u = me->remove2;

    double y1_u = me->y1;
    double y2_u = me->y2;


    // Run the state machine for transition logic
    switch(me->state) {
        case CONTROLLER_C1: // Logic for state c1
            if(me->x > 550.0 && me->y1 >= 15.0 && me->y2 < 15.0) {
                add1_u = true;
                remove1_u = false;
                add2_u = false;
                remove2_u = false;

                // Next state is c2
                state_u = CONTROLLER_C2;
            }
            else if(me->x > 550.0 && me->y2 >= 15.0) {
                add1_u = false;
                remove1_u = false;
                add2_u = true;
                remove2_u = false;

                // Next state is c3
                state_u = CONTROLLER_C3;
            }
            else if(me->x <= 550.0 || (me->y1 < 15.0 && me->y2 < 15.0)) {
                y1_u = me->y1 + 1.0 * STEP_SIZE;
                y2_u = me->y2 + 1.0 * STEP_SIZE;

                if(y1_u < 15.0 && me->y1 > 15.0) {
                    // Need to saturate y1 to 15.0
                    y1_u = 15.0;
                }
                if(y2_u < 15.0 && me->y2 > 15.0) {
                    // Need to saturate y2 to 15.0
                    y2_u = 15.0;
                }

                // Remain in this state
                state_u = CONTROLLER_C1;
            }
            break;
        case CONTROLLER_C2: // Logic for state c2
            if(me->x <= 510.0) {
                add1_u = false;
                remove1_u = true;
                add2_u = false;
                remove2_u = false;
                y1_u = 0.0;

                // Next state is c1
                state_u = CONTROLLER_C1;
            }
            else if(me->x > 510.0) {
                y1_u = me->y1 + 1.0 * STEP_SIZE;
                y2_u = me->y2 + 1.0 * STEP_SIZE;

                // Remain in this state
                state_u = CONTROLLER_C2;
            }
            break;
        case CONTROLLER_C3: // Logic for state c3
            if(me->x <= 510.0) {
                add1_u = false;
                remove1_u = false;
                add2_u = false;
                remove2_u = true;
                y2_u = 0.0;

                // Next state is c1
                state_u = CONTROLLER_C1;
            }
            else if(me->x > 510.0) {
                y1_u = me->y1 + 1.0 * STEP_SIZE;
                y2_u = me->y2 + 1.0 * STEP_SIZE;

                // Remain in this state
                state_u = CONTROLLER_C3;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->add1 = add1_u;
    me->remove1 = remove1_u;
    me->add2 = add2_u;
    me->remove2 = remove2_u;

    me->y1 = y1_u;
    me->y2 = y2_u;

}