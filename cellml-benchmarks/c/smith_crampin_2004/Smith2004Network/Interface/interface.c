#include "interface.h"

// interface Initialisation function
void InterfaceInit(Interface* me) {
    // Initialise State
    me->state = INTERFACE_Q0;

    // Initialise Outputs
    me->time_private = 0.0;
    me->vm_private = 0.0;
    me->cmgadp_private = 0.0;
    me->cna_i_private = 0.0;
    me->v_cyc = 0.0;
    me->net_free_energy = 0.0;

    // Initialise Internal Variables
    me->time = 0.0;
    me->vm = -150.0;
    me->c_mg_a_d_p = 0.01;
    me->cna_i = 50.0;
}

// interface Execution function
void InterfaceRun(Interface* me) {
    // Create intermediary variables
    enum InterfaceStates state_u = me->state;
    double time_private_u = me->time_private;
    double vm_private_u = me->vm_private;
    double cmgadp_private_u = me->cmgadp_private;
    double cna_i_private_u = me->cna_i_private;
    double v_cyc_u = me->v_cyc;
    double net_free_energy_u = me->net_free_energy;

    double time_u = me->time;
    double vm_u = me->vm;
    double c_mg_a_d_p_u = me->c_mg_a_d_p;
    double cna_i_u = me->cna_i;


    // Run the state machine for transition logic
    switch(me->state) {
        case INTERFACE_Q0: // Logic for state q0
            if(true) {
                vm_u = me->vm + 1.0 * STEP_SIZE;
                c_mg_a_d_p_u = me->c_mg_a_d_p + 0.0 * STEP_SIZE;
                cna_i_u = me->cna_i + 0.0 * STEP_SIZE;
                time_u = me->time + 1000.0 * STEP_SIZE;

                time_private_u = time_u;
                vm_private_u = vm_u;
                cmgadp_private_u = c_mg_a_d_p_u;
                cna_i_private_u = cna_i_u;
                v_cyc_u = me->v_cyc_private;
                net_free_energy_u = me->net_free_energy_private;

                // Remain in this state
                state_u = INTERFACE_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->time_private = time_private_u;
    me->vm_private = vm_private_u;
    me->cmgadp_private = cmgadp_private_u;
    me->cna_i_private = cna_i_private_u;
    me->v_cyc = v_cyc_u;
    me->net_free_energy = net_free_energy_u;

    me->time = time_u;
    me->vm = vm_u;
    me->c_mg_a_d_p = c_mg_a_d_p_u;
    me->cna_i = cna_i_u;

}