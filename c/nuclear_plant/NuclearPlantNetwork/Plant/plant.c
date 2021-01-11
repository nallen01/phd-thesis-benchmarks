#include "plant.h"

// Plant Initialisation function
void PlantInit(Plant* me) {
    // Initialise State
    me->state = PLANT_P1;

    // Initialise Outputs
    me->x = 510;
}

// Plant Execution function
void PlantRun(Plant* me) {
    // Create intermediary variables
    enum PlantStates state_u = me->state;
    double x_u = me->x;


    // Run the state machine for transition logic
    switch(me->state) {
        case PLANT_P1: // Logic for state p1
            if(me->add1) {
                x_u = 550;

                // Next state is p2
                state_u = PLANT_P2;
            }
            else if(me->add2) {
                x_u = 550;

                // Next state is p3
                state_u = PLANT_P3;
            }
            else if(!me->add1 && !me->add2) {
                x_u = me->x + (0.1 * me->x - 50) * STEP_SIZE;

                // Remain in this state
                state_u = PLANT_P1;
            }
            break;
        case PLANT_P2: // Logic for state p2
            if(me->remove1) {
                x_u = 510;

                // Next state is p1
                state_u = PLANT_P1;
            }
            else if(!me->remove1) {
                x_u = me->x + (0.1 * me->x - 56) * STEP_SIZE;

                // Remain in this state
                state_u = PLANT_P2;
            }
            break;
        case PLANT_P3: // Logic for state p3
            if(me->remove2) {
                x_u = 510;

                // Next state is p1
                state_u = PLANT_P1;
            }
            else if(!me->remove2) {
                x_u = me->x + (0.1 * me->x - 60) * STEP_SIZE;

                // Remain in this state
                state_u = PLANT_P3;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->x = x_u;

}