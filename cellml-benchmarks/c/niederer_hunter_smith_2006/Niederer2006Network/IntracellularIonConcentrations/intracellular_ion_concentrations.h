#ifndef INTRACELLULAR_ION_CONCENTRATIONS_H_
#define INTRACELLULAR_ION_CONCENTRATIONS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// intracellular_ion_concentrations States
enum IntracellularIonConcentrationsStates {
    INTRACELLULAR_ION_CONCENTRATIONS_Q0,
};

// intracellular_ion_concentrations Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double ca_trpn_max;
    double j_trpn;
    
    // Declare Outputs
    double ca_i;
    double ca_b;
    double trpn;

    // State
    enum IntracellularIonConcentrationsStates state;
} IntracellularIonConcentrations;

// intracellular_ion_concentrations Initialisation function
void IntracellularIonConcentrationsInit(IntracellularIonConcentrations* me);

// intracellular_ion_concentrations Execution function
void IntracellularIonConcentrationsRun(IntracellularIonConcentrations* me);

#endif // INTRACELLULAR_ION_CONCENTRATIONS_H_