#ifndef CELL20_H_
#define CELL20_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell20 States
enum Cell20States {
    CELL20_RP,
    CELL20_ST,
    CELL20_UP,
    CELL20_ERP,
    CELL20_RRP,
};

// Cell20 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell20States state;
} Cell20;

// Cell20 Initialisation function
void Cell20Init(Cell20* me);

// Cell20 Execution function
void Cell20Run(Cell20* me);

#endif // CELL20_H_