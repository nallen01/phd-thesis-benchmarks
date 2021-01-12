#include "smith_2004.h"

// smith_2004 Initialisation function
void Smith2004Init(Smith2004* me) {
    // Initialise Sub-objects
    InterfaceInit(&me->interface_data);

    NakPumpInit(&me->nak_pump_data);

    // Initialise Outputs
    me->interface_time_private = me->interface_data.time_private;
    me->interface_vm_private = me->interface_data.vm_private;
    me->interface_cmgadp_private = me->interface_data.cmgadp_private;
    me->interface_cna_i_private = me->interface_data.cna_i_private;
    me->interface_v_cyc = me->interface_data.v_cyc;
    me->interface_net_free_energy = me->interface_data.net_free_energy;
    me->nak_pump_body_temp_private = me->nak_pump_data.body_temp_private;
    me->nak_pump_gas_const_private = me->nak_pump_data.gas_const_private;
    me->nak_pump_faraday_const_private = me->nak_pump_data.faraday_const_private;
    me->nak_pump_vm_private = me->nak_pump_data.vm_private;
    me->nak_pump_cmgadp_private = me->nak_pump_data.cmgadp_private;
    me->nak_pump_cna_i_private = me->nak_pump_data.cna_i_private;
    me->nak_pump_v_cyc = me->nak_pump_data.v_cyc;
    me->nak_pump_net_free_energy = me->nak_pump_data.net_free_energy;
}

// smith_2004 Execution function
void Smith2004Run(Smith2004* me) {
    // Mappings
    me->nak_pump_data.vm = me->interface_data.vm_private;
    me->nak_pump_data.c_mg_a_d_p = me->interface_data.cmgadp_private;
    me->nak_pump_data.cna_i = me->interface_data.cna_i_private;
    me->interface_data.net_free_energy_private = me->nak_pump_data.net_free_energy;
    me->interface_data.v_cyc_private = me->nak_pump_data.v_cyc;

    // Run Automata
    InterfaceRun(&me->interface_data);

    NakPumpRun(&me->nak_pump_data);

    // Output Mapping
    me->nak_pump_vm_private = me->nak_pump_data.vm_private;
    me->nak_pump_body_temp_private = me->nak_pump_data.body_temp_private;
    me->nak_pump_cmgadp_private = me->nak_pump_data.cmgadp_private;
    me->nak_pump_cna_i_private = me->nak_pump_data.cna_i_private;
    me->nak_pump_faraday_const_private = me->nak_pump_data.faraday_const_private;
    me->nak_pump_gas_const_private = me->nak_pump_data.gas_const_private;
    me->nak_pump_net_free_energy = me->nak_pump_data.net_free_energy;
    me->nak_pump_v_cyc = me->nak_pump_data.v_cyc;
    me->interface_vm_private = me->interface_data.vm_private;
    me->interface_cmgadp_private = me->interface_data.cmgadp_private;
    me->interface_cna_i_private = me->interface_data.cna_i_private;
    me->interface_net_free_energy = me->interface_data.net_free_energy;
    me->interface_time_private = me->interface_data.time_private;
    me->interface_v_cyc = me->interface_data.v_cyc;
}