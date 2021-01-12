#include "l_type_ca_channel.h"

// L_type_Ca_channel Initialisation function
void LTypeCaChannelInit(LTypeCaChannel* me) {
    // Initialise State
    me->state = L_TYPE_CA_CHANNEL_Q0;

    // Initialise Outputs
    me->i_ca_l = 0.0;
    me->i_caca = 0.0;
    me->i_cak = 0.0;
    me->i_cana = 0.0;
    me->gamma_nai = 0.75;
    me->gamma_nao = 0.75;
    me->gamma_ki = 0.75;
    me->gamma_ko = 0.75;
    me->time_private = 0.0;
    me->v_private = 0.0;
    me->cai_private = 0.0;

    // Initialise Internal Variables
    me->i_caca1 = 0.0;
    me->i_cak1 = 0.0;
    me->i_cana1 = 0.0;
    me->d = 0.0;
    me->f1 = 0.0;
    me->f_ca = 0.0;
}

// L_type_Ca_channel Execution function
void LTypeCaChannelRun(LTypeCaChannel* me) {
    // Create intermediary variables
    enum LTypeCaChannelStates state_u = me->state;
    double i_ca_l_u = me->i_ca_l;
    double i_caca_u = me->i_caca;
    double i_cak_u = me->i_cak;
    double i_cana_u = me->i_cana;
    double gamma_nai_u = me->gamma_nai;
    double gamma_nao_u = me->gamma_nao;
    double gamma_ki_u = me->gamma_ki;
    double gamma_ko_u = me->gamma_ko;
    double time_private_u = me->time_private;
    double v_private_u = me->v_private;
    double cai_private_u = me->cai_private;

    double i_caca1_u = me->i_caca1;
    double i_cak1_u = me->i_cak1;
    double i_cana1_u = me->i_cana1;
    double d_u = me->d;
    double f1_u = me->f1;
    double f_ca_u = me->f_ca;


    // Run the state machine for transition logic
    switch(me->state) {
        case L_TYPE_CA_CHANNEL_Q0: // Logic for state q0
            if(true) {
                i_caca_u = me->d * me->f1 * me->f_ca * me->i_caca1;
                i_cana_u = me->d * me->f1 * me->f_ca * me->i_cana1;
                i_cak_u = me->d * me->f1 * me->f_ca * me->i_cak1;
                i_caca1_u = 5.4E-6 * (pow(2.0, 2.0)) * ((me->v * (pow(me->f, 2.0))) / (me->r * me->t)) * ((1.0 * me->cai * exp((2.0 * me->v * me->f) / (me->r * me->t)) - 0.34 * me->cao) / (exp((2.0 * me->v * me->f) / (me->r * me->t)) - 1.0)) * 0.9999999999999999;
                i_cana1_u = 6.75E-9 * (pow(1.0, 2.0)) * ((me->v * (pow(me->f, 2.0))) / (me->r * me->t)) * ((me->gamma_nai * me->nai * exp((1.0 * me->v * me->f) / (me->r * me->t)) - me->gamma_nao * me->nao) / (exp((1.0 * me->v * me->f) / (me->r * me->t)) - 1.0)) * 0.9999999999999999;
                i_cak1_u = 1.93E-9 * (pow(1.0, 2.0)) * ((me->v * (pow(me->f, 2.0))) / (me->r * me->t)) * ((me->gamma_ki * me->ki * exp((1.0 * me->v * me->f) / (me->r * me->t)) - me->gamma_ko * me->ko) / (exp((1.0 * me->v * me->f) / (me->r * me->t)) - 1.0)) * 0.9999999999999999;
                i_ca_l_u = me->i_caca + me->i_cak + me->i_cana;
                time_private_u = me->time;
                v_private_u = me->v;
                cai_private_u = me->cai;
                d_u = me->d_private;
                f1_u = me->f1_private;
                f_ca_u = me->f_ca_private;

                // Remain in this state
                state_u = L_TYPE_CA_CHANNEL_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->i_ca_l = i_ca_l_u;
    me->i_caca = i_caca_u;
    me->i_cak = i_cak_u;
    me->i_cana = i_cana_u;
    me->gamma_nai = gamma_nai_u;
    me->gamma_nao = gamma_nao_u;
    me->gamma_ki = gamma_ki_u;
    me->gamma_ko = gamma_ko_u;
    me->time_private = time_private_u;
    me->v_private = v_private_u;
    me->cai_private = cai_private_u;

    me->i_caca1 = i_caca1_u;
    me->i_cak1 = i_cak1_u;
    me->i_cana1 = i_cana1_u;
    me->d = d_u;
    me->f1 = f1_u;
    me->f_ca = f_ca_u;

}