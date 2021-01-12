#ifndef INWARD_RECTIFIER_POTASSIUM_CURRENT_H_
#define INWARD_RECTIFIER_POTASSIUM_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// inward_rectifier_potassium_current States
enum InwardRectifierPotassiumCurrentStates {
    INWARD_RECTIFIER_POTASSIUM_CURRENT_Q0,
};

// inward_rectifier_potassium_current Data Struct
typedef struct {
    
    // Declare Inputs
    double v;
    double k_o;
    double e_k;
    double time;
    
    // Declare Outputs
    double i_k1;
    
    // Declare Internal Variables
    double xk1_inf;
    double alpha_k1;
    double beta_k1;

    // State
    enum InwardRectifierPotassiumCurrentStates state;
} InwardRectifierPotassiumCurrent;

// inward_rectifier_potassium_current Initialisation function
void InwardRectifierPotassiumCurrentInit(InwardRectifierPotassiumCurrent* me);

// inward_rectifier_potassium_current Execution function
void InwardRectifierPotassiumCurrentRun(InwardRectifierPotassiumCurrent* me);

#endif // INWARD_RECTIFIER_POTASSIUM_CURRENT_H_