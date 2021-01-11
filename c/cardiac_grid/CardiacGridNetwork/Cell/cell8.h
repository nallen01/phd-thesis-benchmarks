#ifndef CELL8_H_
#define CELL8_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell8 States
enum Cell8States {
    CELL8_RP,
    CELL8_ST,
    CELL8_UP,
    CELL8_ERP,
    CELL8_RRP,
};

// Cell8 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell8States state;
} Cell8;

// Cell8 Initialisation function
void Cell8Init(Cell8* me);

// Cell8 Execution function
void Cell8Run(Cell8* me);

#endif // CELL8_H_