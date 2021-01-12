#include "calcium_fluxes_in_the_sr.h"

static double GRelPeakPw() {
    if(0.0 < 1.8E-4) {
        return 0.0;
    }
    else {
        return 60.0;
    }
}


// calcium_fluxes_in_the_SR Initialisation function
void CalciumFluxesInTheSrInit(CalciumFluxesInTheSr* me) {
    // Initialise State
    me->state = CALCIUM_FLUXES_IN_THE_SR_Q0;

    // Initialise Outputs
    me->i_rel = 0.0;
    me->i_up = 0.0;
    me->i_leak = 0.0;
    me->i_tr = 0.0;

    // Initialise Internal Variables
    me->g_rel = 0.0;
    me->g_rel_peak = 0.0;
    me->k_leak = 0.0;
}

// calcium_fluxes_in_the_SR Execution function
void CalciumFluxesInTheSrRun(CalciumFluxesInTheSr* me) {
    // Create intermediary variables
    enum CalciumFluxesInTheSrStates state_u = me->state;
    double i_rel_u = me->i_rel;
    double i_up_u = me->i_up;
    double i_leak_u = me->i_leak;
    double i_tr_u = me->i_tr;

    double g_rel_u = me->g_rel;
    double g_rel_peak_u = me->g_rel_peak;
    double k_leak_u = me->k_leak;


    // Run the state machine for transition logic
    switch(me->state) {
        case CALCIUM_FLUXES_IN_THE_SR_Q0: // Logic for state q0
            if(true) {
                i_rel_u = me->g_rel * (me->ca_jsr - me->cai);
                g_rel_u = me->g_rel_peak * ((0.0 - 1.8E-4) / ((8.0E-4 + 0.0) - 1.8E-4)) * (1.0 - exp(-(0.0 / 2.0))) * exp(-(0.0 / 2.0)) * 0.9999999999999999;
                g_rel_peak_u = GRelPeakPw();
                i_up_u = 0.005 * (me->cai / (me->cai + 9.2E-4)) * 0.9999999999999999;
                i_leak_u = me->k_leak * me->ca_nsr;
                k_leak_u = (0.005 / 15.0) * 0.9999999999999999;
                i_tr_u = (me->ca_nsr - me->ca_jsr) / 180.0;

                // Remain in this state
                state_u = CALCIUM_FLUXES_IN_THE_SR_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_rel = i_rel_u;
    me->i_up = i_up_u;
    me->i_leak = i_leak_u;
    me->i_tr = i_tr_u;

    me->g_rel = g_rel_u;
    me->g_rel_peak = g_rel_peak_u;
    me->k_leak = k_leak_u;

}