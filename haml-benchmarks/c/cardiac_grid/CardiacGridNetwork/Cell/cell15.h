#ifndef CELL15_H_
#define CELL15_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell15 States
enum Cell15States {
    CELL15_RP,
    CELL15_ST,
    CELL15_UP,
    CELL15_ERP,
    CELL15_RRP,
};

// Cell15 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell15States state;
} Cell15;

// Cell15 Initialisation function
void Cell15Init(Cell15* me);

// Cell15 Execution function
void Cell15Run(Cell15* me);

#endif // CELL15_H_