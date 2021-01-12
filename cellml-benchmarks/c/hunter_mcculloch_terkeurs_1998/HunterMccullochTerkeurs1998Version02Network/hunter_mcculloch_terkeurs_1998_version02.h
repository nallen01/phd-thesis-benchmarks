#ifndef HUNTER_MCCULLOCH_TERKEURS_1998_VERSION02_H_
#define HUNTER_MCCULLOCH_TERKEURS_1998_VERSION02_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "Environment/environment.h"
#include "CalciumTransient/calcium_transient.h"
#include "TncCaBindingKinetics/tnc_ca_binding_kinetics.h"
#include "ThinFilamentKinetics/thin_filament_kinetics.h"
#include "CrossbridgeKinetics/crossbridge_kinetics.h"

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// hunter_mcculloch_terkeurs_1998_version02 Data Struct
typedef struct {
    
    // Declare Outputs
    double environment_time;
    double calcium_transient_ca_i;
    double tnc_ca_binding_kinetics_ca_b;
    double tnc_ca_binding_kinetics_lambda;
    double thin_filament_kinetics_to;
    double crossbridge_kinetics_t;

    // Declare Daughter Automata
    Environment environment_data;
    CalciumTransient calcium_transient_data;
    TncCaBindingKinetics tnc_ca_binding_kinetics_data;
    ThinFilamentKinetics thin_filament_kinetics_data;
    CrossbridgeKinetics crossbridge_kinetics_data;
} HunterMccullochTerkeurs1998Version02;

// hunter_mcculloch_terkeurs_1998_version02 Initialisation function
void HunterMccullochTerkeurs1998Version02Init(HunterMccullochTerkeurs1998Version02* me);

// hunter_mcculloch_terkeurs_1998_version02 Execution function
void HunterMccullochTerkeurs1998Version02Run(HunterMccullochTerkeurs1998Version02* me);

#endif // HUNTER_MCCULLOCH_TERKEURS_1998_VERSION02_H_