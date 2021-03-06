#ifndef SODIUM_BACKGROUND_CURRENT_H_
#define SODIUM_BACKGROUND_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_background_current States
enum SodiumBackgroundCurrentStates {
    SODIUM_BACKGROUND_CURRENT_Q0,
};

// sodium_background_current Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double e_na;
    
    // Declare Outputs
    double i_na_b;
    
    // Declare Internal Variables
    double e_nan;

    // State
    enum SodiumBackgroundCurrentStates state;
} SodiumBackgroundCurrent;

// sodium_background_current Initialisation function
void SodiumBackgroundCurrentInit(SodiumBackgroundCurrent* me);

// sodium_background_current Execution function
void SodiumBackgroundCurrentRun(SodiumBackgroundCurrent* me);

#endif // SODIUM_BACKGROUND_CURRENT_H_