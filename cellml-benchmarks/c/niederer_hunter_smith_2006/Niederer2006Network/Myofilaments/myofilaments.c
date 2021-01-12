#include "myofilaments.h"

static double ExtensionratioPw(double time) {
    if(time > 1000.0) {
        return 1.0;
    }
    else {
        return 1.0;
    }
}

static double LambdaPw(double extension_ratio) {
    if(extension_ratio > 0.8 && extension_ratio <= 1.15) {
        return extension_ratio;
    }
    else if(extension_ratio > 1.15) {
        return 1.15;
    }
    else {
        return 0.8;
    }
}


// Myofilaments Initialisation function
void MyofilamentsInit(Myofilaments* me) {
    // Initialise State
    me->state = MYOFILAMENTS_Q0;

    // Initialise Outputs
    me->lambda = 0.0;
    me->extension_ratio = 0.0;
    me->d_extension_ratiodt = 0.0;
    me->lambda_prev = 0.0;
}

// Myofilaments Execution function
void MyofilamentsRun(Myofilaments* me) {
    // Create intermediary variables
    enum MyofilamentsStates state_u = me->state;
    double lambda_u = me->lambda;
    double extension_ratio_u = me->extension_ratio;
    double d_extension_ratiodt_u = me->d_extension_ratiodt;
    double lambda_prev_u = me->lambda_prev;


    // Run the state machine for transition logic
    switch(me->state) {
        case MYOFILAMENTS_Q0: // Logic for state q0
            if(true) {
                extension_ratio_u = ExtensionratioPw(me->time);
                lambda_prev_u = me->extension_ratio;
                d_extension_ratiodt_u = 0.0;
                lambda_u = LambdaPw(me->extension_ratio);

                // Remain in this state
                state_u = MYOFILAMENTS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->lambda = lambda_u;
    me->extension_ratio = extension_ratio_u;
    me->d_extension_ratiodt = d_extension_ratiodt_u;
    me->lambda_prev = lambda_prev_u;

}