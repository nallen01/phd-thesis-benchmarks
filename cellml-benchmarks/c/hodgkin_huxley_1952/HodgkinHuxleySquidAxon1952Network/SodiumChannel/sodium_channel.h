#ifndef SODIUM_CHANNEL_H_
#define SODIUM_CHANNEL_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// sodium_channel States
enum SodiumChannelStates {
    SODIUM_CHANNEL_Q0,
};

// sodium_channel Data Struct
typedef struct {
    
    // Declare Inputs
    double time;
    double v;
    double e_r;
    double m_private;
    double h_private;
    
    // Declare Outputs
    double i_na;
    double time_private;
    double v_private;
    
    // Declare Internal Variables
    double e_na;
    double m;
    double h;

    // State
    enum SodiumChannelStates state;
} SodiumChannel;

// sodium_channel Initialisation function
void SodiumChannelInit(SodiumChannel* me);

// sodium_channel Execution function
void SodiumChannelRun(SodiumChannel* me);

#endif // SODIUM_CHANNEL_H_