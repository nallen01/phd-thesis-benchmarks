#ifndef FAST_SODIUM_CURRENT_H_
#define FAST_SODIUM_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// fast_sodium_current States
enum FastSodiumCurrentStates {
    FAST_SODIUM_CURRENT_Q0,
};

// fast_sodium_current Data Struct
typedef struct {
    
    // Declare Inputs
    double e_na;
    double time;
    double v;
    double m_private;
    double h_private;
    double j_private;
    
    // Declare Outputs
    double i_na;
    double time_private;
    double v_private;
    
    // Declare Internal Variables
    double m;
    double h;
    double j;

    // State
    enum FastSodiumCurrentStates state;
} FastSodiumCurrent;

// fast_sodium_current Initialisation function
void FastSodiumCurrentInit(FastSodiumCurrent* me);

// fast_sodium_current Execution function
void FastSodiumCurrentRun(FastSodiumCurrent* me);

#endif // FAST_SODIUM_CURRENT_H_