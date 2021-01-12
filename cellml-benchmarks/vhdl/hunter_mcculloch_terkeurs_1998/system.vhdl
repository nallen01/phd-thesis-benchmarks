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
        calcium_transient_ca_i_out : out signed(31 downto 0);
        tnc_ca_binding_kinetics_ca_b_out : out signed(31 downto 0);
        tnc_ca_binding_kinetics_lambda_out : out signed(31 downto 0);
        thin_filament_kinetics_to_out : out signed(31 downto 0);
        crossbridge_kinetics_t_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal hunter_mcculloch_terkeurs_1998_version02_environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal hunter_mcculloch_terkeurs_1998_version02_calcium_transient_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal hunter_mcculloch_terkeurs_1998_version02_tnc_ca_binding_kinetics_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal hunter_mcculloch_terkeurs_1998_version02_tnc_ca_binding_kinetics_lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal hunter_mcculloch_terkeurs_1998_version02_thin_filament_kinetics_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal hunter_mcculloch_terkeurs_1998_version02_crossbridge_kinetics_t : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component HunterMccullochTerkeurs1998Version02 is
        port(
            clk : in std_logic;
            environment_time_out : out signed(31 downto 0);
            calcium_transient_ca_i_out : out signed(31 downto 0);
            tnc_ca_binding_kinetics_ca_b_out : out signed(31 downto 0);
            tnc_ca_binding_kinetics_lambda_out : out signed(31 downto 0);
            thin_filament_kinetics_to_out : out signed(31 downto 0);
            crossbridge_kinetics_t_out : out signed(31 downto 0)
        );
    end component HunterMccullochTerkeurs1998Version02;
begin
    -- Create base instance
    hunter_mcculloch_terkeurs_1998_version02_inst : component HunterMccullochTerkeurs1998Version02
        port map(
            clk => clk,
            environment_time_out => hunter_mcculloch_terkeurs_1998_version02_environment_time,
            calcium_transient_ca_i_out => hunter_mcculloch_terkeurs_1998_version02_calcium_transient_ca_i,
            tnc_ca_binding_kinetics_ca_b_out => hunter_mcculloch_terkeurs_1998_version02_tnc_ca_binding_kinetics_ca_b,
            tnc_ca_binding_kinetics_lambda_out => hunter_mcculloch_terkeurs_1998_version02_tnc_ca_binding_kinetics_lambda,
            thin_filament_kinetics_to_out => hunter_mcculloch_terkeurs_1998_version02_thin_filament_kinetics_to,
            crossbridge_kinetics_t_out => hunter_mcculloch_terkeurs_1998_version02_crossbridge_kinetics_t
        );

    -- Perform Mapping
    environment_time_out <= hunter_mcculloch_terkeurs_1998_version02_environment_time;
    calcium_transient_ca_i_out <= hunter_mcculloch_terkeurs_1998_version02_calcium_transient_ca_i;
    tnc_ca_binding_kinetics_ca_b_out <= hunter_mcculloch_terkeurs_1998_version02_tnc_ca_binding_kinetics_ca_b;
    tnc_ca_binding_kinetics_lambda_out <= hunter_mcculloch_terkeurs_1998_version02_tnc_ca_binding_kinetics_lambda;
    thin_filament_kinetics_to_out <= hunter_mcculloch_terkeurs_1998_version02_thin_filament_kinetics_to;
    crossbridge_kinetics_t_out <= hunter_mcculloch_terkeurs_1998_version02_crossbridge_kinetics_t;
end architecture;