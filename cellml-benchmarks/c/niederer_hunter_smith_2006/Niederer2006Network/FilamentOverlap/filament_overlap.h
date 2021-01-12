#ifndef FILAMENT_OVERLAP_H_
#define FILAMENT_OVERLAP_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// filament_overlap States
enum FilamentOverlapStates {
    FILAMENT_OVERLAP_Q0,
};

// filament_overlap Data Struct
typedef struct {
    
    // Declare Inputs
    double lambda;
    
    // Declare Outputs
    double overlap;
    double beta_0;

    // State
    enum FilamentOverlapStates state;
} FilamentOverlap;

// filament_overlap Initialisation function
void FilamentOverlapInit(FilamentOverlap* me);

// filament_overlap Execution function
void FilamentOverlapRun(FilamentOverlap* me);

#endif // FILAMENT_OVERLAP_H_