library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity Tentusscher2004Mcell is
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
architecture behavior of Tentusscher2004Mcell is
    -- Declare all internal signals
    signal environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_kr : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_cal : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_b_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_b_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_p_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_cm : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_v_c : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_stim : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_k_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_na_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_k_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_na_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_ca_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_e_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal reversal_potentials_e_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal inward_rectifier_potassium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal inward_rectifier_potassium_current_k_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal inward_rectifier_potassium_current_e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal inward_rectifier_potassium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal inward_rectifier_potassium_current_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_k_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr1_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr2_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_i_kr : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr1_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr1_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr1_gate_xr1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr2_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr2_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal rapid_time_dependent_potassium_current_xr2_gate_xr2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_e_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_xs_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_i_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_xs_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_xs_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal slow_time_dependent_potassium_current_xs_gate_xs : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_m_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_h_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_j_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal fast_sodium_current_i_na : signed(31 downto 0) := CREATE_FP(0.0);
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
    signal sodium_background_current_e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_background_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_background_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_background_current_i_b_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_ca_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_d_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_f1_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_fca_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_i_cal : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_ca_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_d_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_d_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_d_gate_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_f_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_f_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_f_gate_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_fca_gate_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_fca_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_fca_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal l_type_ca_current_fca_gate_f_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_e_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_background_current_i_b_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_s_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_r_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_i_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_s_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_s_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_s_gate_s : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_r_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_r_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal transient_outward_current_r_gate_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_k_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_na_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_potassium_pump_current_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_na_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_na_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_ca_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_calcium_exchanger_current_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_pump_current_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_pump_current_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_pump_current_e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_pump_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_pump_current_i_p_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_v_c : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_cm : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_i_cal : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_i_b_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_dynamics_ca_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_cm : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_v_c : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_i_naca : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_i_b_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_na_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_dynamics_na_o : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_cm : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_v_c : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_i_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_i_kr : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_i_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_i_p_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_i_stim : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_k_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_dynamics_k_o : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Environment is
        port(
            clk : in std_logic;
            time_out : out signed(31 downto 0)
        );
    end component Environment;

    component Membrane is
        generic(
            stim_start : signed(31 downto 0) := CREATE_FP(10.0);
            stim_period : signed(31 downto 0) := CREATE_FP(1000.0);
            stim_duration : signed(31 downto 0) := CREATE_FP(1.0);
            stim_amplitude : signed(31 downto 0) := CREATE_FP(52.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            i_k1_in : in signed(31 downto 0);
            i_to_in : in signed(31 downto 0);
            i_kr_in : in signed(31 downto 0);
            i_ks_in : in signed(31 downto 0);
            i_cal_in : in signed(31 downto 0);
            i_nak_in : in signed(31 downto 0);
            i_na_in : in signed(31 downto 0);
            i_b_na_in : in signed(31 downto 0);
            i_naca_in : in signed(31 downto 0);
            i_b_ca_in : in signed(31 downto 0);
            i_p_k_in : in signed(31 downto 0);
            i_p_ca_in : in signed(31 downto 0);
            v_out : out signed(31 downto 0);
            r_out : out signed(31 downto 0);
            t_out : out signed(31 downto 0);
            f_out : out signed(31 downto 0);
            cm_out : out signed(31 downto 0);
            v_c_out : out signed(31 downto 0);
            i_stim_out : out signed(31 downto 0)
        );
    end component Membrane;

    component ReversalPotentials is
        generic(
            p_kna : signed(31 downto 0) := CREATE_FP(0.03)
        );
        port(
            clk : in std_logic;
            k_o_in : in signed(31 downto 0);
            na_o_in : in signed(31 downto 0);
            k_i_in : in signed(31 downto 0);
            na_i_in : in signed(31 downto 0);
            ca_o_in : in signed(31 downto 0);
            ca_i_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            e_na_out : out signed(31 downto 0);
            e_k_out : out signed(31 downto 0);
            e_ks_out : out signed(31 downto 0);
            e_ca_out : out signed(31 downto 0)
        );
    end component ReversalPotentials;

    component InwardRectifierPotassiumCurrent is
        generic(
            g_k1 : signed(31 downto 0) := CREATE_FP(5.405)
        );
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            k_o_in : in signed(31 downto 0);
            e_k_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            i_k1_out : out signed(31 downto 0)
        );
    end component InwardRectifierPotassiumCurrent;

    component RapidTimeDependentPotassiumCurrent is
        generic(
            g_kr : signed(31 downto 0) := CREATE_FP(0.096)
        );
        port(
            clk : in std_logic;
            e_k_in : in signed(31 downto 0);
            k_o_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            xr1_private_in : in signed(31 downto 0);
            xr2_private_in : in signed(31 downto 0);
            i_kr_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component RapidTimeDependentPotassiumCurrent;

    component RapidTimeDependentPotassiumCurrentXr1Gate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            xr1_out : out signed(31 downto 0)
        );
    end component RapidTimeDependentPotassiumCurrentXr1Gate;

    component RapidTimeDependentPotassiumCurrentXr2Gate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            xr2_out : out signed(31 downto 0)
        );
    end component RapidTimeDependentPotassiumCurrentXr2Gate;

    component SlowTimeDependentPotassiumCurrent is
        generic(
            g_ks : signed(31 downto 0) := CREATE_FP(0.062)
        );
        port(
            clk : in std_logic;
            e_ks_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            xs_private_in : in signed(31 downto 0);
            i_ks_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component SlowTimeDependentPotassiumCurrent;

    component SlowTimeDependentPotassiumCurrentXsGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            xs_out : out signed(31 downto 0)
        );
    end component SlowTimeDependentPotassiumCurrentXsGate;

    component FastSodiumCurrent is
        generic(
            g_na : signed(31 downto 0) := CREATE_FP(14.838)
        );
        port(
            clk : in std_logic;
            e_na_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            m_private_in : in signed(31 downto 0);
            h_private_in : in signed(31 downto 0);
            j_private_in : in signed(31 downto 0);
            i_na_out : out signed(31 downto 0);
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

    component SodiumBackgroundCurrent is
        generic(
            g_bna : signed(31 downto 0) := CREATE_FP(2.9E-4)
        );
        port(
            clk : in std_logic;
            e_na_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            i_b_na_out : out signed(31 downto 0)
        );
    end component SodiumBackgroundCurrent;

    component LTypeCaCurrent is
        generic(
            g_cal : signed(31 downto 0) := CREATE_FP(1.75E-4)
        );
        port(
            clk : in std_logic;
            ca_o_in : in signed(31 downto 0);
            ca_i_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            d_private_in : in signed(31 downto 0);
            f1_private_in : in signed(31 downto 0);
            fca_private_in : in signed(31 downto 0);
            i_cal_out : out signed(31 downto 0);
            ca_i_private_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0);
            d_out : out signed(31 downto 0)
        );
    end component LTypeCaCurrent;

    component LTypeCaCurrentDGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            d_out : out signed(31 downto 0)
        );
    end component LTypeCaCurrentDGate;

    component LTypeCaCurrentFGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            f_out : out signed(31 downto 0)
        );
    end component LTypeCaCurrentFGate;

    component LTypeCaCurrentFcaGate is
        port(
            clk : in std_logic;
            ca_i_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            f_ca_out : out signed(31 downto 0)
        );
    end component LTypeCaCurrentFcaGate;

    component CalciumBackgroundCurrent is
        generic(
            g_bca : signed(31 downto 0) := CREATE_FP(5.92E-4)
        );
        port(
            clk : in std_logic;
            e_ca_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            i_b_ca_out : out signed(31 downto 0)
        );
    end component CalciumBackgroundCurrent;

    component TransientOutwardCurrent is
        generic(
            g_to : signed(31 downto 0) := CREATE_FP(0.294)
        );
        port(
            clk : in std_logic;
            e_k_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            s_private_in : in signed(31 downto 0);
            r_private_in : in signed(31 downto 0);
            i_to_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0)
        );
    end component TransientOutwardCurrent;

    component TransientOutwardCurrentSGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            s_out : out signed(31 downto 0)
        );
    end component TransientOutwardCurrentSGate;

    component TransientOutwardCurrentRGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            r_out : out signed(31 downto 0)
        );
    end component TransientOutwardCurrentRGate;

    component SodiumPotassiumPumpCurrent is
        generic(
            p_nak : signed(31 downto 0) := CREATE_FP(1.362);
            k_mk : signed(31 downto 0) := CREATE_FP(1.0);
            k_mna : signed(31 downto 0) := CREATE_FP(40.0)
        );
        port(
            clk : in std_logic;
            k_o_in : in signed(31 downto 0);
            na_i_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            i_nak_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component SodiumPotassiumPumpCurrent;

    component SodiumCalciumExchangerCurrent is
        generic(
            k_naca : signed(31 downto 0) := CREATE_FP(1000.0);
            k_sat : signed(31 downto 0) := CREATE_FP(0.1);
            alpha : signed(31 downto 0) := CREATE_FP(2.5);
            gamma : signed(31 downto 0) := CREATE_FP(0.35);
            km_ca : signed(31 downto 0) := CREATE_FP(1.38);
            km_nai : signed(31 downto 0) := CREATE_FP(87.5)
        );
        port(
            clk : in std_logic;
            na_i_in : in signed(31 downto 0);
            na_o_in : in signed(31 downto 0);
            ca_i_in : in signed(31 downto 0);
            ca_o_in : in signed(31 downto 0);
            r_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            i_naca_out : out signed(31 downto 0)
        );
    end component SodiumCalciumExchangerCurrent;

    component CalciumPumpCurrent is
        generic(
            g_pca : signed(31 downto 0) := CREATE_FP(0.825);
            k_pca : signed(31 downto 0) := CREATE_FP(5.0E-4)
        );
        port(
            clk : in std_logic;
            ca_i_in : in signed(31 downto 0);
            i_p_ca_out : out signed(31 downto 0)
        );
    end component CalciumPumpCurrent;

    component PotassiumPumpCurrent is
        generic(
            g_pk : signed(31 downto 0) := CREATE_FP(0.0146)
        );
        port(
            clk : in std_logic;
            e_k_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            i_p_k_out : out signed(31 downto 0)
        );
    end component PotassiumPumpCurrent;

    component CalciumDynamics is
        generic(
            tau_g : signed(31 downto 0) := CREATE_FP(2.0);
            a_rel : signed(31 downto 0) := CREATE_FP(0.016464);
            b_rel : signed(31 downto 0) := CREATE_FP(0.25);
            c_rel : signed(31 downto 0) := CREATE_FP(0.008232);
            k_up : signed(31 downto 0) := CREATE_FP(2.5E-4);
            v_leak : signed(31 downto 0) := CREATE_FP(8.0E-5);
            vmax_up : signed(31 downto 0) := CREATE_FP(4.25E-4);
            buf_c : signed(31 downto 0) := CREATE_FP(0.15);
            k_buf_c : signed(31 downto 0) := CREATE_FP(0.001);
            buf_sr : signed(31 downto 0) := CREATE_FP(10.0);
            k_buf_sr : signed(31 downto 0) := CREATE_FP(0.3);
            v_sr : signed(31 downto 0) := CREATE_FP(0.001094)
        );
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            v_c_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            d_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            cm_in : in signed(31 downto 0);
            i_cal_in : in signed(31 downto 0);
            i_naca_in : in signed(31 downto 0);
            i_p_ca_in : in signed(31 downto 0);
            i_b_ca_in : in signed(31 downto 0);
            ca_i_out : out signed(31 downto 0);
            ca_o_out : out signed(31 downto 0)
        );
    end component CalciumDynamics;

    component SodiumDynamics is
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            cm_in : in signed(31 downto 0);
            v_c_in : in signed(31 downto 0);
            i_na_in : in signed(31 downto 0);
            i_naca_in : in signed(31 downto 0);
            i_nak_in : in signed(31 downto 0);
            i_b_na_in : in signed(31 downto 0);
            na_i_out : out signed(31 downto 0);
            na_o_out : out signed(31 downto 0)
        );
    end component SodiumDynamics;

    component PotassiumDynamics is
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            f_in : in signed(31 downto 0);
            cm_in : in signed(31 downto 0);
            v_c_in : in signed(31 downto 0);
            i_k1_in : in signed(31 downto 0);
            i_to_in : in signed(31 downto 0);
            i_nak_in : in signed(31 downto 0);
            i_kr_in : in signed(31 downto 0);
            i_ks_in : in signed(31 downto 0);
            i_p_k_in : in signed(31 downto 0);
            i_stim_in : in signed(31 downto 0);
            k_i_out : out signed(31 downto 0);
            k_o_out : out signed(31 downto 0)
        );
    end component PotassiumDynamics;

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
            i_k1_in => membrane_i_k1,
            i_to_in => membrane_i_to,
            i_kr_in => membrane_i_kr,
            i_ks_in => membrane_i_ks,
            i_cal_in => membrane_i_cal,
            i_nak_in => membrane_i_nak,
            i_na_in => membrane_i_na,
            i_b_na_in => membrane_i_b_na,
            i_naca_in => membrane_i_naca,
            i_b_ca_in => membrane_i_b_ca,
            i_p_k_in => membrane_i_p_k,
            i_p_ca_in => membrane_i_p_ca,
            v_out => membrane_v,
            r_out => membrane_r,
            t_out => membrane_t,
            f_out => membrane_f,
            cm_out => membrane_cm,
            v_c_out => membrane_v_c,
            i_stim_out => membrane_i_stim
        );

    reversal_potentials_inst : component ReversalPotentials
        port map(
            clk => clk,
            k_o_in => reversal_potentials_k_o,
            na_o_in => reversal_potentials_na_o,
            k_i_in => reversal_potentials_k_i,
            na_i_in => reversal_potentials_na_i,
            ca_o_in => reversal_potentials_ca_o,
            ca_i_in => reversal_potentials_ca_i,
            r_in => reversal_potentials_r,
            f_in => reversal_potentials_f,
            t_in => reversal_potentials_t,
            time_in => reversal_potentials_time,
            e_na_out => reversal_potentials_e_na,
            e_k_out => reversal_potentials_e_k,
            e_ks_out => reversal_potentials_e_ks,
            e_ca_out => reversal_potentials_e_ca
        );

    inward_rectifier_potassium_current_inst : component InwardRectifierPotassiumCurrent
        port map(
            clk => clk,
            v_in => inward_rectifier_potassium_current_v,
            k_o_in => inward_rectifier_potassium_current_k_o,
            e_k_in => inward_rectifier_potassium_current_e_k,
            time_in => inward_rectifier_potassium_current_time,
            i_k1_out => inward_rectifier_potassium_current_i_k1
        );

    rapid_time_dependent_potassium_current_inst : component RapidTimeDependentPotassiumCurrent
        port map(
            clk => clk,
            e_k_in => rapid_time_dependent_potassium_current_e_k,
            k_o_in => rapid_time_dependent_potassium_current_k_o,
            time_in => rapid_time_dependent_potassium_current_time,
            v_in => rapid_time_dependent_potassium_current_v,
            xr1_private_in => rapid_time_dependent_potassium_current_xr1_private,
            xr2_private_in => rapid_time_dependent_potassium_current_xr2_private,
            i_kr_out => rapid_time_dependent_potassium_current_i_kr,
            time_private_out => rapid_time_dependent_potassium_current_time_private,
            v_private_out => rapid_time_dependent_potassium_current_v_private
        );

    rapid_time_dependent_potassium_current_xr1_gate_inst : component RapidTimeDependentPotassiumCurrentXr1Gate
        port map(
            clk => clk,
            v_in => rapid_time_dependent_potassium_current_xr1_gate_v,
            time_in => rapid_time_dependent_potassium_current_xr1_gate_time,
            xr1_out => rapid_time_dependent_potassium_current_xr1_gate_xr1
        );

    rapid_time_dependent_potassium_current_xr2_gate_inst : component RapidTimeDependentPotassiumCurrentXr2Gate
        port map(
            clk => clk,
            v_in => rapid_time_dependent_potassium_current_xr2_gate_v,
            time_in => rapid_time_dependent_potassium_current_xr2_gate_time,
            xr2_out => rapid_time_dependent_potassium_current_xr2_gate_xr2
        );

    slow_time_dependent_potassium_current_inst : component SlowTimeDependentPotassiumCurrent
        port map(
            clk => clk,
            e_ks_in => slow_time_dependent_potassium_current_e_ks,
            time_in => slow_time_dependent_potassium_current_time,
            v_in => slow_time_dependent_potassium_current_v,
            xs_private_in => slow_time_dependent_potassium_current_xs_private,
            i_ks_out => slow_time_dependent_potassium_current_i_ks,
            time_private_out => slow_time_dependent_potassium_current_time_private,
            v_private_out => slow_time_dependent_potassium_current_v_private
        );

    slow_time_dependent_potassium_current_xs_gate_inst : component SlowTimeDependentPotassiumCurrentXsGate
        port map(
            clk => clk,
            v_in => slow_time_dependent_potassium_current_xs_gate_v,
            time_in => slow_time_dependent_potassium_current_xs_gate_time,
            xs_out => slow_time_dependent_potassium_current_xs_gate_xs
        );

    fast_sodium_current_inst : component FastSodiumCurrent
        port map(
            clk => clk,
            e_na_in => fast_sodium_current_e_na,
            time_in => fast_sodium_current_time,
            v_in => fast_sodium_current_v,
            m_private_in => fast_sodium_current_m_private,
            h_private_in => fast_sodium_current_h_private,
            j_private_in => fast_sodium_current_j_private,
            i_na_out => fast_sodium_current_i_na,
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

    sodium_background_current_inst : component SodiumBackgroundCurrent
        port map(
            clk => clk,
            e_na_in => sodium_background_current_e_na,
            time_in => sodium_background_current_time,
            v_in => sodium_background_current_v,
            i_b_na_out => sodium_background_current_i_b_na
        );

    l_type_ca_current_inst : component LTypeCaCurrent
        port map(
            clk => clk,
            ca_o_in => l_type_ca_current_ca_o,
            ca_i_in => l_type_ca_current_ca_i,
            r_in => l_type_ca_current_r,
            f_in => l_type_ca_current_f,
            t_in => l_type_ca_current_t,
            time_in => l_type_ca_current_time,
            v_in => l_type_ca_current_v,
            d_private_in => l_type_ca_current_d_private,
            f1_private_in => l_type_ca_current_f1_private,
            fca_private_in => l_type_ca_current_fca_private,
            i_cal_out => l_type_ca_current_i_cal,
            ca_i_private_out => l_type_ca_current_ca_i_private,
            time_private_out => l_type_ca_current_time_private,
            v_private_out => l_type_ca_current_v_private,
            d_out => l_type_ca_current_d
        );

    l_type_ca_current_d_gate_inst : component LTypeCaCurrentDGate
        port map(
            clk => clk,
            v_in => l_type_ca_current_d_gate_v,
            time_in => l_type_ca_current_d_gate_time,
            d_out => l_type_ca_current_d_gate_d
        );

    l_type_ca_current_f_gate_inst : component LTypeCaCurrentFGate
        port map(
            clk => clk,
            v_in => l_type_ca_current_f_gate_v,
            time_in => l_type_ca_current_f_gate_time,
            f_out => l_type_ca_current_f_gate_f
        );

    l_type_ca_current_fca_gate_inst : component LTypeCaCurrentFcaGate
        port map(
            clk => clk,
            ca_i_in => l_type_ca_current_fca_gate_ca_i,
            v_in => l_type_ca_current_fca_gate_v,
            time_in => l_type_ca_current_fca_gate_time,
            f_ca_out => l_type_ca_current_fca_gate_f_ca
        );

    calcium_background_current_inst : component CalciumBackgroundCurrent
        port map(
            clk => clk,
            e_ca_in => calcium_background_current_e_ca,
            time_in => calcium_background_current_time,
            v_in => calcium_background_current_v,
            i_b_ca_out => calcium_background_current_i_b_ca
        );

    transient_outward_current_inst : component TransientOutwardCurrent
        port map(
            clk => clk,
            e_k_in => transient_outward_current_e_k,
            v_in => transient_outward_current_v,
            time_in => transient_outward_current_time,
            s_private_in => transient_outward_current_s_private,
            r_private_in => transient_outward_current_r_private,
            i_to_out => transient_outward_current_i_to,
            v_private_out => transient_outward_current_v_private,
            time_private_out => transient_outward_current_time_private
        );

    transient_outward_current_s_gate_inst : component TransientOutwardCurrentSGate
        port map(
            clk => clk,
            v_in => transient_outward_current_s_gate_v,
            time_in => transient_outward_current_s_gate_time,
            s_out => transient_outward_current_s_gate_s
        );

    transient_outward_current_r_gate_inst : component TransientOutwardCurrentRGate
        port map(
            clk => clk,
            v_in => transient_outward_current_r_gate_v,
            time_in => transient_outward_current_r_gate_time,
            r_out => transient_outward_current_r_gate_r
        );

    sodium_potassium_pump_current_inst : component SodiumPotassiumPumpCurrent
        port map(
            clk => clk,
            k_o_in => sodium_potassium_pump_current_k_o,
            na_i_in => sodium_potassium_pump_current_na_i,
            time_in => sodium_potassium_pump_current_time,
            r_in => sodium_potassium_pump_current_r,
            f_in => sodium_potassium_pump_current_f,
            t_in => sodium_potassium_pump_current_t,
            v_in => sodium_potassium_pump_current_v,
            i_nak_out => sodium_potassium_pump_current_i_nak,
            v_private_out => sodium_potassium_pump_current_v_private
        );

    sodium_calcium_exchanger_current_inst : component SodiumCalciumExchangerCurrent
        port map(
            clk => clk,
            na_i_in => sodium_calcium_exchanger_current_na_i,
            na_o_in => sodium_calcium_exchanger_current_na_o,
            ca_i_in => sodium_calcium_exchanger_current_ca_i,
            ca_o_in => sodium_calcium_exchanger_current_ca_o,
            r_in => sodium_calcium_exchanger_current_r,
            f_in => sodium_calcium_exchanger_current_f,
            t_in => sodium_calcium_exchanger_current_t,
            v_in => sodium_calcium_exchanger_current_v,
            time_in => sodium_calcium_exchanger_current_time,
            i_naca_out => sodium_calcium_exchanger_current_i_naca
        );

    calcium_pump_current_inst : component CalciumPumpCurrent
        port map(
            clk => clk,
            ca_i_in => calcium_pump_current_ca_i,
            i_p_ca_out => calcium_pump_current_i_p_ca
        );

    potassium_pump_current_inst : component PotassiumPumpCurrent
        port map(
            clk => clk,
            e_k_in => potassium_pump_current_e_k,
            v_in => potassium_pump_current_v,
            i_p_k_out => potassium_pump_current_i_p_k
        );

    calcium_dynamics_inst : component CalciumDynamics
        port map(
            clk => clk,
            v_in => calcium_dynamics_v,
            v_c_in => calcium_dynamics_v_c,
            time_in => calcium_dynamics_time,
            d_in => calcium_dynamics_d,
            f_in => calcium_dynamics_f,
            cm_in => calcium_dynamics_cm,
            i_cal_in => calcium_dynamics_i_cal,
            i_naca_in => calcium_dynamics_i_naca,
            i_p_ca_in => calcium_dynamics_i_p_ca,
            i_b_ca_in => calcium_dynamics_i_b_ca,
            ca_i_out => calcium_dynamics_ca_i,
            ca_o_out => calcium_dynamics_ca_o
        );

    sodium_dynamics_inst : component SodiumDynamics
        port map(
            clk => clk,
            time_in => sodium_dynamics_time,
            f_in => sodium_dynamics_f,
            cm_in => sodium_dynamics_cm,
            v_c_in => sodium_dynamics_v_c,
            i_na_in => sodium_dynamics_i_na,
            i_naca_in => sodium_dynamics_i_naca,
            i_nak_in => sodium_dynamics_i_nak,
            i_b_na_in => sodium_dynamics_i_b_na,
            na_i_out => sodium_dynamics_na_i,
            na_o_out => sodium_dynamics_na_o
        );

    potassium_dynamics_inst : component PotassiumDynamics
        port map(
            clk => clk,
            time_in => potassium_dynamics_time,
            f_in => potassium_dynamics_f,
            cm_in => potassium_dynamics_cm,
            v_c_in => potassium_dynamics_v_c,
            i_k1_in => potassium_dynamics_i_k1,
            i_to_in => potassium_dynamics_i_to,
            i_nak_in => potassium_dynamics_i_nak,
            i_kr_in => potassium_dynamics_i_kr,
            i_ks_in => potassium_dynamics_i_ks,
            i_p_k_in => potassium_dynamics_i_p_k,
            i_stim_in => potassium_dynamics_i_stim,
            k_i_out => potassium_dynamics_k_i,
            k_o_out => potassium_dynamics_k_o
        );

    -- Perform Mapping
    l_type_ca_current_ca_i_private_out <= l_type_ca_current_ca_i_private;
    l_type_ca_current_v_private_out <= l_type_ca_current_v_private;
    l_type_ca_current_d_out <= l_type_ca_current_d;
    l_type_ca_current_d_gate_d_out <= l_type_ca_current_d_gate_d;
    l_type_ca_current_fca_gate_fca_out <= l_type_ca_current_fca_gate_f_ca;
    l_type_ca_current_f_gate_f_out <= l_type_ca_current_f_gate_f;
    l_type_ca_current_i_cal_out <= l_type_ca_current_i_cal;
    l_type_ca_current_time_private_out <= l_type_ca_current_time_private;
    calcium_background_current_i_b_ca_out <= calcium_background_current_i_b_ca;
    calcium_dynamics_ca_i_out <= calcium_dynamics_ca_i;
    calcium_dynamics_ca_o_out <= calcium_dynamics_ca_o;
    calcium_pump_current_i_p_ca_out <= calcium_pump_current_i_p_ca;
    environment_time_out <= environment_time;
    fast_sodium_current_v_private_out <= fast_sodium_current_v_private;
    fast_sodium_current_h_gate_h_out <= fast_sodium_current_h_gate_h;
    fast_sodium_current_i_na_out <= fast_sodium_current_i_na;
    fast_sodium_current_j_gate_j_out <= fast_sodium_current_j_gate_j;
    fast_sodium_current_m_gate_m_out <= fast_sodium_current_m_gate_m;
    fast_sodium_current_time_private_out <= fast_sodium_current_time_private;
    inward_rectifier_potassium_current_i_k1_out <= inward_rectifier_potassium_current_i_k1;
    membrane_cm_out <= membrane_cm;
    membrane_f_out <= membrane_f;
    membrane_r_out <= membrane_r;
    membrane_t_out <= membrane_t;
    membrane_v_out <= membrane_v;
    membrane_v_c_out <= membrane_v_c;
    membrane_i_stim_out <= membrane_i_stim;
    potassium_dynamics_k_i_out <= potassium_dynamics_k_i;
    potassium_dynamics_k_o_out <= potassium_dynamics_k_o;
    potassium_pump_current_i_p_k_out <= potassium_pump_current_i_p_k;
    rapid_time_dependent_potassium_current_v_private_out <= rapid_time_dependent_potassium_current_v_private;
    rapid_time_dependent_potassium_current_xr1_gate_xr1_out <= rapid_time_dependent_potassium_current_xr1_gate_xr1;
    rapid_time_dependent_potassium_current_xr2_gate_xr2_out <= rapid_time_dependent_potassium_current_xr2_gate_xr2;
    rapid_time_dependent_potassium_current_i_kr_out <= rapid_time_dependent_potassium_current_i_kr;
    rapid_time_dependent_potassium_current_time_private_out <= rapid_time_dependent_potassium_current_time_private;
    reversal_potentials_e_ca_out <= reversal_potentials_e_ca;
    reversal_potentials_e_k_out <= reversal_potentials_e_k;
    reversal_potentials_e_ks_out <= reversal_potentials_e_ks;
    reversal_potentials_e_na_out <= reversal_potentials_e_na;
    slow_time_dependent_potassium_current_v_private_out <= slow_time_dependent_potassium_current_v_private;
    slow_time_dependent_potassium_current_xs_gate_xs_out <= slow_time_dependent_potassium_current_xs_gate_xs;
    slow_time_dependent_potassium_current_i_ks_out <= slow_time_dependent_potassium_current_i_ks;
    slow_time_dependent_potassium_current_time_private_out <= slow_time_dependent_potassium_current_time_private;
    sodium_background_current_i_b_na_out <= sodium_background_current_i_b_na;
    sodium_calcium_exchanger_current_i_naca_out <= sodium_calcium_exchanger_current_i_naca;
    sodium_dynamics_na_i_out <= sodium_dynamics_na_i;
    sodium_dynamics_na_o_out <= sodium_dynamics_na_o;
    sodium_potassium_pump_current_v_private_out <= sodium_potassium_pump_current_v_private;
    sodium_potassium_pump_current_i_nak_out <= sodium_potassium_pump_current_i_nak;
    transient_outward_current_v_private_out <= transient_outward_current_v_private;
    transient_outward_current_i_to_out <= transient_outward_current_i_to;
    transient_outward_current_r_gate_r_out <= transient_outward_current_r_gate_r;
    transient_outward_current_s_gate_s_out <= transient_outward_current_s_gate_s;
    transient_outward_current_time_private_out <= transient_outward_current_time_private;
    l_type_ca_current_ca_i <= calcium_dynamics_ca_i;
    l_type_ca_current_ca_o <= calcium_dynamics_ca_o;
    l_type_ca_current_f <= membrane_f;
    l_type_ca_current_r <= membrane_r;
    l_type_ca_current_t <= membrane_t;
    l_type_ca_current_v <= membrane_v;
    l_type_ca_current_d_private <= l_type_ca_current_d_gate_d;
    l_type_ca_current_f1_private <= l_type_ca_current_f_gate_f;
    l_type_ca_current_fca_private <= l_type_ca_current_fca_gate_f_ca;
    l_type_ca_current_time <= environment_time;
    l_type_ca_current_d_gate_v <= l_type_ca_current_v_private;
    l_type_ca_current_d_gate_time <= l_type_ca_current_time_private;
    l_type_ca_current_fca_gate_ca_i <= l_type_ca_current_ca_i_private;
    l_type_ca_current_fca_gate_v <= l_type_ca_current_v_private;
    l_type_ca_current_fca_gate_time <= l_type_ca_current_time_private;
    l_type_ca_current_f_gate_v <= l_type_ca_current_v_private;
    l_type_ca_current_f_gate_time <= l_type_ca_current_time_private;
    calcium_background_current_e_ca <= reversal_potentials_e_ca;
    calcium_background_current_v <= membrane_v;
    calcium_background_current_time <= environment_time;
    calcium_dynamics_cm <= membrane_cm;
    calcium_dynamics_f <= membrane_f;
    calcium_dynamics_v <= membrane_v;
    calcium_dynamics_v_c <= membrane_v_c;
    calcium_dynamics_d <= l_type_ca_current_d;
    calcium_dynamics_i_cal <= l_type_ca_current_i_cal;
    calcium_dynamics_i_naca <= sodium_calcium_exchanger_current_i_naca;
    calcium_dynamics_i_b_ca <= calcium_background_current_i_b_ca;
    calcium_dynamics_i_p_ca <= calcium_pump_current_i_p_ca;
    calcium_dynamics_time <= environment_time;
    calcium_pump_current_ca_i <= calcium_dynamics_ca_i;
    fast_sodium_current_e_na <= reversal_potentials_e_na;
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
    inward_rectifier_potassium_current_e_k <= reversal_potentials_e_k;
    inward_rectifier_potassium_current_k_o <= potassium_dynamics_k_o;
    inward_rectifier_potassium_current_v <= membrane_v;
    inward_rectifier_potassium_current_time <= environment_time;
    membrane_i_cal <= l_type_ca_current_i_cal;
    membrane_i_k1 <= inward_rectifier_potassium_current_i_k1;
    membrane_i_kr <= rapid_time_dependent_potassium_current_i_kr;
    membrane_i_ks <= slow_time_dependent_potassium_current_i_ks;
    membrane_i_na <= fast_sodium_current_i_na;
    membrane_i_naca <= sodium_calcium_exchanger_current_i_naca;
    membrane_i_nak <= sodium_potassium_pump_current_i_nak;
    membrane_i_b_ca <= calcium_background_current_i_b_ca;
    membrane_i_b_na <= sodium_background_current_i_b_na;
    membrane_i_p_ca <= calcium_pump_current_i_p_ca;
    membrane_i_p_k <= potassium_pump_current_i_p_k;
    membrane_i_to <= transient_outward_current_i_to;
    membrane_time <= environment_time;
    potassium_dynamics_cm <= membrane_cm;
    potassium_dynamics_f <= membrane_f;
    potassium_dynamics_v_c <= membrane_v_c;
    potassium_dynamics_i_k1 <= inward_rectifier_potassium_current_i_k1;
    potassium_dynamics_i_kr <= rapid_time_dependent_potassium_current_i_kr;
    potassium_dynamics_i_ks <= slow_time_dependent_potassium_current_i_ks;
    potassium_dynamics_i_nak <= sodium_potassium_pump_current_i_nak;
    potassium_dynamics_i_stim <= membrane_i_stim;
    potassium_dynamics_i_p_k <= potassium_pump_current_i_p_k;
    potassium_dynamics_i_to <= transient_outward_current_i_to;
    potassium_dynamics_time <= environment_time;
    potassium_pump_current_e_k <= reversal_potentials_e_k;
    potassium_pump_current_v <= membrane_v;
    rapid_time_dependent_potassium_current_e_k <= reversal_potentials_e_k;
    rapid_time_dependent_potassium_current_k_o <= potassium_dynamics_k_o;
    rapid_time_dependent_potassium_current_v <= membrane_v;
    rapid_time_dependent_potassium_current_xr1_private <= rapid_time_dependent_potassium_current_xr1_gate_xr1;
    rapid_time_dependent_potassium_current_xr2_private <= rapid_time_dependent_potassium_current_xr2_gate_xr2;
    rapid_time_dependent_potassium_current_time <= environment_time;
    rapid_time_dependent_potassium_current_xr1_gate_v <= rapid_time_dependent_potassium_current_v_private;
    rapid_time_dependent_potassium_current_xr1_gate_time <= rapid_time_dependent_potassium_current_time_private;
    rapid_time_dependent_potassium_current_xr2_gate_v <= rapid_time_dependent_potassium_current_v_private;
    rapid_time_dependent_potassium_current_xr2_gate_time <= rapid_time_dependent_potassium_current_time_private;
    reversal_potentials_ca_i <= calcium_dynamics_ca_i;
    reversal_potentials_ca_o <= calcium_dynamics_ca_o;
    reversal_potentials_f <= membrane_f;
    reversal_potentials_k_i <= potassium_dynamics_k_i;
    reversal_potentials_k_o <= potassium_dynamics_k_o;
    reversal_potentials_na_i <= sodium_dynamics_na_i;
    reversal_potentials_na_o <= sodium_dynamics_na_o;
    reversal_potentials_r <= membrane_r;
    reversal_potentials_t <= membrane_t;
    reversal_potentials_time <= environment_time;
    slow_time_dependent_potassium_current_e_ks <= reversal_potentials_e_ks;
    slow_time_dependent_potassium_current_v <= membrane_v;
    slow_time_dependent_potassium_current_xs_private <= slow_time_dependent_potassium_current_xs_gate_xs;
    slow_time_dependent_potassium_current_time <= environment_time;
    slow_time_dependent_potassium_current_xs_gate_v <= slow_time_dependent_potassium_current_v_private;
    slow_time_dependent_potassium_current_xs_gate_time <= slow_time_dependent_potassium_current_time_private;
    sodium_background_current_e_na <= reversal_potentials_e_na;
    sodium_background_current_v <= membrane_v;
    sodium_background_current_time <= environment_time;
    sodium_calcium_exchanger_current_ca_i <= calcium_dynamics_ca_i;
    sodium_calcium_exchanger_current_ca_o <= calcium_dynamics_ca_o;
    sodium_calcium_exchanger_current_f <= membrane_f;
    sodium_calcium_exchanger_current_na_i <= sodium_dynamics_na_i;
    sodium_calcium_exchanger_current_na_o <= sodium_dynamics_na_o;
    sodium_calcium_exchanger_current_r <= membrane_r;
    sodium_calcium_exchanger_current_t <= membrane_t;
    sodium_calcium_exchanger_current_v <= membrane_v;
    sodium_calcium_exchanger_current_time <= environment_time;
    sodium_dynamics_cm <= membrane_cm;
    sodium_dynamics_f <= membrane_f;
    sodium_dynamics_v_c <= membrane_v_c;
    sodium_dynamics_i_na <= fast_sodium_current_i_na;
    sodium_dynamics_i_naca <= sodium_calcium_exchanger_current_i_naca;
    sodium_dynamics_i_nak <= sodium_potassium_pump_current_i_nak;
    sodium_dynamics_i_b_na <= sodium_background_current_i_b_na;
    sodium_dynamics_time <= environment_time;
    sodium_potassium_pump_current_f <= membrane_f;
    sodium_potassium_pump_current_k_o <= potassium_dynamics_k_o;
    sodium_potassium_pump_current_na_i <= sodium_dynamics_na_i;
    sodium_potassium_pump_current_r <= membrane_r;
    sodium_potassium_pump_current_t <= membrane_t;
    sodium_potassium_pump_current_v <= membrane_v;
    sodium_potassium_pump_current_time <= environment_time;
    transient_outward_current_e_k <= reversal_potentials_e_k;
    transient_outward_current_v <= membrane_v;
    transient_outward_current_r_private <= transient_outward_current_r_gate_r;
    transient_outward_current_s_private <= transient_outward_current_s_gate_s;
    transient_outward_current_time <= environment_time;
    transient_outward_current_r_gate_v <= transient_outward_current_v_private;
    transient_outward_current_r_gate_time <= transient_outward_current_time_private;
    transient_outward_current_s_gate_v <= transient_outward_current_v_private;
    transient_outward_current_s_gate_time <= transient_outward_current_time_private;
end architecture;