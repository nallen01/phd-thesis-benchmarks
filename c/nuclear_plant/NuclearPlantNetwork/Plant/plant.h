#ifndef PLANT_H_
#define PLANT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Plant States
enum PlantStates {
    PLANT_P1,
    PLANT_P2,
    PLANT_P3,
};

// Plant Data Struct
typedef struct {
    
    // Declare Inputs
    bool add1;
    bool remove1;
    bool add2;
    bool remove2;
    
    // Declare Outputs
    double x;

    // State
    enum PlantStates state;
} Plant;

// Plant Initialisation function
void PlantInit(Plant* me);

// Plant Execution function
void PlantRun(Plant* me);

#endif // PLANT_H_