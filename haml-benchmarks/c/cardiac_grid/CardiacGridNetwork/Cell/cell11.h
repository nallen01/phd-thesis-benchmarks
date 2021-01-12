#ifndef CELL11_H_
#define CELL11_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell11 States
enum Cell11States {
    CELL11_RP,
    CELL11_ST,
    CELL11_UP,
    CELL11_ERP,
    CELL11_RRP,
};

// Cell11 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell11States state;
} Cell11;

// Cell11 Initialisation function
void Cell11Init(Cell11* me);

// Cell11 Execution function
void Cell11Run(Cell11* me);

#endif // CELL11_H_