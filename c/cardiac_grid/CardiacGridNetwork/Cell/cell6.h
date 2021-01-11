#ifndef CELL6_H_
#define CELL6_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell6 States
enum Cell6States {
    CELL6_RP,
    CELL6_ST,
    CELL6_UP,
    CELL6_ERP,
    CELL6_RRP,
};

// Cell6 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell6States state;
} Cell6;

// Cell6 Initialisation function
void Cell6Init(Cell6* me);

// Cell6 Execution function
void Cell6Run(Cell6* me);

#endif // CELL6_H_