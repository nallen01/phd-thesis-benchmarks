library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity system is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        interface_time_private_out : out signed(31 downto 0);
        interface_vm_private_out : out signed(31 downto 0);
        interface_cmgadp_private_out : out signed(31 downto 0);
        interface_cna_i_private_out : out signed(31 downto 0);
        interface_v_cyc_out : out signed(31 downto 0);
        interface_net_free_energy_out : out signed(31 downto 0);
        nak_pump_body_temp_private_out : out signed(31 downto 0);
        nak_pump_gas_const_private_out : out signed(31 downto 0);
        nak_pump_faraday_const_private_out : out signed(31 downto 0);
        nak_pump_vm_private_out : out signed(31 downto 0);
        nak_pump_cmgadp_private_out : out signed(31 downto 0);
        nak_pump_cna_i_private_out : out signed(31 downto 0);
        nak_pump_v_cyc_out : out signed(31 downto 0);
        nak_pump_net_free_energy_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal smith_2004_interface_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_interface_vm_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_interface_cmgadp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_interface_cna_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_interface_v_cyc : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_interface_net_free_energy : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_body_temp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_gas_const_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_faraday_const_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_vm_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_cmgadp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_cna_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_v_cyc : signed(31 downto 0) := CREATE_FP(0.0);
    signal smith_2004_nak_pump_net_free_energy : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component Smith2004 is
        port(
            clk : in std_logic;
            interface_time_private_out : out signed(31 downto 0);
            interface_vm_private_out : out signed(31 downto 0);
            interface_cmgadp_private_out : out signed(31 downto 0);
            interface_cna_i_private_out : out signed(31 downto 0);
            interface_v_cyc_out : out signed(31 downto 0);
            interface_net_free_energy_out : out signed(31 downto 0);
            nak_pump_body_temp_private_out : out signed(31 downto 0);
            nak_pump_gas_const_private_out : out signed(31 downto 0);
            nak_pump_faraday_const_private_out : out signed(31 downto 0);
            nak_pump_vm_private_out : out signed(31 downto 0);
            nak_pump_cmgadp_private_out : out signed(31 downto 0);
            nak_pump_cna_i_private_out : out signed(31 downto 0);
            nak_pump_v_cyc_out : out signed(31 downto 0);
            nak_pump_net_free_energy_out : out signed(31 downto 0)
        );
    end component Smith2004;
begin
    -- Create base instance
    smith_2004_inst : component Smith2004
        port map(
            clk => clk,
            interface_time_private_out => smith_2004_interface_time_private,
            interface_vm_private_out => smith_2004_interface_vm_private,
            interface_cmgadp_private_out => smith_2004_interface_cmgadp_private,
            interface_cna_i_private_out => smith_2004_interface_cna_i_private,
            interface_v_cyc_out => smith_2004_interface_v_cyc,
            interface_net_free_energy_out => smith_2004_interface_net_free_energy,
            nak_pump_body_temp_private_out => smith_2004_nak_pump_body_temp_private,
            nak_pump_gas_const_private_out => smith_2004_nak_pump_gas_const_private,
            nak_pump_faraday_const_private_out => smith_2004_nak_pump_faraday_const_private,
            nak_pump_vm_private_out => smith_2004_nak_pump_vm_private,
            nak_pump_cmgadp_private_out => smith_2004_nak_pump_cmgadp_private,
            nak_pump_cna_i_private_out => smith_2004_nak_pump_cna_i_private,
            nak_pump_v_cyc_out => smith_2004_nak_pump_v_cyc,
            nak_pump_net_free_energy_out => smith_2004_nak_pump_net_free_energy
        );

    -- Perform Mapping
    interface_time_private_out <= smith_2004_interface_time_private;
    interface_vm_private_out <= smith_2004_interface_vm_private;
    interface_cmgadp_private_out <= smith_2004_interface_cmgadp_private;
    interface_cna_i_private_out <= smith_2004_interface_cna_i_private;
    interface_v_cyc_out <= smith_2004_interface_v_cyc;
    interface_net_free_energy_out <= smith_2004_interface_net_free_energy;
    nak_pump_body_temp_private_out <= smith_2004_nak_pump_body_temp_private;
    nak_pump_gas_const_private_out <= smith_2004_nak_pump_gas_const_private;
    nak_pump_faraday_const_private_out <= smith_2004_nak_pump_faraday_const_private;
    nak_pump_vm_private_out <= smith_2004_nak_pump_vm_private;
    nak_pump_cmgadp_private_out <= smith_2004_nak_pump_cmgadp_private;
    nak_pump_cna_i_private_out <= smith_2004_nak_pump_cna_i_private;
    nak_pump_v_cyc_out <= smith_2004_nak_pump_v_cyc;
    nak_pump_net_free_energy_out <= smith_2004_nak_pump_net_free_energy;
end architecture;