#ifndef NUCLEAR_PLANT_H_
#define NUCLEAR_PLANT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Plant/plant.h"
#include "Controller/controller.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// nuclear_plant Data Struct
typedef struct {
    
    // Declare Outputs
    double plant_x;

    // Declare Daughter Automata
    Plant plant_data;
    Controller controller_data;
} NuclearPlant;

// nuclear_plant Initialisation function
void NuclearPlantInit(NuclearPlant* me);

// nuclear_plant Execution function
void NuclearPlantRun(NuclearPlant* me);

#endif // NUCLEAR_PLANT_H_