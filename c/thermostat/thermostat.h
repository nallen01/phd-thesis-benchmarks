#ifndef THERMOSTAT_H_
#define THERMOSTAT_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// thermostat States
enum ThermostatStates {
    THERMOSTAT_T1,
    THERMOSTAT_T2,
};

// thermostat Data Struct
typedef struct {
    
    // Declare Outputs
    double temperature;

    // State
    enum ThermostatStates state;
} Thermostat;

// thermostat Initialisation function
void ThermostatInit(Thermostat* me);

// thermostat Execution function
void ThermostatRun(Thermostat* me);

#endif // THERMOSTAT_H_