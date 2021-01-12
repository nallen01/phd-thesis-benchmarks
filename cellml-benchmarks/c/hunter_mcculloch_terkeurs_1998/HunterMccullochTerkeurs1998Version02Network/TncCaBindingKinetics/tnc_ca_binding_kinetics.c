#include "tnc_ca_binding_kinetics.h"

// TnC_Ca_binding_kinetics Initialisation function
void TncCaBindingKineticsInit(TncCaBindingKinetics* me) {
    // Initialise State
    me->state = TNC_CA_BINDING_KINETICS_Q0;

    // Initialise Outputs
    me->ca_b = 0.0;
    me->lambda = 2.6;
}

// TnC_Ca_binding_kinetics Execution function
void TncCaBindingKineticsRun(TncCaBindingKinetics* me) {
    // Create intermediary variables
    enum TncCaBindingKineticsStates state_u = me->state;
    double ca_b_u = me->ca_b;
    double lambda_u = me->lambda;


    // Run the state machine for transition logic
    switch(me->state) {
        case TNC_CA_BINDING_KINETICS_Q0: // Logic for state q0
            if(true) {
                ca_b_u = me->ca_b + (100.0 * me->ca_i * (2.26 - me->ca_b) - 163.0 * me->ca_b * (1.0 - me->t / (me->lambda * me->to))) * STEP_SIZE;

                // Remain in this state
                state_u = TNC_CA_BINDING_KINETICS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->ca_b = ca_b_u;
    me->lambda = lambda_u;

}