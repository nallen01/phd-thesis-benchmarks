#ifndef L_TYPE_CA_CHANNEL_H_
#define L_TYPE_CA_CHANNEL_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// L_type_Ca_channel States
enum LTypeCaChannelStates {
    L_TYPE_CA_CHANNEL_Q0,
};

// L_type_Ca_channel Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double cai;
    double r;
    double t;
    double f;
    double cao;
    double nao;
    double ko;
    double nai;
    double ki;
    double d_private;
    double f1_private;
    double f_ca_private;
    
    // Declare Outputs
    double i_ca_l;
    double i_caca;
    double i_cak;
    double i_cana;
    double gamma_nai;
    double gamma_nao;
    double gamma_ki;
    double gamma_ko;
    double time_private;
    double v_private;
    double cai_private;
    
    // Declare Internal Variables
    double i_caca1;
    double i_cak1;
    double i_cana1;
    double d;
    double f1;
    double f_ca;

    // State
    enum LTypeCaChannelStates state;
} LTypeCaChannel;

// L_type_Ca_channel Initialisation function
void LTypeCaChannelInit(LTypeCaChannel* me);

// L_type_Ca_channel Execution function
void LTypeCaChannelRun(LTypeCaChannel* me);

#endif // L_TYPE_CA_CHANNEL_H_