#ifndef CELL5_H_
#define CELL5_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell5 States
enum Cell5States {
    CELL5_RP,
    CELL5_ST,
    CELL5_UP,
    CELL5_ERP,
    CELL5_RRP,
};

// Cell5 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell5States state;
} Cell5;

// Cell5 Initialisation function
void Cell5Init(Cell5* me);

// Cell5 Execution function
void Cell5Run(Cell5* me);

#endif // CELL5_H_