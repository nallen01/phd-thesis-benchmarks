#ifndef CELL16_H_
#define CELL16_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell16 States
enum Cell16States {
    CELL16_RP,
    CELL16_ST,
    CELL16_UP,
    CELL16_ERP,
    CELL16_RRP,
};

// Cell16 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell16States state;
} Cell16;

// Cell16 Initialisation function
void Cell16Init(Cell16* me);

// Cell16 Execution function
void Cell16Run(Cell16* me);

#endif // CELL16_H_