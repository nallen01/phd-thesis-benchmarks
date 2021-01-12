#ifndef CROSS_BRIDGES_H_
#define CROSS_BRIDGES_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Cross_Bridges States
enum CrossBridgesStates {
    CROSS_BRIDGES_Q0,
};

// Cross_Bridges Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double d_extension_ratiodt;
    double t_0;
    
    // Declare Outputs
    double tension;
    
    // Declare Internal Variables
    double q;
    double q_1;
    double q_2;
    double q_3;

    // State
    enum CrossBridgesStates state;
} CrossBridges;

// Cross_Bridges Initialisation function
void CrossBridgesInit(CrossBridges* me);

// Cross_Bridges Execution function
void CrossBridgesRun(CrossBridges* me);

#endif // CROSS_BRIDGES_H_