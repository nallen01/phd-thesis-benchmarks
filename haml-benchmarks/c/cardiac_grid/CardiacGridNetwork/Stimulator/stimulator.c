#include "stimulator.h"

// Stimulator Initialisation function
void StimulatorInit(Stimulator* me) {
    // Initialise State
    me->state = STIMULATOR_COUNT;

    // Initialise Outputs
    me->v = 0.0;

    // Initialise Internal Variables
    me->t = 0.0;
}

// Stimulator Execution function
void StimulatorRun(Stimulator* me) {
    // Create intermediary variables
    enum StimulatorStates state_u = me->state;
    double v_u = me->v;

    double t_u = me->t;


    // Run the state machine for transition logic
    switch(me->state) {
        case STIMULATOR_COUNT: // Logic for state count
            if(me->t >= 1.0) {
                t_u = 0.0;
                v_u = 131.1;

                // Next state is stimulate
                state_u = STIMULATOR_STIMULATE;
            }
            else if(me->t < 1.0) {
                t_u = me->t + 1.0 * STEP_SIZE;

                if(t_u < 1.0 && me->t > 1.0) {
                    // Need to saturate t to 1.0
                    t_u = 1.0;
                }

                // Remain in this state
                state_u = STIMULATOR_COUNT;
            }
            break;
        case STIMULATOR_STIMULATE: // Logic for state stimulate
            if(me->t >= 0.01) {
                t_u = 0.0;
                v_u = 0.0;

                // Next state is count
                state_u = STIMULATOR_COUNT;
            }
            else if(me->t < 0.01) {
                t_u = me->t + 1.0 * STEP_SIZE;

                if(t_u < 0.01 && me->t > 0.01) {
                    // Need to saturate t to 0.01
                    t_u = 0.01;
                }

                // Remain in this state
                state_u = STIMULATOR_STIMULATE;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->v = v_u;

    me->t = t_u;

}