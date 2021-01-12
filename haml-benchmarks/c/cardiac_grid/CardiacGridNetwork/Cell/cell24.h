#ifndef CELL24_H_
#define CELL24_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell24 States
enum Cell24States {
    CELL24_RP,
    CELL24_ST,
    CELL24_UP,
    CELL24_ERP,
    CELL24_RRP,
};

// Cell24 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell24States state;
} Cell24;

// Cell24 Initialisation function
void Cell24Init(Cell24* me);

// Cell24 Execution function
void Cell24Run(Cell24* me);

#endif // CELL24_H_