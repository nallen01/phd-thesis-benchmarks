#include "calcium_dynamics.h"

static double GInfPw(double ca_i) {
    if(ca_i < 3.5E-4) {
        return 1.0 / (1.0 + pow(ca_i / 3.5E-4, 6.0));
    }
    else {
        return 1.0 / (1.0 + pow(ca_i / 3.5E-4, 16.0));
    }
}

static double GPw(double g_inf, double g, double v, double d_g) {
    if(g_inf > g && v > -60.0) {
        return 0.0;
    }
    else {
        return d_g;
    }
}


// calcium_dynamics Initialisation function
void CalciumDynamicsInit(CalciumDynamics* me) {
    // Initialise State
    me->state = CALCIUM_DYNAMICS_Q0;

    // Initialise Outputs
    me->ca_i = 2.0E-4;
    me->ca_o = 2.0;

    // Initialise Internal Variables
    me->ca_sr = 0.2;
    me->i_rel = 0.0;
    me->i_up = 0.0;
    me->i_leak = 0.0;
    me->g = 1.0;
    me->g_inf = 0.0;
    me->ca_i_bufc = 0.0;
    me->ca_sr_bufsr = 0.0;
    me->d_g = 0.0;
}

// calcium_dynamics Execution function
void CalciumDynamicsRun(CalciumDynamics* me) {
    // Create intermediary variables
    enum CalciumDynamicsStates state_u = me->state;
    double ca_i_u = me->ca_i;
    double ca_o_u = me->ca_o;

    double ca_sr_u = me->ca_sr;
    double i_rel_u = me->i_rel;
    double i_up_u = me->i_up;
    double i_leak_u = me->i_leak;
    double g_u = me->g;
    double g_inf_u = me->g_inf;
    double ca_i_bufc_u = me->ca_i_bufc;
    double ca_sr_bufsr_u = me->ca_sr_bufsr;
    double d_g_u = me->d_g;


    // Run the state machine for transition logic
    switch(me->state) {
        case CALCIUM_DYNAMICS_Q0: // Logic for state q0
            if(true) {
                g_u = me->g + GPw(me->g_inf, me->g, me->v, me->d_g) * STEP_SIZE;
                ca_i_u = me->ca_i + me->ca_i_bufc * (((me->i_leak - me->i_up) + me->i_rel) - ((1.0 * ((me->i_cal + me->i_b_ca + me->i_p_ca) - 2.0 * me->i_naca)) / (2.0 * 1.0 * me->v_c * me->f)) * me->cm) * STEP_SIZE;
                ca_sr_u = me->ca_sr + ((me->ca_sr_bufsr * me->v_c) / 0.001094) * (me->i_up - (me->i_rel + me->i_leak)) * STEP_SIZE;

                i_rel_u = ((0.016464 * (pow(ca_sr_u, 2.0))) / (pow(0.25, 2.0) + pow(ca_sr_u, 2.0)) + 0.008232) * me->d * g_u;
                i_up_u = 4.25E-4 / (1.0 + (pow(2.5E-4, 2.0)) / (pow(ca_i_u, 2.0)));
                i_leak_u = 8.0E-5 * (ca_sr_u - ca_i_u);
                g_inf_u = GInfPw(ca_i_u);
                d_g_u = (me->g_inf - g_u) / 2.0;
                ca_i_bufc_u = 1.0 / (1.0 + (0.15 * 0.001) / (pow(ca_i_u + 0.001, 2.0)));
                ca_sr_bufsr_u = 1.0 / (1.0 + (10.0 * 0.3) / (pow(ca_sr_u + 0.3, 2.0)));

                // Remain in this state
                state_u = CALCIUM_DYNAMICS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->ca_i = ca_i_u;
    me->ca_o = ca_o_u;

    me->ca_sr = ca_sr_u;
    me->i_rel = i_rel_u;
    me->i_up = i_up_u;
    me->i_leak = i_leak_u;
    me->g = g_u;
    me->g_inf = g_inf_u;
    me->ca_i_bufc = ca_i_bufc_u;
    me->ca_sr_bufsr = ca_sr_bufsr_u;
    me->d_g = d_g_u;

}