#ifndef CARDIAC_GRID_H_
#define CARDIAC_GRID_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Cell/cell0.h"
#include "Cell/cell1.h"
#include "Cell/cell2.h"
#include "Cell/cell3.h"
#include "Cell/cell4.h"
#include "Cell/cell5.h"
#include "Cell/cell6.h"
#include "Cell/cell7.h"
#include "Cell/cell8.h"
#include "Cell/cell9.h"
#include "Cell/cell10.h"
#include "Cell/cell11.h"
#include "Cell/cell12.h"
#include "Cell/cell13.h"
#include "Cell/cell14.h"
#include "Cell/cell15.h"
#include "Cell/cell16.h"
#include "Cell/cell17.h"
#include "Cell/cell18.h"
#include "Cell/cell19.h"
#include "Cell/cell20.h"
#include "Cell/cell21.h"
#include "Cell/cell22.h"
#include "Cell/cell23.h"
#include "Cell/cell24.h"
#include "Stimulator/stimulator.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// cardiac_grid Data Struct
typedef struct {
    
    // Declare Outputs
    double cell_v;

    // Declare Daughter Automata
    Cell0 cell0_data;
    Cell1 cell1_data;
    Cell2 cell2_data;
    Cell3 cell3_data;
    Cell4 cell4_data;
    Cell5 cell5_data;
    Cell6 cell6_data;
    Cell7 cell7_data;
    Cell8 cell8_data;
    Cell9 cell9_data;
    Cell10 cell10_data;
    Cell11 cell11_data;
    Cell12 cell12_data;
    Cell13 cell13_data;
    Cell14 cell14_data;
    Cell15 cell15_data;
    Cell16 cell16_data;
    Cell17 cell17_data;
    Cell18 cell18_data;
    Cell19 cell19_data;
    Cell20 cell20_data;
    Cell21 cell21_data;
    Cell22 cell22_data;
    Cell23 cell23_data;
    Cell24 cell24_data;
    Stimulator stimulator_data;
} CardiacGrid;

// cardiac_grid Initialisation function
void CardiacGridInit(CardiacGrid* me);

// cardiac_grid Execution function
void CardiacGridRun(CardiacGrid* me);

#endif // CARDIAC_GRID_H_