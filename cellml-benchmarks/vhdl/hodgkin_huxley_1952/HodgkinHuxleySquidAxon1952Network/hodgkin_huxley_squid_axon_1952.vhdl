library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity HodgkinHuxleySquidAxon1952 is
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
architecture behavior of HodgkinHuxleySquidAxon1952 is
    -- Declare all internal signals
    signal environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_i_l : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal membrane_e_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_e_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_m_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_h_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_m_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_m_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_m_gate_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_h_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_h_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal sodium_channel_h_gate_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_e_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_n_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_n_gate_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_n_gate_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal potassium_channel_n_gate_n : signed(31 downto 0) := CREATE_FP(0.0);
    signal leakage_current_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal leakage_current_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal leakage_current_e_r : signed(31 downto 0) := CREATE_FP(0.0);
    signal leakage_current_i_l : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Environment is
        port(
            clk : in std_logic;
            time_out : out signed(31 downto 0)
        );
    end component Environment;

    component Membrane is
        generic(
            cm : signed(31 downto 0) := CREATE_FP(1.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            i_na_in : in signed(31 downto 0);
            i_k_in : in signed(31 downto 0);
            i_l_in : in signed(31 downto 0);
            v_out : out signed(31 downto 0);
            e_r_out : out signed(31 downto 0)
        );
    end component Membrane;

    component SodiumChannel is
        generic(
            g_na : signed(31 downto 0) := CREATE_FP(120.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            e_r_in : in signed(31 downto 0);
            m_private_in : in signed(31 downto 0);
            h_private_in : in signed(31 downto 0);
            i_na_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component SodiumChannel;

    component SodiumChannelMGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            m_out : out signed(31 downto 0)
        );
    end component SodiumChannelMGate;

    component SodiumChannelHGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            h_out : out signed(31 downto 0)
        );
    end component SodiumChannelHGate;

    component PotassiumChannel is
        generic(
            g_k : signed(31 downto 0) := CREATE_FP(36.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            e_r_in : in signed(31 downto 0);
            n_private_in : in signed(31 downto 0);
            i_k_out : out signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            v_private_out : out signed(31 downto 0)
        );
    end component PotassiumChannel;

    component PotassiumChannelNGate is
        port(
            clk : in std_logic;
            v_in : in signed(31 downto 0);
            time_in : in signed(31 downto 0);
            n_out : out signed(31 downto 0)
        );
    end component PotassiumChannelNGate;

    component LeakageCurrent is
        generic(
            g_l : signed(31 downto 0) := CREATE_FP(0.3)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            v_in : in signed(31 downto 0);
            e_r_in : in signed(31 downto 0);
            i_l_out : out signed(31 downto 0)
        );
    end component LeakageCurrent;

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
            i_k_in => membrane_i_k,
            i_l_in => membrane_i_l,
            v_out => membrane_v,
            e_r_out => membrane_e_r
        );

    sodium_channel_inst : component SodiumChannel
        port map(
            clk => clk,
            time_in => sodium_channel_time,
            v_in => sodium_channel_v,
            e_r_in => sodium_channel_e_r,
            m_private_in => sodium_channel_m_private,
            h_private_in => sodium_channel_h_private,
            i_na_out => sodium_channel_i_na,
            time_private_out => sodium_channel_time_private,
            v_private_out => sodium_channel_v_private
        );

    sodium_channel_m_gate_inst : component SodiumChannelMGate
        port map(
            clk => clk,
            v_in => sodium_channel_m_gate_v,
            time_in => sodium_channel_m_gate_time,
            m_out => sodium_channel_m_gate_m
        );

    sodium_channel_h_gate_inst : component SodiumChannelHGate
        port map(
            clk => clk,
            v_in => sodium_channel_h_gate_v,
            time_in => sodium_channel_h_gate_time,
            h_out => sodium_channel_h_gate_h
        );

    potassium_channel_inst : component PotassiumChannel
        port map(
            clk => clk,
            time_in => potassium_channel_time,
            v_in => potassium_channel_v,
            e_r_in => potassium_channel_e_r,
            n_private_in => potassium_channel_n_private,
            i_k_out => potassium_channel_i_k,
            time_private_out => potassium_channel_time_private,
            v_private_out => potassium_channel_v_private
        );

    potassium_channel_n_gate_inst : component PotassiumChannelNGate
        port map(
            clk => clk,
            v_in => potassium_channel_n_gate_v,
            time_in => potassium_channel_n_gate_time,
            n_out => potassium_channel_n_gate_n
        );

    leakage_current_inst : component LeakageCurrent
        port map(
            clk => clk,
            time_in => leakage_current_time,
            v_in => leakage_current_v,
            e_r_in => leakage_current_e_r,
            i_l_out => leakage_current_i_l
        );

    -- Perform Mapping
    environment_time_out <= environment_time;
    leakage_current_i_l_out <= leakage_current_i_l;
    membrane_e_r_out <= membrane_e_r;
    membrane_v_out <= membrane_v;
    potassium_channel_v_private_out <= potassium_channel_v_private;
    potassium_channel_i_k_out <= potassium_channel_i_k;
    potassium_channel_n_gate_n_out <= potassium_channel_n_gate_n;
    potassium_channel_time_private_out <= potassium_channel_time_private;
    sodium_channel_v_private_out <= sodium_channel_v_private;
    sodium_channel_h_gate_h_out <= sodium_channel_h_gate_h;
    sodium_channel_i_na_out <= sodium_channel_i_na;
    sodium_channel_m_gate_m_out <= sodium_channel_m_gate_m;
    sodium_channel_time_private_out <= sodium_channel_time_private;
    leakage_current_e_r <= membrane_e_r;
    leakage_current_v <= membrane_v;
    leakage_current_time <= environment_time;
    membrane_i_k <= potassium_channel_i_k;
    membrane_i_l <= leakage_current_i_l;
    membrane_i_na <= sodium_channel_i_na;
    membrane_time <= environment_time;
    potassium_channel_e_r <= membrane_e_r;
    potassium_channel_v <= membrane_v;
    potassium_channel_n_private <= potassium_channel_n_gate_n;
    potassium_channel_time <= environment_time;
    potassium_channel_n_gate_v <= potassium_channel_v_private;
    potassium_channel_n_gate_time <= potassium_channel_time_private;
    sodium_channel_e_r <= membrane_e_r;
    sodium_channel_v <= membrane_v;
    sodium_channel_h_private <= sodium_channel_h_gate_h;
    sodium_channel_m_private <= sodium_channel_m_gate_m;
    sodium_channel_time <= environment_time;
    sodium_channel_h_gate_v <= sodium_channel_v_private;
    sodium_channel_h_gate_time <= sodium_channel_time_private;
    sodium_channel_m_gate_v <= sodium_channel_v_private;
    sodium_channel_m_gate_time <= sodium_channel_time_private;
end architecture;