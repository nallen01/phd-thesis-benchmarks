#ifndef SODIUM_POTASSIUM_PUMP_H_
#define SODIUM_POTASSIUM_PUMP_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_potassium_pump States
enum SodiumPotassiumPumpStates {
    SODIUM_POTASSIUM_PUMP_Q0,
};

// sodium_potassium_pump Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double r;
    double t;
    double f;
    double nai;
    double nao;
    double ko;
    
    // Declare Outputs
    double i_nak;
    
    // Declare Internal Variables
    double f_nak;
    double sigma;

    // State
    enum SodiumPotassiumPumpStates state;
} SodiumPotassiumPump;

// sodium_potassium_pump Initialisation function
void SodiumPotassiumPumpInit(SodiumPotassiumPump* me);

// sodium_potassium_pump Execution function
void SodiumPotassiumPumpRun(SodiumPotassiumPump* me);

#endif // SODIUM_POTASSIUM_PUMP_H_