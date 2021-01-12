#include "inward_rectifier_potassium_current.h"

// inward_rectifier_potassium_current Initialisation function
void InwardRectifierPotassiumCurrentInit(InwardRectifierPotassiumCurrent* me) {
    // Initialise State
    me->state = INWARD_RECTIFIER_POTASSIUM_CURRENT_Q0;

    // Initialise Outputs
    me->i_k1 = 0.0;

    // Initialise Internal Variables
    me->xk1_inf = 0.0;
    me->alpha_k1 = 0.0;
    me->beta_k1 = 0.0;
}

// inward_rectifier_potassium_current Execution function
void InwardRectifierPotassiumCurrentRun(InwardRectifierPotassiumCurrent* me) {
    // Create intermediary variables
    enum InwardRectifierPotassiumCurrentStates state_u = me->state;
    double i_k1_u = me->i_k1;

    double xk1_inf_u = me->xk1_inf;
    double alpha_k1_u = me->alpha_k1;
    double beta_k1_u = me->beta_k1;


    // Run the state machine for transition logic
    switch(me->state) {
        case INWARD_RECTIFIER_POTASSIUM_CURRENT_Q0: // Logic for state q0
            if(true) {
                alpha_k1_u = 0.1 / (1.0 + exp(0.06 * ((me->v - me->e_k) - 200.0)));
                beta_k1_u = (3.0 * exp(2.0E-4 * ((me->v - me->e_k) + 100.0)) + exp(0.1 * ((me->v - me->e_k) - 10.0))) / (1.0 + exp(-0.5 * (me->v - me->e_k)));
                xk1_inf_u = me->alpha_k1 / (me->alpha_k1 + me->beta_k1);
                i_k1_u = 5.405 * me->xk1_inf * sqrt(me->k_o / 5.4) * (me->v - me->e_k) * 1.0000000000000002;

                // Remain in this state
                state_u = INWARD_RECTIFIER_POTASSIUM_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_k1 = i_k1_u;

    me->xk1_inf = xk1_inf_u;
    me->alpha_k1 = alpha_k1_u;
    me->beta_k1 = beta_k1_u;

}