#ifndef SODIUM_POTASSIUM_PUMP_CURRENT_H_
#define SODIUM_POTASSIUM_PUMP_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_potassium_pump_current States
enum SodiumPotassiumPumpCurrentStates {
    SODIUM_POTASSIUM_PUMP_CURRENT_Q0,
};

// sodium_potassium_pump_current Data Struct
typedef struct {
    
    // Declare Inputs
    double k_o;
    double na_i;
    double time;
    double r;
    double f;
    double t;
    double v;
    
    // Declare Outputs
    double i_nak;
    double v_private;

    // State
    enum SodiumPotassiumPumpCurrentStates state;
} SodiumPotassiumPumpCurrent;

// sodium_potassium_pump_current Initialisation function
void SodiumPotassiumPumpCurrentInit(SodiumPotassiumPumpCurrent* me);

// sodium_potassium_pump_current Execution function
void SodiumPotassiumPumpCurrentRun(SodiumPotassiumPumpCurrent* me);

#endif // SODIUM_POTASSIUM_PUMP_CURRENT_H_