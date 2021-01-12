#ifndef CALCIUM_BACKGROUND_CURRENT_H_
#define CALCIUM_BACKGROUND_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// calcium_background_current States
enum CalciumBackgroundCurrentStates {
    CALCIUM_BACKGROUND_CURRENT_Q0,
};

// calcium_background_current Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double r;
    double t;
    double f;
    double cai;
    double cao;
    
    // Declare Outputs
    double i_ca_b;
    
    // Declare Internal Variables
    double e_can;

    // State
    enum CalciumBackgroundCurrentStates state;
} CalciumBackgroundCurrent;

// calcium_background_current Initialisation function
void CalciumBackgroundCurrentInit(CalciumBackgroundCurrent* me);

// calcium_background_current Execution function
void CalciumBackgroundCurrentRun(CalciumBackgroundCurrent* me);

#endif // CALCIUM_BACKGROUND_CURRENT_H_