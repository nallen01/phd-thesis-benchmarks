#ifndef BURNER_H_
#define BURNER_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Burner States
enum BurnerStates {
    BURNER_B1,
    BURNER_B2,
};

// Burner Data Struct
typedef struct {
    
    // Declare Outputs
    bool burner_on;
    bool burner_off;
    
    // Declare Internal Variables
    double y;

    // State
    enum BurnerStates state;
} Burner;

// Burner Initialisation function
void BurnerInit(Burner* me);

// Burner Execution function
void BurnerRun(Burner* me);

#endif // BURNER_H_