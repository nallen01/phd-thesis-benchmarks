#ifndef CALCIUM_FLUXES_IN_THE_SR_H_
#define CALCIUM_FLUXES_IN_THE_SR_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// calcium_fluxes_in_the_SR States
enum CalciumFluxesInTheSrStates {
    CALCIUM_FLUXES_IN_THE_SR_Q0,
};

// calcium_fluxes_in_the_SR Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double cai;
    double ca_jsr;
    double ca_nsr;
    
    // Declare Outputs
    double i_rel;
    double i_up;
    double i_leak;
    double i_tr;
    
    // Declare Internal Variables
    double g_rel;
    double g_rel_peak;
    double k_leak;

    // State
    enum CalciumFluxesInTheSrStates state;
} CalciumFluxesInTheSr;

// calcium_fluxes_in_the_SR Initialisation function
void CalciumFluxesInTheSrInit(CalciumFluxesInTheSr* me);

// calcium_fluxes_in_the_SR Execution function
void CalciumFluxesInTheSrRun(CalciumFluxesInTheSr* me);

#endif // CALCIUM_FLUXES_IN_THE_SR_H_