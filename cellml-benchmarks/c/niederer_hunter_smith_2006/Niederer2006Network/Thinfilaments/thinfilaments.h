#ifndef THINFILAMENTS_H_
#define THINFILAMENTS_H_

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

typedef int bool;
#define false 0
#define true 1

#include "config.h"

// thinfilaments States
enum ThinfilamentsStates {
    THINFILAMENTS_Q0,
};

// thinfilaments Data Struct
typedef struct {

    // State
    enum ThinfilamentsStates state;
} Thinfilaments;

// thinfilaments Initialisation function
void ThinfilamentsInit(Thinfilaments* me);

// thinfilaments Execution function
void ThinfilamentsRun(Thinfilaments* me);

#endif // THINFILAMENTS_H_