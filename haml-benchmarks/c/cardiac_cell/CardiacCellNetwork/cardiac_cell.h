#ifndef CARDIAC_CELL_H_
#define CARDIAC_CELL_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Cell/cell.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// cardiac_cell Data Struct
typedef struct {
    
    // Declare Outputs
    double cell_v;

    // Declare Daughter Automata
    Cell cell_data;
} CardiacCell;

// cardiac_cell Initialisation function
void CardiacCellInit(CardiacCell* me);

// cardiac_cell Execution function
void CardiacCellRun(CardiacCell* me);

#endif // CARDIAC_CELL_H_