#ifndef CELL10_H_
#define CELL10_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell10 States
enum Cell10States {
    CELL10_RP,
    CELL10_ST,
    CELL10_UP,
    CELL10_ERP,
    CELL10_RRP,
};

// Cell10 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell10States state;
} Cell10;

// Cell10 Initialisation function
void Cell10Init(Cell10* me);

// Cell10 Execution function
void Cell10Run(Cell10* me);

#endif // CELL10_H_