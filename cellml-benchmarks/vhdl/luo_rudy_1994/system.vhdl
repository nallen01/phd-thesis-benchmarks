library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity system is
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
architecture behavior of system is
    -- Declare all internal signals
    signal luo_rudy_1994_environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_membrane_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_membrane_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_membrane_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_membrane_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_membrane_dv_dt : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_membrane_istimc : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_fast_sodium_current_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_fast_sodium_current_e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_fast_sodium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_fast_sodium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_fast_sodium_current_m_gate_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_fast_sodium_current_h_gate_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_fast_sodium_current_j_gate_j : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_i_ca_l : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_i_caca : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_i_cak : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_i_cana : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_gamma_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_gamma_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_gamma_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_gamma_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_cai_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_d_gate_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_f_gate_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_l_type_ca_channel_f_ca_gate_f_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_dependent_potassium_current_i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_dependent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_dependent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_dependent_potassium_current_x_gate_x : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_dependent_potassium_current_xi_gate_xi : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_independent_potassium_current_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_independent_potassium_current_e_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_independent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_independent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_time_independent_potassium_current_k1_gate_k1_infinity : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_plateau_potassium_current_i_kp : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_sarcolemmal_calcium_pump_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_sodium_background_current_i_na_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_calcium_background_current_i_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_sodium_potassium_pump_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_non_specific_calcium_activated_current_i_ns_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_non_specific_calcium_activated_current_i_ns_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_non_specific_calcium_activated_current_i_ns_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_na_ca_exchanger_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_calcium_fluxes_in_the_sr_i_rel : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_calcium_fluxes_in_the_sr_i_up : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_calcium_fluxes_in_the_sr_i_leak : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_calcium_fluxes_in_the_sr_i_tr : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_nai : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_nao : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_cai : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_cao : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_ki : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_ko : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_ca_jsr : signed(31 downto 0) := CREATE_FP(0.0);
    signal luo_rudy_1994_ionic_concentrations_ca_nsr : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component LuoRudy1994 is
        port(
            clk : in std_logic;
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
    end component LuoRudy1994;
begin
    -- Create base instance
    luo_rudy_1994_inst : component LuoRudy1994
        port map(
            clk => clk,
            environment_time_out => luo_rudy_1994_environment_time,
            membrane_v_out => luo_rudy_1994_membrane_v,
            membrane_r_out => luo_rudy_1994_membrane_r,
            membrane_t_out => luo_rudy_1994_membrane_t,
            membrane_f_out => luo_rudy_1994_membrane_f,
            membrane_dv_dt_out => luo_rudy_1994_membrane_dv_dt,
            membrane_istimc_out => luo_rudy_1994_membrane_istimc,
            fast_sodium_current_i_na_out => luo_rudy_1994_fast_sodium_current_i_na,
            fast_sodium_current_e_na_out => luo_rudy_1994_fast_sodium_current_e_na,
            fast_sodium_current_time_private_out => luo_rudy_1994_fast_sodium_current_time_private,
            fast_sodium_current_v_private_out => luo_rudy_1994_fast_sodium_current_v_private,
            fast_sodium_current_m_gate_m_out => luo_rudy_1994_fast_sodium_current_m_gate_m,
            fast_sodium_current_h_gate_h_out => luo_rudy_1994_fast_sodium_current_h_gate_h,
            fast_sodium_current_j_gate_j_out => luo_rudy_1994_fast_sodium_current_j_gate_j,
            l_type_ca_channel_i_ca_l_out => luo_rudy_1994_l_type_ca_channel_i_ca_l,
            l_type_ca_channel_i_caca_out => luo_rudy_1994_l_type_ca_channel_i_caca,
            l_type_ca_channel_i_cak_out => luo_rudy_1994_l_type_ca_channel_i_cak,
            l_type_ca_channel_i_cana_out => luo_rudy_1994_l_type_ca_channel_i_cana,
            l_type_ca_channel_gamma_nai_out => luo_rudy_1994_l_type_ca_channel_gamma_nai,
            l_type_ca_channel_gamma_nao_out => luo_rudy_1994_l_type_ca_channel_gamma_nao,
            l_type_ca_channel_gamma_ki_out => luo_rudy_1994_l_type_ca_channel_gamma_ki,
            l_type_ca_channel_gamma_ko_out => luo_rudy_1994_l_type_ca_channel_gamma_ko,
            l_type_ca_channel_time_private_out => luo_rudy_1994_l_type_ca_channel_time_private,
            l_type_ca_channel_v_private_out => luo_rudy_1994_l_type_ca_channel_v_private,
            l_type_ca_channel_cai_private_out => luo_rudy_1994_l_type_ca_channel_cai_private,
            l_type_ca_channel_d_gate_d_out => luo_rudy_1994_l_type_ca_channel_d_gate_d,
            l_type_ca_channel_f_gate_f_out => luo_rudy_1994_l_type_ca_channel_f_gate_f,
            l_type_ca_channel_f_ca_gate_f_ca_out => luo_rudy_1994_l_type_ca_channel_f_ca_gate_f_ca,
            time_dependent_potassium_current_i_k_out => luo_rudy_1994_time_dependent_potassium_current_i_k,
            time_dependent_potassium_current_time_private_out => luo_rudy_1994_time_dependent_potassium_current_time_private,
            time_dependent_potassium_current_v_private_out => luo_rudy_1994_time_dependent_potassium_current_v_private,
            time_dependent_potassium_current_x_gate_x_out => luo_rudy_1994_time_dependent_potassium_current_x_gate_x,
            time_dependent_potassium_current_xi_gate_xi_out => luo_rudy_1994_time_dependent_potassium_current_xi_gate_xi,
            time_independent_potassium_current_i_k1_out => luo_rudy_1994_time_independent_potassium_current_i_k1,
            time_independent_potassium_current_e_k1_out => luo_rudy_1994_time_independent_potassium_current_e_k1,
            time_independent_potassium_current_time_private_out => luo_rudy_1994_time_independent_potassium_current_time_private,
            time_independent_potassium_current_v_private_out => luo_rudy_1994_time_independent_potassium_current_v_private,
            time_independent_potassium_current_k1_gate_k1_infinity_out => luo_rudy_1994_time_independent_potassium_current_k1_gate_k1_infinity,
            plateau_potassium_current_i_kp_out => luo_rudy_1994_plateau_potassium_current_i_kp,
            sarcolemmal_calcium_pump_i_p_ca_out => luo_rudy_1994_sarcolemmal_calcium_pump_i_p_ca,
            sodium_background_current_i_na_b_out => luo_rudy_1994_sodium_background_current_i_na_b,
            calcium_background_current_i_ca_b_out => luo_rudy_1994_calcium_background_current_i_ca_b,
            sodium_potassium_pump_i_nak_out => luo_rudy_1994_sodium_potassium_pump_i_nak,
            non_specific_calcium_activated_current_i_ns_ca_out => luo_rudy_1994_non_specific_calcium_activated_current_i_ns_ca,
            non_specific_calcium_activated_current_i_ns_na_out => luo_rudy_1994_non_specific_calcium_activated_current_i_ns_na,
            non_specific_calcium_activated_current_i_ns_k_out => luo_rudy_1994_non_specific_calcium_activated_current_i_ns_k,
            na_ca_exchanger_i_naca_out => luo_rudy_1994_na_ca_exchanger_i_naca,
            calcium_fluxes_in_the_sr_i_rel_out => luo_rudy_1994_calcium_fluxes_in_the_sr_i_rel,
            calcium_fluxes_in_the_sr_i_up_out => luo_rudy_1994_calcium_fluxes_in_the_sr_i_up,
            calcium_fluxes_in_the_sr_i_leak_out => luo_rudy_1994_calcium_fluxes_in_the_sr_i_leak,
            calcium_fluxes_in_the_sr_i_tr_out => luo_rudy_1994_calcium_fluxes_in_the_sr_i_tr,
            ionic_concentrations_nai_out => luo_rudy_1994_ionic_concentrations_nai,
            ionic_concentrations_nao_out => luo_rudy_1994_ionic_concentrations_nao,
            ionic_concentrations_cai_out => luo_rudy_1994_ionic_concentrations_cai,
            ionic_concentrations_cao_out => luo_rudy_1994_ionic_concentrations_cao,
            ionic_concentrations_ki_out => luo_rudy_1994_ionic_concentrations_ki,
            ionic_concentrations_ko_out => luo_rudy_1994_ionic_concentrations_ko,
            ionic_concentrations_ca_jsr_out => luo_rudy_1994_ionic_concentrations_ca_jsr,
            ionic_concentrations_ca_nsr_out => luo_rudy_1994_ionic_concentrations_ca_nsr
        );

    -- Perform Mapping
    environment_time_out <= luo_rudy_1994_environment_time;
    membrane_v_out <= luo_rudy_1994_membrane_v;
    membrane_r_out <= luo_rudy_1994_membrane_r;
    membrane_t_out <= luo_rudy_1994_membrane_t;
    membrane_f_out <= luo_rudy_1994_membrane_f;
    membrane_dv_dt_out <= luo_rudy_1994_membrane_dv_dt;
    membrane_istimc_out <= luo_rudy_1994_membrane_istimc;
    fast_sodium_current_i_na_out <= luo_rudy_1994_fast_sodium_current_i_na;
    fast_sodium_current_e_na_out <= luo_rudy_1994_fast_sodium_current_e_na;
    fast_sodium_current_time_private_out <= luo_rudy_1994_fast_sodium_current_time_private;
    fast_sodium_current_v_private_out <= luo_rudy_1994_fast_sodium_current_v_private;
    fast_sodium_current_m_gate_m_out <= luo_rudy_1994_fast_sodium_current_m_gate_m;
    fast_sodium_current_h_gate_h_out <= luo_rudy_1994_fast_sodium_current_h_gate_h;
    fast_sodium_current_j_gate_j_out <= luo_rudy_1994_fast_sodium_current_j_gate_j;
    l_type_ca_channel_i_ca_l_out <= luo_rudy_1994_l_type_ca_channel_i_ca_l;
    l_type_ca_channel_i_caca_out <= luo_rudy_1994_l_type_ca_channel_i_caca;
    l_type_ca_channel_i_cak_out <= luo_rudy_1994_l_type_ca_channel_i_cak;
    l_type_ca_channel_i_cana_out <= luo_rudy_1994_l_type_ca_channel_i_cana;
    l_type_ca_channel_gamma_nai_out <= luo_rudy_1994_l_type_ca_channel_gamma_nai;
    l_type_ca_channel_gamma_nao_out <= luo_rudy_1994_l_type_ca_channel_gamma_nao;
    l_type_ca_channel_gamma_ki_out <= luo_rudy_1994_l_type_ca_channel_gamma_ki;
    l_type_ca_channel_gamma_ko_out <= luo_rudy_1994_l_type_ca_channel_gamma_ko;
    l_type_ca_channel_time_private_out <= luo_rudy_1994_l_type_ca_channel_time_private;
    l_type_ca_channel_v_private_out <= luo_rudy_1994_l_type_ca_channel_v_private;
    l_type_ca_channel_cai_private_out <= luo_rudy_1994_l_type_ca_channel_cai_private;
    l_type_ca_channel_d_gate_d_out <= luo_rudy_1994_l_type_ca_channel_d_gate_d;
    l_type_ca_channel_f_gate_f_out <= luo_rudy_1994_l_type_ca_channel_f_gate_f;
    l_type_ca_channel_f_ca_gate_f_ca_out <= luo_rudy_1994_l_type_ca_channel_f_ca_gate_f_ca;
    time_dependent_potassium_current_i_k_out <= luo_rudy_1994_time_dependent_potassium_current_i_k;
    time_dependent_potassium_current_time_private_out <= luo_rudy_1994_time_dependent_potassium_current_time_private;
    time_dependent_potassium_current_v_private_out <= luo_rudy_1994_time_dependent_potassium_current_v_private;
    time_dependent_potassium_current_x_gate_x_out <= luo_rudy_1994_time_dependent_potassium_current_x_gate_x;
    time_dependent_potassium_current_xi_gate_xi_out <= luo_rudy_1994_time_dependent_potassium_current_xi_gate_xi;
    time_independent_potassium_current_i_k1_out <= luo_rudy_1994_time_independent_potassium_current_i_k1;
    time_independent_potassium_current_e_k1_out <= luo_rudy_1994_time_independent_potassium_current_e_k1;
    time_independent_potassium_current_time_private_out <= luo_rudy_1994_time_independent_potassium_current_time_private;
    time_independent_potassium_current_v_private_out <= luo_rudy_1994_time_independent_potassium_current_v_private;
    time_independent_potassium_current_k1_gate_k1_infinity_out <= luo_rudy_1994_time_independent_potassium_current_k1_gate_k1_infinity;
    plateau_potassium_current_i_kp_out <= luo_rudy_1994_plateau_potassium_current_i_kp;
    sarcolemmal_calcium_pump_i_p_ca_out <= luo_rudy_1994_sarcolemmal_calcium_pump_i_p_ca;
    sodium_background_current_i_na_b_out <= luo_rudy_1994_sodium_background_current_i_na_b;
    calcium_background_current_i_ca_b_out <= luo_rudy_1994_calcium_background_current_i_ca_b;
    sodium_potassium_pump_i_nak_out <= luo_rudy_1994_sodium_potassium_pump_i_nak;
    non_specific_calcium_activated_current_i_ns_ca_out <= luo_rudy_1994_non_specific_calcium_activated_current_i_ns_ca;
    non_specific_calcium_activated_current_i_ns_na_out <= luo_rudy_1994_non_specific_calcium_activated_current_i_ns_na;
    non_specific_calcium_activated_current_i_ns_k_out <= luo_rudy_1994_non_specific_calcium_activated_current_i_ns_k;
    na_ca_exchanger_i_naca_out <= luo_rudy_1994_na_ca_exchanger_i_naca;
    calcium_fluxes_in_the_sr_i_rel_out <= luo_rudy_1994_calcium_fluxes_in_the_sr_i_rel;
    calcium_fluxes_in_the_sr_i_up_out <= luo_rudy_1994_calcium_fluxes_in_the_sr_i_up;
    calcium_fluxes_in_the_sr_i_leak_out <= luo_rudy_1994_calcium_fluxes_in_the_sr_i_leak;
    calcium_fluxes_in_the_sr_i_tr_out <= luo_rudy_1994_calcium_fluxes_in_the_sr_i_tr;
    ionic_concentrations_nai_out <= luo_rudy_1994_ionic_concentrations_nai;
    ionic_concentrations_nao_out <= luo_rudy_1994_ionic_concentrations_nao;
    ionic_concentrations_cai_out <= luo_rudy_1994_ionic_concentrations_cai;
    ionic_concentrations_cao_out <= luo_rudy_1994_ionic_concentrations_cao;
    ionic_concentrations_ki_out <= luo_rudy_1994_ionic_concentrations_ki;
    ionic_concentrations_ko_out <= luo_rudy_1994_ionic_concentrations_ko;
    ionic_concentrations_ca_jsr_out <= luo_rudy_1994_ionic_concentrations_ca_jsr;
    ionic_concentrations_ca_nsr_out <= luo_rudy_1994_ionic_concentrations_ca_nsr;
end architecture;