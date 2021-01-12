library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity LuoRudy1994 is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        environment_time_out : out signed(31 downto 0);
        membrane_v_out : out signed(31 downto 0);
        membrane_r_out : out signed(31 downto 0);
        membrane_t_out : out signed(31 downto 0);
        membrane_f_out : out signed(31 downto 0);
        membrane_dv_dt_out : out signed(31 downto 0);
        membrane_istimc_out : out signed(31 downto 0);
        fast_sodium_current_i_na_out : out signed(31 downto 0);
        fast_sodium_current_e_na_out : out signed(31 downto 0);
        fast_sodium_current_time_private_out : out signed(31 downto 0);
        fast_sodium_current_v_private_out : out signed(31 downto 0);
        fast_sodium_current_m_gate_m_out : out signed(31 downto 0);
        fast_sodium_current_h_gate_h_out : out signed(31 downto 0);
        fast_sodium_current_j_gate_j_out : out signed(31 downto 0);
        l_type_ca_channel_i_ca_l_out : out signed(31 downto 0);
        l_type_ca_channel_i_caca_out : out signed(31 downto 0);
        l_type_ca_channel_i_cak_out : out signed(31 downto 0);
        l_type_ca_channel_i_cana_out : out signed(31 downto 0);
        l_type_ca_channel_gamma_nai_out : out signed(31 downto 0);
        l_type_ca_channel_gamma_nao_out : out signed(31 downto 0);
        l_type_ca_channel_gamma_ki_out : out signed(31 downto 0);
        l_type_ca_channel_gamma_ko_out : out signed(31 downto 0);
        l_type_ca_channel_time_private_out : out signed(31 downto 0);
        l_type_ca_channel_v_private_out : out signed(31 downto 0);
        l_type_ca_channel_cai_private_out : out signed(31 downto 0);
        l_type_ca_channel_d_gate_d_out : out signed(31 downto 0);
        l_type_ca_channel_f_gate_f_out : out signed(31 downto 0);
        l_type_ca_channel_f_ca_gate_f_ca_out : out signed(31 downto 0);
        time_dependent_potassium_current_i_k_out : out signed(31 downto 0);
        time_dependent_potassium_current_time_private_out : out signed(31 downto 0);
        time_dependent_potassium_current_v_private_out : out signed(31 downto 0);
        time_dependent_potassium_current_x_gate_x_out : out signed(31 downto 0);
        time_dependent_potassium_current_xi_gate_xi_out : out signed(31 downto 0);
        time_independent_potassium_current_i_k1_out : out signed(31 downto 0);
        time_independent_potassium_current_e_k1_out : out signed(31 downto 0);
        time_independent_potassium_current_time_private_out : out signed(31 downto 0);
        time_independent_potassium_current_v_private_out : out signed(31 downto 0);
        time_independent_potassium_current_k1_gate_k1_infinity_out : out signed(31 downto 0);
        plateau_potassium_current_i_kp_out : out signed(31 downto 0);
        sarcolemmal_calcium_pump_i_p_ca_out : out signed(31 downto 0);
        sodium_background_current_i_na_b_out : out signed(31 downto 0);
        calcium_background_current_i_ca_b_out : out signed(31 downto 0);
        sodium_potassium_pump_i_nak_out : out signed(31 downto 0);
        non_specific_calcium_activated_current_i_ns_ca_out : out signed(31 downto 0);
        non_specific_calcium_activated_current_i_ns_na_out : out signed(31 downto 0);
        non_specific_calcium_activated_current_i_ns_k_out : out signed(31 downto 0);
        na_ca_exchanger_i_naca_out : out signed(31 downto 0);
        calcium_fluxes_in_the_sr_i_rel_out : out signed(31 downto 0);
        calcium_fluxes_in_the_sr_i_up_out : out signed(31 downto 0);
        calcium_fluxes_in_the_sr_i_leak_out : out signed(31 downto 0);
        calcium_fluxes_in_the_sr_i_tr_out : out signed(31 downto 0);
        ionic_concentrations_nai_out : out signed(31 downto 0);
        ionic_concentrations_nao_out : out signed(31 downto 0);
        ionic_concentrations_cai_out : out signed(31 downto 0);
        ionic_concentrations_cao_out : out signed(31 downto 0);
        ionic_concentrations_ki_out : out signed(31 downto 0);
        ionic_concentrations_ko_out : out signed(31 downto 0);
        ionic_concentrations_ca_jsr_out : out signed(31 downto 0);
        ionic_concentrations_ca_nsr_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LuoRudy1994 is
    -- Declare all internal signals
    signal environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_ca_l : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_kp : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_na_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_ns_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_dv_dt : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_stim_c : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_m_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_h_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_j_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_m_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_m_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_m_gate_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_h_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_h_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_h_gate_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_j_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_j_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_j_gate_j : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_cao : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_d_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f1_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_ca_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_i_ca_l : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_i_caca : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_i_cak : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_i_cana : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_gamma_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_gamma_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_gamma_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_gamma_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_cai_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_d_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_d_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_d_gate_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_gate_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_ca_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_ca_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_ca_gate_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_channel_f_ca_gate_f_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_x_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_xi_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_x_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_x_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_x_gate_x : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_xi_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_xi_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_dependent_potassium_current_xi_gate_xi : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_k1_infinity_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_e_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_k1_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_k1_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_k1_gate_e_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_independent_potassium_current_k1_gate_k1_infinity : signed(31 downto 0) := CREATE_FP(0.0);
    signal plateau_potassium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal plateau_potassium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal plateau_potassium_current_e_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal plateau_potassium_current_i_kp : signed(31 downto 0) := CREATE_FP(0.0);
    signal sarcolemmal_calcium_pump_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sarcolemmal_calcium_pump_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal sarcolemmal_calcium_pump_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_background_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_background_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_background_current_e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_background_current_i_na_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_cao : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_i_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_gamma_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_gamma_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_gamma_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_gamma_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_cao : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_i_ns_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_i_ns_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal non_specific_calcium_activated_current_i_ns_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_cao : signed(31 downto 0) := CREATE_FP(0.0);
    signal na_ca_exchanger_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_ca_jsr : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_ca_nsr : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_i_rel : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_i_up : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_i_leak : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_fluxes_in_the_sr_i_tr : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_cana : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_na_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_ns_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_caca : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_cak : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_kp : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_ns_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_tr : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_rel : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_leak : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_i_up : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_cao : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_ca_jsr : signed(31 downto 0) := CREATE_FP(0.0);
    signal ionic_concentrations_ca_nsr : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Environment is
        port(
            clk : in std_logic;
            time_out : out signed(31 downto 0)
        );
    end component Environment;

    component Membrane is
        generic(
            cm : signed(31 downto 0) := CREATE_FP(0.01);
            i_st : signed(31 downto 0) := CREATE_FP(0.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            i_na_in : in signed(31 downto 0);
            i_ca_l_in : in signed(31 downto 0);
            i_k_in : in signed(31 downto 0);
            i_naca_in : in signed(31 downto 0);
            i_k1_in : in signed(31 downto 0);
            i_kp_in : in signed(31 downto 0);
            i_p_ca_in : in signed(31 downto 0);
            i_na_b_in : in signed(31 downto 0);
            i_ca_b_in : in signed(31 downto 0);
            i_nak_in : in signed(31 downto 0);
            i_ns_ca_in : in signed(31 downto 0);
            v_out : out signed(31 downto 0);
            r_out : out signed(31 downto 0);
            t_out : out signed(31 downto 0);
            f_out : out signed(31 downto 0);
            dv_dt_out : out signed(31 downto 0);
            i_stim_c_out : out signed(31 downto 0)
        );
    end component Membrane;

    component FastSodiumCurrent is
        generic(
            g_na : signed(31 downto 0) := CREATE_FP(0.16)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            nai_in : in signed(31 downto 0);
            nao_in : in signed(31 downto 0);
            m_private_in : in signed(31 downto 0);
            h_private_in : in signed(31 downto 0);
            j_private_in : in signed(31 downto 0);
            i_na_out : out signed(31 downto 0);
            e_na_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component FastSodiumCurrent;

    component FastSodiumCurrentMGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            m_out : out signed(31 downto 0)
        );
    end component FastSodiumCurrentMGate;

    component FastSodiumCurrentHGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            h_out : out signed(31 downto 0)
        );
    end component FastSodiumCurrentHGate;

    component FastSodiumCurrentJGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            j_out : out signed(31 downto 0)
        );
    end component FastSodiumCurrentJGate;

    component LTypeCaChannel is
        generic(
            p_ca : signed(31 downto 0) := CREATE_FP(5.4E-6);
            p_na : signed(31 downto 0) := CREATE_FP(6.75E-9);
            p_k : signed(31 downto 0) := CREATE_FP(1.93E-9);
            gamma_cai : signed(31 downto 0) := CREATE_FP(1.0);
            gamma_cao : signed(31 downto 0) := CREATE_FP(0.34)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            cai_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            cao_in : in signed(31 downto 0);
            nao_in : in signed(31 downto 0);
            ko_in : in signed(31 downto 0);
            nai_in : in signed(31 downto 0);
            ki_in : in signed(31 downto 0);
            d_private_in : in signed(31 downto 0);
            f1_private_in : in signed(31 downto 0);
            f_ca_private_in : in signed(31 downto 0);
            i_ca_l_out : out signed(31 downto 0);
            i_caca_out : out signed(31 downto 0);
            i_cak_out : out signed(31 downto 0);
            i_cana_out : out signed(31 downto 0);
            gamma_nai_out : out signed(31 downto 0);
            gamma_nao_out : out signed(31 downto 0);
            gamma_ki_out : out signed(31 downto 0);
            gamma_ko_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0);
            cai_private_out : out signed(31 downto 0)
        );
    end component LTypeCaChannel;

    component LTypeCaChannelDGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            d_out : out signed(31 downto 0)
        );
    end component LTypeCaChannelDGate;

    component LTypeCaChannelFGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            f_out : out signed(31 downto 0)
        );
    end component LTypeCaChannelFGate;

    component LTypeCaChannelFCaGate is
        generic(
            km_ca : signed(31 downto 0) := CREATE_FP(6.0E-4)
        );
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            cai_in : in signed(31 downto 0);
            f_ca_out : out signed(31 downto 0)
        );
    end component LTypeCaChannelFCaGate;

    component TimeDependentPotassiumCurrent is
        generic(
            g_k_max : signed(31 downto 0) := CREATE_FP(0.00282);
            pr_nak : signed(31 downto 0) := CREATE_FP(0.01833)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            ko_in : in signed(31 downto 0);
            ki_in : in signed(31 downto 0);
            nao_in : in signed(31 downto 0);
            nai_in : in signed(31 downto 0);
            x_private_in : in signed(31 downto 0);
            xi_private_in : in signed(31 downto 0);
            i_k_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component TimeDependentPotassiumCurrent;

    component TimeDependentPotassiumCurrentXGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            x_out : out signed(31 downto 0)
        );
    end component TimeDependentPotassiumCurrentXGate;

    component TimeDependentPotassiumCurrentXiGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            xi_out : out signed(31 downto 0)
        );
    end component TimeDependentPotassiumCurrentXiGate;

    component TimeIndependentPotassiumCurrent is
        generic(
            g_k1_max : signed(31 downto 0) := CREATE_FP(0.0075)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            ko_in : in signed(31 downto 0);
            ki_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            k1_infinity_private_in : in signed(31 downto 0);
            i_k1_out : out signed(31 downto 0);
            e_k1_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component TimeIndependentPotassiumCurrent;

    component TimeIndependentPotassiumCurrentK1Gate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            e_k1_in : in signed(31 downto 0);
            k1_infinity_out : out signed(31 downto 0)
        );
    end component TimeIndependentPotassiumCurrentK1Gate;

    component PlateauPotassiumCurrent is
        generic(
            g_kp : signed(31 downto 0) := CREATE_FP(1.83E-4)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            e_k1_in : in signed(31 downto 0);
            i_kp_out : out signed(31 downto 0)
        );
    end component PlateauPotassiumCurrent;

    component SarcolemmalCalciumPump is
        generic(
            k_mpca : signed(31 downto 0) := CREATE_FP(5.0E-4);
            i_pca : signed(31 downto 0) := CREATE_FP(0.0115)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            cai_in : in signed(31 downto 0);
            i_p_ca_out : out signed(31 downto 0)
        );
    end component SarcolemmalCalciumPump;

    component SodiumBackgroundCurrent is
        generic(
            g_nab : signed(31 downto 0) := CREATE_FP(1.41E-5)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            e_na_in : in signed(31 downto 0);
            i_na_b_out : out signed(31 downto 0)
        );
    end component SodiumBackgroundCurrent;

    component CalciumBackgroundCurrent is
        generic(
            g_cab : signed(31 downto 0) := CREATE_FP(3.016E-5)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            cai_in : in signed(31 downto 0);
            cao_in : in signed(31 downto 0);
            i_ca_b_out : out signed(31 downto 0)
        );
    end component CalciumBackgroundCurrent;

    component SodiumPotassiumPump is
        generic(
            i_nak1 : signed(31 downto 0) := CREATE_FP(0.015);
            k_mnai : signed(31 downto 0) := CREATE_FP(10.0);
            k_mko : signed(31 downto 0) := CREATE_FP(1.5)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            nai_in : in signed(31 downto 0);
            nao_in : in signed(31 downto 0);
            ko_in : in signed(31 downto 0);
            i_nak_out : out signed(31 downto 0)
        );
    end component SodiumPotassiumPump;

    component NonSpecificCalciumActivatedCurrent is
        generic(
            p_ns_ca : signed(31 downto 0) := CREATE_FP(1.75E-9);
            k_m_ns_ca : signed(31 downto 0) := CREATE_FP(0.0012)
        );
        port(
            clk : in std_logic;
            gamma_nai_in : in signed(31 downto 0);
            gamma_nao_in : in signed(31 downto 0);
            gamma_ki_in : in signed(31 downto 0);
            gamma_ko_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            cao_in : in signed(31 downto 0);
            nao_in : in signed(31 downto 0);
            ko_in : in signed(31 downto 0);
            nai_in : in signed(31 downto 0);
            ki_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            cai_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            i_ns_ca_out : out signed(31 downto 0);
            i_ns_na_out : out signed(31 downto 0);
            i_ns_k_out : out signed(31 downto 0)
        );
    end component NonSpecificCalciumActivatedCurrent;

    component NaCaExchanger is
        generic(
            k_naca : signed(31 downto 0) := CREATE_FP(20.0);
            k_mna : signed(31 downto 0) := CREATE_FP(87.5);
            k_mca : signed(31 downto 0) := CREATE_FP(1.38);
            k_sat : signed(31 downto 0) := CREATE_FP(0.1);
            eta : signed(31 downto 0) := CREATE_FP(0.35)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            nai_in : in signed(31 downto 0);
            nao_in : in signed(31 downto 0);
            cai_in : in signed(31 downto 0);
            cao_in : in signed(31 downto 0);
            i_naca_out : out signed(31 downto 0)
        );
    end component NaCaExchanger;

    component CalciumFluxesInTheSr is
        generic(
            g_rel_max : signed(31 downto 0) := CREATE_FP(60.0);
            tau_on : signed(31 downto 0) := CREATE_FP(2.0);
            tau_off : signed(31 downto 0) := CREATE_FP(2.0);
            t_cicr : signed(31 downto 0) := CREATE_FP(0.0);
            tau_tr : signed(31 downto 0) := CREATE_FP(180.0);
            k_mrel : signed(31 downto 0) := CREATE_FP(8.0E-4);
            k_mup : signed(31 downto 0) := CREATE_FP(9.2E-4);
            i_up1 : signed(31 downto 0) := CREATE_FP(0.005);
            ca_nsr_max : signed(31 downto 0) := CREATE_FP(15.0);
            delta_ca_i2 : signed(31 downto 0) := CREATE_FP(0.0);
            delta_ca_ith : signed(31 downto 0) := CREATE_FP(1.8E-4)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            cai_in : in signed(31 downto 0);
            ca_jsr_in : in signed(31 downto 0);
            ca_nsr_in : in signed(31 downto 0);
            i_rel_out : out signed(31 downto 0);
            i_up_out : out signed(31 downto 0);
            i_leak_out : out signed(31 downto 0);
            i_tr_out : out signed(31 downto 0)
        );
    end component CalciumFluxesInTheSr;

    component IonicConcentrations is
        generic(
            am : signed(31 downto 0) := CREATE_FP(200.0);
            v_myo : signed(31 downto 0) := CREATE_FP(0.68);
            v_jsr : signed(31 downto 0) := CREATE_FP(0.0048);
            v_nsr : signed(31 downto 0) := CREATE_FP(0.0552)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            i_na_in : in signed(31 downto 0);
            i_cana_in : in signed(31 downto 0);
            i_na_b_in : in signed(31 downto 0);
            i_ns_na_in : in signed(31 downto 0);
            i_naca_in : in signed(31 downto 0);
            i_nak_in : in signed(31 downto 0);
            i_caca_in : in signed(31 downto 0);
            i_cak_in : in signed(31 downto 0);
            i_p_ca_in : in signed(31 downto 0);
            i_ca_b_in : in signed(31 downto 0);
            i_k_in : in signed(31 downto 0);
            i_k1_in : in signed(31 downto 0);
            i_kp_in : in signed(31 downto 0);
            i_ns_k_in : in signed(31 downto 0);
            i_tr_in : in signed(31 downto 0);
            i_rel_in : in signed(31 downto 0);
            i_leak_in : in signed(31 downto 0);
            i_up_in : in signed(31 downto 0);
            nai_out : out signed(31 downto 0);
            nao_out : out signed(31 downto 0);
            cai_out : out signed(31 downto 0);
            cao_out : out signed(31 downto 0);
            ki_out : out signed(31 downto 0);
            ko_out : out signed(31 downto 0);
            ca_jsr_out : out signed(31 downto 0);
            ca_nsr_out : out signed(31 downto 0)
        );
    end component IonicConcentrations;

begin
    -- Create child instances
    environment_inst : component Environment
        port map(
            clk => clk,
            time_out => environment_time
        );

    membrane_inst : component Membrane
        port map(
            clk => clk,
            time_in => membrane_time,
            i_na_in => membrane_i_na,
            i_ca_l_in => membrane_i_ca_l,
            i_k_in => membrane_i_k,
            i_naca_in => membrane_i_naca,
            i_k1_in => membrane_i_k1,
            i_kp_in => membrane_i_kp,
            i_p_ca_in => membrane_i_p_ca,
            i_na_b_in => membrane_i_na_b,
            i_ca_b_in => membrane_i_ca_b,
            i_nak_in => membrane_i_nak,
            i_ns_ca_in => membrane_i_ns_ca,
            v_out => membrane_v,
            r_out => membrane_r,
            t_out => membrane_t,
            f_out => membrane_f,
            dv_dt_out => membrane_dv_dt,
            i_stim_c_out => membrane_i_stim_c
        );

    fast_sodium_current_inst : component FastSodiumCurrent
        port map(
            clk => clk,
            time_in => fast_sodium_current_time,
            v_in => fast_sodium_current_v,
            r_in => fast_sodium_current_r,
            f_in => fast_sodium_current_f,
            t_in => fast_sodium_current_t,
            nai_in => fast_sodium_current_nai,
            nao_in => fast_sodium_current_nao,
            m_private_in => fast_sodium_current_m_private,
            h_private_in => fast_sodium_current_h_private,
            j_private_in => fast_sodium_current_j_private,
            i_na_out => fast_sodium_current_i_na,
            e_na_out => fast_sodium_current_e_na,
            time_private_out => fast_sodium_current_time_private,
            v_private_out => fast_sodium_current_v_private
        );

    fast_sodium_current_m_gate_inst : component FastSodiumCurrentMGate
        port map(
            clk => clk,
            v_in => fast_sodium_current_m_gate_v,
            time_in => fast_sodium_current_m_gate_time,
            m_out => fast_sodium_current_m_gate_m
        );

    fast_sodium_current_h_gate_inst : component FastSodiumCurrentHGate
        port map(
            clk => clk,
            v_in => fast_sodium_current_h_gate_v,
            time_in => fast_sodium_current_h_gate_time,
            h_out => fast_sodium_current_h_gate_h
        );

    fast_sodium_current_j_gate_inst : component FastSodiumCurrentJGate
        port map(
            clk => clk,
            v_in => fast_sodium_current_j_gate_v,
            time_in => fast_sodium_current_j_gate_time,
            j_out => fast_sodium_current_j_gate_j
        );

    l_type_ca_channel_inst : component LTypeCaChannel
        port map(
            clk => clk,
            time_in => l_type_ca_channel_time,
            v_in => l_type_ca_channel_v,
            cai_in => l_type_ca_channel_cai,
            r_in => l_type_ca_channel_r,
            t_in => l_type_ca_channel_t,
            f_in => l_type_ca_channel_f,
            cao_in => l_type_ca_channel_cao,
            nao_in => l_type_ca_channel_nao,
            ko_in => l_type_ca_channel_ko,
            nai_in => l_type_ca_channel_nai,
            ki_in => l_type_ca_channel_ki,
            d_private_in => l_type_ca_channel_d_private,
            f1_private_in => l_type_ca_channel_f1_private,
            f_ca_private_in => l_type_ca_channel_f_ca_private,
            i_ca_l_out => l_type_ca_channel_i_ca_l,
            i_caca_out => l_type_ca_channel_i_caca,
            i_cak_out => l_type_ca_channel_i_cak,
            i_cana_out => l_type_ca_channel_i_cana,
            gamma_nai_out => l_type_ca_channel_gamma_nai,
            gamma_nao_out => l_type_ca_channel_gamma_nao,
            gamma_ki_out => l_type_ca_channel_gamma_ki,
            gamma_ko_out => l_type_ca_channel_gamma_ko,
            time_private_out => l_type_ca_channel_time_private,
            v_private_out => l_type_ca_channel_v_private,
            cai_private_out => l_type_ca_channel_cai_private
        );

    l_type_ca_channel_d_gate_inst : component LTypeCaChannelDGate
        port map(
            clk => clk,
            v_in => l_type_ca_channel_d_gate_v,
            time_in => l_type_ca_channel_d_gate_time,
            d_out => l_type_ca_channel_d_gate_d
        );

    l_type_ca_channel_f_gate_inst : component LTypeCaChannelFGate
        port map(
            clk => clk,
            v_in => l_type_ca_channel_f_gate_v,
            time_in => l_type_ca_channel_f_gate_time,
            f_out => l_type_ca_channel_f_gate_f
        );

    l_type_ca_channel_f_ca_gate_inst : component LTypeCaChannelFCaGate
        port map(
            clk => clk,
            v_in => l_type_ca_channel_f_ca_gate_v,
            time_in => l_type_ca_channel_f_ca_gate_time,
            cai_in => l_type_ca_channel_f_ca_gate_cai,
            f_ca_out => l_type_ca_channel_f_ca_gate_f_ca
        );

    time_dependent_potassium_current_inst : component TimeDependentPotassiumCurrent
        port map(
            clk => clk,
            time_in => time_dependent_potassium_current_time,
            v_in => time_dependent_potassium_current_v,
            r_in => time_dependent_potassium_current_r,
            t_in => time_dependent_potassium_current_t,
            f_in => time_dependent_potassium_current_f,
            ko_in => time_dependent_potassium_current_ko,
            ki_in => time_dependent_potassium_current_ki,
            nao_in => time_dependent_potassium_current_nao,
            nai_in => time_dependent_potassium_current_nai,
            x_private_in => time_dependent_potassium_current_x_private,
            xi_private_in => time_dependent_potassium_current_xi_private,
            i_k_out => time_dependent_potassium_current_i_k,
            time_private_out => time_dependent_potassium_current_time_private,
            v_private_out => time_dependent_potassium_current_v_private
        );

    time_dependent_potassium_current_x_gate_inst : component TimeDependentPotassiumCurrentXGate
        port map(
            clk => clk,
            v_in => time_dependent_potassium_current_x_gate_v,
            time_in => time_dependent_potassium_current_x_gate_time,
            x_out => time_dependent_potassium_current_x_gate_x
        );

    time_dependent_potassium_current_xi_gate_inst : component TimeDependentPotassiumCurrentXiGate
        port map(
            clk => clk,
            v_in => time_dependent_potassium_current_xi_gate_v,
            time_in => time_dependent_potassium_current_xi_gate_time,
            xi_out => time_dependent_potassium_current_xi_gate_xi
        );

    time_independent_potassium_current_inst : component TimeIndependentPotassiumCurrent
        port map(
            clk => clk,
            time_in => time_independent_potassium_current_time,
            v_in => time_independent_potassium_current_v,
            ko_in => time_independent_potassium_current_ko,
            ki_in => time_independent_potassium_current_ki,
            r_in => time_independent_potassium_current_r,
            t_in => time_independent_potassium_current_t,
            f_in => time_independent_potassium_current_f,
            k1_infinity_private_in => time_independent_potassium_current_k1_infinity_private,
            i_k1_out => time_independent_potassium_current_i_k1,
            e_k1_out => time_independent_potassium_current_e_k1,
            time_private_out => time_independent_potassium_current_time_private,
            v_private_out => time_independent_potassium_current_v_private
        );

    time_independent_potassium_current_k1_gate_inst : component TimeIndependentPotassiumCurrentK1Gate
        port map(
            clk => clk,
            v_in => time_independent_potassium_current_k1_gate_v,
            time_in => time_independent_potassium_current_k1_gate_time,
            e_k1_in => time_independent_potassium_current_k1_gate_e_k1,
            k1_infinity_out => time_independent_potassium_current_k1_gate_k1_infinity
        );

    plateau_potassium_current_inst : component PlateauPotassiumCurrent
        port map(
            clk => clk,
            time_in => plateau_potassium_current_time,
            v_in => plateau_potassium_current_v,
            e_k1_in => plateau_potassium_current_e_k1,
            i_kp_out => plateau_potassium_current_i_kp
        );

    sarcolemmal_calcium_pump_inst : component SarcolemmalCalciumPump
        port map(
            clk => clk,
            time_in => sarcolemmal_calcium_pump_time,
            cai_in => sarcolemmal_calcium_pump_cai,
            i_p_ca_out => sarcolemmal_calcium_pump_i_p_ca
        );

    sodium_background_current_inst : component SodiumBackgroundCurrent
        port map(
            clk => clk,
            time_in => sodium_background_current_time,
            v_in => sodium_background_current_v,
            e_na_in => sodium_background_current_e_na,
            i_na_b_out => sodium_background_current_i_na_b
        );

    calcium_background_current_inst : component CalciumBackgroundCurrent
        port map(
            clk => clk,
            time_in => calcium_background_current_time,
            v_in => calcium_background_current_v,
            r_in => calcium_background_current_r,
            t_in => calcium_background_current_t,
            f_in => calcium_background_current_f,
            cai_in => calcium_background_current_cai,
            cao_in => calcium_background_current_cao,
            i_ca_b_out => calcium_background_current_i_ca_b
        );

    sodium_potassium_pump_inst : component SodiumPotassiumPump
        port map(
            clk => clk,
            time_in => sodium_potassium_pump_time,
            v_in => sodium_potassium_pump_v,
            r_in => sodium_potassium_pump_r,
            t_in => sodium_potassium_pump_t,
            f_in => sodium_potassium_pump_f,
            nai_in => sodium_potassium_pump_nai,
            nao_in => sodium_potassium_pump_nao,
            ko_in => sodium_potassium_pump_ko,
            i_nak_out => sodium_potassium_pump_i_nak
        );

    non_specific_calcium_activated_current_inst : component NonSpecificCalciumActivatedCurrent
        port map(
            clk => clk,
            gamma_nai_in => non_specific_calcium_activated_current_gamma_nai,
            gamma_nao_in => non_specific_calcium_activated_current_gamma_nao,
            gamma_ki_in => non_specific_calcium_activated_current_gamma_ki,
            gamma_ko_in => non_specific_calcium_activated_current_gamma_ko,
            r_in => non_specific_calcium_activated_current_r,
            t_in => non_specific_calcium_activated_current_t,
            f_in => non_specific_calcium_activated_current_f,
            cao_in => non_specific_calcium_activated_current_cao,
            nao_in => non_specific_calcium_activated_current_nao,
            ko_in => non_specific_calcium_activated_current_ko,
            nai_in => non_specific_calcium_activated_current_nai,
            ki_in => non_specific_calcium_activated_current_ki,
            time_in => non_specific_calcium_activated_current_time,
            cai_in => non_specific_calcium_activated_current_cai,
            v_in => non_specific_calcium_activated_current_v,
            i_ns_ca_out => non_specific_calcium_activated_current_i_ns_ca,
            i_ns_na_out => non_specific_calcium_activated_current_i_ns_na,
            i_ns_k_out => non_specific_calcium_activated_current_i_ns_k
        );

    na_ca_exchanger_inst : component NaCaExchanger
        port map(
            clk => clk,
            time_in => na_ca_exchanger_time,
            v_in => na_ca_exchanger_v,
            r_in => na_ca_exchanger_r,
            t_in => na_ca_exchanger_t,
            f_in => na_ca_exchanger_f,
            nai_in => na_ca_exchanger_nai,
            nao_in => na_ca_exchanger_nao,
            cai_in => na_ca_exchanger_cai,
            cao_in => na_ca_exchanger_cao,
            i_naca_out => na_ca_exchanger_i_naca
        );

    calcium_fluxes_in_the_sr_inst : component CalciumFluxesInTheSr
        port map(
            clk => clk,
            time_in => calcium_fluxes_in_the_sr_time,
            cai_in => calcium_fluxes_in_the_sr_cai,
            ca_jsr_in => calcium_fluxes_in_the_sr_ca_jsr,
            ca_nsr_in => calcium_fluxes_in_the_sr_ca_nsr,
            i_rel_out => calcium_fluxes_in_the_sr_i_rel,
            i_up_out => calcium_fluxes_in_the_sr_i_up,
            i_leak_out => calcium_fluxes_in_the_sr_i_leak,
            i_tr_out => calcium_fluxes_in_the_sr_i_tr
        );

    ionic_concentrations_inst : component IonicConcentrations
        port map(
            clk => clk,
            time_in => ionic_concentrations_time,
            f_in => ionic_concentrations_f,
            i_na_in => ionic_concentrations_i_na,
            i_cana_in => ionic_concentrations_i_cana,
            i_na_b_in => ionic_concentrations_i_na_b,
            i_ns_na_in => ionic_concentrations_i_ns_na,
            i_naca_in => ionic_concentrations_i_naca,
            i_nak_in => ionic_concentrations_i_nak,
            i_caca_in => ionic_concentrations_i_caca,
            i_cak_in => ionic_concentrations_i_cak,
            i_p_ca_in => ionic_concentrations_i_p_ca,
            i_ca_b_in => ionic_concentrations_i_ca_b,
            i_k_in => ionic_concentrations_i_k,
            i_k1_in => ionic_concentrations_i_k1,
            i_kp_in => ionic_concentrations_i_kp,
            i_ns_k_in => ionic_concentrations_i_ns_k,
            i_tr_in => ionic_concentrations_i_tr,
            i_rel_in => ionic_concentrations_i_rel,
            i_leak_in => ionic_concentrations_i_leak,
            i_up_in => ionic_concentrations_i_up,
            nai_out => ionic_concentrations_nai,
            nao_out => ionic_concentrations_nao,
            cai_out => ionic_concentrations_cai,
            cao_out => ionic_concentrations_cao,
            ki_out => ionic_concentrations_ki,
            ko_out => ionic_concentrations_ko,
            ca_jsr_out => ionic_concentrations_ca_jsr,
            ca_nsr_out => ionic_concentrations_ca_nsr
        );

    -- Perform Mapping
    l_type_ca_channel_cai_private_out <= l_type_ca_channel_cai_private;
    l_type_ca_channel_v_private_out <= l_type_ca_channel_v_private;
    l_type_ca_channel_d_gate_d_out <= l_type_ca_channel_d_gate_d;
    l_type_ca_channel_f_ca_gate_f_ca_out <= l_type_ca_channel_f_ca_gate_f_ca;
    l_type_ca_channel_f_gate_f_out <= l_type_ca_channel_f_gate_f;
    l_type_ca_channel_gamma_ki_out <= l_type_ca_channel_gamma_ki;
    l_type_ca_channel_gamma_ko_out <= l_type_ca_channel_gamma_ko;
    l_type_ca_channel_gamma_nai_out <= l_type_ca_channel_gamma_nai;
    l_type_ca_channel_gamma_nao_out <= l_type_ca_channel_gamma_nao;
    l_type_ca_channel_i_caca_out <= l_type_ca_channel_i_caca;
    l_type_ca_channel_i_cak_out <= l_type_ca_channel_i_cak;
    l_type_ca_channel_i_cana_out <= l_type_ca_channel_i_cana;
    l_type_ca_channel_i_ca_l_out <= l_type_ca_channel_i_ca_l;
    l_type_ca_channel_time_private_out <= l_type_ca_channel_time_private;
    na_ca_exchanger_i_naca_out <= na_ca_exchanger_i_naca;
    calcium_background_current_i_ca_b_out <= calcium_background_current_i_ca_b;
    calcium_fluxes_in_the_sr_i_leak_out <= calcium_fluxes_in_the_sr_i_leak;
    calcium_fluxes_in_the_sr_i_rel_out <= calcium_fluxes_in_the_sr_i_rel;
    calcium_fluxes_in_the_sr_i_tr_out <= calcium_fluxes_in_the_sr_i_tr;
    calcium_fluxes_in_the_sr_i_up_out <= calcium_fluxes_in_the_sr_i_up;
    environment_time_out <= environment_time;
    fast_sodium_current_e_na_out <= fast_sodium_current_e_na;
    fast_sodium_current_v_private_out <= fast_sodium_current_v_private;
    fast_sodium_current_h_gate_h_out <= fast_sodium_current_h_gate_h;
    fast_sodium_current_i_na_out <= fast_sodium_current_i_na;
    fast_sodium_current_j_gate_j_out <= fast_sodium_current_j_gate_j;
    fast_sodium_current_m_gate_m_out <= fast_sodium_current_m_gate_m;
    fast_sodium_current_time_private_out <= fast_sodium_current_time_private;
    ionic_concentrations_ca_jsr_out <= ionic_concentrations_ca_jsr;
    ionic_concentrations_ca_nsr_out <= ionic_concentrations_ca_nsr;
    ionic_concentrations_cai_out <= ionic_concentrations_cai;
    ionic_concentrations_cao_out <= ionic_concentrations_cao;
    ionic_concentrations_ki_out <= ionic_concentrations_ki;
    ionic_concentrations_ko_out <= ionic_concentrations_ko;
    ionic_concentrations_nai_out <= ionic_concentrations_nai;
    ionic_concentrations_nao_out <= ionic_concentrations_nao;
    membrane_f_out <= membrane_f;
    membrane_istimc_out <= membrane_i_stim_c;
    membrane_r_out <= membrane_r;
    membrane_t_out <= membrane_t;
    membrane_v_out <= membrane_v;
    membrane_dv_dt_out <= membrane_dv_dt;
    non_specific_calcium_activated_current_i_ns_ca_out <= non_specific_calcium_activated_current_i_ns_ca;
    non_specific_calcium_activated_current_i_ns_k_out <= non_specific_calcium_activated_current_i_ns_k;
    non_specific_calcium_activated_current_i_ns_na_out <= non_specific_calcium_activated_current_i_ns_na;
    plateau_potassium_current_i_kp_out <= plateau_potassium_current_i_kp;
    sarcolemmal_calcium_pump_i_p_ca_out <= sarcolemmal_calcium_pump_i_p_ca;
    sodium_background_current_i_na_b_out <= sodium_background_current_i_na_b;
    sodium_potassium_pump_i_nak_out <= sodium_potassium_pump_i_nak;
    time_dependent_potassium_current_v_private_out <= time_dependent_potassium_current_v_private;
    time_dependent_potassium_current_x_gate_x_out <= time_dependent_potassium_current_x_gate_x;
    time_dependent_potassium_current_xi_gate_xi_out <= time_dependent_potassium_current_xi_gate_xi;
    time_dependent_potassium_current_i_k_out <= time_dependent_potassium_current_i_k;
    time_dependent_potassium_current_time_private_out <= time_dependent_potassium_current_time_private;
    time_independent_potassium_current_e_k1_out <= time_independent_potassium_current_e_k1;
    time_independent_potassium_current_k1_gate_k1_infinity_out <= time_independent_potassium_current_k1_gate_k1_infinity;
    time_independent_potassium_current_v_private_out <= time_independent_potassium_current_v_private;
    time_independent_potassium_current_i_k1_out <= time_independent_potassium_current_i_k1;
    time_independent_potassium_current_time_private_out <= time_independent_potassium_current_time_private;
    l_type_ca_channel_cai <= ionic_concentrations_cai;
    l_type_ca_channel_cao <= ionic_concentrations_cao;
    l_type_ca_channel_f <= membrane_f;
    l_type_ca_channel_ki <= ionic_concentrations_ki;
    l_type_ca_channel_ko <= ionic_concentrations_ko;
    l_type_ca_channel_nai <= ionic_concentrations_nai;
    l_type_ca_channel_nao <= ionic_concentrations_nao;
    l_type_ca_channel_r <= membrane_r;
    l_type_ca_channel_t <= membrane_t;
    l_type_ca_channel_v <= membrane_v;
    l_type_ca_channel_d_private <= l_type_ca_channel_d_gate_d;
    l_type_ca_channel_f1_private <= l_type_ca_channel_f_gate_f;
    l_type_ca_channel_f_ca_private <= l_type_ca_channel_f_ca_gate_f_ca;
    l_type_ca_channel_time <= environment_time;
    l_type_ca_channel_d_gate_v <= l_type_ca_channel_v_private;
    l_type_ca_channel_d_gate_time <= l_type_ca_channel_time_private;
    l_type_ca_channel_f_ca_gate_cai <= l_type_ca_channel_cai_private;
    l_type_ca_channel_f_ca_gate_v <= l_type_ca_channel_v_private;
    l_type_ca_channel_f_ca_gate_time <= l_type_ca_channel_time_private;
    l_type_ca_channel_f_gate_v <= l_type_ca_channel_v_private;
    l_type_ca_channel_f_gate_time <= l_type_ca_channel_time_private;
    na_ca_exchanger_cai <= ionic_concentrations_cai;
    na_ca_exchanger_cao <= ionic_concentrations_cao;
    na_ca_exchanger_f <= membrane_f;
    na_ca_exchanger_nai <= ionic_concentrations_nai;
    na_ca_exchanger_nao <= ionic_concentrations_nao;
    na_ca_exchanger_r <= membrane_r;
    na_ca_exchanger_t <= membrane_t;
    na_ca_exchanger_v <= membrane_v;
    na_ca_exchanger_time <= environment_time;
    calcium_background_current_cai <= ionic_concentrations_cai;
    calcium_background_current_cao <= ionic_concentrations_cao;
    calcium_background_current_f <= membrane_f;
    calcium_background_current_r <= membrane_r;
    calcium_background_current_t <= membrane_t;
    calcium_background_current_v <= membrane_v;
    calcium_background_current_time <= environment_time;
    calcium_fluxes_in_the_sr_ca_jsr <= ionic_concentrations_ca_jsr;
    calcium_fluxes_in_the_sr_ca_nsr <= ionic_concentrations_ca_nsr;
    calcium_fluxes_in_the_sr_cai <= ionic_concentrations_cai;
    calcium_fluxes_in_the_sr_time <= environment_time;
    fast_sodium_current_f <= membrane_f;
    fast_sodium_current_nai <= ionic_concentrations_nai;
    fast_sodium_current_nao <= ionic_concentrations_nao;
    fast_sodium_current_r <= membrane_r;
    fast_sodium_current_t <= membrane_t;
    fast_sodium_current_v <= membrane_v;
    fast_sodium_current_h_private <= fast_sodium_current_h_gate_h;
    fast_sodium_current_j_private <= fast_sodium_current_j_gate_j;
    fast_sodium_current_m_private <= fast_sodium_current_m_gate_m;
    fast_sodium_current_time <= environment_time;
    fast_sodium_current_h_gate_v <= fast_sodium_current_v_private;
    fast_sodium_current_h_gate_time <= fast_sodium_current_time_private;
    fast_sodium_current_j_gate_v <= fast_sodium_current_v_private;
    fast_sodium_current_j_gate_time <= fast_sodium_current_time_private;
    fast_sodium_current_m_gate_v <= fast_sodium_current_v_private;
    fast_sodium_current_m_gate_time <= fast_sodium_current_time_private;
    ionic_concentrations_f <= membrane_f;
    ionic_concentrations_i_caca <= l_type_ca_channel_i_caca;
    ionic_concentrations_i_cak <= l_type_ca_channel_i_cak;
    ionic_concentrations_i_cana <= l_type_ca_channel_i_cana;
    ionic_concentrations_i_ca_b <= calcium_background_current_i_ca_b;
    ionic_concentrations_i_k <= time_dependent_potassium_current_i_k;
    ionic_concentrations_i_k1 <= time_independent_potassium_current_i_k1;
    ionic_concentrations_i_kp <= plateau_potassium_current_i_kp;
    ionic_concentrations_i_na <= fast_sodium_current_i_na;
    ionic_concentrations_i_naca <= na_ca_exchanger_i_naca;
    ionic_concentrations_i_nak <= sodium_potassium_pump_i_nak;
    ionic_concentrations_i_na_b <= sodium_background_current_i_na_b;
    ionic_concentrations_i_leak <= calcium_fluxes_in_the_sr_i_leak;
    ionic_concentrations_i_ns_k <= non_specific_calcium_activated_current_i_ns_k;
    ionic_concentrations_i_ns_na <= non_specific_calcium_activated_current_i_ns_na;
    ionic_concentrations_i_p_ca <= sarcolemmal_calcium_pump_i_p_ca;
    ionic_concentrations_i_rel <= calcium_fluxes_in_the_sr_i_rel;
    ionic_concentrations_i_tr <= calcium_fluxes_in_the_sr_i_tr;
    ionic_concentrations_i_up <= calcium_fluxes_in_the_sr_i_up;
    ionic_concentrations_time <= environment_time;
    membrane_i_ca_l <= l_type_ca_channel_i_ca_l;
    membrane_i_ca_b <= calcium_background_current_i_ca_b;
    membrane_i_k <= time_dependent_potassium_current_i_k;
    membrane_i_k1 <= time_independent_potassium_current_i_k1;
    membrane_i_kp <= plateau_potassium_current_i_kp;
    membrane_i_na <= fast_sodium_current_i_na;
    membrane_i_naca <= na_ca_exchanger_i_naca;
    membrane_i_nak <= sodium_potassium_pump_i_nak;
    membrane_i_na_b <= sodium_background_current_i_na_b;
    membrane_i_ns_ca <= non_specific_calcium_activated_current_i_ns_ca;
    membrane_i_p_ca <= sarcolemmal_calcium_pump_i_p_ca;
    membrane_time <= environment_time;
    non_specific_calcium_activated_current_cai <= ionic_concentrations_cai;
    non_specific_calcium_activated_current_cao <= ionic_concentrations_cao;
    non_specific_calcium_activated_current_f <= membrane_f;
    non_specific_calcium_activated_current_ki <= ionic_concentrations_ki;
    non_specific_calcium_activated_current_ko <= ionic_concentrations_ko;
    non_specific_calcium_activated_current_nai <= ionic_concentrations_nai;
    non_specific_calcium_activated_current_nao <= ionic_concentrations_nao;
    non_specific_calcium_activated_current_r <= membrane_r;
    non_specific_calcium_activated_current_t <= membrane_t;
    non_specific_calcium_activated_current_v <= membrane_v;
    non_specific_calcium_activated_current_gamma_ki <= l_type_ca_channel_gamma_ki;
    non_specific_calcium_activated_current_gamma_ko <= l_type_ca_channel_gamma_ko;
    non_specific_calcium_activated_current_gamma_nai <= l_type_ca_channel_gamma_nai;
    non_specific_calcium_activated_current_gamma_nao <= l_type_ca_channel_gamma_nao;
    non_specific_calcium_activated_current_time <= environment_time;
    plateau_potassium_current_e_k1 <= time_independent_potassium_current_e_k1;
    plateau_potassium_current_v <= membrane_v;
    plateau_potassium_current_time <= environment_time;
    sarcolemmal_calcium_pump_cai <= ionic_concentrations_cai;
    sarcolemmal_calcium_pump_time <= environment_time;
    sodium_background_current_e_na <= fast_sodium_current_e_na;
    sodium_background_current_v <= membrane_v;
    sodium_background_current_time <= environment_time;
    sodium_potassium_pump_f <= membrane_f;
    sodium_potassium_pump_ko <= ionic_concentrations_ko;
    sodium_potassium_pump_nai <= ionic_concentrations_nai;
    sodium_potassium_pump_nao <= ionic_concentrations_nao;
    sodium_potassium_pump_r <= membrane_r;
    sodium_potassium_pump_t <= membrane_t;
    sodium_potassium_pump_v <= membrane_v;
    sodium_potassium_pump_time <= environment_time;
    time_dependent_potassium_current_f <= membrane_f;
    time_dependent_potassium_current_ki <= ionic_concentrations_ki;
    time_dependent_potassium_current_ko <= ionic_concentrations_ko;
    time_dependent_potassium_current_nai <= ionic_concentrations_nai;
    time_dependent_potassium_current_nao <= ionic_concentrations_nao;
    time_dependent_potassium_current_r <= membrane_r;
    time_dependent_potassium_current_t <= membrane_t;
    time_dependent_potassium_current_v <= membrane_v;
    time_dependent_potassium_current_x_private <= time_dependent_potassium_current_x_gate_x;
    time_dependent_potassium_current_xi_private <= time_dependent_potassium_current_xi_gate_xi;
    time_dependent_potassium_current_time <= environment_time;
    time_dependent_potassium_current_x_gate_v <= time_dependent_potassium_current_v_private;
    time_dependent_potassium_current_x_gate_time <= time_dependent_potassium_current_time_private;
    time_dependent_potassium_current_xi_gate_v <= time_dependent_potassium_current_v_private;
    time_dependent_potassium_current_xi_gate_time <= time_dependent_potassium_current_time_private;
    time_independent_potassium_current_f <= membrane_f;
    time_independent_potassium_current_k1_infinity_private <= time_independent_potassium_current_k1_gate_k1_infinity;
    time_independent_potassium_current_ki <= ionic_concentrations_ki;
    time_independent_potassium_current_ko <= ionic_concentrations_ko;
    time_independent_potassium_current_r <= membrane_r;
    time_independent_potassium_current_t <= membrane_t;
    time_independent_potassium_current_v <= membrane_v;
    time_independent_potassium_current_time <= environment_time;
    time_independent_potassium_current_k1_gate_e_k1 <= time_independent_potassium_current_e_k1;
    time_independent_potassium_current_k1_gate_v <= time_independent_potassium_current_v_private;
    time_independent_potassium_current_k1_gate_time <= time_independent_potassium_current_time_private;
end architecture;