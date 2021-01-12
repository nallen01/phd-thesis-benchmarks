#include "plateau_potassium_current.h"

// plateau_potassium_current Initialisation function
void PlateauPotassiumCurrentInit(PlateauPotassiumCurrent* me) {
    // Initialise State
    me->state = PLATEAU_POTASSIUM_CURRENT_Q0;

    // Initialise Outputs
    me->i_kp = 0.0;

    // Initialise Internal Variables
    me->e_kp = 0.0;
    me->kp = 0.0;
}

// plateau_potassium_current Execution function
void PlateauPotassiumCurrentRun(PlateauPotassiumCurrent* me) {
    // Create intermediary variables
    enum PlateauPotassiumCurrentStates state_u = me->state;
    double i_kp_u = me->i_kp;

    double e_kp_u = me->e_kp;
    double kp_u = me->kp;


    // Run the state machine for transition logic
    switch(me->state) {
        case PLATEAU_POTASSIUM_CURRENT_Q0: // Logic for state q0
            if(true) {
                e_kp_u = me->e_k1;
                kp_u = 1.0 / (1.0 + exp((7.488 - me->v) / 5.98));
                i_kp_u = 1.83E-4 * me->kp * (me->v - me->e_kp);

                // Remain in this state
                state_u = PLATEAU_POTASSIUM_CURRENT_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_kp = i_kp_u;

    me->e_kp = e_kp_u;
    me->kp = kp_u;

}