#include "crossbridge_kinetics.h"

// crossbridge_kinetics Initialisation function
void CrossbridgeKineticsInit(CrossbridgeKinetics* me) {
    // Initialise State
    me->state = CROSSBRIDGE_KINETICS_Q0;

    // Initialise Outputs
    me->t = 0.0;

    // Initialise Internal Variables
    me->q = 0.0;
    me->dlambda_dt = 0.0;
}

// crossbridge_kinetics Execution function
void CrossbridgeKineticsRun(CrossbridgeKinetics* me) {
    // Create intermediary variables
    enum CrossbridgeKineticsStates state_u = me->state;
    double t_u = me->t;

    double q_u = me->q;
    double dlambda_dt_u = me->dlambda_dt;


    // Run the state machine for transition logic
    switch(me->state) {
        case CROSSBRIDGE_KINETICS_Q0: // Logic for state q0
            if(true) {
                dlambda_dt_u = (33.0 / 50.0) * ((me->t / me->to - 1.0) / (me->t / me->to + 0.5));
                t_u = me->to * ((1.0 + 0.5 * me->q) / (1.0 - me->q));
                q_u = 50.0 * exp(-33.0 * (me->time - 0.0)) * me->dlambda_dt * 0.0 + 175.0 * exp(-2850.0 * (me->time - 0.0)) * me->dlambda_dt * 0.0 + 175.0 * exp(-2850.0 * (me->time - 0.0)) * me->dlambda_dt * 0.0;

                // Remain in this state
                state_u = CROSSBRIDGE_KINETICS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->t = t_u;

    me->q = q_u;
    me->dlambda_dt = dlambda_dt_u;

}