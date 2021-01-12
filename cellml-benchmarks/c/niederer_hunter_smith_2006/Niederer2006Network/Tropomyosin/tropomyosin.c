#include "tropomyosin.h"

// tropomyosin Initialisation function
void TropomyosinInit(Tropomyosin* me) {
    // Initialise State
    me->state = TROPOMYOSIN_Q0;

    // Initialise Outputs
    me->z = 0.014417937837;
    me->z_max = 0.0;

    // Initialise Internal Variables
    me->ca_50 = 0.0;
    me->ca_trpn_50 = 0.0;
    me->k_2 = 0.0;
    me->k_1 = 0.0;
    me->alpha_tm = 0.0;
    me->beta_tm = 0.0;
}

// tropomyosin Execution function
void TropomyosinRun(Tropomyosin* me) {
    // Create intermediary variables
    enum TropomyosinStates state_u = me->state;
    double z_u = me->z;
    double z_max_u = me->z_max;

    double ca_50_u = me->ca_50;
    double ca_trpn_50_u = me->ca_trpn_50;
    double k_2_u = me->k_2;
    double k_1_u = me->k_1;
    double alpha_tm_u = me->alpha_tm;
    double beta_tm_u = me->beta_tm;


    // Run the state machine for transition logic
    switch(me->state) {
        case TROPOMYOSIN_Q0: // Logic for state q0
            if(true) {
                z_u = me->z + (me->alpha_tm * (1.0 - me->z) - me->beta_tm * me->z) * STEP_SIZE;

                k_2_u = ((0.00175 * (pow(0.85, 3.0))) / (pow(0.85, 3.0) + pow(0.15, 3.0))) * (1.0 - (3.0 * (pow(0.15, 3.0))) / (pow(0.85, 3.0) + pow(0.15, 3.0)));
                k_1_u = (0.00175 * (pow(0.85, 3.0 - 1.0)) * 3.0 * (pow(0.15, 3.0))) / (pow(pow(0.85, 3.0) + pow(0.15, 3.0), 2.0));
                z_max_u = (0.008 / (pow(me->ca_trpn_50 / me->ca_trpn_max, 3.0)) - me->k_2) / (0.002 + me->k_1 + 0.008 / (pow(me->ca_trpn_50 / me->ca_trpn_max, 3.0)));
                ca_50_u = 0.00105 * (1.0 + -4.0 * (me->lambda - 1.0));
                ca_trpn_50_u = (me->ca_50 * me->ca_trpn_max) / (me->ca_50 + (me->k_ref_off / me->k_on) * (1.0 - ((1.0 + me->beta_0 * (me->lambda - 1.0)) * 0.5) / me->gamma_trpn));
                alpha_tm_u = 0.008 * (pow(me->ca_b / me->ca_trpn_50, 3.0));
                beta_tm_u = 0.002 + (0.00175 * (pow(z_u, 3.0 - 1.0))) / (pow(z_u, 3.0) + pow(0.15, 3.0));

                // Remain in this state
                state_u = TROPOMYOSIN_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->z = z_u;
    me->z_max = z_max_u;

    me->ca_50 = ca_50_u;
    me->ca_trpn_50 = ca_trpn_50_u;
    me->k_2 = k_2_u;
    me->k_1 = k_1_u;
    me->alpha_tm = alpha_tm_u;
    me->beta_tm = beta_tm_u;

}