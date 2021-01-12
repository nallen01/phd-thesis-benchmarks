#include "intracellular_ion_concentrations.h"

static double CaIPw(double time) {
    if(time < 1.0) {
        return 1000.0 * 1.8433;
    }
    else if(time >= 10.0 && time < 15.0) {
        return 1000.0 * (((1.055 * (pow(time / 1000.0, 3.0)) - 0.03507 * (pow(time / 1000.0, 2.0))) + (3.992E-4 * time) / 1000.0) - 1.356);
    }
    else if(time >= 15.0 && time < 55.0) {
        return 1000.0 * (((0.014 * (pow(time / 1000.0, 3.0)) - 0.002555 * (pow(time / 1000.0, 2.0))) + (1.494E-4 * time) / 1000.0) - 1.428);
    }
    else if(time >= 55.0 && time < 250.0) {
        return 1000.0 * (((1.739 * (pow(time / 1000.0, 3.0)) - 3.209 * (pow(time / 1000.0, 2.0))) - (5.689 * time) / 1000.0) + 1.719);
    }
    else if(time >= 250.0 && time < 490.0) {
        return 1000.0 * ((((1.321E-4 * (pow(time / 1000.0, 4.0)) - 2.197E-4 * (pow(time / 1000.0, 3.0))) + 1.374E-4 * (pow(time / 1000.0, 2.0))) - (3.895 * time) / 1000.0) + 4.441);
    }
    else {
        return 1000.0 * 1.2148;
    }
}


// intracellular_ion_concentrations Initialisation function
void IntracellularIonConcentrationsInit(IntracellularIonConcentrations* me) {
    // Initialise State
    me->state = INTRACELLULAR_ION_CONCENTRATIONS_Q0;

    // Initialise Outputs
    me->ca_i = 0.0;
    me->ca_b = 0.0;
    me->trpn = 0.067593139865;
}

// intracellular_ion_concentrations Execution function
void IntracellularIonConcentrationsRun(IntracellularIonConcentrations* me) {
    // Create intermediary variables
    enum IntracellularIonConcentrationsStates state_u = me->state;
    double ca_i_u = me->ca_i;
    double ca_b_u = me->ca_b;
    double trpn_u = me->trpn;


    // Run the state machine for transition logic
    switch(me->state) {
        case INTRACELLULAR_ION_CONCENTRATIONS_Q0: // Logic for state q0
            if(true) {
                trpn_u = me->trpn + me->j_trpn * STEP_SIZE;

                ca_b_u = me->ca_trpn_max - trpn_u;
                ca_i_u = CaIPw(me->time);

                // Remain in this state
                state_u = INTRACELLULAR_ION_CONCENTRATIONS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->ca_i = ca_i_u;
    me->ca_b = ca_b_u;
    me->trpn = trpn_u;

}