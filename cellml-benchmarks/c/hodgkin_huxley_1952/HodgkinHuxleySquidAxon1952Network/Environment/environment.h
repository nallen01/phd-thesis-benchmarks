#ifndef ENVIRONMENT_H_
#define ENVIRONMENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// environment States
enum EnvironmentStates {
    ENVIRONMENT_Q0,
};

// environment Data Struct
typedef struct {
    
    // Declare Outputs
    double time;

    // State
    enum EnvironmentStates state;
} Environment;

// environment Initialisation function
void EnvironmentInit(Environment* me);

// environment Execution function
void EnvironmentRun(Environment* me);

#endif // ENVIRONMENT_H_