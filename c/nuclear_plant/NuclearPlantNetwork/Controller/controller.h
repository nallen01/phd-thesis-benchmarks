#ifndef CONTROLLER_H_
#define CONTROLLER_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Controller States
enum ControllerStates {
    CONTROLLER_C1,
    CONTROLLER_C2,
    CONTROLLER_C3,
};

// Controller Data Struct
typedef struct {
    
    // Declare Inputs
    double x;
    
    // Declare Outputs
    bool add1;
    bool remove1;
    bool add2;
    bool remove2;
    
    // Declare Internal Variables
    double y1;
    double y2;

    // State
    enum ControllerStates state;
} Controller;

// Controller Initialisation function
void ControllerInit(Controller* me);

// Controller Execution function
void ControllerRun(Controller* me);

#endif // CONTROLLER_H_