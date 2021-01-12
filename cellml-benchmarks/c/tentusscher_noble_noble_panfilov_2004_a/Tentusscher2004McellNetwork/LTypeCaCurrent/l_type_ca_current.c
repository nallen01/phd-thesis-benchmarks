#include "l_type_ca_current.h"

// L_type_Ca_current Initialisation function
void LTypeCaCurrentInit(LTypeCaCurrent* me) {
    // Initialise State
    me->state = L_TYPE_CA_CURRENT_Q0;

    // Initialise Outputs
    me->i_cal = 0.0;
    me->ca_i_private = 0.0;
    me->time_private = 0.0;
    me->v_private = 0.0;
    me->d = 0.0;

    // Initialise Internal Variables
    me->f1 = 0.0;
    me->f_ca = 0.0;
}

// L_type_Ca_current Execution function
void LTypeCaCurrentRun(LTypeCaCurrent* me) {
    // Create intermediary variables
    enum LTypeCaCurrentStates state_u = me->state;
    double i_cal_u = me->i_cal;
    double ca_i_private_u = me->ca_i_private;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;
    double d_u = me->d;

    double f1_u = me->f1;
    double f_ca_u = me->f_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CURRENT_Q0: // Logic for state q0
            if(true) {
                i_cal_u = (((1.75E-4 * me->d * me->f1 * me->f_ca * 4.0 * me->v * (pow(me->f, 2.0))) / (me->r * me->t)) * (me->ca_i * exp((2.0 * me->v * me->f) / (me->r * me->t)) - 0.341 * me->ca_o)) / (exp((2.0 * me->v * me->f) / (me->r * me->t)) - 1.0);
                ca_i_private_u = me->ca_i;
                time_private_u = me->time;
                v_private_u = me->v;
                d_u = me->d_private;
                f1_u = me->f1_private;
                f_ca_u = me->fca_private;

                // Remain in this state
                state_u = L_TYPE_CA_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_cal = i_cal_u;
    me->ca_i_private = ca_i_private_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;
    me->d = d_u;

    me->f1 = f1_u;
    me->f_ca = f_ca_u;

}