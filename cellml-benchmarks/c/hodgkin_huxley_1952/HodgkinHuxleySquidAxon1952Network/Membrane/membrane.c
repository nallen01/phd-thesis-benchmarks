#include "membrane.h"

static double IStimPw(double time) {
    if(time >= 10.0 && time <= 10.5) {
        return 20.0;
    }
    else {
        return 0.0;
    }
}


// membrane Initialisation function
void MembraneInit(Membrane* me) {
    // Initialise State
    me->state = MEMBRANE_Q0;

    // Initialise Outputs
    me->v = -75.0;
    me->e_r = -75.0;

    // Initialise Internal Variables
    me->i_stim = 0.0;
}

// membrane Execution function
void MembraneRun(Membrane* me) {
    // Create intermediary variables
    enum MembraneStates state_u = me->state;
    double v_u = me->v;
    double e_r_u = me->e_r;

    double i_stim_u = me->i_stim;


    // Run the state machine for transition logic
    switch(me->state) {
        case MEMBRANE_Q0: // Logic for state q0
            if(true) {
                v_u = me->v + (-(-me->i_stim + me->i_na + me->i_k + me->i_l) / 1.0) * STEP_SIZE;

                i_stim_u = IStimPw(me->time);

                // Remain in this state
                state_u = MEMBRANE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->v = v_u;
    me->e_r = e_r_u;

    me->i_stim = i_stim_u;

}