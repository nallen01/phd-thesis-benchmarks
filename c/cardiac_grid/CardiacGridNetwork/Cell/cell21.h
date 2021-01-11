#ifndef CELL21_H_
#define CELL21_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell21 States
enum Cell21States {
    CELL21_RP,
    CELL21_ST,
    CELL21_UP,
    CELL21_ERP,
    CELL21_RRP,
};

// Cell21 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell21States state;
} Cell21;

// Cell21 Initialisation function
void Cell21Init(Cell21* me);

// Cell21 Execution function
void Cell21Run(Cell21* me);

#endif // CELL21_H_