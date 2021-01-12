#include "thin_filament_kinetics.h"

// thin_filament_kinetics Initialisation function
void ThinFilamentKineticsInit(ThinFilamentKinetics* me) {
    // Initialise State
    me->state = THIN_FILAMENT_KINETICS_Q0;

    // Initialise Outputs
    me->to = 0.0;

    // Initialise Internal Variables
    me->z = 0.0;
    me->pc_50 = 0.0;
    me->n = 4.5;
}

// thin_filament_kinetics Execution function
void ThinFilamentKineticsRun(ThinFilamentKinetics* me) {
    // Create intermediary variables
    enum ThinFilamentKineticsStates state_u = me->state;
    double to_u = me->to;

    double z_u = me->z;
    double pc_50_u = me->pc_50;
    double n_u = me->n;


    // Run the state machine for transition logic
    switch(me->state) {
        case THIN_FILAMENT_KINETICS_Q0: // Logic for state q0
            if(true) {
                z_u = me->z + 2.0 * ((pow(me->ca_b / 1.0, me->n)) * (1.0 - me->z) - me->z) * STEP_SIZE;

                to_u = 100.0 * (1.0 + 1.45 * (me->lambda - 1.0)) * z_u;
                n_u = 6.9 * (1.0 + 1.95 * (me->lambda - 1.0));
                pc_50_u = 6.2 * (1.0 + 0.31 * (me->lambda - 1.0));

                // Remain in this state
                state_u = THIN_FILAMENT_KINETICS_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->to = to_u;

    me->z = z_u;
    me->pc_50 = pc_50_u;
    me->n = n_u;

}