#ifndef CELL19_H_
#define CELL19_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell19 States
enum Cell19States {
    CELL19_RP,
    CELL19_ST,
    CELL19_UP,
    CELL19_ERP,
    CELL19_RRP,
};

// Cell19 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell19States state;
} Cell19;

// Cell19 Initialisation function
void Cell19Init(Cell19* me);

// Cell19 Execution function
void Cell19Run(Cell19* me);

#endif // CELL19_H_