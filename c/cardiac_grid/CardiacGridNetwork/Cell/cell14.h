#ifndef CELL14_H_
#define CELL14_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell14 States
enum Cell14States {
    CELL14_RP,
    CELL14_ST,
    CELL14_UP,
    CELL14_ERP,
    CELL14_RRP,
};

// Cell14 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell14States state;
} Cell14;

// Cell14 Initialisation function
void Cell14Init(Cell14* me);

// Cell14 Execution function
void Cell14Run(Cell14* me);

#endif // CELL14_H_