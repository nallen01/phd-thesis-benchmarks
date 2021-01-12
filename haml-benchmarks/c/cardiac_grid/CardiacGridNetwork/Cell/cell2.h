#ifndef CELL2_H_
#define CELL2_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell2 States
enum Cell2States {
    CELL2_RP,
    CELL2_ST,
    CELL2_UP,
    CELL2_ERP,
    CELL2_RRP,
};

// Cell2 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell2States state;
} Cell2;

// Cell2 Initialisation function
void Cell2Init(Cell2* me);

// Cell2 Execution function
void Cell2Run(Cell2* me);

#endif // CELL2_H_