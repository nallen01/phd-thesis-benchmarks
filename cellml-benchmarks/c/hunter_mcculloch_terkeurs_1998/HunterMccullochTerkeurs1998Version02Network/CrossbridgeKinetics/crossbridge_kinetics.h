#ifndef CROSSBRIDGE_KINETICS_H_
#define CROSSBRIDGE_KINETICS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// crossbridge_kinetics States
enum CrossbridgeKineticsStates {
    CROSSBRIDGE_KINETICS_Q0,
};

// crossbridge_kinetics Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double to;
    
    // Declare Outputs
    double t;
    
    // Declare Internal Variables
    double q;
    double dlambda_dt;

    // State
    enum CrossbridgeKineticsStates state;
} CrossbridgeKinetics;

// crossbridge_kinetics Initialisation function
void CrossbridgeKineticsInit(CrossbridgeKinetics* me);

// crossbridge_kinetics Execution function
void CrossbridgeKineticsRun(CrossbridgeKinetics* me);

#endif // CROSSBRIDGE_KINETICS_H_