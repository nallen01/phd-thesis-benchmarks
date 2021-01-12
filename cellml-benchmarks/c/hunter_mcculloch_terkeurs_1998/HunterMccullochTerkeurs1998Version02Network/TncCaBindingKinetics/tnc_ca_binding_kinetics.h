#ifndef TNC_CA_BINDING_KINETICS_H_
#define TNC_CA_BINDING_KINETICS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// TnC_Ca_binding_kinetics States
enum TncCaBindingKineticsStates {
    TNC_CA_BINDING_KINETICS_Q0,
};

// TnC_Ca_binding_kinetics Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double ca_i;
    double to;
    double t;
    
    // Declare Outputs
    double ca_b;
    double lambda;

    // State
    enum TncCaBindingKineticsStates state;
} TncCaBindingKinetics;

// TnC_Ca_binding_kinetics Initialisation function
void TncCaBindingKineticsInit(TncCaBindingKinetics* me);

// TnC_Ca_binding_kinetics Execution function
void TncCaBindingKineticsRun(TncCaBindingKinetics* me);

#endif // TNC_CA_BINDING_KINETICS_H_