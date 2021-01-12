#ifndef SARCOLEMMAL_CALCIUM_PUMP_H_
#define SARCOLEMMAL_CALCIUM_PUMP_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sarcolemmal_calcium_pump States
enum SarcolemmalCalciumPumpStates {
    SARCOLEMMAL_CALCIUM_PUMP_Q0,
};

// sarcolemmal_calcium_pump Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double cai;
    
    // Declare Outputs
    double i_p_ca;

    // State
    enum SarcolemmalCalciumPumpStates state;
} SarcolemmalCalciumPump;

// sarcolemmal_calcium_pump Initialisation function
void SarcolemmalCalciumPumpInit(SarcolemmalCalciumPump* me);

// sarcolemmal_calcium_pump Execution function
void SarcolemmalCalciumPumpRun(SarcolemmalCalciumPump* me);

#endif // SARCOLEMMAL_CALCIUM_PUMP_H_