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
        membrane_e_r_out : out signed(31 downto 0);
        sodium_channel_i_na_out : out signed(31 downto 0);
        sodium_channel_time_private_out : out signed(31 downto 0);
        sodium_channel_v_private_out : out signed(31 downto 0);
        sodium_channel_m_gate_m_out : out signed(31 downto 0);
        sodium_channel_h_gate_h_out : out signed(31 downto 0);
        potassium_channel_i_k_out : out signed(31 downto 0);
        potassium_channel_time_private_out : out signed(31 downto 0);
        potassium_channel_v_private_out : out signed(31 downto 0);
        potassium_channel_n_gate_n_out : out signed(31 downto 0);
        leakage_current_i_l_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal hodgkin_huxley_squid_axon_1952_environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_membrane_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_membrane_e_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_sodium_channel_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_sodium_channel_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_sodium_channel_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_sodium_channel_m_gate_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_sodium_channel_h_gate_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_potassium_channel_i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_potassium_channel_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_potassium_channel_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_potassium_channel_n_gate_n : signed(31 downto 0) := CREATE_FP(0.0);
    signal hodgkin_huxley_squid_axon_1952_leakage_current_i_l : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component HodgkinHuxleySquidAxon1952 is
        port(
            clk : in std_logic;
            environment_time_out : out signed(31 downto 0);
            membrane_v_out : out signed(31 downto 0);
            membrane_e_r_out : out signed(31 downto 0);
            sodium_channel_i_na_out : out signed(31 downto 0);
            sodium_channel_time_private_out : out signed(31 downto 0);
            sodium_channel_v_private_out : out signed(31 downto 0);
            sodium_channel_m_gate_m_out : out signed(31 downto 0);
            sodium_channel_h_gate_h_out : out signed(31 downto 0);
            potassium_channel_i_k_out : out signed(31 downto 0);
            potassium_channel_time_private_out : out signed(31 downto 0);
            potassium_channel_v_private_out : out signed(31 downto 0);
            potassium_channel_n_gate_n_out : out signed(31 downto 0);
            leakage_current_i_l_out : out signed(31 downto 0)
        );
    end component HodgkinHuxleySquidAxon1952;
begin
    -- Create base instance
    hodgkin_huxley_squid_axon_1952_inst : component HodgkinHuxleySquidAxon1952
        port map(
            clk => clk,
            environment_time_out => hodgkin_huxley_squid_axon_1952_environment_time,
            membrane_v_out => hodgkin_huxley_squid_axon_1952_membrane_v,
            membrane_e_r_out => hodgkin_huxley_squid_axon_1952_membrane_e_r,
            sodium_channel_i_na_out => hodgkin_huxley_squid_axon_1952_sodium_channel_i_na,
            sodium_channel_time_private_out => hodgkin_huxley_squid_axon_1952_sodium_channel_time_private,
            sodium_channel_v_private_out => hodgkin_huxley_squid_axon_1952_sodium_channel_v_private,
            sodium_channel_m_gate_m_out => hodgkin_huxley_squid_axon_1952_sodium_channel_m_gate_m,
            sodium_channel_h_gate_h_out => hodgkin_huxley_squid_axon_1952_sodium_channel_h_gate_h,
            potassium_channel_i_k_out => hodgkin_huxley_squid_axon_1952_potassium_channel_i_k,
            potassium_channel_time_private_out => hodgkin_huxley_squid_axon_1952_potassium_channel_time_private,
            potassium_channel_v_private_out => hodgkin_huxley_squid_axon_1952_potassium_channel_v_private,
            potassium_channel_n_gate_n_out => hodgkin_huxley_squid_axon_1952_potassium_channel_n_gate_n,
            leakage_current_i_l_out => hodgkin_huxley_squid_axon_1952_leakage_current_i_l
        );

    -- Perform Mapping
    environment_time_out <= hodgkin_huxley_squid_axon_1952_environment_time;
    membrane_v_out <= hodgkin_huxley_squid_axon_1952_membrane_v;
    membrane_e_r_out <= hodgkin_huxley_squid_axon_1952_membrane_e_r;
    sodium_channel_i_na_out <= hodgkin_huxley_squid_axon_1952_sodium_channel_i_na;
    sodium_channel_time_private_out <= hodgkin_huxley_squid_axon_1952_sodium_channel_time_private;
    sodium_channel_v_private_out <= hodgkin_huxley_squid_axon_1952_sodium_channel_v_private;
    sodium_channel_m_gate_m_out <= hodgkin_huxley_squid_axon_1952_sodium_channel_m_gate_m;
    sodium_channel_h_gate_h_out <= hodgkin_huxley_squid_axon_1952_sodium_channel_h_gate_h;
    potassium_channel_i_k_out <= hodgkin_huxley_squid_axon_1952_potassium_channel_i_k;
    potassium_channel_time_private_out <= hodgkin_huxley_squid_axon_1952_potassium_channel_time_private;
    potassium_channel_v_private_out <= hodgkin_huxley_squid_axon_1952_potassium_channel_v_private;
    potassium_channel_n_gate_n_out <= hodgkin_huxley_squid_axon_1952_potassium_channel_n_gate_n;
    leakage_current_i_l_out <= hodgkin_huxley_squid_axon_1952_leakage_current_i_l;
end architecture;