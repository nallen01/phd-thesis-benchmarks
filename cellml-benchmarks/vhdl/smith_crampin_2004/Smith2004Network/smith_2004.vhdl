library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity Smith2004 is
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
architecture behavior of Smith2004 is
    -- Declare all internal signals
    signal interface_v_cyc_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal interface_net_free_energy_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal interface_time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal interface_vm_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal interface_cmgadp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal interface_cna_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal interface_v_cyc : signed(31 downto 0) := CREATE_FP(0.0);
    signal interface_net_free_energy : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_vm : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_c_mg_a_d_p : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_cna_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_body_temp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_gas_const_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_faraday_const_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_vm_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_cmgadp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_cna_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_v_cyc : signed(31 downto 0) := CREATE_FP(0.0);
    signal nak_pump_net_free_energy : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Interface is
        port(
            clk : in std_logic;
            v_cyc_private_in : in signed(31 downto 0);
            net_free_energy_private_in : in signed(31 downto 0);
            time_private_out : out signed(31 downto 0);
            vm_private_out : out signed(31 downto 0);
            cmgadp_private_out : out signed(31 downto 0);
            cna_i_private_out : out signed(31 downto 0);
            v_cyc_out : out signed(31 downto 0);
            net_free_energy_out : out signed(31 downto 0)
        );
    end component Interface;

    component NakPump is
        generic(
            body_temp : signed(31 downto 0) := CREATE_FP(310.0);
            gas_const : signed(31 downto 0) := CREATE_FP(8.314);
            faraday_const : signed(31 downto 0) := CREATE_FP(96485.0);
            k1 : signed(31 downto 0) := CREATE_FP(1050.0);
            minus_k1 : signed(31 downto 0) := CREATE_FP(172.1);
            k2 : signed(31 downto 0) := CREATE_FP(481.0);
            minus_k2 : signed(31 downto 0) := CREATE_FP(40.1);
            k3 : signed(31 downto 0) := CREATE_FP(2000.0);
            minus_k3 : signed(31 downto 0) := CREATE_FP(79287.1);
            k4 : signed(31 downto 0) := CREATE_FP(320.0);
            minus_k4 : signed(31 downto 0) := CREATE_FP(40.1);
            eq_na_base_e : signed(31 downto 0) := CREATE_FP(15.5);
            eq_na_base_i : signed(31 downto 0) := CREATE_FP(2.49);
            eq_k_e : signed(31 downto 0) := CREATE_FP(0.213);
            eq_k_i : signed(31 downto 0) := CREATE_FP(0.5);
            eq_mgatp : signed(31 downto 0) := CREATE_FP(2.51);
            eq_hpi : signed(31 downto 0) := CREATE_FP(1.69E-4);
            eq_kpi : signed(31 downto 0) := CREATE_FP(292.0);
            eq_napi : signed(31 downto 0) := CREATE_FP(224.0);
            cna_e : signed(31 downto 0) := CREATE_FP(150.0);
            ck_e : signed(31 downto 0) := CREATE_FP(5.4);
            ck_i : signed(31 downto 0) := CREATE_FP(140.0);
            c_mg_a_t_p : signed(31 downto 0) := CREATE_FP(9.8);
            cpi_sum : signed(31 downto 0) := CREATE_FP(4.2);
            c_h : signed(31 downto 0) := CREATE_FP(8.1283E-5);
            partition_factor : signed(31 downto 0) := CREATE_FP(-0.031288692380984445)
        );
        port(
            clk : in std_logic;
            vm_in : in signed(31 downto 0);
            c_mg_a_d_p_in : in signed(31 downto 0);
            cna_i_in : in signed(31 downto 0);
            body_temp_private_out : out signed(31 downto 0);
            gas_const_private_out : out signed(31 downto 0);
            faraday_const_private_out : out signed(31 downto 0);
            vm_private_out : out signed(31 downto 0);
            cmgadp_private_out : out signed(31 downto 0);
            cna_i_private_out : out signed(31 downto 0);
            v_cyc_out : out signed(31 downto 0);
            net_free_energy_out : out signed(31 downto 0)
        );
    end component NakPump;

begin
    -- Create child instances
    interface_inst : component Interface
        port map(
            clk => clk,
            v_cyc_private_in => interface_v_cyc_private,
            net_free_energy_private_in => interface_net_free_energy_private,
            time_private_out => interface_time_private,
            vm_private_out => interface_vm_private,
            cmgadp_private_out => interface_cmgadp_private,
            cna_i_private_out => interface_cna_i_private,
            v_cyc_out => interface_v_cyc,
            net_free_energy_out => interface_net_free_energy
        );

    nak_pump_inst : component NakPump
        port map(
            clk => clk,
            vm_in => nak_pump_vm,
            c_mg_a_d_p_in => nak_pump_c_mg_a_d_p,
            cna_i_in => nak_pump_cna_i,
            body_temp_private_out => nak_pump_body_temp_private,
            gas_const_private_out => nak_pump_gas_const_private,
            faraday_const_private_out => nak_pump_faraday_const_private,
            vm_private_out => nak_pump_vm_private,
            cmgadp_private_out => nak_pump_cmgadp_private,
            cna_i_private_out => nak_pump_cna_i_private,
            v_cyc_out => nak_pump_v_cyc,
            net_free_energy_out => nak_pump_net_free_energy
        );

    -- Perform Mapping
    nak_pump_vm_private_out <= nak_pump_vm_private;
    nak_pump_body_temp_private_out <= nak_pump_body_temp_private;
    nak_pump_cmgadp_private_out <= nak_pump_cmgadp_private;
    nak_pump_cna_i_private_out <= nak_pump_cna_i_private;
    nak_pump_faraday_const_private_out <= nak_pump_faraday_const_private;
    nak_pump_gas_const_private_out <= nak_pump_gas_const_private;
    nak_pump_net_free_energy_out <= nak_pump_net_free_energy;
    nak_pump_v_cyc_out <= nak_pump_v_cyc;
    interface_vm_private_out <= interface_vm_private;
    interface_cmgadp_private_out <= interface_cmgadp_private;
    interface_cna_i_private_out <= interface_cna_i_private;
    interface_net_free_energy_out <= interface_net_free_energy;
    interface_time_private_out <= interface_time_private;
    interface_v_cyc_out <= interface_v_cyc;
    nak_pump_vm <= interface_vm_private;
    nak_pump_c_mg_a_d_p <= interface_cmgadp_private;
    nak_pump_cna_i <= interface_cna_i_private;
    interface_net_free_energy_private <= nak_pump_net_free_energy;
    interface_v_cyc_private <= nak_pump_v_cyc;
end architecture;