#ifndef CELL3_H_
#define CELL3_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell3 States
enum Cell3States {
    CELL3_RP,
    CELL3_ST,
    CELL3_UP,
    CELL3_ERP,
    CELL3_RRP,
};

// Cell3 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell3States state;
} Cell3;

// Cell3 Initialisation function
void Cell3Init(Cell3* me);

// Cell3 Execution function
void Cell3Run(Cell3* me);

#endif // CELL3_H_