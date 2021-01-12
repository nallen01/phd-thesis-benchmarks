#include "membrane.h"

static double IStimPw(double time) {
    if(time - floor(time / 1000.0) * 1000.0 >= 10.0 && time - floor(time / 1000.0) * 1000.0 <= 10.0 + 1.0) {
        return -52.0;
    }
    else {
        return 0.0;
    }
}


// membrane Initialisation function
void MembraneInit(Membrane* me) {
    // Initialise State
    me->state = MEMBRANE_Q0;

    // Initialise Outputs
    me->v = -86.2;
    me->r = 8314.472;
    me->t = 310.0;
    me->f = 96485.3415;
    me->cm = 0.185;
    me->v_c = 0.016404;
    me->i_stim = 0.0;
}

// membrane Execution function
void MembraneRun(Membrane* me) {
    // Create intermediary variables
    enum MembraneStates state_u = me->state;
    double v_u = me->v;
    double r_u = me->r;
    double t_u = me->t;
    double f_u = me->f;
    double cm_u = me->cm;
    double v_c_u = me->v_c;
    double i_stim_u = me->i_stim;


    // Run the state machine for transition logic
    switch(me->state) {
        case MEMBRANE_Q0: // Logic for state q0
            if(true) {
                v_u = me->v + (-1.0 / 1.0) * (me->i_k1 + me->i_to + me->i_kr + me->i_ks + me->i_cal + me->i_nak + me->i_na + me->i_b_na + me->i_naca + me->i_b_ca + me->i_p_k + me->i_p_ca + me->i_stim) * STEP_SIZE;

                i_stim_u = IStimPw(me->time);

                // Remain in this state
                state_u = MEMBRANE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->v = v_u;
    me->r = r_u;
    me->t = t_u;
    me->f = f_u;
    me->cm = cm_u;
    me->v_c = v_c_u;
    me->i_stim = i_stim_u;

}