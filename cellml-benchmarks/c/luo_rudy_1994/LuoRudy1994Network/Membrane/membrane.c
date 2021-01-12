#include "membrane.h"

// membrane Initialisation function
void MembraneInit(Membrane* me) {
    // Initialise State
    me->state = MEMBRANE_Q0;

    // Initialise Outputs
    me->v = -84.624;
    me->r = 8314.5;
    me->t = 310.0;
    me->f = 96845.0;
    me->dv_dt = 0.0;
    me->i_stim_c = 0.0;
}

// membrane Execution function
void MembraneRun(Membrane* me) {
    // Create intermediary variables
    enum MembraneStates state_u = me->state;
    double v_u = me->v;
    double r_u = me->r;
    double t_u = me->t;
    double f_u = me->f;
    double dv_dt_u = me->dv_dt;
    double i_stim_c_u = me->i_stim_c;


    // Run the state machine for transition logic
    switch(me->state) {
        case MEMBRANE_Q0: // Logic for state q0
            if(true) {
                v_u = me->v + me->dv_dt * STEP_SIZE;

                dv_dt_u = (0.0 - (me->i_na + me->i_ca_l + me->i_k + me->i_k1 + me->i_kp + me->i_naca + me->i_p_ca + me->i_na_b + me->i_ca_b + me->i_nak + me->i_ns_ca)) / 0.01;
                i_stim_c_u = 0.0;

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
    me->dv_dt = dv_dt_u;
    me->i_stim_c = i_stim_c_u;

}