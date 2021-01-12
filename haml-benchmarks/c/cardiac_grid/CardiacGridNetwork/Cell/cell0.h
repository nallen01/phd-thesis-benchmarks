#ifndef CELL0_H_
#define CELL0_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell0 States
enum Cell0States {
    CELL0_RP,
    CELL0_ST,
    CELL0_UP,
    CELL0_ERP,
    CELL0_RRP,
};

// Cell0 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell0States state;
} Cell0;

// Cell0 Initialisation function
void Cell0Init(Cell0* me);

// Cell0 Execution function
void Cell0Run(Cell0* me);

#endif // CELL0_H_