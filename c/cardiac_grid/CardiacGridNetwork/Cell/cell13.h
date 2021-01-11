#ifndef CELL13_H_
#define CELL13_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell13 States
enum Cell13States {
    CELL13_RP,
    CELL13_ST,
    CELL13_UP,
    CELL13_ERP,
    CELL13_RRP,
};

// Cell13 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell13States state;
} Cell13;

// Cell13 Initialisation function
void Cell13Init(Cell13* me);

// Cell13 Execution function
void Cell13Run(Cell13* me);

#endif // CELL13_H_