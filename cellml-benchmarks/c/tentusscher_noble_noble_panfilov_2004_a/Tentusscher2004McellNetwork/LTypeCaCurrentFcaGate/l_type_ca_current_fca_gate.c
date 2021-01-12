#include "l_type_ca_current_fca_gate.h"

static double FcaPw(double fca_inf, double f_ca, double v, double d_fca) {
    if(fca_inf > f_ca && v > -60.0) {
        return 0.0;
    }
    else {
        return d_fca;
    }
}


// L_type_Ca_current_fCa_gate Initialisation function
void LTypeCaCurrentFcaGateInit(LTypeCaCurrentFcaGate* me) {
    // Initialise State
    me->state = L_TYPE_CA_CURRENT_FCA_GATE_Q0;

    // Initialise Outputs
    me->f_ca = 1.0;

    // Initialise Internal Variables
    me->alpha_fca = 0.0;
    me->beta_fca = 0.0;
    me->gama_fca = 0.0;
    me->fca_inf = 0.0;
    me->tau_fca = 0.0;
    me->d_fca = 0.0;
}

// L_type_Ca_current_fCa_gate Execution function
void LTypeCaCurrentFcaGateRun(LTypeCaCurrentFcaGate* me) {
    // Create intermediary variables
    enum LTypeCaCurrentFcaGateStates state_u = me->state;
    double f_ca_u = me->f_ca;

    double alpha_fca_u = me->alpha_fca;
    double beta_fca_u = me->beta_fca;
    double gama_fca_u = me->gama_fca;
    double fca_inf_u = me->fca_inf;
    double tau_fca_u = me->tau_fca;
    double d_fca_u = me->d_fca;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CURRENT_FCA_GATE_Q0: // Logic for state q0
            if(true) {
                f_ca_u = me->f_ca + FcaPw(me->fca_inf, me->f_ca, me->v, me->d_fca) * STEP_SIZE;

                alpha_fca_u = 1.0 / (1.0 + pow(me->ca_i / 3.25E-4, 8.0));
                beta_fca_u = 0.1 / (1.0 + exp((me->ca_i - 5.0E-4) / 1.0E-4));
                gama_fca_u = 0.2 / (1.0 + exp((me->ca_i - 7.5E-4) / 8.0E-4));
                fca_inf_u = (me->alpha_fca + me->beta_fca + me->gama_fca + 0.23) / 1.46;
                tau_fca_u = 2.0;
                d_fca_u = (me->fca_inf - f_ca_u) / me->tau_fca;

                // Remain in this state
                state_u = L_TYPE_CA_CURRENT_FCA_GATE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->f_ca = f_ca_u;

    me->alpha_fca = alpha_fca_u;
    me->beta_fca = beta_fca_u;
    me->gama_fca = gama_fca_u;
    me->fca_inf = fca_inf_u;
    me->tau_fca = tau_fca_u;
    me->d_fca = d_fca_u;

}