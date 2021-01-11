#include "cell11.h"

static double F(double theta) {
    double relative;

    relative = 120 * theta;
    return -530 - relative;
}


// Cell11 Initialisation function
void Cell11Init(Cell11* me) {
    // Initialise State
    me->state = CELL11_RP;

    // Initialise Outputs
    me->v = 0;

    // Initialise Internal Variables
    me->theta = 0;
    me->t = 0;
}

// Cell11 Execution function
void Cell11Run(Cell11* me) {
    // Create intermediary variables
    enum Cell11States state_u = me->state;
    double v_u = me->v;

    double theta_u = me->theta;
    double t_u = me->t;


    // Run the state machine for transition logic
    switch(me->state) {
        case CELL11_RP: // Logic for state RP
            if(me->g >= 44.5) {
                theta_u = 9.988E-4 / me->t;

                // Next state is ST
                state_u = CELL11_ST;
            }
            else if(me->v == 0 && me->g < 44.5) {
                v_u = me->v + 0 * STEP_SIZE;
                t_u = me->t + 1 * STEP_SIZE;

                // Remain in this state
                state_u = CELL11_RP;
            }
            break;
        case CELL11_ST: // Logic for state ST
            if(me->g <= 0 && me->v < 44.5) {
                // Next state is RRP
                state_u = CELL11_RRP;
            }
            else if(me->v >= 44.5) {
                // Next state is UP
                state_u = CELL11_UP;
            }
            else if(me->v < 44.5 && me->g > 0) {
                v_u = me->v + 1000 * me->g * STEP_SIZE;
                t_u = me->t + 1 * STEP_SIZE;

                if(v_u < 44.5 && me->v > 44.5) {
                    // Need to saturate v to 44.5
                    v_u = 44.5;
                }

                // Remain in this state
                state_u = CELL11_ST;
            }
            break;
        case CELL11_UP: // Logic for state UP
            if(me->v >= 131.1 - 80 * me->theta) {
                // Next state is ERP
                state_u = CELL11_ERP;
            }
            else if(me->v < 131.1 - 80 * me->theta) {
                v_u = me->v + 29100 * STEP_SIZE;
                t_u = me->t + 1 * STEP_SIZE;

                if(v_u < 131.1 - 80 * me->theta && me->v > 131.1 - 80 * me->theta) {
                    // Need to saturate v to 131.1 - 80 * me->theta
                    v_u = 131.1 - 80 * me->theta;
                }

                // Remain in this state
                state_u = CELL11_UP;
            }
            break;
        case CELL11_ERP: // Logic for state ERP
            if(me->v <= 30) {
                t_u = 0;

                // Next state is RRP
                state_u = CELL11_RRP;
            }
            else if(me->v > 30) {
                v_u = me->v + F(me->theta) * STEP_SIZE;
                t_u = me->t + 1 * STEP_SIZE;

                if(v_u > 30 && me->v < 30) {
                    // Need to saturate v to 30
                    v_u = 30;
                }

                // Remain in this state
                state_u = CELL11_ERP;
            }
            break;
        case CELL11_RRP: // Logic for state RRP
            if(me->g >= 44.5) {
                theta_u = 9.988E-4 / me->t;

                // Next state is ST
                state_u = CELL11_ST;
            }
            else if(me->v > 0 && me->g < 44.5) {
                v_u = me->v + -1600 * STEP_SIZE;
                t_u = me->t + 1 * STEP_SIZE;

                // Remain in this state
                state_u = CELL11_RRP;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->v = v_u;

    me->theta = theta_u;
    me->t = t_u;

}