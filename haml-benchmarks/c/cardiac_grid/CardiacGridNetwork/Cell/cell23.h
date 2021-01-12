#ifndef CELL23_H_
#define CELL23_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell23 States
enum Cell23States {
    CELL23_RP,
    CELL23_ST,
    CELL23_UP,
    CELL23_ERP,
    CELL23_RRP,
};

// Cell23 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell23States state;
} Cell23;

// Cell23 Initialisation function
void Cell23Init(Cell23* me);

// Cell23 Execution function
void Cell23Run(Cell23* me);

#endif // CELL23_H_