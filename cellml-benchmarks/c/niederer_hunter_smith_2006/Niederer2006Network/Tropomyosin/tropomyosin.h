#ifndef TROPOMYOSIN_H_
#define TROPOMYOSIN_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// tropomyosin States
enum TropomyosinStates {
    TROPOMYOSIN_Q0,
};

// tropomyosin Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double k_on;
    double k_ref_off;
    double gamma_trpn;
    double ca_trpn_max;
    double beta_0;
    double ca_b;
    double lambda;
    
    // Declare Outputs
    double z;
    double z_max;
    
    // Declare Internal Variables
    double ca_50;
    double ca_trpn_50;
    double k_2;
    double k_1;
    double alpha_tm;
    double beta_tm;

    // State
    enum TropomyosinStates state;
} Tropomyosin;

// tropomyosin Initialisation function
void TropomyosinInit(Tropomyosin* me);

// tropomyosin Execution function
void TropomyosinRun(Tropomyosin* me);

#endif // TROPOMYOSIN_H_