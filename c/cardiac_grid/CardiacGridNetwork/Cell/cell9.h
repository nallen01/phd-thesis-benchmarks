#ifndef CELL9_H_
#define CELL9_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell9 States
enum Cell9States {
    CELL9_RP,
    CELL9_ST,
    CELL9_UP,
    CELL9_ERP,
    CELL9_RRP,
};

// Cell9 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell9States state;
} Cell9;

// Cell9 Initialisation function
void Cell9Init(Cell9* me);

// Cell9 Execution function
void Cell9Run(Cell9* me);

#endif // CELL9_H_