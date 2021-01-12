#ifndef TROPONIN_H_
#define TROPONIN_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// troponin States
enum TroponinStates {
    TROPONIN_Q0,
};

// troponin Data Struct
typedef struct {
    
    // Declare Inputs
    double trpn;
    double ca_i;
    double tension;
    double t_ref;
    
    // Declare Outputs
    double j_trpn;
    double ca_trpn_max;
    double k_on;
    double k_ref_off;
    double gamma_trpn;
    
    // Declare Internal Variables
    double k_off;

    // State
    enum TroponinStates state;
} Troponin;

// troponin Initialisation function
void TroponinInit(Troponin* me);

// troponin Execution function
void TroponinRun(Troponin* me);

#endif // TROPONIN_H_