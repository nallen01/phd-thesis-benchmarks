#ifndef CELL17_H_
#define CELL17_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell17 States
enum Cell17States {
    CELL17_RP,
    CELL17_ST,
    CELL17_UP,
    CELL17_ERP,
    CELL17_RRP,
};

// Cell17 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell17States state;
} Cell17;

// Cell17 Initialisation function
void Cell17Init(Cell17* me);

// Cell17 Execution function
void Cell17Run(Cell17* me);

#endif // CELL17_H_