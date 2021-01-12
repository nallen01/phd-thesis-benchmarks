#ifndef NAK_PUMP_H_
#define NAK_PUMP_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// NaK_pump States
enum NakPumpStates {
    NAK_PUMP_Q0,
};

// NaK_pump Data Struct
typedef struct {
    
    // Declare Inputs
    double vm;
    double c_mg_a_d_p;
    double cna_i;
    
    // Declare Outputs
    double body_temp_private;
    double gas_const_private;
    double faraday_const_private;
    double vm_private;
    double cmgadp_private;
    double cna_i_private;
    double v_cyc;
    double net_free_energy;
    
    // Declare Internal Variables
    double dimless_na_e;
    double dimless_na_i;
    double dimless_k_e;
    double dimless_k_i;
    double dimless_mgatp;
    double alpha1;
    double alpha2;
    double alpha3;
    double alpha4;
    double minus_alpha1;
    double minus_alpha2;
    double minus_alpha3;
    double minus_alpha4;
    double c_pi;
    double dg_na;
    double dg_k;
    double dg_pump;
    double dg_atp;
    double diagram_sum;

    // State
    enum NakPumpStates state;
} NakPump;

// NaK_pump Initialisation function
void NakPumpInit(NakPump* me);

// NaK_pump Execution function
void NakPumpRun(NakPump* me);

#endif // NAK_PUMP_H_