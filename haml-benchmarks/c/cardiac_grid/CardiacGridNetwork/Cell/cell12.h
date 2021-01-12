#ifndef CELL12_H_
#define CELL12_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell12 States
enum Cell12States {
    CELL12_RP,
    CELL12_ST,
    CELL12_UP,
    CELL12_ERP,
    CELL12_RRP,
};

// Cell12 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell12States state;
} Cell12;

// Cell12 Initialisation function
void Cell12Init(Cell12* me);

// Cell12 Execution function
void Cell12Run(Cell12* me);

#endif // CELL12_H_