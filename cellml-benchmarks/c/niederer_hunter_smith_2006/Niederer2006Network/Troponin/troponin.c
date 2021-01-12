#include "troponin.h"

static double KOffPw(double tension, double gamma_trpn, double t_ref, double k_ref_off) {
    if(1.0 - tension / (gamma_trpn * t_ref) > 0.1) {
        return k_ref_off * (1.0 - tension / (gamma_trpn * t_ref));
    }
    else {
        return k_ref_off * 0.1;
    }
}


// troponin Initialisation function
void TroponinInit(Troponin* me) {
    // Initialise State
    me->state = TROPONIN_Q0;

    // Initialise Outputs
    me->j_trpn = 0.0;
    me->ca_trpn_max = 0.07;
    me->k_on = 100.0;
    me->k_ref_off = 0.2;
    me->gamma_trpn = 2.0;

    // Initialise Internal Variables
    me->k_off = 0.0;
}

// troponin Execution function
void TroponinRun(Troponin* me) {
    // Create intermediary variables
    enum TroponinStates state_u = me->state;
    double j_trpn_u = me->j_trpn;
    double ca_trpn_max_u = me->ca_trpn_max;
    double k_on_u = me->k_on;
    double k_ref_off_u = me->k_ref_off;
    double gamma_trpn_u = me->gamma_trpn;

    double k_off_u = me->k_off;


    // Run the state machine for transition logic
    switch(me->state) {
        case TROPONIN_Q0: // Logic for state q0
            if(true) {
                k_off_u = KOffPw(me->tension, me->gamma_trpn, me->t_ref, me->k_ref_off);
                j_trpn_u = (me->ca_trpn_max - me->trpn) * me->k_off - me->ca_i * me->trpn * me->k_on;

                // Remain in this state
                state_u = TROPONIN_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->j_trpn = j_trpn_u;
    me->ca_trpn_max = ca_trpn_max_u;
    me->k_on = k_on_u;
    me->k_ref_off = k_ref_off_u;
    me->gamma_trpn = gamma_trpn_u;

    me->k_off = k_off_u;

}