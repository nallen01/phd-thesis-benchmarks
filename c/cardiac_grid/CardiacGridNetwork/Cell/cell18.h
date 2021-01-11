#ifndef CELL18_H_
#define CELL18_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell18 States
enum Cell18States {
    CELL18_RP,
    CELL18_ST,
    CELL18_UP,
    CELL18_ERP,
    CELL18_RRP,
};

// Cell18 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell18States state;
} Cell18;

// Cell18 Initialisation function
void Cell18Init(Cell18* me);

// Cell18 Execution function
void Cell18Run(Cell18* me);

#endif // CELL18_H_