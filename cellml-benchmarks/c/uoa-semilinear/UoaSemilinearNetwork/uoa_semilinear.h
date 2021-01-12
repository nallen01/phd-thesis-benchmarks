#ifndef UOA_SEMILINEAR_H_
#define UOA_SEMILINEAR_H_

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

// uoa_semilinear Data Struct
typedef struct {
    
    // Declare Outputs
    double cell_v;

    // Declare Daughter Automata
    Cell cell_data;
    Stimulator stimulator_data;
} UoaSemilinear;

// uoa_semilinear Initialisation function
void UoaSemilinearInit(UoaSemilinear* me);

// uoa_semilinear Execution function
void UoaSemilinearRun(UoaSemilinear* me);

#endif // UOA_SEMILINEAR_H_