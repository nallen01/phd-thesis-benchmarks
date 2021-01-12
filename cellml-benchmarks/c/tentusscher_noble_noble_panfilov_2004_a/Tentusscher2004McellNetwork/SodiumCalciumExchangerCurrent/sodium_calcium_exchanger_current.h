#ifndef SODIUM_CALCIUM_EXCHANGER_CURRENT_H_
#define SODIUM_CALCIUM_EXCHANGER_CURRENT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_calcium_exchanger_current States
enum SodiumCalciumExchangerCurrentStates {
    SODIUM_CALCIUM_EXCHANGER_CURRENT_Q0,
};

// sodium_calcium_exchanger_current Data Struct
typedef struct {
    
    // Declare Inputs
    double na_i;
    double na_o;
    double ca_i;
    double ca_o;
    double r;
    double f;
    double t;
    double v;
    double time;
    
    // Declare Outputs
    double i_naca;

    // State
    enum SodiumCalciumExchangerCurrentStates state;
} SodiumCalciumExchangerCurrent;

// sodium_calcium_exchanger_current Initialisation function
void SodiumCalciumExchangerCurrentInit(SodiumCalciumExchangerCurrent* me);

// sodium_calcium_exchanger_current Execution function
void SodiumCalciumExchangerCurrentRun(SodiumCalciumExchangerCurrent* me);

#endif // SODIUM_CALCIUM_EXCHANGER_CURRENT_H_