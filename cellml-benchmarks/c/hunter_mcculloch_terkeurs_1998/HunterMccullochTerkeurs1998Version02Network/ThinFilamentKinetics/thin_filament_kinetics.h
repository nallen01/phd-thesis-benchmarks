#ifndef THIN_FILAMENT_KINETICS_H_
#define THIN_FILAMENT_KINETICS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// thin_filament_kinetics States
enum ThinFilamentKineticsStates {
    THIN_FILAMENT_KINETICS_Q0,
};

// thin_filament_kinetics Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double ca_b;
    double lambda;
    
    // Declare Outputs
    double to;
    
    // Declare Internal Variables
    double z;
    double pc_50;
    double n;

    // State
    enum ThinFilamentKineticsStates state;
} ThinFilamentKinetics;

// thin_filament_kinetics Initialisation function
void ThinFilamentKineticsInit(ThinFilamentKinetics* me);

// thin_filament_kinetics Execution function
void ThinFilamentKineticsRun(ThinFilamentKinetics* me);

#endif // THIN_FILAMENT_KINETICS_H_