#ifndef NON_SPECIFIC_CALCIUM_ACTIVATED_CURRENT_H_
#define NON_SPECIFIC_CALCIUM_ACTIVATED_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// non_specific_calcium_activated_current States
enum NonSpecificCalciumActivatedCurrentStates {
    NON_SPECIFIC_CALCIUM_ACTIVATED_CURRENT_Q0,
};

// non_specific_calcium_activated_current Data Struct
typedef struct {
    
    // Declare Inputs
    double gamma_nai;
    double gamma_nao;
    double gamma_ki;
    double gamma_ko;
    double r;
    double t;
    double f;
    double cao;
    double nao;
    double ko;
    double nai;
    double ki;
    double time;
    double cai;
    double v;
    
    // Declare Outputs
    double i_ns_ca;
    double i_ns_na;
    double i_ns_k;
    
    // Declare Internal Variables
    double i_ns_na1;
    double i_ns_k1;
    double vns;
    double ens_ca;

    // State
    enum NonSpecificCalciumActivatedCurrentStates state;
} NonSpecificCalciumActivatedCurrent;

// non_specific_calcium_activated_current Initialisation function
void NonSpecificCalciumActivatedCurrentInit(NonSpecificCalciumActivatedCurrent* me);

// non_specific_calcium_activated_current Execution function
void NonSpecificCalciumActivatedCurrentRun(NonSpecificCalciumActivatedCurrent* me);

#endif // NON_SPECIFIC_CALCIUM_ACTIVATED_CURRENT_H_