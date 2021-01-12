#ifndef CELL1_H_
#define CELL1_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell1 States
enum Cell1States {
    CELL1_RP,
    CELL1_ST,
    CELL1_UP,
    CELL1_ERP,
    CELL1_RRP,
};

// Cell1 Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum Cell1States state;
} Cell1;

// Cell1 Initialisation function
void Cell1Init(Cell1* me);

// Cell1 Execution function
void Cell1Run(Cell1* me);

#endif // CELL1_H_