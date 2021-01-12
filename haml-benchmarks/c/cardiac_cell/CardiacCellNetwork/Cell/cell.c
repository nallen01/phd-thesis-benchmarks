#include "cell.h"

static double F(double theta) {
    if(theta >= 0.04) {
        return 4.03947;
    }
    return 0.29 * exp(62.89 * theta) + 0.7 * exp(-10.99 * theta);
}

static double CalculatePacingRate() {
    if(60.0 > 0.0) {
        return 1.0 / (60.0 / 60.0);
    }
    return 0.0;
}


// Cell Initialisation function
void CellInit(Cell* me) {
    // Initialise State
    me->state = CELL_Q0;

    // Initialise Outputs
    me->resting = true;
    me->stimulated = false;
    me->v = 0.0;

    // Initialise Internal Variables
    me->pacing_rate = CalculatePacingRate();
    me->t_auto = 0.0;
    me->v_x = 0.0;
    me->v_y = 0.0;
    me->v_z = 0.0;
    me->theta = 0.0;
    me->f_theta = 0.0;
}

// Cell Execution function
void CellRun(Cell* me) {
    // Create intermediary variables
    enum CellStates state_u = me->state;
    bool resting_u = me->resting;
    bool stimulated_u = me->stimulated;
    double v_u = me->v;

    double pacing_rate_u = me->pacing_rate;
    double t_auto_u = me->t_auto;
    double v_x_u = me->v_x;
    double v_y_u = me->v_y;
    double v_z_u = me->v_z;
    double theta_u = me->theta;
    double f_theta_u = me->f_theta;


    // Run the state machine for transition logic
    switch(me->state) {
        case CELL_Q0: // Logic for state q0
            if(me->pacing_rate > 0.0 && me->t_auto >= me->pacing_rate) {
                v_x_u = (44.5 * 777200.0) / ((777200.0 - 58900.0) + 276600.0);
                v_y_u = (44.5 * 58900.0) / ((777200.0 - 58900.0) + 276600.0);
                v_z_u = (44.5 * 276600.0) / ((777200.0 - 58900.0) + 276600.0);
                v_u = 44.5;
                theta_u = 0.0;
                f_theta_u = F(0.0);

                // Next state is q1
                state_u = CELL_Q1;
            }
            else if(me->g >= 44.5 && (me->pacing_rate <= 0.0 || me->t_auto < me->pacing_rate)) {
                v_x_u = 0.3 * me->v;
                v_y_u = 0.0 * me->v;
                v_z_u = 0.7 * me->v;
                theta_u = me->v / 44.5;
                f_theta_u = F(me->v / 44.5);

                // Next state is q1
                state_u = CELL_Q1;
            }
            else if(me->v < 44.5 && me->g < 44.5 && (me->pacing_rate <= 0.0 || me->t_auto < me->pacing_rate)) {
                v_x_u = me->v_x + -8.7 * me->v_x * STEP_SIZE;
                v_y_u = me->v_y + -190.9 * me->v_y * STEP_SIZE;
                v_z_u = me->v_z + -190.4 * me->v_z * STEP_SIZE;
                t_auto_u = me->t_auto + 1.0 * STEP_SIZE;

                v_u = (v_x_u - v_y_u) + v_z_u;
                resting_u = true;

                if(t_auto_u < me->pacing_rate && me->t_auto > me->pacing_rate) {
                    // Need to saturate t_auto to me->pacing_rate
                    t_auto_u = me->pacing_rate;
                }

                // Remain in this state
                state_u = CELL_Q0;
            }
            break;
        case CELL_Q1: // Logic for state q1
            if(me->v == 44.5 || (me->pacing_rate > 0.0 && me->t_auto >= me->pacing_rate)) {
                t_auto_u = 0.0;
                resting_u = false;

                // Next state is q2
                state_u = CELL_Q2;
            }
            else if(me->g <= 0.0 && me->v < 44.5 && me->t_auto < me->pacing_rate) {
                // Next state is q0
                state_u = CELL_Q0;
            }
            else if(me->v < 44.5 && me->g > 0.0 && (me->pacing_rate <= 0.0 || me->t_auto < me->pacing_rate)) {
                v_x_u = me->v_x + (-23.6 * me->v_x + 777200.0 * me->g) * STEP_SIZE;
                v_y_u = me->v_y + (-45.5 * me->v_y + 58900.0 * me->g) * STEP_SIZE;
                v_z_u = me->v_z + (-12.9 * me->v_z + 276600.0 * me->g) * STEP_SIZE;
                t_auto_u = me->t_auto + 1.0 * STEP_SIZE;

                v_u = (v_x_u - v_y_u) + v_z_u;

                if(t_auto_u < me->pacing_rate && me->t_auto > me->pacing_rate) {
                    // Need to saturate t_auto to me->pacing_rate
                    t_auto_u = me->pacing_rate;
                }
                if(v_u < 44.5 && me->v > 44.5) {
                    // Need to saturate v to 44.5
                    // Also some dependencies that need saturating
                    double frac = (44.5 - me->v) / (v_u - me->v);

                    v_x_u = me->v_x + frac * (v_x_u - me->v_x);
                    v_y_u = me->v_y + frac * (v_y_u - me->v_y);
                    v_z_u = me->v_z + frac * (v_z_u - me->v_z);

                    v_u = 44.5;
                }
                if((v_u > 44.5 && me->v < 44.5) || (v_u < 44.5 && me->v > 44.5)) {
                    // Need to saturate v to 44.5
                    // Also some dependencies that need saturating
                    double frac = (44.5 - me->v) / (v_u - me->v);

                    v_x_u = me->v_x + frac * (v_x_u - me->v_x);
                    v_y_u = me->v_y + frac * (v_y_u - me->v_y);
                    v_z_u = me->v_z + frac * (v_z_u - me->v_z);

                    v_u = 44.5;
                }

                // Remain in this state
                state_u = CELL_Q1;
            }
            break;
        case CELL_Q2: // Logic for state q2
            if(me->v == 131.1 - 80.1 * sqrt(me->theta)) {
                stimulated_u = false;

                // Next state is q3
                state_u = CELL_Q3;
            }
            else if(me->v < 131.1 - 80.1 * sqrt(me->theta)) {
                v_x_u = me->v_x + -6.9 * me->v_x * STEP_SIZE;
                v_y_u = me->v_y + 75.9 * me->v_y * STEP_SIZE;
                v_z_u = me->v_z + 6826.5 * me->v_z * STEP_SIZE;
                t_auto_u = me->t_auto + 1.0 * STEP_SIZE;

                v_u = (v_x_u - v_y_u) + v_z_u;
                stimulated_u = true;

                if((v_u > 131.1 - 80.1 * sqrt(me->theta) && me->v < 131.1 - 80.1 * sqrt(me->theta)) || (v_u < 131.1 - 80.1 * sqrt(me->theta) && me->v > 131.1 - 80.1 * sqrt(me->theta))) {
                    // Need to saturate v to 131.1 - 80.1 * sqrt(me->theta)
                    // Also some dependencies that need saturating
                    double frac = (131.1 - 80.1 * sqrt(me->theta) - me->v) / (v_u - me->v);

                    v_x_u = me->v_x + frac * (v_x_u - me->v_x);
                    v_y_u = me->v_y + frac * (v_y_u - me->v_y);
                    v_z_u = me->v_z + frac * (v_z_u - me->v_z);

                    v_u = 131.1 - 80.1 * sqrt(me->theta);
                }

                // Remain in this state
                state_u = CELL_Q2;
            }
            break;
        case CELL_Q3: // Logic for state q3
            if(me->v == 30.0) {
                // Next state is q0
                state_u = CELL_Q0;
            }
            else if(me->v > 30.0) {
                v_x_u = me->v_x + -33.2 * me->v_x * me->f_theta * STEP_SIZE;
                v_y_u = me->v_y + 20.0 * me->v_y * me->f_theta * STEP_SIZE;
                v_z_u = me->v_z + 2.0 * me->v_z * STEP_SIZE;
                t_auto_u = me->t_auto + 1.0 * STEP_SIZE;

                v_u = (v_x_u - v_y_u) + v_z_u;

                if((v_u > 30.0 && me->v < 30.0) || (v_u < 30.0 && me->v > 30.0)) {
                    // Need to saturate v to 30.0
                    // Also some dependencies that need saturating
                    double frac = (30.0 - me->v) / (v_u - me->v);

                    v_x_u = me->v_x + frac * (v_x_u - me->v_x);
                    v_y_u = me->v_y + frac * (v_y_u - me->v_y);
                    v_z_u = me->v_z + frac * (v_z_u - me->v_z);

                    v_u = 30.0;
                }

                // Remain in this state
                state_u = CELL_Q3;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->resting = resting_u;
    me->stimulated = stimulated_u;
    me->v = v_u;

    me->pacing_rate = pacing_rate_u;
    me->t_auto = t_auto_u;
    me->v_x = v_x_u;
    me->v_y = v_y_u;
    me->v_z = v_z_u;
    me->theta = theta_u;
    me->f_theta = f_theta_u;

}