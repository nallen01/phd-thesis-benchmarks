#include "cross_bridges.h"

static double TensionPw(double q, double t_0) {
    if(q < 0.0) {
        return (t_0 * (0.35 * q + 1.0)) / (1.0 - q);
    }
    else {
        return (t_0 * (1.0 + (0.35 + 2.0) * q)) / (1.0 + q);
    }
}


// Cross_Bridges Initialisation function
void CrossBridgesInit(CrossBridges* me) {
    // Initialise State
    me->state = CROSS_BRIDGES_Q0;

    // Initialise Outputs
    me->tension = 0.0;

    // Initialise Internal Variables
    me->q = 0.0;
    me->q_1 = 0.0;
    me->q_2 = 0.0;
    me->q_3 = 0.0;
}

// Cross_Bridges Execution function
void CrossBridgesRun(CrossBridges* me) {
    // Create intermediary variables
    enum CrossBridgesStates state_u = me->state;
    double tension_u = me->tension;

    double q_u = me->q;
    double q_1_u = me->q_1;
    double q_2_u = me->q_2;
    double q_3_u = me->q_3;


    // Run the state machine for transition logic
    switch(me->state) {
        case CROSS_BRIDGES_Q0: // Logic for state q0
            if(true) {
                q_1_u = me->q_1 + (-29.0 * me->d_extension_ratiodt - 0.03 * me->q_1) * STEP_SIZE;
                q_2_u = me->q_2 + (138.0 * me->d_extension_ratiodt - 0.13 * me->q_2) * STEP_SIZE;
                q_3_u = me->q_3 + (129.0 * me->d_extension_ratiodt - 0.625 * me->q_3) * STEP_SIZE;

                q_u = q_1_u + q_2_u + q_3_u;
                tension_u = TensionPw(me->q, me->t_0);

                // Remain in this state
                state_u = CROSS_BRIDGES_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->tension = tension_u;

    me->q = q_u;
    me->q_1 = q_1_u;
    me->q_2 = q_2_u;
    me->q_3 = q_3_u;

}