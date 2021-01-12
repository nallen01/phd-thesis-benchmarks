#ifndef POTASSIUM_CHANNEL_H_
#define POTASSIUM_CHANNEL_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// potassium_channel States
enum PotassiumChannelStates {
    POTASSIUM_CHANNEL_Q0,
};

// potassium_channel Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double e_r;
    double n_private;
    
    // Declare Outputs
    double i_k;
    double time_private;
    double v_private;
    
    // Declare Internal Variables
    double e_k;
    double n;

    // State
    enum PotassiumChannelStates state;
} PotassiumChannel;

// potassium_channel Initialisation function
void PotassiumChannelInit(PotassiumChannel* me);

// potassium_channel Execution function
void PotassiumChannelRun(PotassiumChannel* me);

#endif // POTASSIUM_CHANNEL_H_