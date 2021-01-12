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
    CELL_Q0,
    CELL_Q1,
    CELL_Q2,
    CELL_Q3,
};

// Cell Data Struct
typedef struct {
    
    // Declare Inputs
    double g;
    
    // Declare Outputs
    bool resting;
    bool stimulated;
    double v;
    
    // Declare Internal Variables
    double pacing_rate;
    double t_auto;
    double v_x;
    double v_y;
    double v_z;
    double theta;
    double f_theta;

    // State
    enum CellStates state;
} Cell;

// Cell Initialisation function
void CellInit(Cell* me);

// Cell Execution function
void CellRun(Cell* me);

#endif // CELL_H_