#include "non_specific_calcium_activated_current.h"

// non_specific_calcium_activated_current Initialisation function
void NonSpecificCalciumActivatedCurrentInit(NonSpecificCalciumActivatedCurrent* me) {
    // Initialise State
    me->state = NON_SPECIFIC_CALCIUM_ACTIVATED_CURRENT_Q0;

    // Initialise Outputs
    me->i_ns_ca = 0.0;
    me->i_ns_na = 0.0;
    me->i_ns_k = 0.0;

    // Initialise Internal Variables
    me->i_ns_na1 = 0.0;
    me->i_ns_k1 = 0.0;
    me->vns = 0.0;
    me->ens_ca = 0.0;
}

// non_specific_calcium_activated_current Execution function
void NonSpecificCalciumActivatedCurrentRun(NonSpecificCalciumActivatedCurrent* me) {
    // Create intermediary variables
    enum NonSpecificCalciumActivatedCurrentStates state_u = me->state;
    double i_ns_ca_u = me->i_ns_ca;
    double i_ns_na_u = me->i_ns_na;
    double i_ns_k_u = me->i_ns_k;

    double i_ns_na1_u = me->i_ns_na1;
    double i_ns_k1_u = me->i_ns_k1;
    double vns_u = me->vns;
    double ens_ca_u = me->ens_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case NON_SPECIFIC_CALCIUM_ACTIVATED_CURRENT_Q0: // Logic for state q0
            if(true) {
                ens_ca_u = ((me->r * me->t) / me->f) * log((me->ko + me->nao) / (me->ki + me->nai)) * 0.9999999999999998;
                vns_u = me->v - me->ens_ca;
                i_ns_na_u = me->i_ns_na1 * (1.0 / (1.0 + pow(0.0012 / me->cai, 3.0)));
                i_ns_k_u = me->i_ns_k1 * (1.0 / (1.0 + pow(0.0012 / me->cai, 3.0)));
                i_ns_ca_u = me->i_ns_na + me->i_ns_k;
                i_ns_na1_u = 1.75E-9 * (pow(1.0, 2.0)) * ((me->vns * (pow(me->f, 2.0))) / (me->r * me->t)) * ((me->gamma_nai * me->nai * exp((1.0 * me->vns * me->f) / (me->r * me->t)) - me->gamma_nao * me->nao) / (exp((1.0 * me->vns * me->f) / (me->r * me->t)) - 1.0)) * 0.9999999999999999;
                i_ns_k1_u = 1.75E-9 * (pow(1.0, 2.0)) * ((me->vns * (pow(me->f, 2.0))) / (me->r * me->t)) * ((me->gamma_ki * me->ki * exp((1.0 * me->vns * me->f) / (me->r * me->t)) - me->gamma_ko * me->ko) / (exp((1.0 * me->vns * me->f) / (me->r * me->t)) - 1.0)) * 0.9999999999999999;

                // Remain in this state
                state_u = NON_SPECIFIC_CALCIUM_ACTIVATED_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_ns_ca = i_ns_ca_u;
    me->i_ns_na = i_ns_na_u;
    me->i_ns_k = i_ns_k_u;

    me->i_ns_na1 = i_ns_na1_u;
    me->i_ns_k1 = i_ns_k1_u;
    me->vns = vns_u;
    me->ens_ca = ens_ca_u;

}