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
        membrane_cm_out : out signed(31 downto 0);
        membrane_v_c_out : out signed(31 downto 0);
        membrane_i_stim_out : out signed(31 downto 0);
        reversal_potentials_e_na_out : out signed(31 downto 0);
        reversal_potentials_e_k_out : out signed(31 downto 0);
        reversal_potentials_e_ks_out : out signed(31 downto 0);
        reversal_potentials_e_ca_out : out signed(31 downto 0);
        inward_rectifier_potassium_current_i_k1_out : out signed(31 downto 0);
        rapid_time_dependent_potassium_current_i_kr_out : out signed(31 downto 0);
        rapid_time_dependent_potassium_current_time_private_out : out signed(31 downto 0);
        rapid_time_dependent_potassium_current_v_private_out : out signed(31 downto 0);
        rapid_time_dependent_potassium_current_xr1_gate_xr1_out : out signed(31 downto 0);
        rapid_time_dependent_potassium_current_xr2_gate_xr2_out : out signed(31 downto 0);
        slow_time_dependent_potassium_current_i_ks_out : out signed(31 downto 0);
        slow_time_dependent_potassium_current_time_private_out : out signed(31 downto 0);
        slow_time_dependent_potassium_current_v_private_out : out signed(31 downto 0);
        slow_time_dependent_potassium_current_xs_gate_xs_out : out signed(31 downto 0);
        fast_sodium_current_i_na_out : out signed(31 downto 0);
        fast_sodium_current_time_private_out : out signed(31 downto 0);
        fast_sodium_current_v_private_out : out signed(31 downto 0);
        fast_sodium_current_m_gate_m_out : out signed(31 downto 0);
        fast_sodium_current_h_gate_h_out : out signed(31 downto 0);
        fast_sodium_current_j_gate_j_out : out signed(31 downto 0);
        sodium_background_current_i_b_na_out : out signed(31 downto 0);
        l_type_ca_current_i_cal_out : out signed(31 downto 0);
        l_type_ca_current_ca_i_private_out : out signed(31 downto 0);
        l_type_ca_current_time_private_out : out signed(31 downto 0);
        l_type_ca_current_v_private_out : out signed(31 downto 0);
        l_type_ca_current_d_out : out signed(31 downto 0);
        l_type_ca_current_d_gate_d_out : out signed(31 downto 0);
        l_type_ca_current_f_gate_f_out : out signed(31 downto 0);
        l_type_ca_current_fca_gate_fca_out : out signed(31 downto 0);
        calcium_background_current_i_b_ca_out : out signed(31 downto 0);
        transient_outward_current_i_to_out : out signed(31 downto 0);
        transient_outward_current_v_private_out : out signed(31 downto 0);
        transient_outward_current_time_private_out : out signed(31 downto 0);
        transient_outward_current_s_gate_s_out : out signed(31 downto 0);
        transient_outward_current_r_gate_r_out : out signed(31 downto 0);
        sodium_potassium_pump_current_i_nak_out : out signed(31 downto 0);
        sodium_potassium_pump_current_v_private_out : out signed(31 downto 0);
        sodium_calcium_exchanger_current_i_naca_out : out signed(31 downto 0);
        calcium_pump_current_i_p_ca_out : out signed(31 downto 0);
        potassium_pump_current_i_p_k_out : out signed(31 downto 0);
        calcium_dynamics_ca_i_out : out signed(31 downto 0);
        calcium_dynamics_ca_o_out : out signed(31 downto 0);
        sodium_dynamics_na_i_out : out signed(31 downto 0);
        sodium_dynamics_na_o_out : out signed(31 downto 0);
        potassium_dynamics_k_i_out : out signed(31 downto 0);
        potassium_dynamics_k_o_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal tentusscher_2004_mcell_environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_membrane_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_membrane_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_membrane_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_membrane_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_membrane_cm : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_membrane_v_c : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_membrane_i_stim : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_reversal_potentials_e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_reversal_potentials_e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_reversal_potentials_e_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_reversal_potentials_e_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_inward_rectifier_potassium_current_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_rapid_time_dependent_potassium_current_i_kr : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_rapid_time_dependent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_rapid_time_dependent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_rapid_time_dependent_potassium_current_xr1_gate_xr1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_rapid_time_dependent_potassium_current_xr2_gate_xr2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_slow_time_dependent_potassium_current_i_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_slow_time_dependent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_slow_time_dependent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_slow_time_dependent_potassium_current_xs_gate_xs : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_fast_sodium_current_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_fast_sodium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_fast_sodium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_fast_sodium_current_m_gate_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_fast_sodium_current_h_gate_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_fast_sodium_current_j_gate_j : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_sodium_background_current_i_b_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_i_cal : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_ca_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_d_gate_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_f_gate_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_l_type_ca_current_fca_gate_fca : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_calcium_background_current_i_b_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_transient_outward_current_i_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_transient_outward_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_transient_outward_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_transient_outward_current_s_gate_s : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_transient_outward_current_r_gate_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_sodium_potassium_pump_current_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_sodium_potassium_pump_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_sodium_calcium_exchanger_current_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_calcium_pump_current_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_potassium_pump_current_i_p_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_calcium_dynamics_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_calcium_dynamics_ca_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_sodium_dynamics_na_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_sodium_dynamics_na_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_potassium_dynamics_k_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal tentusscher_2004_mcell_potassium_dynamics_k_o : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component Tentusscher2004Mcell is
        port(
            clk : in std_logic;
            environment_time_out : out signed(31 downto 0);
            membrane_v_out : out signed(31 downto 0);
            membrane_r_out : out signed(31 downto 0);
            membrane_t_out : out signed(31 downto 0);
            membrane_f_out : out signed(31 downto 0);
            membrane_cm_out : out signed(31 downto 0);
            membrane_v_c_out : out signed(31 downto 0);
            membrane_i_stim_out : out signed(31 downto 0);
            reversal_potentials_e_na_out : out signed(31 downto 0);
            reversal_potentials_e_k_out : out signed(31 downto 0);
            reversal_potentials_e_ks_out : out signed(31 downto 0);
            reversal_potentials_e_ca_out : out signed(31 downto 0);
            inward_rectifier_potassium_current_i_k1_out : out signed(31 downto 0);
            rapid_time_dependent_potassium_current_i_kr_out : out signed(31 downto 0);
            rapid_time_dependent_potassium_current_time_private_out : out signed(31 downto 0);
            rapid_time_dependent_potassium_current_v_private_out : out signed(31 downto 0);
            rapid_time_dependent_potassium_current_xr1_gate_xr1_out : out signed(31 downto 0);
            rapid_time_dependent_potassium_current_xr2_gate_xr2_out : out signed(31 downto 0);
            slow_time_dependent_potassium_current_i_ks_out : out signed(31 downto 0);
            slow_time_dependent_potassium_current_time_private_out : out signed(31 downto 0);
            slow_time_dependent_potassium_current_v_private_out : out signed(31 downto 0);
            slow_time_dependent_potassium_current_xs_gate_xs_out : out signed(31 downto 0);
            fast_sodium_current_i_na_out : out signed(31 downto 0);
            fast_sodium_current_time_private_out : out signed(31 downto 0);
            fast_sodium_current_v_private_out : out signed(31 downto 0);
            fast_sodium_current_m_gate_m_out : out signed(31 downto 0);
            fast_sodium_current_h_gate_h_out : out signed(31 downto 0);
            fast_sodium_current_j_gate_j_out : out signed(31 downto 0);
            sodium_background_current_i_b_na_out : out signed(31 downto 0);
            l_type_ca_current_i_cal_out : out signed(31 downto 0);
            l_type_ca_current_ca_i_private_out : out signed(31 downto 0);
            l_type_ca_current_time_private_out : out signed(31 downto 0);
            l_type_ca_current_v_private_out : out signed(31 downto 0);
            l_type_ca_current_d_out : out signed(31 downto 0);
            l_type_ca_current_d_gate_d_out : out signed(31 downto 0);
            l_type_ca_current_f_gate_f_out : out signed(31 downto 0);
            l_type_ca_current_fca_gate_fca_out : out signed(31 downto 0);
            calcium_background_current_i_b_ca_out : out signed(31 downto 0);
            transient_outward_current_i_to_out : out signed(31 downto 0);
            transient_outward_current_v_private_out : out signed(31 downto 0);
            transient_outward_current_time_private_out : out signed(31 downto 0);
            transient_outward_current_s_gate_s_out : out signed(31 downto 0);
            transient_outward_current_r_gate_r_out : out signed(31 downto 0);
            sodium_potassium_pump_current_i_nak_out : out signed(31 downto 0);
            sodium_potassium_pump_current_v_private_out : out signed(31 downto 0);
            sodium_calcium_exchanger_current_i_naca_out : out signed(31 downto 0);
            calcium_pump_current_i_p_ca_out : out signed(31 downto 0);
            potassium_pump_current_i_p_k_out : out signed(31 downto 0);
            calcium_dynamics_ca_i_out : out signed(31 downto 0);
            calcium_dynamics_ca_o_out : out signed(31 downto 0);
            sodium_dynamics_na_i_out : out signed(31 downto 0);
            sodium_dynamics_na_o_out : out signed(31 downto 0);
            potassium_dynamics_k_i_out : out signed(31 downto 0);
            potassium_dynamics_k_o_out : out signed(31 downto 0)
        );
    end component Tentusscher2004Mcell;
begin
    -- Create base instance
    tentusscher_2004_mcell_inst : component Tentusscher2004Mcell
        port map(
            clk => clk,
            environment_time_out => tentusscher_2004_mcell_environment_time,
            membrane_v_out => tentusscher_2004_mcell_membrane_v,
            membrane_r_out => tentusscher_2004_mcell_membrane_r,
            membrane_t_out => tentusscher_2004_mcell_membrane_t,
            membrane_f_out => tentusscher_2004_mcell_membrane_f,
            membrane_cm_out => tentusscher_2004_mcell_membrane_cm,
            membrane_v_c_out => tentusscher_2004_mcell_membrane_v_c,
            membrane_i_stim_out => tentusscher_2004_mcell_membrane_i_stim,
            reversal_potentials_e_na_out => tentusscher_2004_mcell_reversal_potentials_e_na,
            reversal_potentials_e_k_out => tentusscher_2004_mcell_reversal_potentials_e_k,
            reversal_potentials_e_ks_out => tentusscher_2004_mcell_reversal_potentials_e_ks,
            reversal_potentials_e_ca_out => tentusscher_2004_mcell_reversal_potentials_e_ca,
            inward_rectifier_potassium_current_i_k1_out => tentusscher_2004_mcell_inward_rectifier_potassium_current_i_k1,
            rapid_time_dependent_potassium_current_i_kr_out => tentusscher_2004_mcell_rapid_time_dependent_potassium_current_i_kr,
            rapid_time_dependent_potassium_current_time_private_out => tentusscher_2004_mcell_rapid_time_dependent_potassium_current_time_private,
            rapid_time_dependent_potassium_current_v_private_out => tentusscher_2004_mcell_rapid_time_dependent_potassium_current_v_private,
            rapid_time_dependent_potassium_current_xr1_gate_xr1_out => tentusscher_2004_mcell_rapid_time_dependent_potassium_current_xr1_gate_xr1,
            rapid_time_dependent_potassium_current_xr2_gate_xr2_out => tentusscher_2004_mcell_rapid_time_dependent_potassium_current_xr2_gate_xr2,
            slow_time_dependent_potassium_current_i_ks_out => tentusscher_2004_mcell_slow_time_dependent_potassium_current_i_ks,
            slow_time_dependent_potassium_current_time_private_out => tentusscher_2004_mcell_slow_time_dependent_potassium_current_time_private,
            slow_time_dependent_potassium_current_v_private_out => tentusscher_2004_mcell_slow_time_dependent_potassium_current_v_private,
            slow_time_dependent_potassium_current_xs_gate_xs_out => tentusscher_2004_mcell_slow_time_dependent_potassium_current_xs_gate_xs,
            fast_sodium_current_i_na_out => tentusscher_2004_mcell_fast_sodium_current_i_na,
            fast_sodium_current_time_private_out => tentusscher_2004_mcell_fast_sodium_current_time_private,
            fast_sodium_current_v_private_out => tentusscher_2004_mcell_fast_sodium_current_v_private,
            fast_sodium_current_m_gate_m_out => tentusscher_2004_mcell_fast_sodium_current_m_gate_m,
            fast_sodium_current_h_gate_h_out => tentusscher_2004_mcell_fast_sodium_current_h_gate_h,
            fast_sodium_current_j_gate_j_out => tentusscher_2004_mcell_fast_sodium_current_j_gate_j,
            sodium_background_current_i_b_na_out => tentusscher_2004_mcell_sodium_background_current_i_b_na,
            l_type_ca_current_i_cal_out => tentusscher_2004_mcell_l_type_ca_current_i_cal,
            l_type_ca_current_ca_i_private_out => tentusscher_2004_mcell_l_type_ca_current_ca_i_private,
            l_type_ca_current_time_private_out => tentusscher_2004_mcell_l_type_ca_current_time_private,
            l_type_ca_current_v_private_out => tentusscher_2004_mcell_l_type_ca_current_v_private,
            l_type_ca_current_d_out => tentusscher_2004_mcell_l_type_ca_current_d,
            l_type_ca_current_d_gate_d_out => tentusscher_2004_mcell_l_type_ca_current_d_gate_d,
            l_type_ca_current_f_gate_f_out => tentusscher_2004_mcell_l_type_ca_current_f_gate_f,
            l_type_ca_current_fca_gate_fca_out => tentusscher_2004_mcell_l_type_ca_current_fca_gate_fca,
            calcium_background_current_i_b_ca_out => tentusscher_2004_mcell_calcium_background_current_i_b_ca,
            transient_outward_current_i_to_out => tentusscher_2004_mcell_transient_outward_current_i_to,
            transient_outward_current_v_private_out => tentusscher_2004_mcell_transient_outward_current_v_private,
            transient_outward_current_time_private_out => tentusscher_2004_mcell_transient_outward_current_time_private,
            transient_outward_current_s_gate_s_out => tentusscher_2004_mcell_transient_outward_current_s_gate_s,
            transient_outward_current_r_gate_r_out => tentusscher_2004_mcell_transient_outward_current_r_gate_r,
            sodium_potassium_pump_current_i_nak_out => tentusscher_2004_mcell_sodium_potassium_pump_current_i_nak,
            sodium_potassium_pump_current_v_private_out => tentusscher_2004_mcell_sodium_potassium_pump_current_v_private,
            sodium_calcium_exchanger_current_i_naca_out => tentusscher_2004_mcell_sodium_calcium_exchanger_current_i_naca,
            calcium_pump_current_i_p_ca_out => tentusscher_2004_mcell_calcium_pump_current_i_p_ca,
            potassium_pump_current_i_p_k_out => tentusscher_2004_mcell_potassium_pump_current_i_p_k,
            calcium_dynamics_ca_i_out => tentusscher_2004_mcell_calcium_dynamics_ca_i,
            calcium_dynamics_ca_o_out => tentusscher_2004_mcell_calcium_dynamics_ca_o,
            sodium_dynamics_na_i_out => tentusscher_2004_mcell_sodium_dynamics_na_i,
            sodium_dynamics_na_o_out => tentusscher_2004_mcell_sodium_dynamics_na_o,
            potassium_dynamics_k_i_out => tentusscher_2004_mcell_potassium_dynamics_k_i,
            potassium_dynamics_k_o_out => tentusscher_2004_mcell_potassium_dynamics_k_o
        );

    -- Perform Mapping
    environment_time_out <= tentusscher_2004_mcell_environment_time;
    membrane_v_out <= tentusscher_2004_mcell_membrane_v;
    membrane_r_out <= tentusscher_2004_mcell_membrane_r;
    membrane_t_out <= tentusscher_2004_mcell_membrane_t;
    membrane_f_out <= tentusscher_2004_mcell_membrane_f;
    membrane_cm_out <= tentusscher_2004_mcell_membrane_cm;
    membrane_v_c_out <= tentusscher_2004_mcell_membrane_v_c;
    membrane_i_stim_out <= tentusscher_2004_mcell_membrane_i_stim;
    reversal_potentials_e_na_out <= tentusscher_2004_mcell_reversal_potentials_e_na;
    reversal_potentials_e_k_out <= tentusscher_2004_mcell_reversal_potentials_e_k;
    reversal_potentials_e_ks_out <= tentusscher_2004_mcell_reversal_potentials_e_ks;
    reversal_potentials_e_ca_out <= tentusscher_2004_mcell_reversal_potentials_e_ca;
    inward_rectifier_potassium_current_i_k1_out <= tentusscher_2004_mcell_inward_rectifier_potassium_current_i_k1;
    rapid_time_dependent_potassium_current_i_kr_out <= tentusscher_2004_mcell_rapid_time_dependent_potassium_current_i_kr;
    rapid_time_dependent_potassium_current_time_private_out <= tentusscher_2004_mcell_rapid_time_dependent_potassium_current_time_private;
    rapid_time_dependent_potassium_current_v_private_out <= tentusscher_2004_mcell_rapid_time_dependent_potassium_current_v_private;
    rapid_time_dependent_potassium_current_xr1_gate_xr1_out <= tentusscher_2004_mcell_rapid_time_dependent_potassium_current_xr1_gate_xr1;
    rapid_time_dependent_potassium_current_xr2_gate_xr2_out <= tentusscher_2004_mcell_rapid_time_dependent_potassium_current_xr2_gate_xr2;
    slow_time_dependent_potassium_current_i_ks_out <= tentusscher_2004_mcell_slow_time_dependent_potassium_current_i_ks;
    slow_time_dependent_potassium_current_time_private_out <= tentusscher_2004_mcell_slow_time_dependent_potassium_current_time_private;
    slow_time_dependent_potassium_current_v_private_out <= tentusscher_2004_mcell_slow_time_dependent_potassium_current_v_private;
    slow_time_dependent_potassium_current_xs_gate_xs_out <= tentusscher_2004_mcell_slow_time_dependent_potassium_current_xs_gate_xs;
    fast_sodium_current_i_na_out <= tentusscher_2004_mcell_fast_sodium_current_i_na;
    fast_sodium_current_time_private_out <= tentusscher_2004_mcell_fast_sodium_current_time_private;
    fast_sodium_current_v_private_out <= tentusscher_2004_mcell_fast_sodium_current_v_private;
    fast_sodium_current_m_gate_m_out <= tentusscher_2004_mcell_fast_sodium_current_m_gate_m;
    fast_sodium_current_h_gate_h_out <= tentusscher_2004_mcell_fast_sodium_current_h_gate_h;
    fast_sodium_current_j_gate_j_out <= tentusscher_2004_mcell_fast_sodium_current_j_gate_j;
    sodium_background_current_i_b_na_out <= tentusscher_2004_mcell_sodium_background_current_i_b_na;
    l_type_ca_current_i_cal_out <= tentusscher_2004_mcell_l_type_ca_current_i_cal;
    l_type_ca_current_ca_i_private_out <= tentusscher_2004_mcell_l_type_ca_current_ca_i_private;
    l_type_ca_current_time_private_out <= tentusscher_2004_mcell_l_type_ca_current_time_private;
    l_type_ca_current_v_private_out <= tentusscher_2004_mcell_l_type_ca_current_v_private;
    l_type_ca_current_d_out <= tentusscher_2004_mcell_l_type_ca_current_d;
    l_type_ca_current_d_gate_d_out <= tentusscher_2004_mcell_l_type_ca_current_d_gate_d;
    l_type_ca_current_f_gate_f_out <= tentusscher_2004_mcell_l_type_ca_current_f_gate_f;
    l_type_ca_current_fca_gate_fca_out <= tentusscher_2004_mcell_l_type_ca_current_fca_gate_fca;
    calcium_background_current_i_b_ca_out <= tentusscher_2004_mcell_calcium_background_current_i_b_ca;
    transient_outward_current_i_to_out <= tentusscher_2004_mcell_transient_outward_current_i_to;
    transient_outward_current_v_private_out <= tentusscher_2004_mcell_transient_outward_current_v_private;
    transient_outward_current_time_private_out <= tentusscher_2004_mcell_transient_outward_current_time_private;
    transient_outward_current_s_gate_s_out <= tentusscher_2004_mcell_transient_outward_current_s_gate_s;
    transient_outward_current_r_gate_r_out <= tentusscher_2004_mcell_transient_outward_current_r_gate_r;
    sodium_potassium_pump_current_i_nak_out <= tentusscher_2004_mcell_sodium_potassium_pump_current_i_nak;
    sodium_potassium_pump_current_v_private_out <= tentusscher_2004_mcell_sodium_potassium_pump_current_v_private;
    sodium_calcium_exchanger_current_i_naca_out <= tentusscher_2004_mcell_sodium_calcium_exchanger_current_i_naca;
    calcium_pump_current_i_p_ca_out <= tentusscher_2004_mcell_calcium_pump_current_i_p_ca;
    potassium_pump_current_i_p_k_out <= tentusscher_2004_mcell_potassium_pump_current_i_p_k;
    calcium_dynamics_ca_i_out <= tentusscher_2004_mcell_calcium_dynamics_ca_i;
    calcium_dynamics_ca_o_out <= tentusscher_2004_mcell_calcium_dynamics_ca_o;
    sodium_dynamics_na_i_out <= tentusscher_2004_mcell_sodium_dynamics_na_i;
    sodium_dynamics_na_o_out <= tentusscher_2004_mcell_sodium_dynamics_na_o;
    potassium_dynamics_k_i_out <= tentusscher_2004_mcell_potassium_dynamics_k_i;
    potassium_dynamics_k_o_out <= tentusscher_2004_mcell_potassium_dynamics_k_o;
end architecture;