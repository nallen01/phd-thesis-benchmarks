#ifndef CELL_H_
#define CELL_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cell States
enum CellStates {
    CELL_RP,
    CELL_ST,
    CELL_UP,
    CELL_ERP,
    CELL_RRP,
};

// Cell Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    double v;
    
    // Declare Internal Variables
    double theta;
    double t;

    // State
    enum CellStates state;
} Cell;

// Cell Initialisation function
void CellInit(Cell* me);

// Cell Execution function
void CellRun(Cell* me);

#endif // CELL_H_