#include "nak_pump.h"

// NaK_pump Initialisation function
void NakPumpInit(NakPump* me) {
    // Initialise State
    me->state = NAK_PUMP_Q0;

    // Initialise Outputs
    me->body_temp_private = 0.0;
    me->gas_const_private = 0.0;
    me->faraday_const_private = 0.0;
    me->vm_private = 0.0;
    me->cmgadp_private = 0.0;
    me->cna_i_private = 0.0;
    me->v_cyc = 0.0;
    me->net_free_energy = 0.0;

    // Initialise Internal Variables
    me->dimless_na_e = 0.0;
    me->dimless_na_i = 0.0;
    me->dimless_k_e = 0.0;
    me->dimless_k_i = 0.0;
    me->dimless_mgatp = 0.0;
    me->alpha1 = 0.0;
    me->alpha2 = 0.0;
    me->alpha3 = 0.0;
    me->alpha4 = 0.0;
    me->minus_alpha1 = 0.0;
    me->minus_alpha2 = 0.0;
    me->minus_alpha3 = 0.0;
    me->minus_alpha4 = 0.0;
    me->c_pi = 0.0;
    me->dg_na = 0.0;
    me->dg_k = 0.0;
    me->dg_pump = 0.0;
    me->dg_atp = 0.0;
    me->diagram_sum = 0.0;
}

// NaK_pump Execution function
void NakPumpRun(NakPump* me) {
    // Create intermediary variables
    enum NakPumpStates state_u = me->state;
    double body_temp_private_u = me->body_temp_private;
    double gas_const_private_u = me->gas_const_private;
    double faraday_const_private_u = me->faraday_const_private;
    double vm_private_u = me->vm_private;
    double cmgadp_private_u = me->cmgadp_private;
    double cna_i_private_u = me->cna_i_private;
    double v_cyc_u = me->v_cyc;
    double net_free_energy_u = me->net_free_energy;

    double dimless_na_e_u = me->dimless_na_e;
    double dimless_na_i_u = me->dimless_na_i;
    double dimless_k_e_u = me->dimless_k_e;
    double dimless_k_i_u = me->dimless_k_i;
    double dimless_mgatp_u = me->dimless_mgatp;
    double alpha1_u = me->alpha1;
    double alpha2_u = me->alpha2;
    double alpha3_u = me->alpha3;
    double alpha4_u = me->alpha4;
    double minus_alpha1_u = me->minus_alpha1;
    double minus_alpha2_u = me->minus_alpha2;
    double minus_alpha3_u = me->minus_alpha3;
    double minus_alpha4_u = me->minus_alpha4;
    double c_pi_u = me->c_pi;
    double dg_na_u = me->dg_na;
    double dg_k_u = me->dg_k;
    double dg_pump_u = me->dg_pump;
    double dg_atp_u = me->dg_atp;
    double diagram_sum_u = me->diagram_sum;


    // Run the state machine for transition logic
    switch(me->state) {
        case NAK_PUMP_Q0: // Logic for state q0
            if(true) {
                c_pi_u = 4.2 / (1.0 + 140.0 / 292.0 + 8.1283E-5 / 1.69E-4 + me->cna_i / 224.0);
                dg_na_u = 8.314 * 310.0 * log(150.0 / me->cna_i) - 96485.0 * 0.001 * me->vm * 0.001;
                dg_k_u = 8.314 * 310.0 * log(140.0 / 5.4) + 96485.0 * 0.001 * me->vm * 0.001;
                dg_pump_u = 2.0 * me->dg_k + 3.0 * me->dg_na;
                dg_atp_u = -29600.0 - 8.314 * 310.0 * log(9.8 / (0.001 * me->c_mg_a_d_p * me->c_pi));
                net_free_energy_u = me->dg_atp + me->dg_pump;
                dimless_na_i_u = me->cna_i / (2.49 * exp((-0.031288692380984445 * 96485.0 * 0.001 * me->vm) / (3.0 * 8.314 * 310.0)));
                dimless_na_e_u = 150.0 / (15.5 * exp(((1.0 + -0.031288692380984445) * 96485.0 * 0.001 * me->vm) / (3.0 * 8.314 * 310.0)));
                dimless_k_i_u = 140.0 / 0.5;
                dimless_k_e_u = 5.4 / 0.213;
                dimless_mgatp_u = 9.8 / 2.51;
                alpha1_u = (1050.0 * (pow(me->dimless_na_i, 3.0))) / ((pow(1.0 + me->dimless_na_i, 3.0) + pow(1.0 + me->dimless_k_i, 2.0)) - 1.0);
                alpha2_u = 481.0;
                alpha3_u = (2000.0 * (pow(me->dimless_k_e, 2.0))) / ((pow(1.0 + me->dimless_na_e, 3.0) + pow(1.0 + me->dimless_k_e, 2.0)) - 1.0);
                alpha4_u = (320.0 * me->dimless_mgatp) / (1.0 + me->dimless_mgatp);
                minus_alpha1_u = 172.1 * me->c_mg_a_d_p;
                minus_alpha2_u = (40.1 * (pow(me->dimless_na_e, 3.0))) / ((pow(1.0 + me->dimless_na_e, 3.0) + pow(1.0 + me->dimless_k_e, 2.0)) - 1.0);
                minus_alpha3_u = ((79287.1 * me->c_pi * 8.1283E-5) / (1.0 + me->dimless_mgatp)) * 1.0000000000000002;
                minus_alpha4_u = (40.1 * (pow(me->dimless_k_i, 2.0))) / ((pow(1.0 + me->dimless_na_i, 3.0) + pow(1.0 + me->dimless_k_i, 2.0)) - 1.0);
                diagram_sum_u = me->minus_alpha3 * me->minus_alpha2 * me->minus_alpha1 + me->alpha4 * me->minus_alpha2 * me->minus_alpha1 + me->alpha4 * me->alpha2 * me->alpha3 + me->alpha4 * me->minus_alpha1 * me->alpha3 + me->minus_alpha3 * me->minus_alpha2 * me->alpha1 + me->alpha4 * me->minus_alpha2 * me->alpha1 + me->alpha4 * me->alpha1 * me->alpha3 + me->minus_alpha3 * me->alpha1 * me->alpha2 + me->alpha4 * me->alpha1 * me->alpha2 + me->alpha1 * me->alpha2 * me->alpha3 + me->minus_alpha4 * me->minus_alpha3 * me->minus_alpha1 + me->minus_alpha4 * me->minus_alpha3 * me->alpha2 + me->minus_alpha4 * me->minus_alpha3 * me->minus_alpha2 + me->minus_alpha4 * me->minus_alpha1 * me->minus_alpha2 + me->minus_alpha4 * me->alpha2 * me->alpha3 + me->minus_alpha4 * me->minus_alpha1 * me->alpha3;
                v_cyc_u = (me->alpha1 * me->alpha2 * me->alpha3 * me->alpha4 - me->minus_alpha1 * me->minus_alpha2 * me->minus_alpha3 * me->minus_alpha4) / me->diagram_sum;
                body_temp_private_u = 310.0;
                gas_const_private_u = 8.314;
                faraday_const_private_u = 96485.0;
                vm_private_u = me->vm;
                cmgadp_private_u = me->c_mg_a_d_p;
                cna_i_private_u = me->cna_i;

                // Remain in this state
                state_u = NAK_PUMP_Q0;
            }
            break;
    }

    // Update from intermediary variables
    me->state = state_u;
    me->body_temp_private = body_temp_private_u;
    me->gas_const_private = gas_const_private_u;
    me->faraday_const_private = faraday_const_private_u;
    me->vm_private = vm_private_u;
    me->cmgadp_private = cmgadp_private_u;
    me->cna_i_private = cna_i_private_u;
    me->v_cyc = v_cyc_u;
    me->net_free_energy = net_free_energy_u;

    me->dimless_na_e = dimless_na_e_u;
    me->dimless_na_i = dimless_na_i_u;
    me->dimless_k_e = dimless_k_e_u;
    me->dimless_k_i = dimless_k_i_u;
    me->dimless_mgatp = dimless_mgatp_u;
    me->alpha1 = alpha1_u;
    me->alpha2 = alpha2_u;
    me->alpha3 = alpha3_u;
    me->alpha4 = alpha4_u;
    me->minus_alpha1 = minus_alpha1_u;
    me->minus_alpha2 = minus_alpha2_u;
    me->minus_alpha3 = minus_alpha3_u;
    me->minus_alpha4 = minus_alpha4_u;
    me->c_pi = c_pi_u;
    me->dg_na = dg_na_u;
    me->dg_k = dg_k_u;
    me->dg_pump = dg_pump_u;
    me->dg_atp = dg_atp_u;
    me->diagram_sum = diagram_sum_u;

}