#ifndef SMITH_2004_H_
#define SMITH_2004_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Interface/interface.h"
#include "NakPump/nak_pump.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// smith_2004 Data Struct
typedef struct {
    
    // Declare Outputs
    double interface_time_private;
    double interface_vm_private;
    double interface_cmgadp_private;
    double interface_cna_i_private;
    double interface_v_cyc;
    double interface_net_free_energy;
    double nak_pump_body_temp_private;
    double nak_pump_gas_const_private;
    double nak_pump_faraday_const_private;
    double nak_pump_vm_private;
    double nak_pump_cmgadp_private;
    double nak_pump_cna_i_private;
    double nak_pump_v_cyc;
    double nak_pump_net_free_energy;

    // Declare Daughter Automata
    Interface interface_data;
    NakPump nak_pump_data;
} Smith2004;

// smith_2004 Initialisation function
void Smith2004Init(Smith2004* me);

// smith_2004 Execution function
void Smith2004Run(Smith2004* me);

#endif // SMITH_2004_H_