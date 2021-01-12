#include "ionic_concentrations.h"

// ionic_concentrations Initialisation function
void IonicConcentrationsInit(IonicConcentrations* me) {
    // Initialise State
    me->state = IONIC_CONCENTRATIONS_Q0;

    // Initialise Outputs
    me->nai = 10.0;
    me->nao = 140.0;
    me->cai = 1.2E-4;
    me->cao = 1.8;
    me->ki = 145.0;
    me->ko = 5.4;
    me->ca_jsr = 1.8;
    me->ca_nsr = 1.8;
}

// ionic_concentrations Execution function
void IonicConcentrationsRun(IonicConcentrations* me) {
    // Create intermediary variables
    enum IonicConcentrationsStates state_u = me->state;
    double nai_u = me->nai;
    double nao_u = me->nao;
    double cai_u = me->cai;
    double cao_u = me->cao;
    double ki_u = me->ki;
    double ko_u = me->ko;
    double ca_jsr_u = me->ca_jsr;
    double ca_nsr_u = me->ca_nsr;


    // Run the state machine for transition logic
    switch(me->state) {
        case IONIC_CONCENTRATIONS_Q0: // Logic for state q0
            if(true) {
                nai_u = me->nai + -(me->i_na + me->i_cana + me->i_na_b + me->i_ns_na + me->i_naca * 3.0 + me->i_nak * 3.0) * (200.0 / (0.68 * me->f)) * 1.0000000000000002 * STEP_SIZE;
                cai_u = me->cai + (-((me->i_caca + me->i_p_ca + me->i_ca_b) - me->i_naca) * (200.0 / (2.0 * 0.68 * me->f)) + me->i_rel * (0.0048 / 0.68) * 0.9999999999999999 + (me->i_leak - me->i_up) * (0.0552 / 0.68) * 0.9999999999999999) * 1.0000000000000002 * STEP_SIZE;
                ki_u = me->ki + -(me->i_cak + me->i_k + me->i_k1 + me->i_kp + me->i_ns_k + -(me->i_nak * 2.0)) * (200.0 / (0.68 * me->f)) * 1.0000000000000002 * STEP_SIZE;
                ca_jsr_u = me->ca_jsr + -(me->i_rel - me->i_tr * (0.0552 / 0.0048)) * STEP_SIZE;
                ca_nsr_u = me->ca_nsr + -((me->i_leak + me->i_tr) - me->i_up) * STEP_SIZE;

                // Remain in this state
                state_u = IONIC_CONCENTRATIONS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->nai = nai_u;
    me->nao = nao_u;
    me->cai = cai_u;
    me->cao = cao_u;
    me->ki = ki_u;
    me->ko = ko_u;
    me->ca_jsr = ca_jsr_u;
    me->ca_nsr = ca_nsr_u;

}