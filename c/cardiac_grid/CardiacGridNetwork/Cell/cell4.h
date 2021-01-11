#ifndef CELL4_H_
#define CELL4_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell4 States
enum Cell4States {
    CELL4_RP,
    CELL4_ST,
    CELL4_UP,
    CELL4_ERP,
    CELL4_RRP,
};

// Cell4 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell4States state;
} Cell4;

// Cell4 Initialisation function
void Cell4Init(Cell4* me);

// Cell4 Execution function
void Cell4Run(Cell4* me);

#endif // CELL4_H_