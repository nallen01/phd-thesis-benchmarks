#ifndef IONIC_CONCENTRATIONS_H_
#define IONIC_CONCENTRATIONS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// ionic_concentrations States
enum IonicConcentrationsStates {
    IONIC_CONCENTRATIONS_Q0,
};

// ionic_concentrations Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double f;
    double i_na;
    double i_cana;
    double i_na_b;
    double i_ns_na;
    double i_naca;
    double i_nak;
    double i_caca;
    double i_cak;
    double i_p_ca;
    double i_ca_b;
    double i_k;
    double i_k1;
    double i_kp;
    double i_ns_k;
    double i_tr;
    double i_rel;
    double i_leak;
    double i_up;
    
    // Declare Outputs
    double nai;
    double nao;
    double cai;
    double cao;
    double ki;
    double ko;
    double ca_jsr;
    double ca_nsr;

    // State
    enum IonicConcentrationsStates state;
} IonicConcentrations;

// ionic_concentrations Initialisation function
void IonicConcentrationsInit(IonicConcentrations* me);

// ionic_concentrations Execution function
void IonicConcentrationsRun(IonicConcentrations* me);

#endif // IONIC_CONCENTRATIONS_H_