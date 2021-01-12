#ifndef PLATEAU_POTASSIUM_CURRENT_H_
#define PLATEAU_POTASSIUM_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// plateau_potassium_current States
enum PlateauPotassiumCurrentStates {
    PLATEAU_POTASSIUM_CURRENT_Q0,
};

// plateau_potassium_current Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double e_k1;
    
    // Declare Outputs
    double i_kp;
    
    // Declare Internal Variables
    double e_kp;
    double kp;

    // State
    enum PlateauPotassiumCurrentStates state;
} PlateauPotassiumCurrent;

// plateau_potassium_current Initialisation function
void PlateauPotassiumCurrentInit(PlateauPotassiumCurrent* me);

// plateau_potassium_current Execution function
void PlateauPotassiumCurrentRun(PlateauPotassiumCurrent* me);

#endif // PLATEAU_POTASSIUM_CURRENT_H_