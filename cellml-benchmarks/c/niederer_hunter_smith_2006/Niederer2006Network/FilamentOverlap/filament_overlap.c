#include "filament_overlap.h"

// filament_overlap Initialisation function
void FilamentOverlapInit(FilamentOverlap* me) {
    // Initialise State
    me->state = FILAMENT_OVERLAP_Q0;

    // Initialise Outputs
    me->overlap = 0.0;
    me->beta_0 = 4.9;
}

// filament_overlap Execution function
void FilamentOverlapRun(FilamentOverlap* me) {
    // Create intermediary variables
    enum FilamentOverlapStates state_u = me->state;
    double overlap_u = me->overlap;
    double beta_0_u = me->beta_0;


    // Run the state machine for transition logic
    switch(me->state) {
        case FILAMENT_OVERLAP_Q0: // Logic for state q0
            if(true) {
                overlap_u = 1.0 + me->beta_0 * (me->lambda - 1.0);

                // Remain in this state
                state_u = FILAMENT_OVERLAP_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->overlap = overlap_u;
    me->beta_0 = beta_0_u;

}