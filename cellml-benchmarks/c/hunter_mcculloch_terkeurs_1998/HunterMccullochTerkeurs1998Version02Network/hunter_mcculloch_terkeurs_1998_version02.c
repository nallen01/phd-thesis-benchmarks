#include "hunter_mcculloch_terkeurs_1998_version02.h"

// hunter_mcculloch_terkeurs_1998_version02 Initialisation function
void HunterMccullochTerkeurs1998Version02Init(HunterMccullochTerkeurs1998Version02* me) {
    // Initialise Sub-objects
    EnvironmentInit(&me->environment_data);

    CalciumTransientInit(&me->calcium_transient_data);

    TncCaBindingKineticsInit(&me->tnc_ca_binding_kinetics_data);

    ThinFilamentKineticsInit(&me->thin_filament_kinetics_data);

    CrossbridgeKineticsInit(&me->crossbridge_kinetics_data);

    // Initialise Outputs
    me->environment_time = me->environment_data.time;
    me->calcium_transient_ca_i = me->calcium_transient_data.ca_i;
    me->tnc_ca_binding_kinetics_ca_b = me->tnc_ca_binding_kinetics_data.ca_b;
    me->tnc_ca_binding_kinetics_lambda = me->tnc_ca_binding_kinetics_data.lambda;
    me->thin_filament_kinetics_to = me->thin_filament_kinetics_data.to;
    me->crossbridge_kinetics_t = me->crossbridge_kinetics_data.t;
}

// hunter_mcculloch_terkeurs_1998_version02 Execution function
void HunterMccullochTerkeurs1998Version02Run(HunterMccullochTerkeurs1998Version02* me) {
    // Mappings
    me->tnc_ca_binding_kinetics_data.ca_i = me->calcium_transient_data.ca_i;
    me->tnc_ca_binding_kinetics_data.t = me->crossbridge_kinetics_data.t;
    me->tnc_ca_binding_kinetics_data.to = me->thin_filament_kinetics_data.to;
    me->tnc_ca_binding_kinetics_data.time = me->environment_data.time;
    me->calcium_transient_data.time = me->environment_data.time;
    me->crossbridge_kinetics_data.to = me->thin_filament_kinetics_data.to;
    me->crossbridge_kinetics_data.time = me->environment_data.time;
    me->thin_filament_kinetics_data.ca_b = me->tnc_ca_binding_kinetics_data.ca_b;
    me->thin_filament_kinetics_data.lambda = me->tnc_ca_binding_kinetics_data.lambda;
    me->thin_filament_kinetics_data.time = me->environment_data.time;

    // Run Automata
    EnvironmentRun(&me->environment_data);

    CalciumTransientRun(&me->calcium_transient_data);

    TncCaBindingKineticsRun(&me->tnc_ca_binding_kinetics_data);

    ThinFilamentKineticsRun(&me->thin_filament_kinetics_data);

    CrossbridgeKineticsRun(&me->crossbridge_kinetics_data);

    // Output Mapping
    me->tnc_ca_binding_kinetics_ca_b = me->tnc_ca_binding_kinetics_data.ca_b;
    me->tnc_ca_binding_kinetics_lambda = me->tnc_ca_binding_kinetics_data.lambda;
    me->calcium_transient_ca_i = me->calcium_transient_data.ca_i;
    me->crossbridge_kinetics_t = me->crossbridge_kinetics_data.t;
    me->environment_time = me->environment_data.time;
    me->thin_filament_kinetics_to = me->thin_filament_kinetics_data.to;
}