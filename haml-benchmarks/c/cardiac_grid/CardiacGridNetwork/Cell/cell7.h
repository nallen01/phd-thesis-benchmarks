#ifndef CELL7_H_
#define CELL7_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell7 States
enum Cell7States {
    CELL7_RP,
    CELL7_ST,
    CELL7_UP,
    CELL7_ERP,
    CELL7_RRP,
};

// Cell7 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell7States state;
} Cell7;

// Cell7 Initialisation function
void Cell7Init(Cell7* me);

// Cell7 Execution function
void Cell7Run(Cell7* me);

#endif // CELL7_H_