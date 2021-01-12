#ifndef UOA_MYOCITE_H_
#define UOA_MYOCITE_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Cell/cell.h"
#include "Stimulator/stimulator.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// uoa_myocite Data Struct
typedef struct {
    
    // Declare Outputs
    double cell_v;

    // Declare Daughter Automata
    Cell cell_data;
    Stimulator stimulator_data;
} UoaMyocite;

// uoa_myocite Initialisation function
void UoaMyociteInit(UoaMyocite* me);

// uoa_myocite Execution function
void UoaMyociteRun(UoaMyocite* me);

#endif // UOA_MYOCITE_H_