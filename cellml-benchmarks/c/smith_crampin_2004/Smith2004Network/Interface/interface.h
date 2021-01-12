#ifndef INTERFACE_H_
#define INTERFACE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// interface States
enum InterfaceStates {
    INTERFACE_Q0,
};

// interface Data Struct
typedef struct {
    
    // Declare Inputs
    double v_cyc_private;
    double net_free_energy_private;
    
    // Declare Outputs
    double time_private;
    double vm_private;
    double cmgadp_private;
    double cna_i_private;
    double v_cyc;
    double net_free_energy;
    
    // Declare Internal Variables
    double time;
    double vm;
    double c_mg_a_d_p;
    double cna_i;

    // State
    enum InterfaceStates state;
} Interface;

// interface Initialisation function
void InterfaceInit(Interface* me);

// interface Execution function
void InterfaceRun(Interface* me);

#endif // INTERFACE_H_