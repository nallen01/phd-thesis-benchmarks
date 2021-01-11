#ifndef WATER_HEATER_H_
#define WATER_HEATER_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Watertank/tank.h"
#include "Burner/burner.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// water_heater Data Struct
typedef struct {
    
    // Declare Outputs
    double temperature;

    // Declare Daughter Automata
    Tank tank_data;
    Burner burner_data;
} WaterHeater;

// water_heater Initialisation function
void WaterHeaterInit(WaterHeater* me);

// water_heater Execution function
void WaterHeaterRun(WaterHeater* me);

#endif // WATER_HEATER_H_