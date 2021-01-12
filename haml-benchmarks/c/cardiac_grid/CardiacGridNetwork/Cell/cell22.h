#ifndef CELL22_H_
#define CELL22_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell22 States
enum Cell22States {
    CELL22_RP,
    CELL22_ST,
    CELL22_UP,
    CELL22_ERP,
    CELL22_RRP,
};

// Cell22 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell22States state;
} Cell22;

// Cell22 Initialisation function
void Cell22Init(Cell22* me);

// Cell22 Execution function
void Cell22Run(Cell22* me);

#endif // CELL22_H_