#ifndef MYOFILAMENTS_H_
#define MYOFILAMENTS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Myofilaments States
enum MyofilamentsStates {
    MYOFILAMENTS_Q0,
};

// Myofilaments Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    
    // Declare Outputs
    double lambda;
    double extension_ratio;
    double d_extension_ratiodt;
    double lambda_prev;

    // State
    enum MyofilamentsStates state;
} Myofilaments;

// Myofilaments Initialisation function
void MyofilamentsInit(Myofilaments* me);

// Myofilaments Execution function
void MyofilamentsRun(Myofilaments* me);

#endif // MYOFILAMENTS_H_