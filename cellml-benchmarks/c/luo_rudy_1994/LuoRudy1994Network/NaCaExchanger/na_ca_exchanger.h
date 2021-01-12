#ifndef NA_CA_EXCHANGER_H_
#define NA_CA_EXCHANGER_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// Na_Ca_exchanger States
enum NaCaExchangerStates {
    NA_CA_EXCHANGER_Q0,
};

// Na_Ca_exchanger Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double r;
    double t;
    double f;
    double nai;
    double nao;
    double cai;
    double cao;
    
    // Declare Outputs
    double i_naca;

    // State
    enum NaCaExchangerStates state;
} NaCaExchanger;

// Na_Ca_exchanger Initialisation function
void NaCaExchangerInit(NaCaExchanger* me);

// Na_Ca_exchanger Execution function
void NaCaExchangerRun(NaCaExchanger* me);

#endif // NA_CA_EXCHANGER_H_