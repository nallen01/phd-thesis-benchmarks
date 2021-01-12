#ifndef STIMULATOR_H_
#define STIMULATOR_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Stimulator States
enum StimulatorStates {
    STIMULATOR_COUNT,
    STIMULATOR_STIMULATE,
};

// Stimulator Data Struct
typedef struct {
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double t;

    // State
    enum StimulatorStates state;
} Stimulator;

// Stimulator Initialisation function
void StimulatorInit(Stimulator* me);

// Stimulator Execution function
void StimulatorRun(Stimulator* me);

#endif // STIMULATOR_H_