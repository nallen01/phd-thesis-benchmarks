#ifndef TANK_H_
#define TANK_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Tank States
enum TankStates {
    TANK_T1,
    TANK_T2,
    TANK_T3,
    TANK_T4,
};

// Tank Data Struct
typedef struct {
    
    // Declare Inputs
    bool burner_on;
    bool burner_off;
    
    // Declare Outputs
    double temperature;

    // State
    enum TankStates state;
} Tank;

// Tank Initialisation function
void TankInit(Tank* me);

// Tank Execution function
void TankRun(Tank* me);

#endif // TANK_H_